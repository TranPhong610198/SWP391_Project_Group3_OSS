package admin;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("update".equals(action)) {
            handleUpdateRequest(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/userlists");
        }
    }
    
    private void handleUpdateRequest(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String, String> errors = new HashMap<>();
        UserDAO userDAO = new UserDAO();
        
        try {
            // Get user ID and validate it exists
            int userId = Integer.parseInt(request.getParameter("id"));
            User existingUser = userDAO.getUserById(userId);
            
            if (existingUser == null) {
                response.sendRedirect(request.getContextPath() + "/userlists");
                return;
            }
            
            // Update user fields
            existingUser.setFullName(request.getParameter("fullName"));
            existingUser.setGender(request.getParameter("gender"));
            existingUser.setEmail(request.getParameter("email"));
            existingUser.setMobile(request.getParameter("mobile"));
            
            // Only admin can update role and status
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser != null && "admin".equalsIgnoreCase(currentUser.getRole())) {
                existingUser.setRole(request.getParameter("role"));
                existingUser.setStatus(request.getParameter("status"));
            }
            
            // Validate fields
            if (existingUser.getFullName() == null || existingUser.getFullName().trim().isEmpty()) {
                errors.put("fullName", "Full name is required");
            }
            
            if (existingUser.getEmail() == null || existingUser.getEmail().trim().isEmpty()) {
                errors.put("email", "Email is required");
            } else {
                // Check if email is already used by another user
                User userWithEmail = userDAO.checkExistEmail(existingUser.getEmail());
                if (userWithEmail != null && userWithEmail.getId() != userId) {
                    errors.put("email", "Email is already in use");
                }
            }
            
            if (existingUser.getMobile() != null && !existingUser.getMobile().trim().isEmpty()) {
                // Check if mobile is already used by another user
                User userWithMobile = userDAO.checkExistPhone(existingUser.getMobile());
                if (userWithMobile != null && userWithMobile.getId() != userId) {
                    errors.put("mobile", "Mobile number is already in use");
                }
            }
            
            // If there are validation errors
            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                request.setAttribute("user", existingUser);
                request.getRequestDispatcher("/userdetail.jsp").forward(request, response);
                return;
            }
            
            // Update user in database
            boolean updateSuccess = userDAO.updateProfile(existingUser);
            
            if (updateSuccess) {
                // Set success message
                session.setAttribute("successMessage", "User details updated successfully");
            } else {
                session.setAttribute("errorMessage", "Failed to update user details");
            }
            
            // Redirect back to user detail page
            response.sendRedirect(request.getContextPath() + 
                "/userdetail/view?id=" + userId);
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/userlists");
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