/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DAO.CategoryDAO;
import entity.Category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author thanh
 */
@WebServlet(name = "CategoryList", urlPatterns = {"/categorylists"})
public class CategoryList extends HttpServlet {
private static final int PAGE_SIZE = 5;
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
            out.println("<title>Servlet CategoryList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryList at " + request.getContextPath() + "</h1>");
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
        try {
            CategoryDAO categoryDAO = new CategoryDAO();

            // Get filter parameters
            String searchQuery = request.getParameter("search");
            String sortBy = request.getParameter("sort");
            String statusFilter = request.getParameter("status");

            // Get all categories
            List<Category> allCategories = categoryDAO.getAll();
            List<Category> categories = new ArrayList<>(allCategories);

            // Apply search filter
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                categories.removeIf(c -> !c.getName().toLowerCase().contains(searchQuery.toLowerCase()));
            }

            // Apply status filter
            if (statusFilter != null && !statusFilter.isEmpty()) {
                categories.removeIf(c -> !c.getStatus().equals(statusFilter));
            }

            // Apply sorting
            if (sortBy != null && !sortBy.isEmpty()) {
                switch (sortBy) {
                    case "name":
                        categories.sort((a, b) -> a.getName().compareTo(b.getName()));
                        break;
                    case "status":
                        categories.sort((a, b) -> a.getStatus().compareTo(b.getStatus()));
                        break;
                }
            }

            // Xử lý phân trang
            int totalCategories = categories.size();
            int totalPages = (int) Math.ceil((double) totalCategories / PAGE_SIZE);

            // Lấy trang hiện tại
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null && !pageStr.trim().isEmpty()) {
                try {
                    page = Integer.parseInt(pageStr);
                } catch (NumberFormatException e) {
                    page = 1;
                }
            }

            // Đảm bảo page không vượt quá giới hạn
            if (page < 1) page = 1;
            if (page > totalPages && totalPages > 0) page = totalPages;

            // Tính toán phân trang
            int startItem = (page - 1) * PAGE_SIZE;
            int endItem = Math.min(startItem + PAGE_SIZE, totalCategories);

            // Lấy danh sách cho trang hiện tại
            List<Category> pagedCategories = categories.subList(startItem, endItem);

            // Add parent names and indented names for display
            Map<Integer, String> categoryNames = new HashMap<>();
            for (Category category : allCategories) {
                categoryNames.put(category.getId(), category.getName());
            }

            for (Category category : pagedCategories) {
                // Set parent name
                Integer parentId = category.getParentId();
                if (parentId != null) {
                    String parentName = categoryNames.get(parentId);
                    request.setAttribute("parentName_" + category.getId(), parentName);
                }

                // Create indented name based on level
                String indent = "- ".repeat(category.getLevel());
                request.setAttribute("indentedName_" + category.getId(), indent + category.getName());
            }

            // Set attributes
            request.setAttribute("categories", pagedCategories);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("pageSize", PAGE_SIZE);
            request.setAttribute("totalCategories", totalCategories);
            request.setAttribute("searchQuery", searchQuery);
            request.setAttribute("sortBy", sortBy);
            request.setAttribute("statusFilter", statusFilter);

            // Forward to JSP
            request.getRequestDispatcher("admin/categorylists.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Error in CategoryList servlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("error.jsp");
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
        response.sendRedirect(request.getContextPath() + "/categorylists");
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
