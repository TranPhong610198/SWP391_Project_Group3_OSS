package profile;

import DAO.UserDAO;
import entity.User;
import entity.UserAddress;
import java.io.File;
import java.io.IOException;
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
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class ProfileServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads/avatars";
    private static final Logger LOGGER = Logger.getLogger(ProfileServlet.class.getName());

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

        if (action.equals("update_profile")) {
            user.setFullName(request.getParameter("fullName"));
            user.setGender(request.getParameter("gender"));
            user.setMobile(request.getParameter("mobile"));
            if (userDAO.updateProfile(user)) {
                session.setAttribute("acc", user);
            }
        } else if (action.equals("update_avatar")) {
            Part filePart = request.getPart("avatar");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = extractFilename(filePart);
                if (!fileName.isEmpty()) {
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
                }
            }
        } else if (action.equals("add")) {
            UserAddress newAddress = new UserAddress();
            newAddress.setUserId(user.getId());
            newAddress.setRecipientName(request.getParameter("recipient_name"));
            newAddress.setPhone(request.getParameter("phone"));
            newAddress.setAddress(request.getParameter("address"));
            newAddress.setDefault(request.getParameter("is_default") != null);
            userDAO.addUserAddress(newAddress);
        } else if (action.equals("set_default")) {
            int addressId = Integer.parseInt(request.getParameter("address_id"));
            userDAO.setDefaultAddress(addressId, user.getId());
        } else if (action.equals("delete")) {
            int addressId = Integer.parseInt(request.getParameter("address_id"));
            userDAO.deleteUserAddress(addressId, user.getId());
        }

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
}