package admin;

import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userdetail/delete")
public class DeleteUser extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String userIdStr = request.getParameter("id");
            if (userIdStr == null || userIdStr.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/userlists");
                return;
            }

            int userId = Integer.parseInt(userIdStr);
            UserDAO userDAO = new UserDAO();
            
            if (userDAO.getUserById(userId) == null) {
                response.sendRedirect(request.getContextPath() + "/userlists");
                return;
            }

            boolean deleted = userDAO.deleteUser(userId);
            
            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/userlists");
            } else {
                response.sendRedirect(request.getContextPath() + "/userlists");
            }
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/userlists");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/userlists");
        }
    }
}