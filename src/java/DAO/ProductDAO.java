/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author tphon
 */
import Context.DBContext;
import entity.Product;
import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {

//_______________________________________Phần DAO Cho Việc List______________________________________________________________ 
    private static final int RECORDS_PER_PAGE = 10;

    //Lấy tổng hàng tồn của 1 sản phẩm
    public int getTotalStockByProductId(int productId) {
        String query = "SELECT SUM(stock_quantity) AS total_stock FROM product_variants WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("total_stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    //Lấy danh sách sản phẩm thông qua lọc
    public List<Product> getProductsByFilter(String filterQuery, List<Object> params) {
        List<Product> products = new ArrayList<>();
        try (PreparedStatement ps = connection.prepareStatement(filterQuery)) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setDescription(rs.getString("description"));
                product.setOriginalPrice(rs.getBigDecimal("original_price"));
                product.setSalePrice(rs.getBigDecimal("sale_price"));
                product.setThumbnail(rs.getString("thumbnail"));
                product.setStatus(rs.getString("status"));
                product.setIsCombo(rs.getBoolean("is_combo"));
                product.setComboGroupId(rs.getInt("combo_group_id"));
                product.setCreatedAt(rs.getString("created_at"));
                product.setUpdatedAt(rs.getString("updated_at"));

                product.setStock(getTotalStockByProductId(rs.getInt("id")));
                product.setSubImages(getProductImages(rs.getInt("id")));

                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //Lấy danh sách những sản phẩm thuộc 1 combo
    public List<Product> getComboProduct(int comboGroupId) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products WHERE combo_group_id = ? ORDER BY id DESC";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, comboGroupId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product comboProduct = new Product();
                comboProduct.setId(rs.getInt("id"));
                comboProduct.setTitle(rs.getString("title"));
                comboProduct.setCategoryId(rs.getInt("category_id"));
                comboProduct.setDescription(rs.getString("description"));
                comboProduct.setOriginalPrice(rs.getBigDecimal("original_price"));
                comboProduct.setSalePrice(rs.getBigDecimal("sale_price"));
                comboProduct.setThumbnail(rs.getString("thumbnail"));
                comboProduct.setStatus(rs.getString("status"));
                comboProduct.setIsCombo(rs.getBoolean("is_combo"));
                comboProduct.setComboGroupId(rs.getInt("combo_group_id"));
                comboProduct.setCreatedAt(rs.getString("created_at"));
                comboProduct.setUpdatedAt(rs.getString("updated_at"));
                comboProduct.setStock(getTotalStockByProductId(rs.getInt("id")));

                products.add(comboProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //Lấy tổng sản phẩm đã đc lọc
    public int getTotalFilteredRecords(String filterQuery, List<Object> params) {
        String countQuery = "SELECT COUNT(*) AS total FROM (" + filterQuery + ") AS filtered";
        try (PreparedStatement ps = connection.prepareStatement(countQuery)) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getPaginatedProducts(String baseQuery, List<Object> params, int page) {
        int offset = (page - 1) * RECORDS_PER_PAGE;
        String paginatedQuery = baseQuery + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        params.add(offset);
        params.add(RECORDS_PER_PAGE);
        return getProductsByFilter(paginatedQuery, params);
    }
//_______________________________________Hết Phần DAO Cho Việc List______________________________________________________________ 

//_________________________________________Phần DAO Cho Việc Add____________________________________________________________    
    // Lấy danh sách các sản phẩm chính của 1 combo
    public List<Product> getComboProducts() {
        List<Product> comboProducts = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE is_combo = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setComboGroupId(rs.getInt("combo_group_id"));
                comboProducts.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comboProducts;
    }

    // Lấy giá trị combo_group_id lớn nhất
    public int getMaxComboGroupId() {
        int maxId = 0;
        String sql = "SELECT MAX(combo_group_id) as max_id FROM products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                maxId = rs.getInt("max_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return maxId;
    }

    // Lấy danh sách ảnh phụ
    public List<String> getProductImages(int productId) {
        List<String> images = new ArrayList<>();
        String query = "SELECT image_url FROM product_images WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("image_url"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }

    // Thêm sản phẩm vào db
    public boolean addProduct(Product product, List<String> subImages) {
        String insertProduct = "INSERT INTO products (title, category_id, description, original_price, sale_price, thumbnail, is_combo, combo_group_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(insertProduct, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, product.getTitle());
            ps.setInt(2, product.getCategoryId());
            ps.setString(3, product.getDescription());
            ps.setBigDecimal(4, product.getOriginalPrice());
            ps.setBigDecimal(5, product.getSalePrice());
            ps.setString(6, product.getThumbnail());
            ps.setBoolean(7, product.isIsCombo());
            ps.setInt(8, product.getComboGroupId());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int productId = generatedKeys.getInt(1);
                    addProductImages(productId, subImages);
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Thêm ảnh phụ vào db
    private void addProductImages(int productId, List<String> subImages) {
        String insertImage = "INSERT INTO product_images (product_id, image_url) VALUES (?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(insertImage)) {
            for (int i = 0; i < subImages.size(); i++) {
                ps.setInt(1, productId);
                ps.setString(2, subImages.get(i));
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//______________________________________________________Hết Phần DAO Cho Việc Add_________________________________________

//_______________________________________________________Phần DAO Cho Việc Delete____________________________________________
    // Chuyển sản phẩm chính
    public boolean setIsComboByProductId(int productId, boolean isCombo) {
        String sql = "UPDATE products SET is_combo = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setBoolean(1, isCombo);
            ps.setInt(2, productId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Trả về false nếu có lỗi
    }

    //Kiểm tra xem sản phẩm có trong cart hay không
    public boolean hasProductInCart(int productId) {
        String query = "SELECT COUNT(*) FROM cart_items WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Nếu COUNT > 0, sản phẩm đang có trong giỏ hàng
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //Kiểm tra sản phẩm có trong order processing không
    public boolean hasProcessOrders(int productId) {
        String query = "SELECT COUNT(*) FROM order_items oi "
                + "JOIN orders o ON oi.order_id = o.id "
                + "WHERE oi.product_id = ? AND o.status IN ('pending', 'processing', 'shipped')";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Nếu có đơn hàng đang xử lý, không thể xóa
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //Kiểm tra sản phẩm còn tồn hàng không    
    public boolean hasStock(int productId) {
        String query = "SELECT SUM(stock_quantity) FROM product_variants WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Nếu tổng stock_quantity > 0, sản phẩm vẫn còn tồn kho
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //Kiểm tra xem có được phép xóa hay không
    public boolean canDeleteProduct(int productId) {
        return !hasProcessOrders(productId) && !hasStock(productId);
    }

    //Thực hiện xóa
    public boolean deleteProduct(int productId, String uploadPath) {
        if (!canDeleteProduct(productId)) {
            return false; // Không thể xóa nếu sản phẩm có đơn hàng chưa hoàn tất
        }

        // Lấy đường dẫn ảnh chính của sản phẩm
        String thumbnailPath = null;
        String selectThumbnailQuery = "SELECT thumbnail FROM products WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(selectThumbnailQuery)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                thumbnailPath = rs.getString("thumbnail");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        // Lấy danh sách ảnh phụ của sản phẩm để xóa file
        List<String> imagePaths = getProductImages(productId);

        // Xóa ảnh chính khỏi thư mục
        if (thumbnailPath != null) {
            thumbnailPath = thumbnailPath.replace("uploads/productImages/", "");
            File thumbnailFile = new File(uploadPath + File.separator + thumbnailPath);
            if (thumbnailFile.exists()) {
                thumbnailFile.delete();
            }
        }

        // Xóa ảnh phụ sản phẩm khỏi thư mục
        for (String imagePath : imagePaths) {
            imagePath = imagePath.replace("uploads/productImages/", "");
            File file = new File(uploadPath + File.separator + imagePath);
            if (file.exists()) {
                file.delete();
            }
        }

        // Xóa ảnh trong DB
        String deleteImagesQuery = "DELETE FROM product_images WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(deleteImagesQuery)) {
            ps.setInt(1, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        // Xóa sản phẩm khỏi DB
        String deleteProductQuery = "DELETE FROM products WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(deleteProductQuery)) {
            ps.setInt(1, productId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
//_______________________________________________________Hết Phần DAO Cho Việc Delete____________________________________________

//_______________________________________________________Phần DAO Cho Việc EDIT____________________________________________    
    // Lấy sản phẩm bằng Id
    public Product getProductById(int productId) {
        String sql = "SELECT * FROM products WHERE id = ?";
        Product product = null;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setDescription(rs.getString("description"));
                product.setOriginalPrice(rs.getBigDecimal("original_price"));
                product.setSalePrice(rs.getBigDecimal("sale_price"));
                product.setThumbnail(rs.getString("thumbnail"));
                product.setStatus(rs.getString("status"));
                product.setIsCombo(rs.getBoolean("is_combo"));
                product.setComboGroupId(rs.getInt("combo_group_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product; // Trả về product (hoặc null nếu không tìm thấy)
    }

    // set status khi sản phẩm hết hàng
    public void updateProductStatus(int productId, String status) {
        String query = "UPDATE products SET status = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
