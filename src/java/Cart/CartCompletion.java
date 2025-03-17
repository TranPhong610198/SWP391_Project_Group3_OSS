package Cart;

import DAO.CartDAO;
import DAO.OrderDAO;
import DAO.UserDAO;
import DAO.InventoryDAO;
import com.google.gson.reflect.TypeToken;
import entity.Cart;
import entity.CartItem;
import entity.Order;
import entity.User;
import entity.UserAddress;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@WebServlet(name = "CartCompletion", urlPatterns = {"/cartcompletion"})
public class CartCompletion extends HttpServlet {

    private CartDAO cartDAO = new CartDAO();
    private OrderDAO orderDAO = new OrderDAO();
    private UserDAO userDAO = new UserDAO();
    private InventoryDAO inventoryDAO = new InventoryDAO();
    private static final String GUEST_ADDRESS_COOKIE = "guest_address";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartCompletion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartCompletion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        // Kiểm tra xem có đơn hàng đã thanh toán thành công từ PaymentServlet chuyển tới không
        Order completedOrder = (Order) session.getAttribute("completed_order");
        if (completedOrder != null) {
            
            request.setAttribute("orderCode", completedOrder.getOrderCode());
            
            // Đảm bảo có ngày đặt hàng, nếu không thì tạo mới
            Date orderDate = completedOrder.getOrderDate();
            if (orderDate == null) {
                orderDate = new Date();
            }
            request.setAttribute("orderDate", orderDate);
            request.setAttribute("total", completedOrder.getTotal());
            request.setAttribute("paymentMethod", completedOrder.getPaymentMethod());
            request.setAttribute("shippingMethod", completedOrder.getShippingMethod());
            request.setAttribute("shippingFee", completedOrder.getShippingFee());
            request.setAttribute("selectedItems", completedOrder.getItems());
            
            // Hiển thị trạng thái thanh toán - FIX HERE
            // Sử dụng trạng thái thanh toán từ đối tượng Order thay vì hardcode
            request.setAttribute("paymentStatus", completedOrder.getPaymentStatus());
            
            // Tính toán subtotal
            double subtotal = 0;
            for (CartItem item : completedOrder.getItems()) {
                subtotal += item.getProductPrice() * item.getQuantity();
            }
            request.setAttribute("subtotal", subtotal);
            
            // Đặt thông tin giảm giá nếu có
            if (completedOrder.getDiscountAmount() > 0) {
                request.setAttribute("discount", completedOrder.getDiscountAmount());
            }
            
            // Chuẩn bị thông tin địa chỉ giao hàng
            UserAddress shippingAddress = new UserAddress();
            shippingAddress.setRecipientName(completedOrder.getRecipientName());
            shippingAddress.setPhone(completedOrder.getPhone());
            shippingAddress.setAddress(completedOrder.getAddress());
            request.setAttribute("shippingAddress", shippingAddress);
            
            // Xóa đơn hàng đã hoàn thành khỏi session
            session.removeAttribute("completed_order");
            
            // Chuyển đến trang xác nhận đơn hàng
            request.getRequestDispatcher("cartcompletion.jsp").forward(request, response);
            return;
        }

        // Lấy thông tin đơn hàng từ session
        String addressId = (String) session.getAttribute("shipping_address_id");
        String shippingMethod = (String) session.getAttribute("shipping_method");
        Double shippingFee = (Double) session.getAttribute("shipping_fee");
        String paymentMethod = (String) session.getAttribute("payment_method");

        // Kiểm tra thông tin đơn hàng
        if (addressId == null || shippingMethod == null || shippingFee == null || paymentMethod == null) {
            response.sendRedirect("cartdetail");
            return;
        }

        // Lấy thông tin sản phẩm đã chọn
        List<String> selectedItemIds = (List<String>) session.getAttribute("selectedItemIds");
        List<String> selectedQuantities = (List<String>) session.getAttribute("selectedQuantities");

        if (selectedItemIds == null || selectedQuantities == null || selectedItemIds.isEmpty()) {
            response.sendRedirect("cartdetail");
            return;
        }

        // Lấy thông tin giỏ hàng
        Cart cart = user != null
                ? cartDAO.getCartByUserId(user.getId())
                : cartDAO.getCartFromCookies(request);

        if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cartdetail");
            return;
        }

        // Tạo danh sách sản phẩm đã chọn
        List<CartItem> selectedItems = new ArrayList<>();
        for (CartItem item : cart.getItems()) {
            for (int i = 0; i < selectedItemIds.size(); i++) {
                if (String.valueOf(item.getId()).equals(selectedItemIds.get(i))) {
                    item.setQuantity(Integer.parseInt(selectedQuantities.get(i)));
                    selectedItems.add(item);
                    break;
                }
            }
        }

        // Lấy thông tin địa chỉ giao hàng
        UserAddress shippingAddress = null;
        if (user != null) {
            List<UserAddress> addresses = userDAO.getUserAddresses(user.getId());
            for (UserAddress address : addresses) {
                if (String.valueOf(address.getId()).equals(addressId)) {
                    shippingAddress = address;
                    break;
                }
            }
        } else {
            List<UserAddress> guestAddresses = getGuestAddressesFromCookie(request);
            for (UserAddress address : guestAddresses) {
                if (String.valueOf(address.getId()).equals(addressId)) {
                    shippingAddress = address;
                    break;
                }
            }
        }

        if (shippingAddress == null) {
            response.sendRedirect("cartcontact");
            return;
        }

        // Tính tổng tiền
        double subtotal = 0;
        for (CartItem item : selectedItems) {
            subtotal += item.getProductPrice() * item.getQuantity();
        }

        // Lấy giảm giá từ session
        Double discountAmount = (Double) session.getAttribute("cartDiscount");
        String appliedCoupon = (String) session.getAttribute("appliedCoupon");

        // Tính tổng tiền cuối cùng
        double total = subtotal;
        if (discountAmount != null && discountAmount > 0) {
            total -= discountAmount;
        }
        total += shippingFee;

        // Tạo đối tượng Order
        Order order = new Order();

        // Thiết lập thông tin đơn hàng
        if (user != null) {
            order.setUserId(user.getId());
            order.setRecipientEmail(user.getEmail());
        } else {
            // Khách vãng lai sẽ có userId là null trong database
            order.setRecipientEmail(shippingAddress.getRecipientName()!= null
                    ? shippingAddress.getRecipientName(): "guest@example.com");
        }

        // Tạo mã đơn hàng duy nhất và dễ đọc
        Random random = new Random();
        int randomNumber = random.nextInt(900000) + 100000; // Số ngẫu nhiên từ 100000 đến 999999
        String orderCode = "ORD" + randomNumber;
        order.setOrderCode(orderCode);

        order.setStatus("pending");
        order.setTotal(total);
        order.setRecipientName(shippingAddress.getRecipientName());
        order.setPhone(shippingAddress.getPhone());
        order.setAddress(shippingAddress.getAddress());
        order.setItems(selectedItems);

        // Nếu có mã giảm giá
        if (discountAmount != null && discountAmount > 0 && appliedCoupon != null) {
            order.setDiscountAmount(discountAmount);
            order.setCouponCode(appliedCoupon);
        }

        // Lưu thông tin giao hàng và thanh toán
        order.setShippingMethod(shippingMethod);
        order.setPaymentMethod(paymentMethod);
        order.setShippingFee(shippingFee);
        
        // Đặt trạng thái thanh toán ban đầu
        if ("bank".equals(paymentMethod) || "bank_transfer".equals(paymentMethod)) {
            order.setPaymentStatus("pending"); // Trạng thái ban đầu là "pending" cho thanh toán online
        } else {
            order.setPaymentStatus("pending"); // Mặc định cho COD
        }

        // Nếu là thanh toán trực tuyến qua VNPay
        if ("bank".equals(paymentMethod)) {
            // Lưu đơn hàng vào database trước
            Order savedOrder = orderDAO.createOrder(order);

            if (savedOrder != null) {
                // Lưu thông tin đơn hàng vào session để sử dụng sau khi thanh toán
                session.setAttribute("pending_order", savedOrder);

                // Chuyển hướng đến trang thanh toán trực tuyến
                response.sendRedirect("payment");
                return;
            } else {
                // Xử lý lỗi khi không thể tạo đơn hàng
                request.setAttribute("error", "Có lỗi xảy ra khi tạo đơn hàng. Vui lòng thử lại.");
                request.getRequestDispatcher("cartdetail").forward(request, response);
                return;
            }
        }

        // Xử lý đơn hàng COD
        if ("cod".equals(paymentMethod)) {
            // Lưu đơn hàng vào database
            Order savedOrder = orderDAO.createOrder(order);

            if (savedOrder != null) {
                // Cập nhật thông tin để hiển thị
                request.setAttribute("orderCode", savedOrder.getOrderCode());
                request.setAttribute("orderDate", new Date());
                request.setAttribute("total", total);
                request.setAttribute("paymentMethod", paymentMethod);
                request.setAttribute("paymentStatus", "pending"); // Đơn hàng COD có trạng thái thanh toán là "pending"
                request.setAttribute("shippingMethod", shippingMethod);
                request.setAttribute("shippingFee", shippingFee);
                request.setAttribute("subtotal", subtotal);
                request.setAttribute("selectedItems", selectedItems);
                request.setAttribute("shippingAddress", shippingAddress);

                if (discountAmount != null && discountAmount > 0) {
                    request.setAttribute("discount", discountAmount);
                }

                // Xóa sản phẩm đã đặt khỏi giỏ hàng
                if (user != null) {
                    for (CartItem item : selectedItems) {
                        cartDAO.deleteCartItem(request, response, item.getId(), user.getId());
                    }
                } else {
                    for (CartItem item : selectedItems) {
                        cartDAO.deleteCartItemFromCookie(request, response, item.getId());
                    }
                }

                // Xóa thông tin đặt hàng khỏi session
                clearOrderSession(session);

                // Chuyển đến trang xác nhận đơn hàng
                request.getRequestDispatcher("cartcompletion.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("error", "Có lỗi xảy ra khi tạo đơn hàng. Vui lòng thử lại.");
                request.getRequestDispatcher("cartdetail").forward(request, response);
                return;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // POST requests will be redirected to GET
        doGet(request, response);
    }

    // Lấy danh sách địa chỉ khách từ cookie
    private List<UserAddress> getGuestAddressesFromCookie(HttpServletRequest request) {
        List<UserAddress> addresses = new ArrayList<>();
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (GUEST_ADDRESS_COOKIE.equals(cookie.getName())) {
                    try {
                        // Giải mã cookie
                        String addressesJson = cartDAO.decodeCookieValue(cookie.getValue());

                        // Sử dụng TypeToken để chỉ định loại dữ liệu cần chuyển đổi
                        Type listType = new TypeToken<ArrayList<UserAddress>>() {
                        }.getType();
                        addresses = cartDAO.gson.fromJson(addressesJson, listType);

                        break;
                    } catch (Exception e) {
                        System.out.println("Error parsing guest addresses cookie: " + e.getMessage());
                    }
                }
            }
        }

        return addresses != null ? addresses : new ArrayList<>();
    }

    // Xóa thông tin đặt hàng khỏi session
    private void clearOrderSession(HttpSession session) {
        session.removeAttribute("shipping_address_id");
        session.removeAttribute("shipping_method");
        session.removeAttribute("shipping_fee");
        session.removeAttribute("payment_method");
        session.removeAttribute("selectedItemIds");
        session.removeAttribute("selectedQuantities");
        session.removeAttribute("cartDiscount");
        session.removeAttribute("appliedCoupon");
        session.removeAttribute("orderPending");
        session.removeAttribute("pending_order");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}