/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DAO.CategoryDAO;
import DAO.ProductDAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tphon
 */
@WebServlet(urlPatterns = {"/listproduct"})
public class ListProductServlet extends HttpServlet {

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
            out.println("<title>Servlet ListProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListProductServlet at " + request.getContextPath() + "</h1>");
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
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        // Get filter parameters
        String keyword = request.getParameter("keyword");
        String categoryId = request.getParameter("category");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        String sortBy = request.getParameter("sortBy");
        String page = request.getParameter("page");

        // Build filter query
        StringBuilder filterQuery = new StringBuilder("SELECT * FROM products WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            filterQuery.append(" AND (title LIKE ? OR description LIKE ?)");
            params.add("%" + keyword + "%");
            params.add("%" + keyword + "%");
        }

        if (categoryId != null && !categoryId.isEmpty()) {
            filterQuery.append(" AND category_id = ?");
            params.add(Integer.parseInt(categoryId));
        }

        if (minPrice != null && !minPrice.isEmpty()) {
            filterQuery.append(" AND sale_price >= ?");
            params.add(new BigDecimal(minPrice));
        }

        if (maxPrice != null && !maxPrice.isEmpty()) {
            filterQuery.append(" AND sale_price <= ?");
            params.add(new BigDecimal(maxPrice));
        }

        // Add sorting
        if (sortBy != null) {
            switch (sortBy) {
                case "price_asc":
                    filterQuery.append(" ORDER BY sale_price ASC");
                    break;
                case "price_desc":
                    filterQuery.append(" ORDER BY sale_price DESC");
                    break;
                case "newest":
                    filterQuery.append(" ORDER BY created_at DESC");
                    break;
                default:
                    filterQuery.append(" ORDER BY id DESC");
            }
        } else {
            filterQuery.append(" ORDER BY id DESC");
        }

        // Pagination
        int currentPage = (page != null && !page.isEmpty()) ? Integer.parseInt(page) : 1;
        List<Product> products = productDAO.getPaginatedProducts(filterQuery.toString(), params, currentPage);
        int totalRecords = productDAO.getTotalFilteredRecords(filterQuery.toString(), params);
        int totalPages = (int) Math.ceil((double) totalRecords / 10);

        // Get all categories for filter
        List<Category> categories = categoryDAO.getAll();

        String categoryName = null;
        if (categoryId != null && !categoryId.isEmpty()) {
            Category category = categoryDAO.getCategoryById(Integer.parseInt(categoryId));
            if (category != null) {
                categoryName = category.getName();
            }
        }
        request.setAttribute("categoryName", categoryName);

        // Set attributes
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("keyword", keyword);
        request.setAttribute("selectedCategory", categoryId);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);
        request.setAttribute("sortBy", sortBy);

        request.getRequestDispatcher("productList.jsp").forward(request, response);
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
