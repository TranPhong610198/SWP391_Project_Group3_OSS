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
                product.setOriginalPrice(rs.getDouble("original_price"));
                product.setSalePrice(rs.getDouble("sale_price"));
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
                comboProduct.setOriginalPrice(rs.getDouble("original_price"));
                comboProduct.setSalePrice(rs.getDouble("sale_price"));
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

    public boolean addProduct(Product product, List<String> subImages) {
        String insertProduct = "INSERT INTO products (title, category_id, description, original_price, sale_price, thumbnail, is_combo, combo_group_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(insertProduct, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, product.getTitle());
            ps.setInt(2, product.getCategoryId());
            ps.setString(3, product.getDescription());
            ps.setDouble(4, product.getOriginalPrice());
            ps.setDouble(5, product.getSalePrice());
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
    public boolean canDeleteProduct(int productId) {
        String query = "SELECT COUNT(*) FROM order_items oi "
                + "JOIN orders o ON oi.order_id = o.id "
                + "WHERE oi.product_id = ? AND o.status IN ('pending', 'processing', 'shipping')";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) == 0; // Nếu không có đơn hàng đang xử lý, có thể xóa
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

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
}
