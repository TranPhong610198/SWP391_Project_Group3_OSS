package DAO;

import Context.DBContext;
import entity.Color;
import entity.Inventory;
import entity.Size;
import entity.Variant;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class InventoryDAO extends DBContext {

    public List<Inventory> searchInventory(String keyword, Integer categoryId, String sortField, String sortOrder, int limit, int offset) {
        Map<Integer, Inventory> inventoryMap = new LinkedHashMap<>();

        String query = "WITH ProductPagination AS ("
                + " SELECT p.id AS product_id, p.title AS product_name, c.name AS category, "
                + " COALESCE(SUM(pv.stock_quantity), 0) AS total_stock_quantity "
                + " FROM products p "
                + " JOIN categories c ON p.category_id = c.id "
                + " LEFT JOIN product_variants pv ON p.id = pv.product_id "
                + " WHERE 1=1 ";

        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            query += "AND p.title LIKE ? ";
            params.add("%" + keyword + "%");
        }
        if (categoryId != null) {
            query += "AND p.category_id = ? ";
            params.add(categoryId);
        }

        query += " GROUP BY p.id, p.title, c.name "
                + " ORDER BY " + (sortField.equals("category") ? "c.name" : sortField.equals("totalQuantity") ? "total_stock_quantity" : "p.title") + " " + (sortOrder.equalsIgnoreCase("asc") ? "ASC" : "DESC")
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY) "
                + "SELECT pp.product_id, pp.product_name, pp.category, pp.total_stock_quantity, "
                + " pc.id AS color_id, pc.color AS color_name, ps.id AS size_id, ps.size AS size_name "
                + "FROM ProductPagination pp "
                + "LEFT JOIN product_colors pc ON pp.product_id = pc.product_id "
                + "LEFT JOIN product_sizes ps ON pp.product_id = ps.product_id";

        params.add(offset);
        params.add(limit);

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("product_id");
                String productName = rs.getString("product_name");
                String category = rs.getString("category");
                int totalQuantity = rs.getInt("total_stock_quantity");
                int colorId = rs.getInt("color_id");
                String colorName = rs.getString("color_name");
                int sizeId = rs.getInt("size_id");
                String sizeName = rs.getString("size_name");

                Inventory inventory = inventoryMap.computeIfAbsent(productId,
                        id -> new Inventory(id, productName, category, new HashSet<>(), new HashSet<>(), totalQuantity));

                if (colorName != null) {
                    inventory.getColors().add(new Color(colorId, colorName));
                }
                if (sizeName != null) {
                    inventory.getSizes().add(new Size(sizeId, sizeName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ArrayList<>(inventoryMap.values());
    }

    public int getTotalInventoryCount(String keyword, Integer categoryId) {
        int totalRecords = 0;
        String query = "SELECT COUNT(DISTINCT p.id) FROM products p WHERE 1=1 ";

        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.trim().isEmpty()) {
            query += "AND p.title LIKE ? ";
            params.add("%" + keyword + "%");
        }
        if (categoryId != null) {
            query += "AND p.category_id = ? ";
            params.add(categoryId);
        }

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalRecords;
    }

    public Inventory getInventoryDetail(int productId) throws SQLException {
        String sql = """
                    SELECT p.id, p.title, c.name as category_name,
                           pc.id as color_id, pc.color as color_name,
                           ps.id as size_id, ps.size as size_name,
                           SUM(pv.stock_quantity) as total_quantity
                    FROM products p
                    JOIN categories c ON p.category_id = c.id
                    LEFT JOIN product_variants pv ON p.id = pv.product_id
                    LEFT JOIN product_colors pc ON pv.color_id = pc.id
                    LEFT JOIN product_sizes ps ON pv.size_id = ps.id
                    WHERE p.id = ?
                    GROUP BY p.id, p.title, c.name, pc.id, pc.color, ps.id, ps.size
                    """;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();

            Set<Color> colors = new TreeSet<>((c1, c2) -> c1.getName().compareToIgnoreCase(c2.getName()));
            Set<Size> sizes = new TreeSet<>((s1, s2) -> s1.getName().compareToIgnoreCase(s2.getName()));
            String productName = null;
            String category = null;
            int totalQuantity = 0;

            while (rs.next()) {
                if (productName == null) {
                    productName = rs.getString("title");
                    category = rs.getString("category_name");
                }

                if (rs.getInt("color_id") != 0) {
                    colors.add(new Color(rs.getInt("color_id"), rs.getString("color_name")));
                }
                if (rs.getInt("size_id") != 0) {
                    sizes.add(new Size(rs.getInt("size_id"), rs.getString("size_name")));
                }

                totalQuantity += rs.getInt("total_quantity");
            }

            return new Inventory(productId, productName, category, colors, sizes, totalQuantity);
        }
    }

    public List<Variant> getProductVariants(int productId) throws SQLException {
        String sql = """
                    SELECT pv.id, pv.product_id, 
                           pc.id as color_id, pc.color as color_name,
                           ps.id as size_id, ps.size as size_name,
                           pv.stock_quantity, pv.last_restock_date
                    FROM product_variants pv
                    JOIN product_colors pc ON pv.color_id = pc.id
                    JOIN product_sizes ps ON pv.size_id = ps.id
                    WHERE pv.product_id = ?
                    ORDER BY pc.color, ps.size
                    """;

        List<Variant> variants = new ArrayList<>();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Color color = new Color(rs.getInt("color_id"), rs.getString("color_name"));
                Size size = new Size(rs.getInt("size_id"), rs.getString("size_name"));

                variants.add(new Variant(
                        rs.getInt("id"),
                        productId,
                        color,
                        size,
                        rs.getInt("stock_quantity"),
                        rs.getTimestamp("last_restock_date")
                ));
            }
        }

        return variants;
    }

    public Color getColorByName(int productId, String colorName) throws SQLException {
        String sql = "SELECT id, color FROM product_colors WHERE product_id = ? AND color = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setString(2, colorName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Color(rs.getInt("id"), rs.getString("color"));
            }
        }
        return null;
    }

    public Size getSizeByName(int productId, String sizeName) throws SQLException {
        String sql = "SELECT id, size FROM product_sizes WHERE product_id = ? AND size = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setString(2, sizeName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Size(rs.getInt("id"), rs.getString("size"));
            }
        }
        return null;
    }

    public int addColor(int productId, String colorName) throws SQLException {
        String sql = "INSERT INTO product_colors (product_id, color) OUTPUT INSERTED.id VALUES (?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setString(2, colorName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return -1;
    }

    public int addSize(int productId, String sizeName) throws SQLException {
        String sql = "INSERT INTO product_sizes (product_id, size) OUTPUT INSERTED.id VALUES (?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setString(2, sizeName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return -1;
    }

    public void updateVariant(int variantId, int colorId, int sizeId, int quantity) throws SQLException {
        String sql = "UPDATE product_variants SET color_id = ?, size_id = ?, stock_quantity = ?, last_restock_date = GETDATE() WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, colorId);
            st.setInt(2, sizeId);
            st.setInt(3, quantity);
            st.setInt(4, variantId);
            st.executeUpdate();
        }
    }

    public void addNewVariant(int productId, int colorId, int sizeId, int quantity) throws SQLException {
        String sql = "INSERT INTO product_variants (product_id, color_id, size_id, stock_quantity, last_restock_date) VALUES (?, ?, ?, ?, GETDATE())";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setInt(2, colorId);
            st.setInt(3, sizeId);
            st.setInt(4, quantity);
            st.executeUpdate();
        }
    }

    public boolean isVariantExists(int productId, int colorId, int sizeId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM product_variants WHERE product_id = ? AND color_id = ? AND size_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            st.setInt(2, colorId);
            st.setInt(3, sizeId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    public Variant getVariant(int variantId) throws SQLException {
        String sql = """
                    SELECT pv.id, pv.product_id,
                           pc.id as color_id, pc.color as color_name,
                           ps.id as size_id, ps.size as size_name,
                           pv.stock_quantity, pv.last_restock_date
                    FROM product_variants pv
                    JOIN product_colors pc ON pv.color_id = pc.id
                    JOIN product_sizes ps ON pv.size_id = ps.id
                    WHERE pv.id = ?
                    """;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, variantId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Color color = new Color(rs.getInt("color_id"), rs.getString("color_name"));
                Size size = new Size(rs.getInt("size_id"), rs.getString("size_name"));

                return new Variant(
                        rs.getInt("id"),
                        rs.getInt("product_id"),
                        color,
                        size,
                        rs.getInt("stock_quantity"),
                        rs.getTimestamp("last_restock_date")
                );
            }
        }
        return null;
    }

    public void deleteVariant(int variantId) throws SQLException {
        // lấy color_id and size_id
        String getIdsSQL = "SELECT color_id, size_id FROM product_variants WHERE id = ?";
        int colorId = 0;
        int sizeId = 0;

        try (PreparedStatement st = connection.prepareStatement(getIdsSQL)) {
            st.setInt(1, variantId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                colorId = rs.getInt("color_id");
                sizeId = rs.getInt("size_id");
            }
        }

        // Start transaction
        connection.setAutoCommit(false);
        try {
            // xóa từ product_variants
            String deleteVariantSQL = "DELETE FROM product_variants WHERE id = ?";
            try (PreparedStatement st = connection.prepareStatement(deleteVariantSQL)) {
                st.setInt(1, variantId);
                st.executeUpdate();
            }

            // Kiểm tra xem màu sắc có còn được sử dụng trong các biến thể khác không
            String checkColorSQL = "SELECT COUNT(*) FROM product_variants WHERE color_id = ?";
            boolean colorInUse = false;
            try (PreparedStatement st = connection.prepareStatement(checkColorSQL)) {
                st.setInt(1, colorId);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    colorInUse = rs.getInt(1) > 0;
                }
            }

            // Xóa từ product_colors nếu ko đc sử dụng
            if (!colorInUse) {
                String deleteColorSQL = "DELETE FROM product_colors WHERE id = ?";
                try (PreparedStatement st = connection.prepareStatement(deleteColorSQL)) {
                    st.setInt(1, colorId);
                    st.executeUpdate();
                }
            }

            // Kiểm tra xem kích thước có còn được sử dụng trong các biến thể khác không
            String checkSizeSQL = "SELECT COUNT(*) FROM product_variants WHERE size_id = ?";
            boolean sizeInUse = false;
            try (PreparedStatement st = connection.prepareStatement(checkSizeSQL)) {
                st.setInt(1, sizeId);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    sizeInUse = rs.getInt(1) > 0;
                }
            }

            // Xóa từ product_sizes nếu ko đc sử dụng
            if (!sizeInUse) {
                String deleteSizeSQL = "DELETE FROM product_sizes WHERE id = ?";
                try (PreparedStatement st = connection.prepareStatement(deleteSizeSQL)) {
                    st.setInt(1, sizeId);
                    st.executeUpdate();
                }
            }

            // Commit transaction
            connection.commit();
        } catch (SQLException e) {
            connection.rollback();
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }

    public void updateVariantQuantity(int variantId, int quantity) throws SQLException {
        String sql = "UPDATE product_variants SET stock_quantity = ?, last_restock_date = GETDATE() WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, quantity);
            st.setInt(2, variantId);
            st.executeUpdate();
        }
    }
}
