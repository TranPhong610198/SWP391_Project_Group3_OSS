package admin;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BCrypt;

@WebServlet(name="AddUser", urlPatterns={"/userdetail/add"})
@MultipartConfig
public class AddUser extends HttpServlet {
   
    private UserDAO userDAO;
    
    @Override
    public void init() {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("create".equals(action)) {
            createUser(request, response);
        }
    }
    
    private void createUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get form data
            String fullName = request.getParameter("fullName");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String role = request.getParameter("role");
            
            // Create user object
            User user = new User();
            user.setStatus("Active"); // hoặc status mặc định phù hợp
            user.setFullName(fullName);
            user.setGender(gender);
            user.setEmail(email);
            user.setMobile(mobile);
            user.setRole(role);
            
            // Generate username from email
            String username = email.substring(0, email.indexOf('@'));
            username = userDAO.generateUniqueUsername(username);
            user.setUsername(username);
            
            // Generate random password and hash it
            String password = generateRandomPassword();
            user.setPasswordHash(BCrypt.hashpw(password, BCrypt.gensalt()));
            
            // Insert user
            int result = userDAO.insertUserWithPendingStatus(user);
            
            if (result > 0) {
                // Sử dụng đường dẫn tuyệt đối để redirect
                String contextPath = request.getContextPath();
                response.sendRedirect(contextPath + "/userlists");
                return;  // Thêm return để kết thúc method sau khi redirect
            } else {
                request.setAttribute("error", "Failed to create user");
                request.getRequestDispatcher("/userform.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/userform.jsp").forward(request, response);
        }
    }
    
    private String generateRandomPassword() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder(10);
        for (int i = 0; i < 10; i++) {
            int index = (int) (chars.length() * Math.random());
            sb.append(chars.charAt(index));
        }
        return sb.toString();
    }
}