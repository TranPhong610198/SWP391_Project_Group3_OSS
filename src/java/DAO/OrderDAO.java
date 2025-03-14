package DAO;

import Context.DBContext;
import entity.CartItem;
import entity.Order;
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

            // Bước 1: Thêm đơn hàng vào bảng orders
            String sqlOrder = "INSERT INTO orders (user_id, status, total_amount, recipient_name, recipient_email, "
                    + "recipient_phone, recipient_address, notes, created_at, updated_at) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())";

            stmtOrder = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);

            // Nếu đây là đơn hàng của khách vãng lai, user_id sẽ là null
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

            // Tạo mã đơn hàng
            String orderCode = "ORD" + System.currentTimeMillis() % 1000000;
            stmtOrder.setString(8, orderCode);

            stmtOrder.executeUpdate();

            // Lấy ID của đơn hàng vừa tạo
            rs = stmtOrder.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
                order.setId(orderId);
                order.setOrderCode(orderCode);
            }

            // Bước 2: Thêm các sản phẩm vào bảng order_items
            if (orderId > 0 && order.getItems() != null && !order.getItems().isEmpty()) {
                String sqlItems = "INSERT INTO order_items (order_id, product_id, variant_id, quantity, unit_price) "
                        + "VALUES (?, ?, ?, ?, ?)";

                stmtItems = conn.prepareStatement(sqlItems);

                for (CartItem item : order.getItems()) {
                    stmtItems.setInt(1, orderId);
                    stmtItems.setInt(2, item.getProductId());
                    stmtItems.setInt(3, item.getVariantId());
                    stmtItems.setInt(4, item.getQuantity());
                    stmtItems.setDouble(5, item.getProductPrice());
                    stmtItems.addBatch();
                }

                stmtItems.executeBatch();
            }

            // Bước 3: Thêm thông tin thanh toán vào bảng payments
            String sqlPayment = "INSERT INTO payments (order_id, payment_method, payment_status, created_at) "
                    + "VALUES (?, ?, ?, GETDATE())";

            stmtPayment = conn.prepareStatement(sqlPayment);
            stmtPayment.setInt(1, orderId);

            // Chuyển đổi phương thức thanh toán thành định dạng phù hợp với cột payment_method
            String paymentMethodValue;
            switch (order.getPaymentMethod().toLowerCase()) {
                case "bank":
                    paymentMethodValue = "bank_transfer";
                    break;
                case "cod":
                    paymentMethodValue = "cod";
                    break;
                default:
                    paymentMethodValue = "cod";
            }

            stmtPayment.setString(2, paymentMethodValue);

            // Đặt trạng thái thanh toán ban đầu
            String paymentStatus = "cod".equals(paymentMethodValue) ? "pending" : "pending";
            stmtPayment.setString(3, paymentStatus);

            stmtPayment.executeUpdate();

            // Bước 4: Nếu có sử dụng mã giảm giá, lưu thông tin sử dụng mã giảm giá
            if (order.getCouponCode() != null && !order.getCouponCode().isEmpty() && order.getDiscountAmount() > 0) {
                applyCouponToOrder(conn, orderId, order.getCouponCode(), order.getDiscountAmount(), order.getRecipientEmail());
            }

            // Bước 5: Thêm thông tin vận chuyển
            if (order.getShippingMethod() != null && !order.getShippingMethod().isEmpty()) {
                addShippingInfo(conn, orderId, order.getShippingMethod());
            }

            // Commit giao dịch
            conn.commit();

            return order;

        } catch (SQLException e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                System.out.println("Error rolling back transaction: " + ex.getMessage());
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
            String sql = "INSERT INTO shipping (order_id, shipping_provider, estimated_delivery) "
                    + "VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, orderId);

            // Thiết lập thông tin vận chuyển dựa trên phương thức
            String provider = "standard".equals(shippingMethod) ? "Standard Delivery" : "Express Delivery";

            // Tính ngày giao hàng dự kiến
            java.sql.Date estimatedDelivery = calculateEstimatedDelivery(shippingMethod);

            stmt.setString(2, provider);
            stmt.setDate(3, estimatedDelivery);
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

    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();

        try {
            String sql = "SELECT o.*, p.payment_method, p.payment_status "
                    + "FROM orders o "
                    + "LEFT JOIN payments p ON o.id = p.order_id "
                    + "WHERE o.user_id = ? "
                    + "ORDER BY o.created_at DESC";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, userId);
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

                // Lấy thông tin các sản phẩm trong đơn hàng
                order.setItems(getOrderItems(order.getId()));

                orders.add(order);
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error getting orders: " + e.getMessage());
        }

        return orders;
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

    public Order getOrderById(int orderId) {
        Order order = null;

        try {
            String sql = "SELECT o.*, p.payment_method, p.payment_status "
                    + "FROM orders o "
                    + "LEFT JOIN payments p ON o.id = p.order_id "
                    + "WHERE o.id = ?";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                order = new Order();
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

                // Lấy thông tin các sản phẩm trong đơn hàng
                order.setItems(getOrderItems(order.getId()));
            }

            rs.close();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error getting order: " + e.getMessage());
        }

        return order;
    }

    public boolean updateOrderStatus(int orderId, String status, int updatedBy) {
        try {
            // Cập nhật trạng thái đơn hàng
            String sqlUpdateOrder = "UPDATE orders SET status = ?, updated_at = GETDATE() WHERE id = ?";
            PreparedStatement stmtUpdateOrder = connection.prepareStatement(sqlUpdateOrder);
            stmtUpdateOrder.setString(1, status);
            stmtUpdateOrder.setInt(2, orderId);
            stmtUpdateOrder.executeUpdate();

            // Thêm vào lịch sử đơn hàng
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
                return true;
            }

            return false;
        } catch (SQLException e) {
            System.out.println("Error cancelling order: " + e.getMessage());
            return false;
        }
    }
    // Thêm vào lớp OrderDAO

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
}
