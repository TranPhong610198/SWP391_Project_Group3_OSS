package admin;

import DAO.CategoryDAO;
import entity.Category;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/categoryadd")
public class AddCategory extends HttpServlet {
    private CategoryDAO categoryDAO = new CategoryDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/addcategory.jsp").forward(request, response);
    }
     
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        if (name == null || name.trim().isEmpty()) {
            response.sendRedirect("addcategory.jsp?error=Vui lòng nhập tên danh mục!");
            return;
        }

        Category newCategory = new Category(0, name, description, status);
        boolean success = categoryDAO.addCategory(newCategory);

        if (success) {
            response.sendRedirect("categorylists");
        } else {
            response.sendRedirect("addcategory");
        }
    }
}
