package DAO;

import Context.DBContext;
import entity.Post;
import java.sql.*;
import java.util.*;

public class PostDAO extends DBContext {

    public List<Post> getPosts(String search, String category, int page) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE title LIKE ? ";

        if (category != null && !category.isEmpty()) {
            sql += "AND category = ? ";
        }

        sql += "ORDER BY updatedAt DESC OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + (search != null ? search : "") + "%");

            if (category != null && !category.isEmpty()) {
                ps.setString(2, category);
                ps.setInt(3, (page - 1) * 5);
            } else {
                ps.setInt(2, (page - 1) * 5);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("thumbnail"),
                    rs.getString("summary"),
                    rs.getString("content"),
                    rs.getString("author"),
                    rs.getTimestamp("updatedAt"),
                    rs.getString("category")
                );
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public int getTotalPosts(String search, String category) {
        int totalPosts = 0;
        String sql = "SELECT COUNT(*) FROM posts WHERE title LIKE ? ";

        if (category != null && !category.isEmpty()) {
            sql += "AND category = ? ";
        }

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + (search != null ? search : "") + "%");

            if (category != null && !category.isEmpty()) {
                ps.setString(2, category);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalPosts = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPosts;
    }

    public List<Post> getLatestPosts() {
        List<Post> latestPosts = new ArrayList<>();
        String sql = "SELECT * FROM posts ORDER BY updatedAt DESC LIMIT 5";

        try (Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Post post = new Post(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("thumbnail"),
                    rs.getString("summary"),
                    rs.getString("content"),
                    rs.getString("author"),
                    rs.getTimestamp("updatedAt"),
                    rs.getString("category")
                );
                latestPosts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return latestPosts;
    }
}
