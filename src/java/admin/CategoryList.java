package admin;

import DAO.CategoryDAO;
import entity.Category;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="CategoryList", urlPatterns={"/categorylists"})
public class CategoryList extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
           
            CategoryDAO categoryDAO = new CategoryDAO();
            
           
            String searchQuery = request.getParameter("search");
            String sortBy = request.getParameter("sort");
            String statusFilter = request.getParameter("status");
            
           
            List<Category> categories = categoryDAO.getAll();
            
            
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                categories.removeIf(c -> !c.getName().toLowerCase()
                                       .contains(searchQuery.toLowerCase()));
            }
            
            
            if (statusFilter != null && !statusFilter.isEmpty()) {
                categories.removeIf(c -> !c.getStatus().equals(statusFilter));
            }
            
           
            if (sortBy != null) {
                switch (sortBy) {
                    case "name":
                        categories.sort((a, b) -> a.getName().compareTo(b.getName()));
                        break;
                    case "status":
                        categories.sort((a, b) -> a.getStatus().compareTo(b.getStatus()));
                        break;
                }
            }
            
            
            request.setAttribute("categories", categories);
            request.setAttribute("searchQuery", searchQuery);
            request.setAttribute("sortBy", sortBy);
            request.setAttribute("statusFilter", statusFilter);
            
            
            request.getRequestDispatcher("admin/categorylists.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Category List Servlet";
    }
}