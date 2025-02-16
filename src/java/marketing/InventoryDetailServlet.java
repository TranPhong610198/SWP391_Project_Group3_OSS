/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.InventoryDAO;
import entity.Inventory;
import entity.Variant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author nguye
 */
@WebServlet(name = "InventoryDetailServlet", urlPatterns = {"/inventoryDetail"})
public class InventoryDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet InventoryDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InventoryDetailServlet at " + request.getContextPath() + "</h1>");
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
        InventoryDAO inventoryDAO = new InventoryDAO();
        try {
            int productId = Integer.parseInt(request.getParameter("id"));

            // Lấy thông tin inventory
            Inventory inventory = inventoryDAO.getInventoryDetail(productId);
            List<Variant> variants = inventoryDAO.getProductVariants(productId);

            request.setAttribute("inventory", inventory);
            request.setAttribute("variants", variants);
            request.getRequestDispatcher("/marketing/inventory/InventoryDetail.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("error/404.jsp");
        }
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
        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        InventoryDAO inventoryDAO = new InventoryDAO();

        try {
            if ("delete".equals(action)) {
                int variantId = Integer.parseInt(request.getParameter("variantId"));

                // xóa khỏi tất cả các bảng liên quan
                inventoryDAO.deleteVariant(variantId);

                response.sendRedirect("inventoryDetail?id=" + productId + "&success=deleted");
            }
        } catch (Exception e) {
            response.sendRedirect("error/404.jsp");
        }
    }
}
