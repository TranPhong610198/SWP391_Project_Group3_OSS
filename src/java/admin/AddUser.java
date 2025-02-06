/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import utils.BCrypt;

/**
 *
 * @author VuxD4t
 */
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
            
            // Handle avatar upload
            String avatarPath = null;
            Part avatarPart = request.getPart("avatar");
            if (avatarPart != null && avatarPart.getSize() > 0) {
                String uploadPath = getServletContext().getRealPath("/uploads/avatars");
                Files.createDirectories(Paths.get(uploadPath));
                
                String fileName = System.currentTimeMillis() + "_" + 
                                Paths.get(avatarPart.getSubmittedFileName()).getFileName().toString();
                avatarPath = "uploads/avatars/" + fileName;
                
                Files.copy(avatarPart.getInputStream(),
                          Paths.get(uploadPath, fileName),
                          StandardCopyOption.REPLACE_EXISTING);
            }
            
            // Create user object
            User user = new User();
            user.setFullName(fullName);
            user.setGender(gender);
            user.setEmail(email);
            user.setMobile(mobile);
            user.setRole(role);
            user.setAvatar(avatarPath);
            
            // Generate username from email
            String username = email.substring(0, email.indexOf('@'));
            username = userDAO.generateUniqueUsername(username);
            user.setUsername(username);
            
            // Generate random password and hash it
            String password = generateRandomPassword();
            user.setPasswordHash(BCrypt.hashpw(password, BCrypt.gensalt()));
            
            // Insert user
            if (userDAO.insertUserWithPendingStatus(user) > 0) {
                response.sendRedirect(request.getContextPath() + "/userlists");
            } else {
                request.setAttribute("error", "Failed to create user");
                request.getRequestDispatcher("/userform.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
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
