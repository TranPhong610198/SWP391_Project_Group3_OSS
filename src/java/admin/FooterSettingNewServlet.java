
package admin;

import DAO.FooterDAO;
import entity.Footer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FooterSettingNewServlet", urlPatterns = {"/admin/footer-settings/new"})
public class FooterSettingNewServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/footersettingnew.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters from the form
            String fieldName = request.getParameter("fieldName");
            String value = request.getParameter("value");
            String type = request.getParameter("type");
            String status = request.getParameter("status");
            String image = request.getParameter("image"); // Optional

            // Create new Footer object
            Footer footer = new Footer();
            footer.setFieldName(fieldName);
            footer.setValue(value);
            footer.setType(type);
            footer.setStatus(status);
            footer.setImage(image);

            // Save to database
            FooterDAO dao = new FooterDAO();
            dao.insertFooter(footer);

            // Redirect back to footer settings list with success message
            response.sendRedirect(request.getContextPath() + "/admin/footer-settings?message=success");
            
        } catch (Exception e) {
            // If error occurs, go back to the form with error message
            request.setAttribute("error", "Có lỗi xảy ra khi thêm cài đặt mới.");
            request.getRequestDispatcher("/admin/footersettingnew.jsp").forward(request, response);
        }
    }
}

