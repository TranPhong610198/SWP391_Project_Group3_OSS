package DAO;

import Context.DBContext;
import entity.*;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class SalesReportDAO extends DBContext {

    /**
     * Generates a comprehensive sales report for the specified date range
     *
     * @param startDate Start date for the report
     * @param endDate   End date for the report
     * @return SalesReport object containing all report data
     */
    public SalesReport generateSalesReport(Date startDate, Date endDate) {
        SalesReport report = new SalesReport();
        report.setStartDate(startDate);
        report.setEndDate(endDate);

        try {
            // Convert java.util.Date to java.sql.Date for SQL queries
            java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
            java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());

            // Get sales overview metrics
            getSalesOverview(report, sqlStartDate, sqlEndDate);

            // Get time-based metrics
            getTimeBasedMetrics(report, sqlStartDate, sqlEndDate);

            // Get product performance metrics
            getProductPerformance(report, sqlStartDate, sqlEndDate);

            // Get customer metrics
            getCustomerMetrics(report, sqlStartDate, sqlEndDate);

            // Get cart metrics
            

            // Get order processing metrics
            getOrderProcessingMetrics(report, sqlStartDate, sqlEndDate);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return report;
    }

    /**
     * Gets sales overview metrics like total revenue, orders, etc.
     */
    private void getSalesOverview(SalesReport report, java.sql.Date startDate, java.sql.Date endDate) throws SQLException {
    // Thống kê đơn hàng, doanh thu, giá trị trung bình đơn hàng, tổng số khách hàng
    String sql = "SELECT COUNT(id) AS total_orders, " +
                 "SUM(total_amount) AS total_revenue, " +
                 "AVG(total_amount) AS avg_order_value, " +
                 "COUNT(DISTINCT user_id) AS total_customers " +
                 "FROM orders " +
                 "WHERE created_at BETWEEN ? AND ? " +
                 "AND status = 'completed'"; // Chỉ tính đơn hàng đã hoàn thành

    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setDate(1, startDate);
        stmt.setDate(2, endDate);

        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                report.setTotalOrders(rs.getInt("total_orders"));
                report.setTotalRevenue(rs.getBigDecimal("total_revenue") != null ? 
                        rs.getBigDecimal("total_revenue") : BigDecimal.ZERO);
                report.setAverageOrderValue(rs.getBigDecimal("avg_order_value") != null ? 
                        rs.getBigDecimal("avg_order_value").setScale(2, RoundingMode.HALF_UP) : BigDecimal.ZERO);
                report.setTotalCustomers(rs.getInt("total_customers"));
            }
        }
    }

    // Thống kê tổng số sản phẩm đã bán
    sql = "SELECT SUM(oi.quantity) AS total_quantity " +
          "FROM order_items oi " +
          "JOIN orders o ON oi.order_id = o.id " +
          "WHERE o.created_at BETWEEN ? AND ? " +
          "AND o.status = 'completed'"; // Chỉ tính đơn hàng đã hoàn thành

    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setDate(1, startDate);
        stmt.setDate(2, endDate);

        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                report.setTotalProducts(rs.getInt("total_quantity")); // Sửa lại thành đúng tên cột
            }
        }
    }
}


    /**
     * Gets time-based metrics like daily/monthly revenue
     */
    private void getTimeBasedMetrics(SalesReport report, java.sql.Date startDate, java.sql.Date endDate) throws SQLException {
    // Thống kê doanh thu theo ngày
    String sqlDaily = "SELECT CONVERT(VARCHAR(10), created_at, 120) AS order_date, " +
                      "SUM(total_amount) AS daily_revenue, " +
                      "COUNT(id) AS daily_orders " +
                      "FROM orders " +
                      "WHERE created_at BETWEEN ? AND ? " +
                      "AND status = 'completed' " + // Chỉ lấy đơn hàng hoàn thành
                      "GROUP BY CONVERT(VARCHAR(10), created_at, 120) " +
                      "ORDER BY order_date";

    Map<String, BigDecimal> dailyRevenue = new LinkedHashMap<>();
    Map<String, Integer> ordersPerDay = new LinkedHashMap<>();

    try (PreparedStatement stmt = connection.prepareStatement(sqlDaily)) {
        stmt.setDate(1, startDate);
        stmt.setDate(2, endDate);

        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                String date = rs.getString("order_date");
                BigDecimal revenue = rs.getBigDecimal("daily_revenue");
                int orders = rs.getInt("daily_orders");

                dailyRevenue.put(date, revenue);
                ordersPerDay.put(date, orders);
            }
        }
    }

    report.setDailyRevenue(dailyRevenue);
    report.setOrdersPerDay(ordersPerDay);

    // Thống kê doanh thu theo tháng
    String sqlMonthly = "SELECT SUBSTRING(CONVERT(VARCHAR(10), created_at, 120), 1, 7) AS month, " +
                        "SUM(total_amount) AS monthly_revenue, " +
                        "COUNT(id) AS monthly_orders " +
                        "FROM orders " +
                        "WHERE created_at BETWEEN ? AND ? " +
                        "AND status = 'completed' " + // Chỉ lấy đơn hàng hoàn thành
                        "GROUP BY SUBSTRING(CONVERT(VARCHAR(10), created_at, 120), 1, 7) " +
                        "ORDER BY month";

    Map<String, BigDecimal> monthlyRevenue = new LinkedHashMap<>();
    Map<String, Integer> ordersPerMonth = new LinkedHashMap<>();

    try (PreparedStatement stmt = connection.prepareStatement(sqlMonthly)) {
        stmt.setDate(1, startDate);
        stmt.setDate(2, endDate);

        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                String month = rs.getString("month");
                BigDecimal revenue = rs.getBigDecimal("monthly_revenue");
                int orders = rs.getInt("monthly_orders");

                monthlyRevenue.put(month, revenue);
                ordersPerMonth.put(month, orders);
            }
        }
    }

    report.setMonthlyRevenue(monthlyRevenue);
    report.setOrdersPerMonth(ordersPerMonth);
}


    /**
     * Gets product performance metrics
     */
    private void getProductPerformance(SalesReport report, java.sql.Date startDate, java.sql.Date endDate) throws SQLException {
        // Top products by revenue
        String sql = "SELECT TOP 10 " + // Limit to top 10 products
        "p.id AS product_id, " +
        "p.title AS product_name, " +
        "c.name AS category_name, " +
        "SUM(oi.quantity) AS total_quantity, " +
        "SUM(oi.quantity * oi.unit_price_at_order) AS total_revenue " +
        "FROM order_items oi " +
        "JOIN orders o ON oi.order_id = o.id " +
        "JOIN products p ON oi.product_id = p.id " +
        "JOIN categories c ON p.category_id = c.id " +
        "WHERE o.created_at BETWEEN ? AND ? " +
        "AND o.status = 'completed' " +  // Only completed orders
        "GROUP BY p.id, p.title, c.name " +
        "ORDER BY total_revenue DESC";

    List<SalesReport.ProductPerformance> topProducts = new ArrayList<>();

    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setDate(1, startDate);
        stmt.setDate(2, endDate);

        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                SalesReport.ProductPerformance product = new SalesReport.ProductPerformance();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setCategory(rs.getString("category_name"));
                product.setTotalQuantitySold(rs.getInt("total_quantity"));
                product.setTotalRevenue(rs.getBigDecimal("total_revenue"));

                // Get additional details for this product
                getProductVariantDistribution(product);
                
                topProducts.add(product);
            }
        }
    }

    report.setTopProducts(topProducts);

        // Revenue by category
        sql = "SELECT c.name AS category_name, " +
                "SUM(oi.quantity * oi.unit_price_at_order) AS category_revenue, " +
                "COUNT(DISTINCT o.id) AS category_orders " +
                "FROM order_items oi " +
                "JOIN orders o ON oi.order_id = o.id " +
                "JOIN products p ON oi.product_id = p.id " +
                "JOIN categories c ON p.category_id = c.id " +
                "WHERE o.created_at BETWEEN ? AND ? " +
                "AND o.status != 'cancelled' " +
                "GROUP BY c.name " +
                "ORDER BY category_revenue DESC";

        Map<String, BigDecimal> revenueByCategoryMap = new LinkedHashMap<>();
        Map<String, Integer> ordersByCategoryMap = new LinkedHashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String categoryName = rs.getString("category_name");
                    BigDecimal revenue = rs.getBigDecimal("category_revenue");
                    int orders = rs.getInt("category_orders");

                    revenueByCategoryMap.put(categoryName, revenue);
                    ordersByCategoryMap.put(categoryName, orders);
                }
            }
        }

        report.setRevenueByCategoryMap(revenueByCategoryMap);
        report.setOrdersByCategoryMap(ordersByCategoryMap);
    }

    /**
     * Gets distribution of sizes and colors for a product
     */
    private void getProductVariantDistribution(SalesReport.ProductPerformance product) throws SQLException {
        // Size distribution
        String sqlSizes = "SELECT ps.size, COUNT(oi.id) AS count " +
                "FROM order_items oi " +
                "JOIN product_variants pv ON oi.variant_id = pv.id " +
                "JOIN product_sizes ps ON pv.size_id = ps.id " +
                "WHERE oi.product_id = ? " +
                "GROUP BY ps.size " +
                "ORDER BY count DESC";

        Map<String, Integer> sizeDistribution = new HashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sqlSizes)) {
            stmt.setInt(1, product.getProductId());

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String size = rs.getString("size");
                    int count = rs.getInt("count");
                    sizeDistribution.put(size, count);
                }
            }
        }

        product.setSizeDistribution(sizeDistribution);

        // Color distribution
        String sqlColors = "SELECT pc.color, COUNT(oi.id) AS count " +
                "FROM order_items oi " +
                "JOIN product_variants pv ON oi.variant_id = pv.id " +
                "JOIN product_colors pc ON pv.color_id = pc.id " +
                "WHERE oi.product_id = ? " +
                "GROUP BY pc.color " +
                "ORDER BY count DESC";

        Map<String, Integer> colorDistribution = new HashMap<>();

        try (PreparedStatement stmt = connection.prepareStatement(sqlColors)) {
            stmt.setInt(1, product.getProductId());

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String color = rs.getString("color");
                    int count = rs.getInt("count");
                    colorDistribution.put(color, count);
                }
            }
        }

        product.setColorDistribution(colorDistribution);

        // Get category
        String sqlCategory = "SELECT c.name FROM products p " +
                "JOIN categories c ON p.category_id = c.id " +
                "WHERE p.id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sqlCategory)) {
            stmt.setInt(1, product.getProductId());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    product.setCategory(rs.getString("name"));
                }
            }
        }
    }

    /**
     * Gets customer metrics
     */
    private void getCustomerMetrics(SalesReport report, java.sql.Date startDate, java.sql.Date endDate) throws SQLException {
        // New vs returning customers
        String sqlNewCustomers = "SELECT COUNT(DISTINCT user_id) AS new_customers " +
                "FROM orders o " +
                "WHERE created_at BETWEEN ? AND ? " +
                "AND user_id IS NOT NULL " +
                "AND user_id NOT IN (" +
                "    SELECT DISTINCT user_id " +
                "    FROM orders " +
                "    WHERE created_at < ? " +
                "    AND user_id IS NOT NULL" +
                ")";

        try (PreparedStatement stmt = connection.prepareStatement(sqlNewCustomers)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);
            stmt.setDate(3, startDate);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    report.setNewCustomers(rs.getInt("new_customers"));
                }
            }
        }

        // Returning customers
        String sqlReturningCustomers = "SELECT COUNT(DISTINCT user_id) AS returning_customers " +
                "FROM orders o " +
                "WHERE created_at BETWEEN ? AND ? " +
                "AND user_id IS NOT NULL " +
                "AND user_id IN (" +
                "    SELECT DISTINCT user_id " +
                "    FROM orders " +
                "    WHERE created_at < ? " +
                "    AND user_id IS NOT NULL" +
                ")";

        try (PreparedStatement stmt = connection.prepareStatement(sqlReturningCustomers)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);
            stmt.setDate(3, startDate);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    report.setReturningCustomers(rs.getInt("returning_customers"));
                }
            }
        }

        // Customers by gender
        String sqlCustomersByGender = "SELECT gender, COUNT(DISTINCT o.user_id) AS customer_count " +
                "FROM orders o " +
                "JOIN users u ON o.user_id = u.id " +
                "WHERE o.created_at BETWEEN ? AND ? " +
                "GROUP BY u.gender";

        Map<String, Integer> customersByGender = new HashMap<>();
        try (PreparedStatement stmt = connection.prepareStatement(sqlCustomersByGender)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    customersByGender.put(
                        rs.getString("gender"), 
                        rs.getInt("customer_count")
                    );
                }
            }
        }
        report.setCustomersByGender(customersByGender);

        // Top customers
        String sqlTopCustomers = "SELECT " +
                "u.id AS user_id, " +
                "u.full_name, " +
                "u.email, " +
                "CASE WHEN cch.total_spend >= 5000 THEN 'VIP' ELSE 'Normal' END AS customer_type, " +
                "COUNT(o.id) AS total_orders, " +
                "SUM(o.total_amount) AS total_spend, " +
                "MIN(o.created_at) AS first_order_date, " +
                "MAX(o.created_at) AS last_order_date " +
                "FROM orders o " +
                "JOIN users u ON o.user_id = u.id " +
                "JOIN customer_contact_history cch ON u.id = cch.user_id " +
                "WHERE o.created_at BETWEEN ? AND ? " +
                "GROUP BY u.id, u.full_name, u.email, cch.total_spend " +
                "ORDER BY total_spend DESC " +
                "LIMIT 10";

        List<SalesReport.CustomerPerformance> topCustomers = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sqlTopCustomers)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SalesReport.CustomerPerformance customer = new SalesReport.CustomerPerformance();
                    customer.setUserId(rs.getInt("user_id"));
                    customer.setFullName(rs.getString("full_name"));
                    customer.setEmail(rs.getString("email"));
                    customer.setCustomerType(rs.getString("customer_type"));
                    customer.setTotalOrders(rs.getInt("total_orders"));
                    customer.setTotalSpend(rs.getBigDecimal("total_spend"));
                    customer.setFirstOrderDate(rs.getDate("first_order_date"));
                    customer.setLastOrderDate(rs.getDate("last_order_date"));

                    topCustomers.add(customer);
                }
            }
        }
        report.setTopCustomers(topCustomers);
    }

    

    /**
     * Gets order processing metrics
     */
    private void getOrderProcessingMetrics(SalesReport report, java.sql.Date startDate, java.sql.Date endDate) {
    try {
        // In ra thông tin để debug
        System.out.println("Start Date: " + startDate);
        System.out.println("End Date: " + endDate);

        // Xử lý trạng thái đơn hàng
        String sqlOrderStatus = "SELECT status, COUNT(*) AS status_count " +
                "FROM orders " +
                "WHERE created_at BETWEEN ? AND ? " +
                "GROUP BY status";
        
        Map<String, Integer> ordersByStatus = new HashMap<>();
        
        try (PreparedStatement stmt = connection.prepareStatement(sqlOrderStatus)) {
            stmt.setDate(1, startDate);
            stmt.setDate(2, endDate);
            
            // In ra câu SQL để kiểm tra
            System.out.println("SQL Query: " + stmt.toString());
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String status = rs.getString("status");
                    int count = rs.getInt("status_count");
                    
                    // In ra từng dòng kết quả
                    System.out.println("Status: " + status + ", Count: " + count);
                    
                    ordersByStatus.put(status, count);
                }
            }
        }
        
        report.setOrdersByStatus(ordersByStatus);
        
        // Tương tự cho fulfillment time
    } catch (SQLException e) {
        // Log chi tiết lỗi
        e.printStackTrace();
        System.err.println("SQL Error Details: " + e.getMessage());
        System.err.println("SQL State: " + e.getSQLState());
        System.err.println("Error Code: " + e.getErrorCode());
    }
}


    // Other existing methods (getSalesOverview, getTimeBasedMetrics, getProductPerformance) remain the same
}