/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import entity.Token;
import java.sql.ResultSet;
import Context.DBContext;
import java.time.LocalDateTime;

public class TokenDAO extends DBContext {

    public boolean insertTokenForget(Token token) {
        invalidateUserTokens(token.getUserId()); //vô hiệu quá các token cũ cùng userID

        String sql = "INSERT INTO [dbo].[tokenPassword] "
                + "([token], [expiryTime], [isUsed], [UserID]) "
                + "VALUES (?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token.getToken());
            // Chuyển đổi trực tiếp từ LocalDateTime sang java.sql.Timestamp
            ps.setTimestamp(2, java.sql.Timestamp.valueOf(token.getExpiryTime()));
            ps.setBoolean(3, token.isIsUsed());
            ps.setInt(4, token.getUserId());

            int result = ps.executeUpdate();
            if (result > 0) {
                System.out.println("Token inserted successfully");
                return true;
            } else {
                System.out.println("No rows were inserted");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Error inserting token: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public void invalidateUserTokens(int userId) {
        String sql = "UPDATE [dbo].[tokenPassword] SET [isUsed] = 1 "
                + "WHERE [UserID] = ? AND [isUsed] = 0";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error invalidating previous tokens: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public Token getTokenPassword(String token) {
        String sql = "Select * from [tokenPassword] where token = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, token);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Token(
                        rs.getInt("id"),
                        rs.getInt("userId"),
                        rs.getBoolean("isUsed"),
                        rs.getString("token"),
                        rs.getTimestamp("expiryTime").toLocalDateTime()
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateStatus(Token token) {
        System.out.println("token = " + token);
        String sql = "UPDATE [dbo].[tokenPassword]\n"
                + "   SET [isUsed] = ?\n"
                + " WHERE token = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, token.isIsUsed());
            st.setString(2, token.getToken());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
