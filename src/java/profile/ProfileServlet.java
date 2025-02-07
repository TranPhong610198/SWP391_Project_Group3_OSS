package profile;

import DAO.UserDAO;
import entity.User;
import entity.UserAddress;
import java.io.File;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.logging.Logger;
import java.util.logging.Level;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
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
        request.setAttribute("user", userDAO.getUserById(user.getId()));
        request.setAttribute("addresses", userDAO.getUserAddresses(user.getId()));
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

    private void handleProfileUpdate(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO, HttpSession session)
            throws IOException {
        user.setFullName(request.getParameter("fullName"));
        user.setGender(request.getParameter("gender"));
        user.setMobile(request.getParameter("mobile"));

        if (userDAO.updateProfile(user)) {
            session.setAttribute("acc", user);
        }
        response.sendRedirect("profile");
    }

    private void handleAvatarUpdate(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO, HttpSession session)
            throws ServletException, IOException {
        Part filePart = request.getPart("avatar");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendRedirect("profile?error=no_file");
            return;
        }

        String fileName = extractFilename(filePart);
        if (fileName.isEmpty()) {
            response.sendRedirect("profile?error=invalid_file");
            return;
        }

        String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String filePath = uploadPath + File.separator + fileName;
        try {
            filePart.write(filePath);
            String dbPath = UPLOAD_DIR + "/" + fileName;
            if (userDAO.updateAvatar(user.getId(), dbPath)) {
                user.setAvatar(dbPath);
                session.setAttribute("acc", user);
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Error uploading avatar", e);
        }

        response.sendRedirect("profile");
    }

    private void handleAddAddress(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO) throws IOException {
        UserAddress newAddress = new UserAddress();
        newAddress.setUserId(user.getId());
        newAddress.setRecipientName(request.getParameter("recipient_name"));
        newAddress.setPhone(request.getParameter("phone"));
        newAddress.setAddress(request.getParameter("address"));
        newAddress.setDefault(request.getParameter("is_default") != null);

        userDAO.addUserAddress(newAddress);
        response.sendRedirect("profile");
    }

    private void handleSetDefaultAddress(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO) throws IOException {
        int addressId = Integer.parseInt(request.getParameter("address_id"));
        userDAO.setDefaultAddress(addressId, user.getId());
        response.sendRedirect("profile");
    }

    private void handleDeleteAddress(HttpServletRequest request, HttpServletResponse response, User user, UserDAO userDAO) throws IOException {
        int addressId = Integer.parseInt(request.getParameter("address_id"));
        userDAO.deleteUserAddress(addressId, user.getId());
        response.sendRedirect("profile");
    }

    private String extractFilename(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String s : contentDisp.split(";")) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf('=') + 2, s.length() - 1);
            }
        }
        return "";
    }
    private static final String UPLOAD_DIR = "uploads/avatars";
    private static final Logger LOGGER = Logger.getLogger(ProfileServlet.class.getName());

}
