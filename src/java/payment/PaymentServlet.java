package payment;

import DAO.OrderDAO;
import DAO.InventoryDAO;
import entity.Cart;
import entity.Order;
import entity.CartItem;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

@WebServlet(name = "PaymentServlet", urlPatterns = {"/payment"})
public class PaymentServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();
    private InventoryDAO inventoryDAO = new InventoryDAO();

    // VNPay configuration constants
    private static final String VNP_VERSION = "2.1.0";
    private static final String VNP_COMMAND = "pay";
    private static final String VNP_TMN_CODE = "UE7X71VT";
    private static final String VNP_HASH_SECRET = "V0LLLO92GG64TULVKNLABKZ2GO9PFLZU";
    private static final String VNP_API_URL = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    private static final String VNP_CURR_CODE = "VND";
    private static final String ORDER_TYPE = "other";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Display payment options page or process payment return
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");

        if (vnp_ResponseCode != null) {
            // This is a return from VNPay
            processVNPayReturn(request, response);
            return;
        }

        // Get order from session to display on payment page
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("pending_order");

        if (order == null) {
            response.sendRedirect("cartdetail");
            return;
        }

        // Pass the order to the JSP
        request.setAttribute("order", order);

        // Show payment page with options
        request.getRequestDispatcher("payment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get order from session
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("pending_order");

        if (order == null) {
            response.sendRedirect("cartdetail");
            return;
        }

        String paymentMethod = request.getParameter("payment_method");

        if ("vnpay".equals(paymentMethod)) {
            // Process VNPay payment
            processVNPayPayment(request, response, order);
        } else {
            // Redirect to other payment methods or show error
            request.setAttribute("errorMessage", "Phương thức thanh toán không được hỗ trợ");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }

    private void processVNPayPayment(HttpServletRequest request, HttpServletResponse response, Order order)
            throws IOException, ServletException {
        try {
            // Validate the order has a valid order code
            if (order.getOrderCode() == null || order.getOrderCode().isEmpty()) {
                // Generate a temporary order code if needed
                order.setOrderCode("ORD" + System.currentTimeMillis());
            }

            // Clean the order code to ensure it contains only alphanumeric characters
            String cleanOrderCode = order.getOrderCode().replaceAll("[^a-zA-Z0-9]", "");

            // Create the order information for VNPay
            String vnp_OrderInfo = "Thanh toan don hang " + order.getOrderCode();
            String vnp_TxnRef = cleanOrderCode;
            String vnp_IpAddr = getClientIpAddress(request);

            // Amount in VND, needs to be multiplied by 100 (no decimal points)
            long amount = (long) (order.getTotal() * 100);
            String vnp_Amount = String.valueOf(amount);

            // Add parameters to VNPay request
            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", VNP_VERSION);
            vnp_Params.put("vnp_Command", VNP_COMMAND);
            vnp_Params.put("vnp_TmnCode", VNP_TMN_CODE);
            vnp_Params.put("vnp_Amount", vnp_Amount);
            vnp_Params.put("vnp_CurrCode", VNP_CURR_CODE);

            // Set locale for language: vn or en
            vnp_Params.put("vnp_Locale", "vn");

            // Set order information
            vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
            vnp_Params.put("vnp_OrderType", ORDER_TYPE);

            // Add return URL - the user will be redirected here after payment
            String returnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + request.getContextPath() + "/payment";
            vnp_Params.put("vnp_ReturnUrl", returnUrl);

            // Set IP address
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

            // Set transaction reference
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);

            // Create date string for VNPay format (GMT+7)
            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            // Set expiry date for the payment (15 minutes)
            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

            // Build VNPay payment URL
            String paymentUrl = buildVNPayUrl(vnp_Params);

            // Log the URL for debugging
            System.out.println("Redirecting to VNPay URL: " + paymentUrl);

            // Redirect to VNPay payment gateway
            response.sendRedirect(paymentUrl);
        } catch (Exception e) {
            System.out.println("Error processing VNPay payment: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi kết nối với cổng thanh toán: " + e.getMessage());
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }

    // Replace the current processVNPayReturn method with this version:
    private void processVNPayReturn(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters from VNPay
            Map<String, String> vnp_Params = getParameterMap(request);
            String vnp_SecureHash = request.getParameter("vnp_SecureHash");

            // Log received parameters for debugging
            System.out.println("VNPay Response Parameters: " + vnp_Params);

            if (vnp_SecureHash == null) {
                throw new Exception("Missing secure hash from VNPay response");
            }

            // Remove hash params
            vnp_Params.remove("vnp_SecureHash");
            vnp_Params.remove("vnp_SecureHashType");

            // Get transaction details
            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TransactionStatus = request.getParameter("vnp_TransactionStatus");
            String vnp_Amount = request.getParameter("vnp_Amount");
            String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");

            HttpSession session = request.getSession();
            Order order = (Order) session.getAttribute("pending_order");

            // Verify transaction with our records
            boolean isValidHash = validateVNPayHash(vnp_Params, vnp_SecureHash);
            boolean isValidTransaction = false;
            if (order != null) {
                String cleanOrderCode = order.getOrderCode().replaceAll("[^a-zA-Z0-9]", "");
                isValidTransaction = cleanOrderCode.equals(vnp_TxnRef)
                        && String.valueOf((long) (order.getTotal() * 100)).equals(vnp_Amount);
            } else {
                // If order is not in session, try to find it by order code
                String orderCode = null;
                if (vnp_OrderInfo != null && vnp_OrderInfo.contains("Thanh toan don hang ")) {
                    orderCode = vnp_OrderInfo.replace("Thanh toan don hang ", "");
                }

                if (orderCode != null) {
                    // Find order by order code
                    List<Order> orders = orderDAO.getAllOrders();
                    for (Order o : orders) {
                        if (orderCode.equals(o.getOrderCode())) {
                            order = o;
                            break;
                        }
                    }

                    if (order != null) {
                        isValidTransaction = String.valueOf((long) (order.getTotal() * 100)).equals(vnp_Amount);
                    }
                }
            }

            // Check if payment is successful
            if (isValidHash && isValidTransaction && "00".equals(vnp_ResponseCode) && "00".equals(vnp_TransactionStatus)) {
                // Payment successful - process order
                if (order != null) {
                    // Update payment status - DIRECT DATABASE ACCESS
                    try (java.sql.Connection conn = new Context.DBContext().connection; java.sql.PreparedStatement stmt = conn.prepareStatement(
                            "UPDATE payments SET payment_status = 'completed' WHERE order_id = ?")) {

                        stmt.setInt(1, order.getId());
                        int updateResult = stmt.executeUpdate();
                        System.out.println("Updated payment status result: " + updateResult + " rows affected");
                    } catch (Exception e) {
                        System.out.println("Error updating payment status: " + e.getMessage());
                    }

                    // Update order status
                    orderDAO.updateOrderStatus(order.getId(), "processing", order.getUserId());

                    // Update the in-memory order object
                    order.setPaymentStatus("completed");

                    request.setAttribute("orderId", order.getId());

                    // Clear cart
                    Integer userId = order.getUserId() > 0 ? order.getUserId() : null;
                    DAO.CartDAO cartDAO = new DAO.CartDAO();

                    if (userId != null) {
                        for (CartItem item : order.getItems()) {
                            cartDAO.deleteCartItem(request, response, item.getId(), userId);
                        }
                    } else {
                        Cart emptyCart = new Cart();
                        emptyCart.setItems(new ArrayList<>());
                        cartDAO.saveCartToCookies(response, emptyCart);
                    }
                }

                // Store completed order in session for display
                session.setAttribute("completed_order", order);
                session.removeAttribute("pending_order");

                // Redirect to completion page
                response.sendRedirect("cartcompletion");
            } else {
                // Payment failed or validation failed
                String errorMessage = "Thanh toán không thành công. ";

                if ("24".equals(vnp_ResponseCode)) {
                    errorMessage += "Giao dịch đã bị hủy bởi khách hàng.";
                } else if ("51".equals(vnp_ResponseCode)) {
                    errorMessage += "Giao dịch đang xử lý hoặc đã được xử lý.";
                } else if ("01".equals(vnp_ResponseCode) || "02".equals(vnp_ResponseCode)) {
                    errorMessage += "Giao dịch không thành công do: Quỹ không đủ/Thẻ/Tài khoản bị khóa/Vượt hạn mức thanh toán.";
                } else if ("07".equals(vnp_ResponseCode) || "09".equals(vnp_ResponseCode)) {
                    errorMessage += "Giao dịch bị nghi ngờ gian lận hoặc không đúng.";
                } else if (!isValidHash) {
                    errorMessage += "Thông tin không hợp lệ. Hash không khớp.";
                } else if (!isValidTransaction) {
                    errorMessage += "Thông tin giao dịch không khớp với dữ liệu đơn hàng.";
                } else {
                    errorMessage += "Lỗi không xác định. Mã lỗi: " + vnp_ResponseCode;
                }

                request.setAttribute("paymentSuccess", false);
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("payment_failed.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Exception in processVNPayReturn: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("paymentSuccess", false);
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi xử lý kết quả thanh toán: " + e.getMessage());
            request.getRequestDispatcher("payment_failed.jsp").forward(request, response);
        }
    }

    // Helper method to build VNPay URL
    private String buildVNPayUrl(Map<String, String> vnp_Params) throws Exception {
        // Add sorting for VNPay params
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                // Build hash data
                hashData.append(fieldName).append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                // Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                if (itr.hasNext()) {
                    hashData.append('&');
                    query.append('&');
                }
            }
        }

        // Add secure hash
        String vnp_SecureHash = calculateHMAC(hashData.toString(), VNP_HASH_SECRET);
        query.append("&vnp_SecureHash=").append(vnp_SecureHash);

        // Build the full URL
        String queryUrl = query.toString();
        String paymentUrl = VNP_API_URL + "?" + queryUrl;

        return paymentUrl;
    }

    // Helper method to calculate HMAC hash
    private String calculateHMAC(String data, String key) throws Exception {
        Mac hmac = Mac.getInstance("HmacSHA512");
        SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(), "HmacSHA512");
        hmac.init(secretKeySpec);
        byte[] hmacBytes = hmac.doFinal(data.getBytes());
        return bytesToHex(hmacBytes);
    }

    // Helper method to convert bytes to hex string
    private String bytesToHex(byte[] bytes) {
        StringBuilder result = new StringBuilder();
        for (byte b : bytes) {
            result.append(String.format("%02x", b));
        }
        return result.toString();
    }

    // Helper method to validate VNPay hash
    private boolean validateVNPayHash(Map<String, String> params, String secureHash) {
        try {
            // Sort field names
            List<String> fieldNames = new ArrayList<>(params.keySet());
            Collections.sort(fieldNames);

            // Create hash data
            StringBuilder hashData = new StringBuilder();

            Iterator<String> itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = itr.next();
                String fieldValue = params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    // Build hash data
                    hashData.append(fieldName).append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                    if (itr.hasNext()) {
                        hashData.append('&');
                    }
                }
            }

            // Calculate HMAC hash
            String calculatedHash = calculateHMAC(hashData.toString(), VNP_HASH_SECRET);

            // Compare calculated hash with received hash
            return calculatedHash.equalsIgnoreCase(secureHash);
        } catch (Exception e) {
            System.out.println("Error validating VNPay hash: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // Helper method to get client IP address
    private String getClientIpAddress(HttpServletRequest request) {
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null || ipAddress.isEmpty()) {
            ipAddress = request.getRemoteAddr();
        }
        return ipAddress;
    }

    // Helper method to convert request parameters to map
    private Map<String, String> getParameterMap(HttpServletRequest request) {
        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();

        for (Map.Entry<String, String[]> entry : requestParams.entrySet()) {
            String key = entry.getKey();
            String[] values = entry.getValue();
            if (values != null && values.length > 0) {
                params.put(key, values[0]);
            }
        }

        return params;
    }
}
