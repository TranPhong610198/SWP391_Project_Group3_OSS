package admin;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userdetail/*")
public class UserDetailServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo.startsWith("/view")) {
            handleViewRequest(request, response);
        } else if (pathInfo.startsWith("/edit")) {
            handleEditRequest(request, response);
        }
    }
    
    private void handleViewRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserById(userId);
            
            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("/userdetail.jsp")
                      .forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/userlists");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/userlists");
        }
    }
    
    private void handleEditRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        handleViewRequest(request, response);
    }
}