package DAO;

import Context.DBContext;
import entity.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SliderDAO extends DBContext {

    public List<Slider> getAllSliders(int page, int pageSize, String search, String status) {
        List<Slider> sliders = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM sliders WHERE 1=1");
        List<Object> params = new ArrayList<>();
        
        if (search != null && !search.isEmpty()) {
            sql.append(" AND title LIKE ?");
            params.add("%" + search + "%");
        }
        
        if (status != null && !status.isEmpty()) {
            sql.append(" AND status = ?");
            params.add(status);
        }
        
        sql.append(" ORDER BY created_at DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        params.add((page - 1) * pageSize);
        params.add(pageSize);
        
        try (PreparedStatement st = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                if (params.get(i) instanceof Integer) {
                    st.setInt(i + 1, (Integer) params.get(i));
                } else {
                    st.setString(i + 1, (String) params.get(i));
                }
            }
            
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    sliders.add(new Slider(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("image"),
                        rs.getString("backlink"),
                        rs.getString("status"),
                        rs.getString("note"),
                        rs.getDate("created_at"),
                        rs.getDate("updated_at")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public Slider getSliderById(int id) {
        String sql = "SELECT * FROM sliders WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new Slider(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("image"),
                        rs.getString("backlink"),
                        rs.getString("status"),
                        rs.getString("note"),
                        rs.getDate("created_at"),
                        rs.getDate("updated_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addSlider(Slider slider) {
        String sql = "INSERT INTO sliders (title, image, backlink, status, note, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, slider.getTitle());
            st.setString(2, slider.getImage());
            st.setString(3, slider.getBacklink());
            st.setString(4, slider.getStatus());
            st.setString(5, slider.getNote());
            st.setDate(6, slider.getCreatedAt());
            st.setDate(7, slider.getUpdatedAt());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateSlider(Slider slider) {
        String sql = "UPDATE sliders SET title = ?, image = ?, backlink = ?, status = ?, note = ?, updated_at = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, slider.getTitle());
            st.setString(2, slider.getImage());
            st.setString(3, slider.getBacklink());
            st.setString(4, slider.getStatus());
            st.setString(5, slider.getNote());
            st.setDate(6, slider.getUpdatedAt());
            st.setInt(7, slider.getId());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteSlider(int id) {
        String sql = "DELETE FROM sliders WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
