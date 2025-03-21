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

    // Kiểm tra đơn hàng đã hoàn tất từ PaymentServlet
    Order completedOrder = (Order) session.getAttribute("completed_order");
    if (completedOrder != null) {
        // Hiển thị trang xác nhận đơn hàng thành công
        prepareOrderAttributes(request, completedOrder);
        session.removeAttribute("completed_order");
        request.getRequestDispatcher("cartcompletion.jsp").forward(request, response);
        return;
    }

    // Lấy thông tin đơn hàng từ session
    String addressId = (String) session.getAttribute("shipping_address_id");
    String shippingMethod = (String) session.getAttribute("shipping_method");
    Double shippingFee = (Double) session.getAttribute("shipping_fee");
    String paymentMethod = (String) session.getAttribute("payment_method");

    if (addressId == null || shippingMethod == null || shippingFee == null || paymentMethod == null) {
        response.sendRedirect("cartdetail");
        return;
    }

    // Lấy danh sách sản phẩm đã chọn
    List<String> selectedItemIds = (List<String>) session.getAttribute("selectedItemIds");
    List<String> selectedQuantities = (List<String>) session.getAttribute("selectedQuantities");

    if (selectedItemIds == null || selectedQuantities == null || selectedItemIds.isEmpty()) {
        response.sendRedirect("cartdetail");
        return;
    }

    Cart cart = user != null ? cartDAO.getCartByUserId(user.getId()) : cartDAO.getCartFromCookies(request);
    if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
        response.sendRedirect("cartdetail");
        return;
    }

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

    UserAddress shippingAddress = getShippingAddress(user, addressId, request);
    if (shippingAddress == null) {
        response.sendRedirect("cartcontact");
        return;
    }

    // Tính toán tổng tiền
    double subtotal = 0;
    for (CartItem item : selectedItems) {
        subtotal += item.getProductPrice() * item.getQuantity();
    }
    Double discountAmount = (Double) session.getAttribute("cartDiscount");
    String appliedCoupon = (String) session.getAttribute("appliedCoupon");
    double total = subtotal - (discountAmount != null ? discountAmount : 0) + shippingFee;

    // Tạo đối tượng Order nhưng chưa lưu vào database
    Order order = new Order();
    if (user != null) {
        order.setUserId(user.getId());
        order.setRecipientEmail(user.getEmail());
    } else {
        order.setRecipientEmail(shippingAddress.getRecipientName() != null ? shippingAddress.getRecipientName() : "guest@example.com");
    }

    String orderCode = "ORD" + System.currentTimeMillis() + (int)(Math.random() * 1000);
    order.setOrderCode(orderCode);
    order.setStatus("pending");
    order.setTotal(total);
    order.setRecipientName(shippingAddress.getRecipientName());
    order.setPhone(shippingAddress.getPhone());
    order.setAddress(shippingAddress.getAddress());
    order.setItems(selectedItems);
    order.setShippingMethod(shippingMethod);
    order.setPaymentMethod(paymentMethod);
    order.setShippingFee(shippingFee);
    order.setPaymentStatus("pending");
    if (discountAmount != null && discountAmount > 0 && appliedCoupon != null) {
        order.setDiscountAmount(discountAmount);
        order.setCouponCode(appliedCoupon);
    }

    if ("bank".equals(paymentMethod)) {
        // Lưu đơn hàng tạm thời vào session thay vì database
        session.setAttribute("pending_order", order);
        response.sendRedirect("payment");
        return;
    } else if ("cod".equals(paymentMethod)) {
        // Với COD, lưu đơn hàng vào database ngay
        Order savedOrder = orderDAO.createOrder(order);
        if (savedOrder != null) {
            prepareOrderAttributes(request, savedOrder);
            clearCartAndSession(request, response, user, selectedItems, session);
            request.getRequestDispatcher("cartcompletion.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Có lỗi xảy ra khi tạo đơn hàng. Vui lòng thử lại.");
            request.getRequestDispatcher("cartdetail").forward(request, response);
        }
    }
}

// Phương thức hỗ trợ để gán các thuộc tính cho request
private void prepareOrderAttributes(HttpServletRequest request, Order order) {
    request.setAttribute("orderCode", order.getOrderCode());
    request.setAttribute("orderDate", order.getOrderDate() != null ? order.getOrderDate() : new Date());
    request.setAttribute("total", order.getTotal());
    request.setAttribute("paymentMethod", order.getPaymentMethod());
    request.setAttribute("shippingMethod", order.getShippingMethod());
    request.setAttribute("shippingFee", order.getShippingFee());
    request.setAttribute("selectedItems", order.getItems());
    request.setAttribute("paymentStatus", order.getPaymentStatus());
    double subtotal = 0;
    for (CartItem item : order.getItems()) {
        subtotal += item.getProductPrice() * item.getQuantity();
    }
    request.setAttribute("subtotal", subtotal);
    if (order.getDiscountAmount() > 0) {
        request.setAttribute("discount", order.getDiscountAmount());
    }
    UserAddress shippingAddress = new UserAddress();
    shippingAddress.setRecipientName(order.getRecipientName());
    shippingAddress.setPhone(order.getPhone());
    shippingAddress.setAddress(order.getAddress());
    request.setAttribute("shippingAddress", shippingAddress);
}

// Phương thức hỗ trợ để lấy địa chỉ giao hàng
private UserAddress getShippingAddress(User user, String addressId, HttpServletRequest request) {
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
    return shippingAddress;
}

// Phương thức hỗ trợ để xóa giỏ hàng và session
private void clearCartAndSession(HttpServletRequest request, HttpServletResponse response, User user, List<CartItem> selectedItems, HttpSession session) {
    if (user != null) {
        for (CartItem item : selectedItems) {
            cartDAO.deleteCartItem(request, response, item.getId(), user.getId());
        }
    } else {
        for (CartItem item : selectedItems) {
            cartDAO.deleteCartItemFromCookie(request, response, item.getId());
        }
    }
    clearOrderSession(session);
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