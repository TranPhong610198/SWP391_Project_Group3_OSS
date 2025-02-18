/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author nguye
 */
import Context.DBContext;
import entity.Coupon;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO extends DBContext {

    public List<Coupon> getCoupons(String searchCode, String filterType, String filterStatus, String sortField, String sortOrder, int page, int recordsPerPage) {
        List<Coupon> list = new ArrayList<>();
        String sql = "SELECT * FROM coupons WHERE 1=1";

        // Thêm điều kiện tìm kiếm và lọc
        if (searchCode != null && !searchCode.isEmpty()) {
            sql += " AND code LIKE ?";
        }
        if (filterType != null && !filterType.isEmpty()) {
            sql += " AND discount_type = ?";
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql += " AND status = ?";
        }

        // Thêm sắp xếp
        if (sortField != null && !sortField.isEmpty()) {
            sql += " ORDER BY " + sortField + (sortOrder.equals("desc") ? " DESC" : " ASC");
        } else {
            sql += " ORDER BY id"; // Sắp xếp mặc định
        }

        // Thêm phân trang
        sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            int parameterIndex = 1;
            if (searchCode != null && !searchCode.isEmpty()) {
                ps.setString(parameterIndex++, "%" + searchCode + "%");
            }
            if (filterType != null && !filterType.isEmpty()) {
                ps.setString(parameterIndex++, filterType);
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(parameterIndex++, filterStatus);
            }

            ps.setInt(parameterIndex++, (page - 1) * recordsPerPage);
            ps.setInt(parameterIndex++, recordsPerPage);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Coupon coupon = new Coupon();
                coupon.setId(rs.getInt("id"));
                coupon.setCode(rs.getString("code"));
                coupon.setDiscount_type(rs.getString("discount_type"));
                coupon.setDiscount_value(rs.getDouble("discount_value"));
                coupon.setMin_order_amount(rs.getDouble("min_order_amount"));
                coupon.setMax_discount(rs.getDouble("max_discount"));
                coupon.setUsage_limit(rs.getInt("usage_limit"));
                coupon.setUsed_count(rs.getInt("used_count"));
                coupon.setExpiry_date(rs.getDate("expiry_date"));
                coupon.setCreated_at(rs.getDate("created_at"));
                coupon.setStatus(rs.getString("status"));
                list.add(coupon);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalCoupons(String searchCode, String filterType, String filterStatus) {
        String sql = "SELECT COUNT(*) FROM coupons WHERE 1=1";

        // Thêm điều kiện tìm kiếm và lọc
        if (searchCode != null && !searchCode.isEmpty()) {
            sql += " AND code LIKE ?";
        }
        if (filterType != null && !filterType.isEmpty()) {
            sql += " AND discount_type = ?";
        }
        if (filterStatus != null && !filterStatus.isEmpty()) {
            sql += " AND status = ?";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            int parameterIndex = 1;
            if (searchCode != null && !searchCode.isEmpty()) {
                ps.setString(parameterIndex++, "%" + searchCode + "%");
            }
            if (filterType != null && !filterType.isEmpty()) {
                ps.setString(parameterIndex++, filterType);
            }
            if (filterStatus != null && !filterStatus.isEmpty()) {
                ps.setString(parameterIndex++, filterStatus);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public static void main(String[] args) {
        CouponDAO dao = new CouponDAO();
        List<Coupon> list = dao.getCoupons("", "", "", "", "", 1, 10);
        for (Coupon o : list) {
            System.out.println(o);
        }
    }
}
