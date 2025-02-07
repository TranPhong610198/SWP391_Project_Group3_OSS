package profile;

import DAO.UserDAO;
import entity.User;
import entity.UserAddress;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDAO userDAO = new UserDAO();
        User userDetails = userDAO.getUserById(user.getId());
        request.setAttribute("user", userDetails);

        List<UserAddress> addresses = userDAO.getUserAddresses(user.getId());
        request.setAttribute("addresses", addresses);

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("profile");
            return;
        }

        UserDAO userDAO = new UserDAO();
        switch (action) {
            case "update_profile":
                handleProfileUpdate(request, response, user, userDAO, session);
                break;
            case "update_avatar":
                handleAvatarUpdate(request, response, user, userDAO, session);
                break;
            case "add":
                handleAddAddress(request, response, user, userDAO);
                break;
            case "set_default":
                handleSetDefaultAddress(request, response, user, userDAO);
                break;
            case "delete":
                handleDeleteAddress(request, response, user, userDAO);
                break;
            default:
                response.sendRedirect("profile");
                break;
        }
    }
    
    private void handleAddAddress(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO) throws IOException {
        String recipientName = request.getParameter("recipient_name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        boolean isDefault = request.getParameter("is_default") != null;

        if (recipientName == null || phone == null || address == null) {
            response.sendRedirect("profile?error=missing_parameters");
            return;
        }

        UserAddress newAddress = new UserAddress();
        newAddress.setUserId(user.getId());
        newAddress.setRecipientName(recipientName);
        newAddress.setPhone(phone);
        newAddress.setAddress(address);
        newAddress.setDefault(isDefault);

        userDAO.addUserAddress(newAddress);
        response.sendRedirect("profile");
    }
    
    private void handleSetDefaultAddress(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO) throws IOException {
        String addressIdStr = request.getParameter("address_id");
        if (addressIdStr == null) {
            response.sendRedirect("profile?error=missing_address_id");
            return;
        }
        int addressId = Integer.parseInt(addressIdStr);
        userDAO.setDefaultAddress(addressId, user.getId());
        response.sendRedirect("profile");
    }
    
    private void handleDeleteAddress(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO) throws IOException {
        String addressIdStr = request.getParameter("address_id");
        if (addressIdStr == null) {
            response.sendRedirect("profile?error=missing_address_id");
            return;
        }
        int addressId = Integer.parseInt(addressIdStr);
        userDAO.deleteUserAddress(addressId, user.getId());
        response.sendRedirect("profile");
    }
    
    private void handleProfileUpdate(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO, HttpSession session)
            throws IOException {

        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");

        if (fullName == null || gender == null || mobile == null) {
            // Handle missing parameters appropriately, e.g., with error message
            response.sendRedirect("profile?error=missing_profile_fields");
            return;
        }

        user.setFullName(fullName);
        user.setGender(gender);
        user.setMobile(mobile);

        if (userDAO.updateProfile(user)) {
            session.setAttribute("acc", user);
        }

        response.sendRedirect("profile"); // Redirect to the profile page
    }

    private void handleAvatarUpdate(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO, HttpSession session)
            throws ServletException, IOException {

        Part filePart = request.getPart("avatar");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFilename(filePart); // Use a helper method
            String uploadPath = getServletContext().getRealPath("/uploads/avatars");

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String filePath = uploadPath + File.separator + fileName;

            try {
                filePart.write(filePath);

                String dbPath = "uploads/avatars/" + fileName;
                if (userDAO.updateAvatar(user.getId(), dbPath)) {
                    user.setAvatar(dbPath);
                    session.setAttribute("acc", user);
                } else {
                    // Handle database update error
                }

            } catch (IOException e) {
                // Handle file write exception
                e.printStackTrace(); // Or log the error appropriately
            }
        }

        response.sendRedirect("profile");
    }

    // Helper method to extract filename from Part
    private String extractFilename(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return ""; // Or handle the case where filename is not found
    }
}
