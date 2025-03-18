package marketing;
import DAO.OrderSaleDAO;
import entity.OrderStatusCount;
import entity.CategorySales;
import entity.DailySalesData;
import entity.SalesOverview;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.math.BigDecimal;

@WebServlet(name = "SalesDashboardServlet", urlPatterns = {"/saledashboard"})
public class SaleDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderSaleDAO orderDAO = new OrderSaleDAO();
        
        // Get sales overview
        SalesOverview salesOverview = orderDAO.getSalesOverview();
        request.setAttribute("salesOverview", salesOverview);
        
        // Get date range for order status trend
        LocalDate endDate = LocalDate.now();
        LocalDate startDate = endDate.minusDays(6); // Default to last 7 days
        
        // Check if custom date range is provided
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        
        if (startDateStr != null && !startDateStr.isEmpty()) {
            try {
                startDate = LocalDate.parse(startDateStr, DateTimeFormatter.ISO_DATE);
            } catch (DateTimeParseException e) {
                // Use default if parsing fails
            }
        }
        
        if (endDateStr != null && !endDateStr.isEmpty()) {
            try {
                endDate = LocalDate.parse(endDateStr, DateTimeFormatter.ISO_DATE);
            } catch (DateTimeParseException e) {
                // Use default if parsing fails
            }
        }
        
        // For date picker default values
        request.setAttribute("sevenDaysAgo", endDate.minusDays(6).toString());
        request.setAttribute("today", endDate.toString());
        
        // Get order status counts for the date range
        List<OrderStatusCount> orderStatusCounts = orderDAO.getOrderStatusCounts(startDate, endDate);
        request.setAttribute("orderStatusCounts", orderStatusCounts);
        
        // Get sales by category
        List<CategorySales> categorySales = orderDAO.getSalesByCategory();
        request.setAttribute("categorySales", categorySales);
        
        // Calculate total category amount for percentage calculation
        BigDecimal totalCategoryAmount = BigDecimal.ZERO;
        for (CategorySales category : categorySales) {
            totalCategoryAmount = totalCategoryAmount.add(category.getTotalAmount());
        }
        request.setAttribute("totalCategoryAmount", totalCategoryAmount);
        
        // Get daily sales data
        List<DailySalesData> dailySalesData = orderDAO.getDailySalesData(startDate, endDate);
        request.setAttribute("dailySalesData", dailySalesData);
        
        request.getRequestDispatcher("/saledashboard.jsp").forward(request, response);
    }
}