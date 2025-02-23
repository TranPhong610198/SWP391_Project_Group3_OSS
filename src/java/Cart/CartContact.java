/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Cart;

import DAO.CartDAO;
import DAO.UserDAO;
import entity.Cart;
import entity.CartItem;
import entity.User;
import entity.UserAddress;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thanh
 */
@WebServlet(name = "CartContact", urlPatterns = {"/cartcontact"})
public class CartContact extends HttpServlet {

    private CartDAO cartDAO = new CartDAO();
    private UserDAO userDAO = new UserDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartContact</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartContact at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        // Check if user is logged in 
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        // Get cart
        Cart cart = cartDAO.getCartByUserId(user.getId());
        if (cart == null || cart.getItems() == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cartdetail");
            return;
        }

        // Get selected items from session
        List<String> selectedItemIds = (List<String>) session.getAttribute("selectedItemIds");
        List<String> selectedQuantities = (List<String>) session.getAttribute("selectedQuantities");
        List<CartItem> selectedItems = new ArrayList<>();

        if (selectedItemIds != null && selectedQuantities != null
                && selectedItemIds.size() == selectedQuantities.size()) {

            for (CartItem item : cart.getItems()) {
                for (int i = 0; i < selectedItemIds.size(); i++) {
                    if (String.valueOf(item.getId()).equals(selectedItemIds.get(i))) {
                        item.setQuantity(Integer.parseInt(selectedQuantities.get(i)));
                        selectedItems.add(item);
                        break;
                    }
                }
            }
        }

        if (selectedItems.isEmpty()) {
            response.sendRedirect("cartdetail");
            return;
        }

        // Calculate totals
        double subtotal = 0;
        for (CartItem item : selectedItems) {
            subtotal += item.getProductPrice() * item.getQuantity();
        }

        // Get discount from session
        String appliedCoupon = (String) session.getAttribute("appliedCoupon");
        Double discountAmount = (Double) session.getAttribute("cartDiscount"); // Thay đổi từ discount sang cartDiscount

        // Set default shipping fee
        double shippingFee = 30000.0;

        // Get user's shipping addresses
        List<UserAddress> addresses = userDAO.getUserAddresses(user.getId());

        // Calculate final total with discount
        double total = subtotal;
        if (discountAmount != null && discountAmount > 0) {
            total -= discountAmount;
        }
        total += shippingFee;

        // Store data in request
        request.setAttribute("selectedItems", selectedItems);
        request.setAttribute("addresses", addresses);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("discount", discountAmount); // Thay đổi
        request.setAttribute("appliedCoupon", appliedCoupon);
        request.setAttribute("shippingFee", shippingFee);
        request.setAttribute("total", total);

        request.getRequestDispatcher("cartcontact.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");

        if ("add_address".equals(action)) {
            // Handle adding new address
            UserAddress newAddress = new UserAddress();
            newAddress.setUserId(user.getId());
            newAddress.setRecipientName(request.getParameter("recipient_name"));
            newAddress.setPhone(request.getParameter("phone"));
            newAddress.setAddress(request.getParameter("address"));
            newAddress.setDefault(request.getParameter("is_default") != null);

            userDAO.addUserAddress(newAddress);

            response.sendRedirect("cartcontact");
            return;
        }

        // Get selected shipping address
        String addressId = request.getParameter("shipping_address");
        if (addressId == null || addressId.isEmpty()) {
            request.setAttribute("error", "Vui lòng chọn địa chỉ giao hàng");
            doGet(request, response);
            return;
        }

        // Get shipping method and calculate fee
        String shippingMethod = request.getParameter("shipping_method");
        double shippingFee = "express".equals(shippingMethod) ? 45000.0 : 30000.0;

        // Get payment method
        String paymentMethod = request.getParameter("payment_method");
        if (paymentMethod == null || paymentMethod.isEmpty()) {
            request.setAttribute("error", "Vui lòng chọn phương thức thanh toán");
            doGet(request, response);
            return;
        }

       // Lưu thông tin đơn hàng vào session
    session.setAttribute("shipping_address_id", addressId);
    session.setAttribute("shipping_method", shippingMethod);
    session.setAttribute("shipping_fee", shippingFee);
    session.setAttribute("payment_method", paymentMethod);

    // Giữ lại thông tin giảm giá
    Double discount = (Double) session.getAttribute("cartDiscount");
    String appliedCoupon = (String) session.getAttribute("appliedCoupon");
    if (discount != null) {
        session.setAttribute("order_discount", discount);
        session.setAttribute("order_coupon", appliedCoupon);
    }

    // Redirect to order completion
    response.sendRedirect("cartcompletion.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
