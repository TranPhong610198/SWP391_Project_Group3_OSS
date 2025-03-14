/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Orders;

import DAO.OrderDAO;
import entity.Order;
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
@WebServlet(name="OrderDetail", urlPatterns={"/orderdetail"})
public class OrderDetail extends HttpServlet {
   private OrderDAO orderDAO = new OrderDAO();
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
            out.println("<title>Servlet OrderDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetail at " + request.getContextPath () + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        
        // Chuyển hướng nếu chưa đăng nhập
        if (user == null) {
            response.sendRedirect("login?redirect=orderdetail" + 
                  (request.getParameter("id") != null ? "?id=" + request.getParameter("id") : ""));
            return;
        }
        
        // Xử lý hành động (nếu có)
        String action = request.getParameter("action");
        String orderId = request.getParameter("id");
        
        if (action != null && orderId != null && !orderId.isEmpty()) {
            try {
                int id = Integer.parseInt(orderId);
                
                // Kiểm tra xem đơn hàng có tồn tại và thuộc về người dùng này không
                Order order = orderDAO.getOrderById(id);
                if (order == null || order.getUserId() != user.getId()) {
                    response.sendRedirect("myorder");
                    return;
                }
                
                // Xử lý các action
                if ("cancel".equals(action)) {
                    boolean success = orderDAO.cancelOrder(id, user.getId());
                    if (success) {
                        request.setAttribute("successMessage", "Đơn hàng đã được hủy thành công");
                    } else {
                        request.setAttribute("errorMessage", "Không thể hủy đơn hàng. Đơn hàng có thể đã được xử lý.");
                    }
                } else if ("reorder".equals(action)) {
                    // Logic cho mua lại đơn hàng
                    boolean success = reorderItems(request, response, id, user.getId());
                    if (success) {
                        response.sendRedirect("cartdetail");
                        return;
                    } else {
                        request.setAttribute("errorMessage", "Không thể thêm sản phẩm vào giỏ hàng. Vui lòng thử lại sau.");
                    }
                }
            } catch (NumberFormatException e) {
                // Không làm gì, sẽ hiển thị trang chi tiết đơn hàng bình thường
            }
        }
        
        // Hiển thị chi tiết đơn hàng
        displayOrderDetail(request, response);
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
         HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        
        // Chuyển hướng nếu chưa đăng nhập
        if (user == null) {
            response.sendRedirect("login?redirect=myorder");
            return;
        }
        
        String orderId = request.getParameter("id");
        String action = request.getParameter("action");
        
        if (orderId != null && !orderId.isEmpty() && action != null) {
            try {
                int id = Integer.parseInt(orderId);
                
                // Kiểm tra xem đơn hàng có tồn tại và thuộc về người dùng này không
                Order order = orderDAO.getOrderById(id);
                if (order == null || order.getUserId() != user.getId()) {
                    response.sendRedirect("myorder");
                    return;
                }
                
                if ("feedback".equals(action)) {
                    // Xử lý việc gửi đánh giá
                    String itemId = request.getParameter("itemId");
                    String rating = request.getParameter("rating");
                    String comment = request.getParameter("comment");
                    
                    if (itemId != null && rating != null) {
                        try {
                            int orderItemId = Integer.parseInt(itemId);
                            int ratingValue = Integer.parseInt(rating);
                            
//                            boolean success = submitFeedback(orderItemId, user.getId(), ratingValue, comment);
//                            if (success) {
//                                request.setAttribute("successMessage", "Cảm ơn bạn đã đánh giá sản phẩm!");
//                            } else {
//                                request.setAttribute("errorMessage", "Không thể gửi đánh giá. Vui lòng thử lại sau.");
//                            }
                        } catch (NumberFormatException e) {
                            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ.");
                        }
                    }
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "ID đơn hàng không hợp lệ.");
            }
        }
        
        // Hiển thị lại chi tiết đơn hàng
        displayOrderDetail(request, response);
    }
    
    private void displayOrderDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        
        // Lấy ID đơn hàng từ request
        String orderId = request.getParameter("id");
        if (orderId == null || orderId.isEmpty()) {
            response.sendRedirect("myorder");
            return;
        }
        
        try {
            int id = Integer.parseInt(orderId);
            
            // Lấy thông tin đơn hàng
            Order order = orderDAO.getOrderById(id);
            
            // Kiểm tra xem đơn hàng có tồn tại và thuộc về người dùng này không
            if (order == null || order.getUserId() != user.getId()) {
                response.sendRedirect("myorder");
                return;
            }
            
            // Thiết lập thuộc tính để hiển thị
            request.setAttribute("order", order);
            request.setAttribute("orderHistory", orderDAO.getOrderHistory(id));
            
            // Forward đến trang jsp
            request.getRequestDispatcher("orderdetail.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect("myorder");
        }
    }
    
    private boolean reorderItems(HttpServletRequest request, HttpServletResponse response, int orderId, int userId) {
        try {
            // Lấy các sản phẩm từ đơn hàng
            Order order = orderDAO.getOrderById(orderId);
            if (order == null || order.getItems() == null || order.getItems().isEmpty()) {
                return false;
            }
            
            // Lấy giỏ hàng hiện tại của người dùng
            DAO.CartDAO cartDAO = new DAO.CartDAO();
            entity.Cart cart = cartDAO.getCartByUserId(userId);
            
            // Nếu không có giỏ hàng, tạo mới
            if (cart == null) {
                cart = cartDAO.createCart(userId);
            }
            
            // Thêm các sản phẩm vào giỏ hàng
            boolean allItemsAdded = true;
            for (entity.CartItem item : order.getItems()) {
                // Kiểm tra tồn kho trước khi thêm
                DAO.InventoryDAO inventoryDAO = new DAO.InventoryDAO();
                entity.Variant variant = inventoryDAO.getVariant(item.getVariantId());
                
                if (variant != null && variant.getQuantity() > 0) {
                    // Thêm vào giỏ hàng với số lượng có sẵn trong kho
                    int quantityToAdd = Math.min(item.getQuantity(), variant.getQuantity());
                    
                    entity.CartItem newItem = new entity.CartItem();
                    newItem.setCartId(cart.getId());
                    newItem.setProductId(item.getProductId());
                    newItem.setVariantId(item.getVariantId());
                    newItem.setQuantity(quantityToAdd);
                    
                    boolean success = cartDAO.addCartItem(newItem);
                    if (!success) {
                        allItemsAdded = false;
                    }
                } else {
                    allItemsAdded = false;
                }
            }
            
            return allItemsAdded;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
//    private boolean submitFeedback(int orderItemId, int userId, int rating, String comment) {
//        try {
//            DAO.FeedbackDAO feedbackDAO = new DAO.FeedbackDAO();
//            return feedbackDAO.addFeedback(orderItemId, userId, rating, comment);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
    
    @Override
    public String getServletInfo() {
        return "Servlet hiển thị chi tiết đơn hàng";
    }
}