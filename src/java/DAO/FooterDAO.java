package DAO;

import entity.Footer;
import Context.DBContext;
import java.sql.*;
import java.util.*;

public class FooterDAO extends DBContext {
    public List<Footer> getAllFooters(String searchValue, String status, String sortBy, String sortOrder) {
        List<Footer> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM footer_settings WHERE 1=1";
            
            if (searchValue != null && !searchValue.trim().isEmpty()) {
                sql += " AND value LIKE ?";
            }
            
            if (status != null && !status.trim().isEmpty()) {
                sql += " AND status = ?";
            }
            
            if (sortBy != null && !sortBy.trim().isEmpty()) {
                // Convert camelCase to snake_case for database column names
                String dbColumn = sortBy.equals("fieldName") ? "field_name" : sortBy;
                sql += " ORDER BY " + dbColumn + " " + sortOrder;
            }
            
            PreparedStatement st = connection.prepareStatement(sql);
            
            int paramIndex = 1;
            if (searchValue != null && !searchValue.trim().isEmpty()) {
                st.setString(paramIndex++, "%" + searchValue + "%");
            }
            if (status != null && !status.trim().isEmpty()) {
                st.setString(paramIndex, status);
            }
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Footer footer = new Footer(
                    rs.getInt("id"),
                    rs.getString("type"),
                    rs.getString("field_name"),
                    rs.getString("value"),
                    
                    rs.getString("status")
                );
                list.add(footer);
            }
        } catch (SQLException e) {
            System.out.println("Error getting footer list: " + e.getMessage());
        }
        return list;
    }
    
    public boolean updateFooterStatus(int id, String status) {
        try {
            String sql = "UPDATE footer_settings SET status = ? WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error updating footer status: " + e.getMessage());
            return false;
        }
    }
}