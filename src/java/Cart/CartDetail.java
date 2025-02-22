/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Cart;

import DAO.CartDAO;
import entity.Cart;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author thanh
 */
@WebServlet(name="CartDetail", urlPatterns={"/cartdetail"})
public class CartDetail extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<h1>Servlet CartDetail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        double discount = calculateDiscount(request);
        
        request.setAttribute("cart", cart);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("discount", discount);
    }
    
    private double calculateDiscount(HttpServletRequest request) {
        // Implement discount calculation logic here
        // For example, get from session if coupon was applied
        HttpSession session = request.getSession();
        Double discount = (Double) session.getAttribute("cartDiscount");
        return discount != null ? discount : 0.0;
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
         
        
        switch (action) {
            case "update":
                handleUpdateQuantity(request);
                break;
            case "delete":
                handleDeleteItem(request);
                break;
            case "applyCoupon":
                handleApplyCoupon(request);
                break;
        }
        
        response.sendRedirect("cartdetail");
    }
    
    private void handleUpdateQuantity(HttpServletRequest request) {
        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cartDAO.updateCartItemQuantity(cartItemId, quantity);
        } catch (NumberFormatException e) {
            System.out.println("Error parsing quantity: " + e.getMessage());
        }
    }
    
    private void handleDeleteItem(HttpServletRequest request) {
        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            cartDAO.deleteCartItem(cartItemId);
        } catch (NumberFormatException e) {
            System.out.println("Error parsing cartItemId: " + e.getMessage());
        }
    }
    
    private void handleApplyCoupon(HttpServletRequest request) {
        String couponCode = request.getParameter("couponCode");
        // Implement coupon validation and discount calculation
        // Save discount to session
        if (couponCode != null && !couponCode.trim().isEmpty()) {
            double discount = validateAndCalculateCouponDiscount(couponCode);
            HttpSession session = request.getSession();
            session.setAttribute("cartDiscount", discount);
        }
    }
    
    private double validateAndCalculateCouponDiscount(String couponCode) {
        // Implement coupon validation logic here
        return 0.0; // Return actual discount value
    }
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
