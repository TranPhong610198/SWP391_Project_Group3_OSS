package admin;

import DAO.FooterDAO;
import entity.Footer;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FooterSettingsListServlet", urlPatterns = {"/admin/footer-settings"})
public class FooterSettingListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FooterDAO dao = new FooterDAO();
        
        String searchValue = request.getParameter("search");
        String statusFilter = request.getParameter("status");
        String sortColumn = request.getParameter("sort");
        String sortOrder = request.getParameter("order");
        
        // Default sorting
        if (sortColumn == null) sortColumn = "id";
        if (sortOrder == null) sortOrder = "ASC";
        
        List<Footer> footers = dao.getAllFooters(searchValue, statusFilter, sortColumn, sortOrder);
        
        request.setAttribute("footers", footers);
        request.setAttribute("searchValue", searchValue);
        request.setAttribute("statusFilter", statusFilter);
        request.setAttribute("sortColumn", sortColumn);
        request.setAttribute("sortOrder", sortOrder);
        
        request.getRequestDispatcher("/admin/footersettinglist.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        
        if ("toggleStatus".equals(action)) {
            String currentStatus = request.getParameter("currentStatus");
            String newStatus = "active".equals(currentStatus) ? "inactive" : "active";
            
            FooterDAO dao = new FooterDAO();
            dao.updateStatus(id, newStatus);
            
            response.sendRedirect(request.getContextPath() + "/admin/footer-settings");
        }
    }
}