package marketing;


import DAO.MarketingReportDAO;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "MKTReportServlet", urlPatterns = {"/marketing/report"})
public class MKTReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String reportType = request.getParameter("type");
        if (reportType == null) {
            reportType = "overview"; // Default report type
        }
        
        MarketingReportDAO reportDAO = new MarketingReportDAO();
        
        try {
            // Common data for all reports
            Map<String, Object> commonData = new HashMap<>();
            
            // 1. Coupon Report
            if (reportType.equals("overview") || reportType.equals("coupon")) {
                // Coupon overview
                commonData.put("couponsByStatus", reportDAO.getCouponsByStatus());
                commonData.put("couponsByType", reportDAO.getCouponsByType());
                commonData.put("couponsByDiscountType", reportDAO.getCouponsByDiscountType());
                
                // Coupon usage effectiveness
                commonData.put("couponUsageRate", reportDAO.getCouponUsageRate());
                commonData.put("mostUsedCoupons", reportDAO.getMostUsedCoupons(5)); // Top 5
                commonData.put("averageDiscountAmount", reportDAO.getAverageDiscountAmount());
                
                // Coupon time analysis
                commonData.put("couponExpiryAnalysis", reportDAO.getCouponExpiryAnalysis());
                
                commonData.put("unusedExpiredCouponsCount", reportDAO.getUnusedExpiredCouponsCount());
                commonData.put("couponUsageMetrics", reportDAO.getCouponUsageMetrics());
            }
            
            // 2. Feedback Report
            if (reportType.equals("overview") || reportType.equals("feedback")) {
                // Rating analysis
                commonData.put("averageRating", reportDAO.getAverageRating());
                commonData.put("ratingDistribution", reportDAO.getRatingDistribution());
                commonData.put("feedbackByStatus", reportDAO.getFeedbackByStatus());
                
                // Product analysis
                commonData.put("highestRatedProducts", reportDAO.getProductsByRating(true, 5)); // Top 5
                commonData.put("lowestRatedProducts", reportDAO.getProductsByRating(false, 5)); // Bottom 5
                commonData.put("productRatingCoverage", reportDAO.getProductRatingCoverage());
                
                // Customer analysis
                commonData.put("mostActiveReviewers", reportDAO.getMostActiveReviewers(5)); // Top 5
                commonData.put("customerFeedbackRate", reportDAO.getCustomerFeedbackRate());
                
                // Content analysis
                commonData.put("feedbackWithImagesCount", reportDAO.getFeedbackWithImagesCount());
                commonData.put("feedbackWithRepliesCount", reportDAO.getFeedbackWithRepliesCount());
            }
            
            // 3. Product Report
            if (reportType.equals("overview") || reportType.equals("product")) {
                // Product overview
                commonData.put("productsByStatus", reportDAO.getProductsByStatus());
                commonData.put("productsByCategory", reportDAO.getProductsByCategory());
                commonData.put("comboProductsCount", reportDAO.getComboProductsCount());
                
                // Price analysis
                commonData.put("averagePriceByCategory", reportDAO.getAveragePriceByCategory());
                commonData.put("productsWithHighestDiscount", reportDAO.getProductsWithHighestDiscount(5)); // Top 5
                
                // Sales performance
                commonData.put("bestSellingProducts", reportDAO.getBestSellingProducts(5)); // Top 5
                commonData.put("revenueByCategory", reportDAO.getRevenueByCategory());
                
                // Product variants
                commonData.put("productVariationsBySize", reportDAO.getProductVariationsBySize());
                commonData.put("productVariationsByColor", reportDAO.getProductVariationsByColor());
            }
            
            // 4. Inventory Report
            if (reportType.equals("overview") || reportType.equals("inventory")) {
                commonData.put("totalInventoryValue", reportDAO.getTotalInventoryValue());
                commonData.put("totalInventoryByProduct", reportDAO.getTotalInventoryByProduct(5)); // Thêm
                commonData.put("inventoryByCategory", reportDAO.getInventoryByCategory()); // Thêm
                commonData.put("lowStockProducts", reportDAO.getLowStockProducts(10));
                commonData.put("productsWithoutRecentRestocking", reportDAO.getProductsWithoutRecentRestocking(30));
                commonData.put("outOfStockRate", reportDAO.getOutOfStockRate());
                commonData.put("productVariationsBySize", reportDAO.getProductVariationsBySize());
                commonData.put("productVariationsByColor", reportDAO.getProductVariationsByColor());
            }
            
            // 5. Slider Report
            if (reportType.equals("overview") || reportType.equals("slider")) {
                // Slider overview
                commonData.put("slidersByStatus", reportDAO.getSlidersByStatus());
                commonData.put("slidersByDisplayOrder", reportDAO.getSlidersByDisplayOrder());
                commonData.put("allSliders", reportDAO.getAllSliders());
            }
            
            // 6. Post Report
            if (reportType.equals("overview") || reportType.equals("post")) {
                // Post overview
                commonData.put("postsByStatus", reportDAO.getPostsByStatus());
                commonData.put("featuredPostsCount", reportDAO.getFeaturedPostsCount());
                commonData.put("postsByAuthor", reportDAO.getPostsByAuthor());
                
                // Post time analysis
                commonData.put("postDistributionByMonth", reportDAO.getPostDistributionByMonth());
                commonData.put("averageTimeDraftToPublished", reportDAO.getAverageTimeDraftToPublished());
                commonData.put("latestUpdatedPostDate", reportDAO.getLatestUpdatedPostDate());
                commonData.put("longTimeDraftPosts", reportDAO.getLongTimeDraftPosts(7)); // In draft for 7+ days
            }
            
            // 7. Comprehensive Report
            if (reportType.equals("comprehensive")) {
                // Combined metrics
                commonData.put("combinedProductMetrics", reportDAO.getCombinedProductMetrics(10)); // Top 10
                commonData.put("couponUsageMetrics", reportDAO.getCouponUsageMetrics());
            }
            
            // Set data for JSP
            for (Map.Entry<String, Object> entry : commonData.entrySet()) {
                request.setAttribute(entry.getKey(), entry.getValue());
            }
            
            request.setAttribute("reportType", reportType);
            request.getRequestDispatcher("/marketing/mktreport.jsp").forward(request, response);
            
        } finally {
            reportDAO.close(); // Ensure resources are closed
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}