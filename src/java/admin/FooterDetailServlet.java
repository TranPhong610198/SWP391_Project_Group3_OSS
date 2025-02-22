package admin;

import DAO.FooterDAO;
import entity.Footer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FooterDetailServlet", urlPatterns = {"/admin/footer-settings/edit"})
public class FooterDetailServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            FooterDAO dao = new FooterDAO();
            Footer footer = dao.getFooterById(id);
            
            if (footer != null) {
                request.setAttribute("footer", footer);
                request.getRequestDispatcher("/admin/footerdetail.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/footer-settings");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/footer-settings");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters
            int id = Integer.parseInt(request.getParameter("id"));
            String fieldName = request.getParameter("fieldName");
            String value = request.getParameter("value");
            String type = request.getParameter("type");
            String status = request.getParameter("status");
            String image = request.getParameter("image");
            
            // Validate required fields
            if (fieldName == null || fieldName.trim().isEmpty() ||
                value == null || value.trim().isEmpty() ||
                type == null || type.trim().isEmpty()) {
                
                request.setAttribute("error", "All required fields must be filled out");
                doGet(request, response);
                return;
            }
            
            // Create Footer object and update
            Footer footer = new Footer(id, type, fieldName, value, status, image);
            FooterDAO dao = new FooterDAO();
            dao.updateFooter(footer);
            
            // Redirect with success message
            response.sendRedirect(request.getContextPath() + "/admin/footer-settings");
            
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/footer-settings");
        }
    }
}