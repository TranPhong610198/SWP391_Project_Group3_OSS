package Orders;

import DAO.OrderDAO;
import entity.Order;
import entity.OrderHistory;
import entity.User;
import entity.CartItem;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/orderdetail"})
public class OrderDetail extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        // Check if user is logged in
        if (user == null) {
            response.sendRedirect("login?redirect=myorder");
            return;
        }
        
        // Get order ID from request
        String orderIdStr = request.getParameter("id");
        if (orderIdStr == null || orderIdStr.isEmpty()) {
            response.sendRedirect("myorder");
            return;
        }
        
        int orderId;
        try {
            orderId = Integer.parseInt(orderIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("myorder");
            return;
        }
        
        // Get order details
        Order order = orderDAO.getOrderById(orderId);
        
        // Check if order exists and belongs to the current user
        if (order == null || order.getUserId() != user.getId()) {
            response.sendRedirect("myorder");
            return;
        }
        
        // Get order history
        List<OrderHistory> orderHistory = orderDAO.getOrderHistory(orderId);
        
        // Calculate shipping fee based on shipping method
        double shippingFee = 30000.0; // Default standard shipping
        if (order.getShippingMethod() != null) {
            if (order.getShippingMethod().equals("express")) {
                shippingFee = 45000.0;
            }
        }
        
        // Calculate subtotal from order items
        double subtotal = 0;
        if (order.getItems() != null) {
            for (CartItem item : order.getItems()) {
                subtotal += item.getProductPrice() * item.getQuantity();
            }
        }
        
        // Set attributes for JSP
        request.setAttribute("order", order);
        request.setAttribute("orderHistory", orderHistory);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("shippingFee", shippingFee);
        
        // Forward to JSP
        request.getRequestDispatcher("orderdetail.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if there's an action parameter
        String action = request.getParameter("action");
        
        if (action != null && action.equals("cancel")) {
            // Handle order cancellation
            int orderId = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("acc");
            
            if (user != null) {
                boolean success = orderDAO.cancelOrder(orderId, user.getId());
                if (success) {
                    request.setAttribute("successMessage", "Đơn hàng đã được hủy thành công");
                } else {
                    request.setAttribute("errorMessage", "Không thể hủy đơn hàng. Vui lòng liên hệ với nhân viên hỗ trợ.");
                }
            }
        } else if (action != null && action.equals("reorder")) {
            // Handle reordering functionality 
            int orderId = Integer.parseInt(request.getParameter("id"));
            
            // Implementation for reordering would go here
            // This would typically add the items from the order back to the cart
            // and redirect to cart page
            
            // For now, just redirect to cart
            response.sendRedirect("cartdetail");
            return;
        }
        
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Order Detail Servlet";
    }
}