/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import entity.Cart;
import entity.CartItem;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public Cart createCart(int userId) {
        Cart cart = new Cart();
        String sql = "INSERT INTO cart (user_id, created_at) VALUES (?, NOW())";
        try {
            PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setInt(1, userId);
            st.executeUpdate();

            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                cart.setId(rs.getInt(1));
                cart.setUserId(userId);
                cart.setCreatedAt(rs.getTimestamp("created_at"));
                cart.setItems(new ArrayList<>());
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error creating cart: " + e.getMessage());
        }
        return cart;
    }

    // Thêm phương thức tính tổng giá trị
    public double calculateTotalAmount(Cart cart) {
        double total = 0;
        if (cart != null && cart.getItems() != null) {
            for (CartItem item : cart.getItems()) {
                total += item.getProductPrice() * item.getQuantity();
            }
        }
        return total;
    }

    // Lấy thông tin Cart và CartItems
    public Cart getCartByUserId(int userId) {
        Cart cart = null;
        String sql = "SELECT * FROM cart WHERE user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cart = new Cart();
                cart.setId(rs.getInt("id"));
                cart.setUserId(rs.getInt("user_id"));
                cart.setCreatedAt(rs.getTimestamp("created_at"));
                // Lấy cart items và set vào cart
                cart.setItems(getCartItems(rs.getInt("id")));
            }
        } catch (SQLException e) {
            System.out.println("Error getting cart: " + e.getMessage());
        }
        return cart;
    }

    // Lấy chi tiết sản phẩm trong giỏ hàng
    private List<CartItem> getCartItems(int cartId) {
        List<CartItem> items = new ArrayList<>();
        String sql = "SELECT ci.*, pv.size_id, pv.color_id, "
                + "ps.size, pc.color, p.title, p.thumbnail, p.sale_price "
                + "FROM cart_items ci "
                + "INNER JOIN product_variants pv ON ci.variant_id = pv.id "
                + "INNER JOIN product_sizes ps ON pv.size_id = ps.id "
                + "INNER JOIN product_colors pc ON pv.color_id = pc.id "
                + "INNER JOIN products p ON ci.product_id = p.id "
                + "WHERE ci.cart_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem();
                item.setId(rs.getInt("id"));
                item.setCartId(cartId);
                item.setProductId(rs.getInt("product_id"));
                item.setVariantId(rs.getInt("variant_id"));
                item.setQuantity(rs.getInt("quantity"));

                // Set thông tin sản phẩm
                item.setProductTitle(rs.getString("title"));
                item.setProductThumbnail(rs.getString("thumbnail"));
                item.setProductPrice(rs.getDouble("sale_price"));
                item.setSize(rs.getString("size"));
                item.setColor(rs.getString("color"));

                items.add(item);
            }
        } catch (SQLException e) {
            System.out.println("Error getting cart items: " + e.getMessage());
        }
        return items;
    }

    // Cập nhật số lượng sản phẩm
    public boolean updateCartItemQuantity(int cartItemId, int quantity) {
        String sql = "UPDATE cart_items SET quantity = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, cartItemId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating quantity: " + e.getMessage());
            return false;
        }
    }

    // Xóa sản phẩm khỏi giỏ hàng  
    public boolean deleteCartItem(int cartItemId) {
        String sql = "DELETE FROM cart_items WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartItemId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting cart item: " + e.getMessage());
            return false;
        }
    }

    // Thêm sản phẩm vào giỏ hàng
    public boolean addCartItem(CartItem item) {
        String sql = "INSERT INTO cart_items (cart_id, product_id, variant_id, quantity) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, item.getCartId());
            st.setInt(2, item.getProductId());
            st.setInt(3, item.getVariantId());
            st.setInt(4, item.getQuantity());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error adding cart item: " + e.getMessage());
            return false;
        }
    }

}
