package marketing;

import DAO.DashboardDAO;
import entity.DashboardStats;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

@WebServlet(name = "DashboardServlet", urlPatterns = {"/marketing/mktdashboard"})
public class DashboardServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Parse date range parameters, default to last 7 days if not provided
        Date startDate = getStartDate(request);
        Date endDate = getEndDate(request);
        
        // Get dashboard statistics
        DashboardDAO dashboardDAO = new DashboardDAO();
        DashboardStats stats = dashboardDAO.getDashboardStats(startDate, endDate);
         stats.setProductsByCategory(dashboardDAO.getProductsByCategory());
          stats.setFeedbackByRating(dashboardDAO.getFeedbackByRating());

        // Set attributes for JSP
        request.setAttribute("stats", stats);
        request.setAttribute("startDateStr", formatDate(startDate));
        request.setAttribute("endDateStr", formatDate(endDate));
         request.setAttribute("productsByCategory", dashboardDAO.getProductsByCategory());
         request.setAttribute("feedbackByRating", dashboardDAO.getFeedbackByRating());
        
        // Forward to JSP
        request.getRequestDispatcher("/marketing/mktdashboard.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle any form submissions (like date range changes)
        doGet(request, response);
    }
    
    private Date getStartDate(HttpServletRequest request) {
        String startDateStr = request.getParameter("startDate");
        if (startDateStr != null && !startDateStr.isEmpty()) {
            try {
                return parseDate(startDateStr);
            } catch (ParseException e) {
                // Ignore parsing errors and use default
            }
        }
        
        // Default: 7 days ago
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -7);
        return cal.getTime();
    }
    
    private Date getEndDate(HttpServletRequest request) {
        String endDateStr = request.getParameter("endDate");
        if (endDateStr != null && !endDateStr.isEmpty()) {
            try {
                return parseDate(endDateStr);
            } catch (ParseException e) {
                // Ignore parsing errors and use default
            }
        }
        
        // Default: today
        return new Date();
    }
    
    private Date parseDate(String dateStr) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.parse(dateStr);
    }
    
    private String formatDate(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date);
    }
}