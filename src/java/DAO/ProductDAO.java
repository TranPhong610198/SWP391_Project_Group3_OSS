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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {

    private static final int RECORDS_PER_PAGE = 10;

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
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product getComboProduct(int productId) {
        String query = "SELECT * FROM products WHERE id = (SELECT combo_group_id FROM products WHERE id = ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
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
                return comboProduct;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
}
