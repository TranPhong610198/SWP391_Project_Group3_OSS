/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import entity.FeedbackImage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nguye
 */
public class FeedbackImageDAO extends DBContext {

    public List<FeedbackImage> getImagesByFeedbackId(int feedbackId) {
        List<FeedbackImage> list = new ArrayList<>();
        String sql = "SELECT * FROM feedback_images WHERE feedback_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FeedbackImage image = new FeedbackImage();
                image.setId(rs.getInt("id"));
                image.setFeedbackId(rs.getInt("feedback_id"));
                image.setImageUrl(rs.getString("image_url"));
                image.setCreatedAt(rs.getDate("created_at"));
                list.add(image);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
