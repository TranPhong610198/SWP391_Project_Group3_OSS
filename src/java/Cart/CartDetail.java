/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Cart;

import DAO.CartDAO;
import DAO.CouponDAO;
import entity.Cart;
import entity.Coupon;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 *
 * @author thanh
 */
@WebServlet(name = "CartDetail", urlPatterns = {"/cartdetail"})
public class CartDetail extends HttpServlet {

    private CartDAO cartDAO = new CartDAO();
    private CouponDAO couponDAO = new CouponDAO();

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
            out.println("<title>Servlet CartDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartDetail at " + request.getContextPath() + "</h1>");
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

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        Cart cart = getOrCreateCart(user.getId());

        // Lấy danh sách mã giảm giá có thể sử dụng 
        List<Coupon> availableCoupons = couponDAO.getAvailableCoupons();
        request.setAttribute("availableCoupons", availableCoupons);

        setupCartAttributes(request, cart);
        request.getRequestDispatcher("cartdetail.jsp").forward(request, response);
    }

    private Cart getOrCreateCart(int userId) {
        Cart cart = cartDAO.getCartByUserId(userId);
        if (cart == null) {
            cart = cartDAO.createCart(userId);
        }
        return cart;
    }

    private void setupCartAttributes(HttpServletRequest request, Cart cart) {
        double totalAmount = cartDAO.calculateTotalAmount(cart);
        double discount = calculateDiscount(request, totalAmount);

        request.setAttribute("cart", cart);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("discount", discount);
        request.setAttribute("finalAmount", totalAmount - discount);

        String appliedCoupon = (String) request.getSession().getAttribute("appliedCoupon");
        if (appliedCoupon != null) {
            request.setAttribute("appliedCoupon", appliedCoupon);
            Coupon couponDetails = couponDAO.getCouponByCode(appliedCoupon);
            if (couponDetails != null) {
                request.setAttribute("appliedCouponDetails", couponDetails);
            }
        }
    }

    private double calculateDiscount(HttpServletRequest request, double totalAmount) {
        HttpSession session = request.getSession();
        String appliedCoupon = (String) session.getAttribute("appliedCoupon");

        if (appliedCoupon != null) {
            try {
                return validateAndCalculateCouponDiscount(appliedCoupon, totalAmount);
            } catch (Exception e) {
                session.removeAttribute("appliedCoupon");
                session.removeAttribute("cartDiscount");
                request.setAttribute("couponError", e.getMessage());
            }
        }
        return 0.0;
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
        // Lấy loại hành động từ request
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            handleUpdateQuantity(request);
        } else if ("delete".equals(action)) {
            handleDeleteItem(request);
        } else if ("applyCoupon".equals(action)) {
            handleApplyCoupon(request, response);
            return;
        } else if ("checkout".equals(action)) {
            handleCheckout(request, response);
            return;
        }

        response.sendRedirect("cartdetail");
    }

    private void handleCheckout(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
    
    // Lấy các sản phẩm được chọn
    String[] selectedItems = request.getParameterValues("selectedItems");
    
    // Kiểm tra có sản phẩm được chọn không
    if (selectedItems == null || selectedItems.length == 0) {
        request.setAttribute("error", "Vui lòng chọn sản phẩm");
        doGet(request, response);
        return;
    }

    // Lưu vào session
    session.setAttribute("selectedItems", selectedItems);
    
    // Lưu thông tin giảm giá nếu có
    if (session.getAttribute("appliedCoupon") != null) {
        double cartDiscount = (Double) request.getAttribute("discount");
        session.setAttribute("cartDiscount", cartDiscount);
    }

    // Chuyển hướng sang trang contact
    response.sendRedirect("cartcontact");}

   private void handleUpdateQuantity(HttpServletRequest request) {
    try {
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        // Thêm logging
        System.out.println("Updating cart item: " + cartItemId + " with quantity: " + quantity);
        
        boolean success = cartDAO.updateCartItemQuantity(cartItemId, quantity);
        
        if (!success) {
            System.out.println("Failed to update cart item quantity");
        }
    } catch (NumberFormatException e) {
        System.out.println("Error parsing quantity: " + e.getMessage());
        // Log the parameters for debugging
        System.out.println("cartItemId: " + request.getParameter("cartItemId"));
        System.out.println("quantity: " + request.getParameter("quantity"));
    }
}

    private void handleDeleteItem(HttpServletRequest request) {
        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            cartDAO.deleteCartItem(cartItemId);
        } catch (NumberFormatException e) {
            System.out.println("Lỗi khi parse ID sản phẩm: " + e.getMessage());
        }
    }

    private void handleApplyCoupon(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String couponCode = request.getParameter("couponCode");

        User user = (User) session.getAttribute("acc");
        Cart cart = cartDAO.getCartByUserId(user.getId());

        if (couponCode == null || couponCode.trim().isEmpty()) {
            session.removeAttribute("appliedCoupon");
            session.removeAttribute("cartDiscount");
            response.sendRedirect("cartdetail");
            return;
        }

        try {
            double totalAmount = cartDAO.calculateTotalAmount(cart);
            double discount = validateAndCalculateCouponDiscount(couponCode, totalAmount);

            session.setAttribute("appliedCoupon", couponCode);
            session.setAttribute("cartDiscount", discount);
        } catch (Exception e) {
            session.removeAttribute("appliedCoupon");
            session.removeAttribute("cartDiscount");
            request.setAttribute("couponError", e.getMessage());
        }

        response.sendRedirect("cartdetail");
    }

    private double validateAndCalculateCouponDiscount(String couponCode, double totalAmount) throws Exception {
        Coupon coupon = couponDAO.getCouponByCode(couponCode);

        if (coupon == null) {
            throw new Exception("Mã giảm giá không tồn tại!");
        }

        if (!"active".equals(coupon.getStatus())) {
            throw new Exception("Mã giảm giá không còn hiệu lực!");
        }

        Date expiryDate = coupon.getExpiry_date();
        if (expiryDate != null) {
            Date currentDate = new Date(System.currentTimeMillis());
            if (currentDate.after(expiryDate)) {
                throw new Exception("Mã giảm giá đã hết hạn!");
            }
        }

        Integer usageLimit = coupon.getUsage_limit();
        if (usageLimit != null && usageLimit > 0) {
            int usedCount = coupon.getUsed_count();
            if (usedCount >= usageLimit) {
                throw new Exception("Mã giảm giá đã hết lượt sử dụng!");
            }
        }

        if (totalAmount < coupon.getMin_order_amount()) {
            throw new Exception(String.format("Đơn hàng cần tối thiểu %,.0f₫ để áp dụng mã này!",
                    coupon.getMin_order_amount()));
        }

        double discount;
        if ("percentage".equals(coupon.getDiscount_type())) {
            discount = totalAmount * (coupon.getDiscount_value() / 100);
            if (coupon.getMax_discount() > 0 && discount > coupon.getMax_discount()) {
                discount = coupon.getMax_discount();
            }
        } else {
            discount = coupon.getDiscount_value();
        }

        return discount;
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
