package DAO;

import entity.DashboardStats;
import entity.LowStockProduct;
import Context.DBContext;

import java.sql.*;
import java.util.*;
import java.util.Date;

public class DashboardDAO extends DBContext {
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public DashboardStats getDashboardStats(Date startDate, Date endDate) {
        DashboardStats stats = new DashboardStats();
        stats.setStartDate(startDate);
        stats.setEndDate(endDate);
        
        try {
            // Set basic stats
            stats.setTotalProducts(getProductCount(null));
            stats.setActiveProducts(getProductCount("active"));
            stats.setOutOfStockProducts(getProductCount("EOStock"));
            stats.setProductsByCategory(getProductsByCategory());
            
            stats.setTotalStock(getTotalStock());
            stats.setLowStockProducts(getLowStockProducts(10)); // Products with stock less than 10
            
            stats.setTotalCustomers(getCustomerCount(null));
            stats.setActiveCustomers(getCustomerCount("active"));
            stats.setNewCustomersByDay(getNewCustomersByDay(startDate, endDate));
            
            stats.setTotalPosts(getPostCount(null));
            stats.setPublishedPosts(getPostCount("published"));
            stats.setDraftPosts(getPostCount("draft"));
            
            stats.setTotalFeedback(getFeedbackCount());
            stats.setAverageRating(getAverageRating());
            stats.setFeedbackByRating(getFeedbackByRating());
            
            stats.setTotalSliders(getSliderCount(null));
            stats.setActiveSliders(getSliderCount("active"));
            
            stats.setTotalCoupons(getCouponCount(null));
            stats.setActiveCoupons(getCouponCount("active"));
            stats.setExpiredCoupons(getCouponCount("expired"));
            stats.setCouponUsage(getCouponUsage());
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        
        return stats;
    }
    
    // Get count of products based on status
    private int getProductCount(String status) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM products";
            if (status != null) {
                sql += " WHERE status = ?";
            }
            
            ps = connection.prepareStatement(sql);
            if (status != null) {
                ps.setString(1, status);
            }
            
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    // Get products by category
    public Map<String, Integer> getProductsByCategory() {
    Map<String, Integer> productsByCategory = new LinkedHashMap<>();
    String sql = "WITH CategoryHierarchy AS ( " +
                 "    SELECT c1.id, c1.name, c1.parent_id, " +
                 "        CASE " +
                 "            WHEN c1.level = 1 THEN c1.id " +
                 "            WHEN c2.level = 1 THEN c2.id " +
                 "            WHEN c3.level = 1 THEN c3.id " +
                 "            ELSE NULL " +
                 "        END AS top_level_id " +
                 "    FROM categories c1 " +
                 "    LEFT JOIN categories c2 ON c1.parent_id = c2.id " +
                 "    LEFT JOIN categories c3 ON c2.parent_id = c3.id " +
                 ") " +
                 "SELECT TOP 5 c.name AS category_name, COUNT(p.id) AS product_count " +
                 "FROM products p " +
                 "JOIN CategoryHierarchy ch ON p.category_id = ch.id " +
                 "JOIN categories c ON ch.top_level_id = c.id " +
                 "WHERE p.status = 'active' " +
                 "GROUP BY c.name " +
                 "ORDER BY product_count DESC;";

    try (PreparedStatement ps = connection.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        
        while (rs.next()) {
            productsByCategory.put(rs.getString("category_name"), rs.getInt("product_count"));
        }

    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error in getProductsByCategory: " + e.getMessage());
    }
    
    return productsByCategory;
}



    
    // Get total inventory stock
    private int getTotalStock() {
        int count = 0;
        try {
            String sql = "SELECT SUM(stock_quantity) FROM product_variants";
            
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    
    // Get low stock products
private List<LowStockProduct> getLowStockProducts(int threshold) {
    List<LowStockProduct> lowStockProducts = new ArrayList<>();
    try {
        String sql = "SELECT p.id, p.title, ps.size, pc.color, pv.stock_quantity " +
                     "FROM product_variants pv " +
                     "JOIN products p ON pv.product_id = p.id " +
                     "JOIN product_sizes ps ON pv.size_id = ps.id " +
                     "JOIN product_colors pc ON pv.color_id = pc.id " +
                     "WHERE pv.stock_quantity < ? " +
                     "ORDER BY pv.stock_quantity ASC";
        
        ps = connection.prepareStatement(sql);
        ps.setInt(1, threshold);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            LowStockProduct product = new LowStockProduct();
            product.setProductId(rs.getInt("id"));
            product.setProductName(rs.getString("title"));
            product.setSize(rs.getString("size"));
            product.setColor(rs.getString("color"));
            product.setStockQuantity(rs.getInt("stock_quantity"));
            lowStockProducts.add(product);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return lowStockProducts;
}
    
    // Get customer count based on status
    private int getCustomerCount(String status) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM users WHERE role = 'customer'";
            if (status != null) {
                sql += " AND status = ?";
            }
            
            ps = connection.prepareStatement(sql);
            if (status != null) {
                ps.setString(1, status);
            }
            
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    // Get new customers by day
    private Map<Date, Integer> getNewCustomersByDay(Date startDate, Date endDate) {
        Map<Date, Integer> newCustomersByDay = new LinkedHashMap<>(); // Use LinkedHashMap to maintain order
        
        try {
            String sql = "SELECT CONVERT(DATE, created_at) as signup_date, COUNT(*) as customer_count " +
                         "FROM users " +
                         "WHERE role = 'customer' " +
                         "AND created_at BETWEEN ? AND ? " +
                         "GROUP BY CONVERT(DATE, created_at) " +
                         "ORDER BY signup_date";
            
            ps = connection.prepareStatement(sql);
            ps.setTimestamp(1, new java.sql.Timestamp(startDate.getTime()));
            ps.setTimestamp(2, new java.sql.Timestamp(endDate.getTime()));
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Date signupDate = rs.getDate("signup_date");
                int count = rs.getInt("customer_count");
                newCustomersByDay.put(signupDate, count);
            }
            
            // Ensure all dates in range are included (even if zero registrations)
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(startDate);
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);
            
            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(endDate);
            endCalendar.set(Calendar.HOUR_OF_DAY, 0);
            endCalendar.set(Calendar.MINUTE, 0);
            endCalendar.set(Calendar.SECOND, 0);
            endCalendar.set(Calendar.MILLISECOND, 0);
            
            while (!calendar.after(endCalendar)) {
                Date currentDate = calendar.getTime();
                if (!containsDate(newCustomersByDay, currentDate)) {
                    newCustomersByDay.put(currentDate, 0);
                }
                calendar.add(Calendar.DAY_OF_MONTH, 1);
            }
            
            // Sort by date
            Map<Date, Integer> sortedMap = new TreeMap<>(newCustomersByDay);
            return sortedMap;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newCustomersByDay;
    }
    
    // Helper method to check if a date exists in the map ignoring time component
    private boolean containsDate(Map<Date, Integer> map, Date dateToCheck) {
        for (Date date : map.keySet()) {
            if (isSameDay(date, dateToCheck)) {
                return true;
            }
        }
        return false;
    }
    
    // Helper method to check if two dates are the same day
    private boolean isSameDay(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
        return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) &&
                cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH) &&
                cal1.get(Calendar.DAY_OF_MONTH) == cal2.get(Calendar.DAY_OF_MONTH);
    }
    
    // Get post count based on status
    private int getPostCount(String status) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM posts";
            if (status != null) {
                sql += " WHERE status = ?";
            }
            
            ps = connection.prepareStatement(sql);
            if (status != null) {
                ps.setString(1, status);
            }
            
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    // Get feedback count
    private int getFeedbackCount() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM feedback";
            
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    // Get average feedback rating
    private double getAverageRating() {
        double avgRating = 0.0;
        try {
            String sql = "SELECT AVG(CAST(rating AS FLOAT)) FROM feedback WHERE status = 'approved'";
            
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                avgRating = rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return avgRating;
    }
    
    // Get feedback by rating
    private Map<Integer, Integer> getFeedbackByRating() {
        Map<Integer, Integer> feedbackByRating = new HashMap<>();
        try {
            String sql = "SELECT rating, COUNT(*) as count FROM feedback GROUP BY rating";
            
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                feedbackByRating.put(rs.getInt("rating"), rs.getInt("count"));
            }
            
            // Ensure all ratings 1-5 are included
            for (int i = 1; i <= 5; i++) {
                if (!feedbackByRating.containsKey(i)) {
                    feedbackByRating.put(i, 0);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return feedbackByRating;
    }
    
    // Get slider count based on status
    private int getSliderCount(String status) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM sliders";
            if (status != null) {
                sql += " WHERE status = ?";
            }
            
            ps = connection.prepareStatement(sql);
            if (status != null) {
                ps.setString(1, status);
            }
            
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    // Get coupon count based on status
    private int getCouponCount(String status) {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM coupons";
            if (status != null) {
                sql += " WHERE status = ?";
            }
            
            ps = connection.prepareStatement(sql);
            if (status != null) {
                ps.setString(1, status);
            }
            
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    // Get coupon usage
    private Map<String, Integer> getCouponUsage() {
        Map<String, Integer> couponUsage = new HashMap<>();
        try {
            String sql = "SELECT c.code, COUNT(oc.id) as usage_count " +
                         "FROM coupons c " +
                         "LEFT JOIN order_coupons oc ON c.id = oc.coupon_id " +
                         "GROUP BY c.code " +
                         "ORDER BY usage_count DESC";
            
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                couponUsage.put(rs.getString("code"), rs.getInt("usage_count"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return couponUsage;
    }
    
    private void closeConnection() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}