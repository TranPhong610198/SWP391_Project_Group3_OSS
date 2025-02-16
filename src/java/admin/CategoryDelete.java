package admin;

import DAO.CategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="CategoryDeleteServlet", urlPatterns={"/categorydelete"})
public class CategoryDelete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            CategoryDAO categoryDAO = new CategoryDAO();
            boolean success = categoryDAO.deleteCategory(id);

            if (success) {
                response.sendRedirect("categorylists?message= Xóa thành công!");
            } else {
                response.sendRedirect("categorylists?error=Xóa thất bại!");
            }
        } catch (Exception e) {
            response.sendRedirect("categorylists?error=Lỗi xử lý!");
        }
    }
}
