/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import java.sql.*;

/**
 *
 * @author tphon
 */
public class CartDAO extends DBContext {

    public boolean deleteProductFromCart(int productId) {
        String query = "DELETE FROM cart_items WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            return ps.executeUpdate() > 0; // Trả về true nếu có ít nhất 1 dòng bị xóa
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
