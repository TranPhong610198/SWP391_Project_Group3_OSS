package admin;

import DAO.UserDAO;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import utils.BCrypt;

@WebServlet(name = "UserAddServlet", urlPatterns = "/addUser")
public class AddUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters from the form
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName");
            String gender = request.getParameter("gender");
            String mobile = request.getParameter("mobile");
            String role = request.getParameter("role");

            // Input validation
            if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                fullName == null || fullName.trim().isEmpty() ||
                gender == null || gender.trim().isEmpty() ||
                mobile == null || mobile.trim().isEmpty() ||
                role == null || role.trim().isEmpty()) {
                
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Check if passwords match
            if (!password.equals(repassword)) {
                request.setAttribute("error", "Passwords do not match");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Create UserDAO instance
            UserDAO userDAO = new UserDAO();

            // Check if username already exists
            if (userDAO.checkExistUsername(username) != null) {
                request.setAttribute("error", "Username already exists");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Check if email already exists
            if (userDAO.checkExistEmail(email) != null) {
                request.setAttribute("error", "Email already exists");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Check if mobile already exists
            if (userDAO.checkExistPhone(mobile) != null) {
                request.setAttribute("error", "Phone number already exists");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
                return;
            }

            // Create new User object
            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPasswordHash(BCrypt.hashpw(password, BCrypt.gensalt()));
            newUser.setEmail(email);
            newUser.setFullName(fullName);
            newUser.setGender(gender);
            newUser.setMobile(mobile);
            newUser.setRole(role);
            newUser.setStatus("active");

            // Add user to database
            boolean success = userDAO.createUser(newUser);

            if (success) {
                // Redirect to user list with success message
                response.sendRedirect("userlists");
            } else {
                request.setAttribute("error", "Failed to create user");
                request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while creating the user");
            request.getRequestDispatcher("/admin/userform.jsp").forward(request, response);
        }
    }
}