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

@WebServlet(name = "FooterSettingListServlet", urlPatterns = {"/admin/footersettinglist"})
public class FooterSettingListServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String searchValue = request.getParameter("search");
        String status = request.getParameter("status");
        String sortBy = request.getParameter("sortBy");
        String sortOrder = request.getParameter("sortOrder");
        
        // Set default sort if not specified
        if (sortBy == null) sortBy = "id";
        if (sortOrder == null) sortOrder = "ASC";
        
        FooterDAO dao = new FooterDAO();
        List<Footer> footerList = dao.getAllFooters(searchValue, status, sortBy, sortOrder);
        
        request.setAttribute("footerList", footerList);
        request.setAttribute("searchValue", searchValue);
        request.setAttribute("status", status);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("sortOrder", sortOrder);
        
        request.getRequestDispatcher("../admin/footersettinglist.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        
        if ("toggleStatus".equals(action)) {
            String newStatus = request.getParameter("status");
            FooterDAO dao = new FooterDAO();
            dao.updateFooterStatus(id, newStatus);
            response.sendRedirect(request.getContextPath() + "/admin/footersettinglist");
            return;
        }
        
        processRequest(request, response);
    }
}