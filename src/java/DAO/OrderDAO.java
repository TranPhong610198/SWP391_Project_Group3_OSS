package DAO;

import Context.DBContext;
import entity.CartItem;
import entity.Order;
import entity.OrderHistory;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class OrderDAO extends DBContext {

    public Order createOrder(Order order) {
        Connection conn = null;
        PreparedStatement stmtOrder = null;
        PreparedStatement stmtItems = null;
        PreparedStatement stmtPayment = null;
        ResultSet rs = null;

        try {
            conn = connection;
            conn.setAutoCommit(false);

            // Thêm đơn hàng vào bảng orders
            String sqlOrder = "INSERT INTO orders (user_id, status, total_amount, recipient_name, recipient_email, "
                    + "recipient_phone, recipient_address, notes, created_at, updated_at) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())";

            stmtOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            if (order.getUserId() > 0) {
                stmtOrder.setInt(1, order.getUserId());
            } else {
                stmtOrder.setNull(1, java.sql.Types.INTEGER);
            }
            stmtOrder.setString(2, order.getStatus() != null ? order.getStatus() : "pending");
            stmtOrder.setDouble(3, order.getTotal());
            stmtOrder.setString(4, order.getRecipientName());
            stmtOrder.setString(5, order.getRecipientEmail());
            stmtOrder.setString(6, order.getPhone());
            stmtOrder.setString(7, order.getAddress());
            stmtOrder.setString(8, order.getOrderCode());
            stmtOrder.executeUpdate();

            rs = stmtOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
                order.setId(orderId);
            }

            // Thêm các sản phẩm vào bảng order_items (dữ liệu cứng từ cart_items)
            if (orderId > 0 && order.getItems() != null && !order.getItems().isEmpty()) {
                String sqlItems = "INSERT INTO order_items (order_id, product_id, product_name, product_image, variant_id, variant_name, quantity, unit_price_at_order) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

                stmtItems = conn.prepareStatement(sqlItems);
                for (CartItem item : order.getItems()) {
                    stmtItems.setInt(1, orderId);
                    stmtItems.setInt(2, item.getProductId());
                    stmtItems.setString(3, item.getProductTitle());
                    stmtItems.setString(4, item.getProductThumbnail());
                    stmtItems.setInt(5, item.getVariantId());
                    stmtItems.setString(6, item.getSize() + " - " + item.getColor()); // Lưu thông tin biến thể
                    stmtItems.setInt(7, item.getQuantity());
                    stmtItems.setDouble(8, item.getProductPrice());
                    stmtItems.addBatch();
                }
                stmtItems.executeBatch();
            }

            // Thêm thông tin thanh toán
            String sqlPayment = "INSERT INTO payments (order_id, payment_method, payment_status, created_at) "
                    + "VALUES (?, ?, ?, GETDATE())";
            stmtPayment = conn.prepareStatement(sqlPayment);
            stmtPayment.setInt(1, orderId);
            String paymentMethodValue = "bank".equals(order.getPaymentMethod()) ? "bank_transfer" : "cod";
            stmtPayment.setString(2, paymentMethodValue);
            stmtPayment.setString(3, "pending");
            stmtPayment.executeUpdate();

            // Thêm mã giảm giá nếu có
            if (order.getCouponCode() != null && !order.getCouponCode().isEmpty() && order.getDiscountAmount() > 0) {
                applyCouponToOrder(conn, orderId, order.getCouponCode(), order.getDiscountAmount(), order.getRecipientEmail());
            }

            // Thêm thông tin vận chuyển
            if (order.getShippingMethod() != null && !order.getShippingMethod().isEmpty()) {
                addShippingInfo(conn, orderId, order.getShippingMethod());
            }

            // Thêm lịch sử đơn hàng
            addOrderHistory(conn, orderId, order.getUserId() > 0 ? order.getUserId() : 1, order.getStatus(), "Đơn hàng mới được tạo");

            conn.commit();
            return order;

        } catch (SQLException e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                System.out.println("Error rolling back: " + ex.getMessage());
            }
            System.out.println("Error creating order: " + e.getMessage());
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmtOrder != null) {
                    stmtOrder.close();
                }
                if (stmtItems != null) {
                    stmtItems.close();
                }
                if (stmtPayment != null) {
                    stmtPayment.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true);
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }

    private void applyCouponToOrder(Connection conn, int orderId, String couponCode, double discountAmount, String userEmail) throws SQLException {
        PreparedStatement stmtCoupon = null;
        ResultSet rs = null;

        try {
            // Lấy ID của mã giảm giá từ bảng coupons
            String sqlGetCoupon = "SELECT id FROM coupons WHERE code = ?";
            stmtCoupon = conn.prepareStatement(sqlGetCoupon);
            stmtCoupon.setString(1, couponCode);
            rs = stmtCoupon.executeQuery();

            if (rs.next()) {
                int couponId = rs.getInt("id");
                rs.close();
                stmtCoupon.close();

                // Thêm vào bảng order_coupons
                String sqlOrderCoupon = "INSERT INTO order_coupons (order_id, coupon_id, user_email, discount_applied, created_at) "
                        + "VALUES (?, ?, ?, ?, GETDATE())";
                stmtCoupon = conn.prepareStatement(sqlOrderCoupon);
                stmtCoupon.setInt(1, orderId);
                stmtCoupon.setInt(2, couponId);
                stmtCoupon.setString(3, userEmail);
                stmtCoupon.setDouble(4, discountAmount);
                stmtCoupon.executeUpdate();

                // Cập nhật số lần sử dụng của mã giảm giá
                String sqlUpdateCoupon = "UPDATE coupons SET used_count = used_count + 1 WHERE id = ?";
                stmtCoupon.close();
                stmtCoupon = conn.prepareStatement(sqlUpdateCoupon);
                stmtCoupon.setInt(1, couponId);
                stmtCoupon.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmtCoupon != null) {
                stmtCoupon.close();
            }
        }
    }

    private void addShippingInfo(Connection conn, int orderId, String shippingMethod) throws SQLException {
        PreparedStatement stmt = null;

        try {
            // Tạo mã theo dõi tạm thời - phải là duy nhất
            String tempTrackingNumber = "TEMP-" + orderId + "-" + System.currentTimeMillis();

            String sql = "INSERT INTO shipping (order_id, shipping_provider, tracking_number, estimated_delivery) "
                    + "VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, orderId);

            // Thiết lập thông tin vận chuyển dựa trên phương thức
            String provider = "standard".equals(shippingMethod) ? "Standard Delivery" : "Express Delivery";

            // Tính ngày giao hàng dự kiến
            java.sql.Date estimatedDelivery = calculateEstimatedDelivery(shippingMethod);

            stmt.setString(2, provider);
            stmt.setString(3, tempTrackingNumber); // Sử dụng mã theo dõi tạm thời thay vì NULL
            stmt.setDate(4, estimatedDelivery);
            stmt.executeUpdate();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
    }

    private void addOrderHistory(Connection conn, int orderId, int userId, String status, String notes) throws SQLException {
        PreparedStatement stmt = null;

        try {
            String sql = "INSERT INTO order_history (order_id, updated_by, status, notes, updated_at) "
                    + "VALUES (?, ?, ?, ?, GETDATE())";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, orderId);
            stmt.setInt(2, userId > 0 ? userId : 1); // Sử dụng admin ID nếu là khách
            stmt.setString(3, status);
            stmt.setString(4, notes);
            stmt.executeUpdate();
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
    }

    private java.sql.Date calculateEstimatedDelivery(String shippingMethod) {
        // Tính ngày giao hàng dự kiến dựa trên phương thức vận chuyển
        java.util.Calendar cal = java.util.Calendar.getInstance();
        cal.add(java.util.Calendar.DATE, "express".equals(shippingMethod) ? 2 : 5);
        return new java.sql.Date(cal.getTimeInMillis());
    }

    public List<Order> getUserOrders(int userId, String keyword, String status, int page, int recordsPerPage) {
        List<Order> orders = new ArrayList<>();

        try {
            // Tính vị trí bắt đầu
            int start = (page - 1) * recordsPerPage;

            // Xây dựng query
            StringBuilder sql = new StringBuilder(
                    "SELECT o.*, p.payment_method, p.payment_status "
                    + "FROM orders o "
                    + "LEFT JOIN payments p ON o.id = p.order_id "
                    + "WHERE o.user_id = ? "
            );

            List<Object> params = new ArrayList<>();
            params.add(userId);

            // Thêm điều kiện tìm kiếm
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql.append("AND (o.notes LIKE ? OR o.recipient_name LIKE ? OR EXISTS (SELECT 1 FROM order_items oi "
                        + "INNER JOIN products pr ON oi.product_id = pr.id "
                        + "WHERE oi.order_id = o.id AND pr.title LIKE ?)) ");
                params.add("%" + keyword + "%");
                params.add("%" + keyword + "%");
                params.add("%" + keyword + "%");
            }

            // Thêm điều kiện lọc theo trạng thái
            if (status != null && !status.trim().isEmpty() && !status.equals("all")) {
                sql.append("AND o.status = ? ");
                params.add(status);
            }

            // Thêm phần sắp xếp và phân trang
            sql.append("ORDER BY o.created_at DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            params.add(start);
            params.add(recordsPerPage);

            // Thực thi truy vấn
            PreparedStatement stmt = connection.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                stmt.setObject(i + 1, params.get(i));
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderCode(rs.getString("notes")); // Mã đơn hàng được lưu trong notes
                order.setStatus(rs.getString("status"));
                order.setTotal(rs.getDouble("total_amount"));
                order.setRecipientName(rs.getString("recipient_name"));
                order.setRecipientEmail(rs.getString("recipient_email"));
                order.setPhone(rs.getString("recipient_phone"));
                order.setAddress(rs.getString("recipient_address"));
                order.setOrderDate(rs.getTimestamp("created_at"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setPaymentStatus(rs.getString("payment_status"));

                // Lấy thông tin các sản phẩm trong đơn hàng
                order.setItems(getOrderItems(order.getId()));

                orders.add(order);
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error getting user orders: " + e.getMessage());
        }

        return orders;
    }

    public int getNumberOfUserOrders(int userId, String keyword, String status) {
        int count = 0;

        try {
            // Xây dựng query đếm tổng số đơn hàng
            StringBuilder sql = new StringBuilder(
                    "SELECT COUNT(*) FROM orders o WHERE o.user_id = ? "
            );

            List<Object> params = new ArrayList<>();
            params.add(userId);

            // Thêm điều kiện tìm kiếm
            if (keyword != null && !keyword.trim().isEmpty()) {
                sql.append("AND (o.notes LIKE ? OR o.recipient_name LIKE ? OR EXISTS (SELECT 1 FROM order_items oi "
                        + "INNER JOIN products pr ON oi.product_id = pr.id "
                        + "WHERE oi.order_id = o.id AND pr.title LIKE ?)) ");
                params.add("%" + keyword + "%");
                params.add("%" + keyword + "%");
                params.add("%" + keyword + "%");
            }

            // Thêm điều kiện lọc theo trạng thái
            if (status != null && !status.trim().isEmpty() && !status.equals("all")) {
                sql.append("AND o.status = ? ");
                params.add(status);
            }

            // Thực thi truy vấn
            PreparedStatement stmt = connection.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                stmt.setObject(i + 1, params.get(i));
            }

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error counting user orders: " + e.getMessage());
        }

        return count;
    }

    public List<CartItem> getOrderItems(int orderId) {
        List<CartItem> items = new ArrayList<>();

        try {
            String sql = "SELECT oi.*, p.title, p.thumbnail, ps.size, pc.color "
                    + "FROM order_items oi "
                    + "INNER JOIN products p ON oi.product_id = p.id "
                    + "INNER JOIN product_variants pv ON oi.variant_id = pv.id "
                    + "INNER JOIN product_sizes ps ON pv.size_id = ps.id "
                    + "INNER JOIN product_colors pc ON pv.color_id = pc.id "
                    + "WHERE oi.order_id = ?";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CartItem item = new CartItem();
                item.setId(rs.getInt("id"));
                item.setProductId(rs.getInt("product_id"));
                item.setVariantId(rs.getInt("variant_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setProductPrice(rs.getDouble("unit_price"));
                item.setProductTitle(rs.getString("title"));
                item.setProductThumbnail(rs.getString("thumbnail"));
                item.setSize(rs.getString("size"));
                item.setColor(rs.getString("color"));

                items.add(item);
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error getting order items: " + e.getMessage());
        }

        return items;
    }

    // Add these methods to your existing OrderDAO.java class
    public Order getOrderById(int orderId) {
        Order order = null;

        try {
            // Modified query to include shipping and coupon information
            String sql = "SELECT o.*, p.payment_method, p.payment_status, "
                    + "s.shipping_provider, s.tracking_number, s.estimated_delivery, "
                    + "oc.coupon_id, oc.discount_applied, c.code AS coupon_code "
                    + "FROM orders o "
                    + "LEFT JOIN payments p ON o.id = p.order_id "
                    + "LEFT JOIN shipping s ON o.id = s.order_id "
                    + "LEFT JOIN order_coupons oc ON o.id = oc.order_id "
                    + "LEFT JOIN coupons c ON oc.coupon_id = c.id "
                    + "WHERE o.id = ?";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderCode(rs.getString("notes")); // Order code is stored in notes field
                order.setStatus(rs.getString("status"));
                order.setTotal(rs.getDouble("total_amount"));
                order.setRecipientName(rs.getString("recipient_name"));
                order.setRecipientEmail(rs.getString("recipient_email"));
                order.setPhone(rs.getString("recipient_phone"));
                order.setAddress(rs.getString("recipient_address"));
                order.setOrderDate(rs.getTimestamp("created_at"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setPaymentStatus(rs.getString("payment_status"));

                // Get shipping method from shipping provider
                String shippingProvider = rs.getString("shipping_provider");
                if (shippingProvider != null) {
                    // Determine shipping method based on provider name
                    if (shippingProvider.toLowerCase().contains("express")) {
                        order.setShippingMethod("express");
                    } else {
                        order.setShippingMethod("standard");
                    }
                }

                // Get coupon information if available
                double discountAmount = rs.getDouble("discount_applied");
                if (discountAmount > 0) {
                    order.setDiscountAmount(discountAmount);
                    order.setCouponCode(rs.getString("coupon_code"));
                }

                // Get items in the order
                order.setItems(getOrderItems(order.getId()));
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error getting order: " + e.getMessage());
        }

        return order;
    }

    public List<OrderHistory> getOrderHistory(int orderId) {
        List<OrderHistory> history = new ArrayList<>();

        try {
            String sql = "SELECT oh.*, u.full_name "
                    + "FROM order_history oh "
                    + "LEFT JOIN users u ON oh.updated_by = u.id "
                    + "WHERE oh.order_id = ? "
                    + "ORDER BY oh.updated_at ASC";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                OrderHistory item = new OrderHistory();
                item.setId(rs.getInt("id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setUpdatedBy(rs.getInt("updated_by"));
                item.setUpdaterName(rs.getString("full_name"));
                item.setStatus(rs.getString("status"));
                item.setNotes(rs.getString("notes"));
                item.setUpdatedAt(rs.getTimestamp("updated_at"));

                history.add(item);
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error getting order history: " + e.getMessage());
        }

        return history;
    }

    public boolean updateOrderStatus(int orderId, String status, int updatedBy) {
        // Validate status
        String[] validStatuses = {"pending_pay", "pending", "processing", "shipped", "completed", "cancelled"};
        boolean isValidStatus = false;
        for (String validStatus : validStatuses) {
            if (validStatus.equals(status)) {
                isValidStatus = true;
                break;
            }
        }
        if (!isValidStatus) {
            System.out.println("Invalid status value: " + status);
            return false;
        }

        try {
            // Update order status
            String sqlUpdateOrder = "UPDATE orders SET status = ?, updated_at = GETDATE() WHERE id = ?";
            PreparedStatement stmtUpdateOrder = connection.prepareStatement(sqlUpdateOrder);
            stmtUpdateOrder.setString(1, status);
            stmtUpdateOrder.setInt(2, orderId);
            stmtUpdateOrder.executeUpdate();

            // Add to order history
            String sqlOrderHistory = "INSERT INTO order_history (order_id, updated_by, status, updated_at) "
                    + "VALUES (?, ?, ?, GETDATE())";
            PreparedStatement stmtOrderHistory = connection.prepareStatement(sqlOrderHistory);
            stmtOrderHistory.setInt(1, orderId);
            stmtOrderHistory.setInt(2, updatedBy);
            stmtOrderHistory.setString(3, status);
            stmtOrderHistory.executeUpdate();

            stmtUpdateOrder.close();
            stmtOrderHistory.close();

            return true;
        } catch (SQLException e) {
            System.out.println("Error updating order status: " + e.getMessage());
            return false;
        }
    }

    public boolean cancelOrder(int orderId, int userId) {
        try {
            // Kiểm tra đơn hàng có thuộc về người dùng này không
            String sqlCheckOrder = "SELECT id FROM orders WHERE id = ? AND user_id = ?";
            PreparedStatement stmtCheckOrder = connection.prepareStatement(sqlCheckOrder);
            stmtCheckOrder.setInt(1, orderId);
            stmtCheckOrder.setInt(2, userId);
            ResultSet rs = stmtCheckOrder.executeQuery();

            if (!rs.next()) {
                rs.close();
                stmtCheckOrder.close();
                return false; // Đơn hàng không tồn tại hoặc không thuộc về người dùng này
            }

            rs.close();
            stmtCheckOrder.close();

            // Lấy thông tin đơn hàng để hoàn trả tồn kho
            List<CartItem> orderItems = getOrderItems(orderId);

            // Cập nhật trạng thái đơn hàng thành "cancelled"
            if (updateOrderStatus(orderId, "cancelled", userId)) {
                // Hoàn trả số lượng sản phẩm về kho
                InventoryDAO inventoryDAO = new InventoryDAO();
                for (CartItem item : orderItems) {
                    inventoryDAO.updateVariantQuantity(item.getVariantId(), item.getQuantity());
                }

                // Kiểm tra và cập nhật số lượt dùng của mã giảm giá
                String sqlGetCoupon = "SELECT oc.coupon_id FROM order_coupons oc WHERE oc.order_id = ?";
                PreparedStatement stmtGetCoupon = connection.prepareStatement(sqlGetCoupon);
                stmtGetCoupon.setInt(1, orderId);
                ResultSet rsCoupon = stmtGetCoupon.executeQuery();

                if (rsCoupon.next()) {
                    int couponId = rsCoupon.getInt("coupon_id");
                    // Giảm số lần sử dụng của mã giảm giá
                    String sqlUpdateCoupon = "UPDATE coupons SET used_count = used_count - 1 WHERE id = ? AND used_count > 0";
                    PreparedStatement stmtUpdateCoupon = connection.prepareStatement(sqlUpdateCoupon);
                    stmtUpdateCoupon.setInt(1, couponId);
                    stmtUpdateCoupon.executeUpdate();

                    stmtUpdateCoupon.close();
                }

                rsCoupon.close();
                stmtGetCoupon.close();

                return true;
            }

            return false;
        } catch (SQLException e) {
            System.out.println("Error cancelling order: " + e.getMessage());
            return false;
        }
    }

    public List<Order> getOrdersByUserId(int userId) {
        return getUserOrders(userId, null, null, 1, Integer.MAX_VALUE);
    }
// Add this method to your OrderDAO class

    public boolean updatePaymentStatus(int orderId, String status) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = connection;
            conn.setAutoCommit(false); // Start transaction

            // Use explicit transaction to ensure both operations complete or fail together
            // 1. Update payment status in payments table
            String sql = "UPDATE payments SET payment_status = ?, updated_at = GETDATE() WHERE order_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setInt(2, orderId);
            int result = stmt.executeUpdate();

            if (result <= 0) {
                // No rows updated - possibly no payment record exists
                System.out.println("Warning: No payment record found for order ID: " + orderId);
                // Optionally insert a new payment record if needed
            }

            // 2. Add payment info to order history
            String historyNote = "pending".equals(status) ? "Đang chờ thanh toán"
                    : "completed".equals(status) ? "Đã thanh toán thành công"
                    : "failed".equals(status) ? "Thanh toán không thành công"
                    : "refunded".equals(status) ? "Đã hoàn tiền" : "Cập nhật trạng thái thanh toán: " + status;

            stmt.close(); // Close the previous statement

            String orderHistorySql = "INSERT INTO order_history (order_id, updated_by, status, notes, updated_at) "
                    + "VALUES (?, 1, (SELECT status FROM orders WHERE id = ?), ?, GETDATE())";

            stmt = conn.prepareStatement(orderHistorySql);
            stmt.setInt(1, orderId);
            stmt.setInt(2, orderId);
            stmt.setString(3, historyNote);
            stmt.executeUpdate();

            // Commit the transaction
            conn.commit();

            return true;
        } catch (SQLException e) {
            // If any error occurs, roll back the transaction
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                System.out.println("Error rolling back transaction: " + ex.getMessage());
            }
            System.out.println("Error updating payment status: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.setAutoCommit(true); // Reset auto-commit mode
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();

        try {
            String sql = "SELECT o.*, p.payment_method, p.payment_status "
                    + "FROM orders o "
                    + "LEFT JOIN payments p ON o.id = p.order_id "
                    + "ORDER BY o.created_at DESC";

            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderCode(rs.getString("notes")); // Mã đơn hàng được lưu trong notes
                order.setStatus(rs.getString("status"));
                order.setTotal(rs.getDouble("total_amount"));
                order.setRecipientName(rs.getString("recipient_name"));
                order.setRecipientEmail(rs.getString("recipient_email"));
                order.setPhone(rs.getString("recipient_phone"));
                order.setAddress(rs.getString("recipient_address"));
                order.setOrderDate(rs.getTimestamp("created_at"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setPaymentStatus(rs.getString("payment_status"));

                // Get order items
                order.setItems(getOrderItems(order.getId()));

                orders.add(order);
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error getting all orders: " + e.getMessage());
        }

        return orders;
    }

}
