package Orders;

import DAO.OrderDAO;
import entity.CartItem;
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
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 *
 * @author thanh
 */
@WebServlet(name = "MyOrderServlet", urlPatterns = {"/myorder"})
public class MyOrderServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

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
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        // Chuyển hướng nếu chưa đăng nhập
        if (user == null) {
            response.sendRedirect("login?redirect=myorder");
            return;
        }

        // Xử lý tìm kiếm (nếu có)
        String keyword = request.getParameter("keyword");
        String status = request.getParameter("status");

        // Xử lý phân trang
        int page = 1;
        int recordsPerPage = 5;
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        // Lấy danh sách đơn hàng
        List<Order> orders = orderDAO.getUserOrders(user.getId(), keyword, status, page, recordsPerPage);
        int noOfRecords = orderDAO.getNumberOfUserOrders(user.getId(), keyword, status);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        
        // Thiết lập các thuộc tính để hiển thị
        request.setAttribute("orders", orders);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("keyword", keyword);
        request.setAttribute("status", status);

        // Forward đến trang jsp
        request.getRequestDispatcher("myorder.jsp").forward(request, response);
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
   String action = request.getParameter("action");

    if (action != null && action.equals("reorder")) {
        int orderId = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if (user != null) {
            Order order = orderDAO.getOrderById(orderId);
            if (order != null && order.getUserId() == user.getId()) {
                // Tạo query string từ danh sách sản phẩm trong đơn hàng
                StringBuilder queryParams = new StringBuilder();
                List<CartItem> items = order.getItems();
                if (items != null && !items.isEmpty()) {
                    for (int i = 0; i < items.size(); i++) {
                        CartItem item = items.get(i);
                        if (i > 0) {
                            queryParams.append("&");
                        }
                        queryParams.append("productId=").append(item.getProductId())
                                .append("&size=").append(URLEncoder.encode(item.getSize(), StandardCharsets.UTF_8.toString()))
                                .append("&color=").append(URLEncoder.encode(item.getColor(), StandardCharsets.UTF_8.toString()))
                                .append("&quantity=").append(item.getQuantity());
                    }
                }
                // Chuyển hướng đến trang cartcontact với dữ liệu sản phẩm đã mã hóa
                response.sendRedirect("cartcontact?" + queryParams.toString());
                return;
            }
        }
    }

    processRequest(request, response);
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
        processRequest(request, response);
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