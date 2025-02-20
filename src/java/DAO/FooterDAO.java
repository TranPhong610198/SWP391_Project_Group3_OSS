
package DAO;

import Context.DBContext;
import entity.Footer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FooterDAO extends DBContext {
    public List<Footer> getAllFooters(String searchValue, String statusFilter, String sortColumn, String sortOrder) {
        List<Footer> list = new ArrayList<>();
        String sql = "SELECT * FROM footer_settings WHERE 1=1";
        
        if (searchValue != null && !searchValue.trim().isEmpty()) {
            sql += " AND value LIKE ?";
        }
        
        if (statusFilter != null && !statusFilter.trim().isEmpty()) {
            sql += " AND status = ?";
        }
        
        if (sortColumn != null && !sortColumn.trim().isEmpty()) {
            sql += " ORDER BY " + sortColumn + " " + sortOrder;
        }
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int paramIndex = 1;
            
            if (searchValue != null && !searchValue.trim().isEmpty()) {
                ps.setString(paramIndex++, "%" + searchValue + "%");
            }
            
            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                ps.setString(paramIndex, statusFilter);
            }
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Footer(
                    rs.getInt("id"),
                    rs.getString("type"),
                    rs.getString("field_name"),
                    rs.getString("value"),
                    rs.getString("status"),
                    rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void updateStatus(int id, String status) {
        String sql = "UPDATE footer_settings SET status = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}