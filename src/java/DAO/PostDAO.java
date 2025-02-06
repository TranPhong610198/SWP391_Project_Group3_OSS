package DAO;

import Context.DBContext;
import entity.Post;
import java.sql.*;
import java.util.*;

public class PostDAO extends DBContext {

    public List<Post> getPosts(String search, String category, String author, String status, int page, String sortField, boolean ascending) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE title LIKE ? ";

        // Lọc theo category
        if (category != null && !category.isEmpty()) {
            sql += "AND category = ? ";
        }

        // Lọc theo author
        if (author != null && !author.isEmpty()) {
            sql += "AND author = ? ";
        }

        // Lọc theo status
        if (status != null && !status.isEmpty()) {
            sql += "AND status = ? ";
        }

        // Thêm phần sắp xếp
        if (sortField != null && !sortField.isEmpty()) {
            sql += "ORDER BY " + sortField + (ascending ? " ASC" : " DESC");
        } else {
            sql += "ORDER BY updatedAt DESC";  // Sắp xếp mặc định theo ngày cập nhật
        }

        sql += " OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + (search != null ? search : "") + "%");

            int paramIndex = 2; // Dùng để trỏ đến tham số trong câu lệnh SQL

            if (category != null && !category.isEmpty()) {
                ps.setString(paramIndex++, category);
            }

            if (author != null && !author.isEmpty()) {
                ps.setString(paramIndex++, author);
            }

            if (status != null && !status.isEmpty()) {
                ps.setString(paramIndex++, status);
            }

            ps.setInt(paramIndex, (page - 1) * 5);

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
                    rs.getString("category"),
                    rs.getString("status") // Giả sử bảng 'posts' có cột 'status'
                );
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public int getTotalPosts(String search, String category, String author, String status) {
        int totalPosts = 0;
        String sql = "SELECT COUNT(*) FROM posts WHERE title LIKE ? ";

        // Lọc theo category
        if (category != null && !category.isEmpty()) {
            sql += "AND category = ? ";
        }

        // Lọc theo author
        if (author != null && !author.isEmpty()) {
            sql += "AND author = ? ";
        }

        // Lọc theo status
        if (status != null && !status.isEmpty()) {
            sql += "AND status = ? ";
        }

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, "%" + (search != null ? search : "") + "%");

            int paramIndex = 2; // Dùng để trỏ đến tham số trong câu lệnh SQL

            if (category != null && !category.isEmpty()) {
                ps.setString(paramIndex++, category);
            }

            if (author != null && !author.isEmpty()) {
                ps.setString(paramIndex++, author);
            }

            if (status != null && !status.isEmpty()) {
                ps.setString(paramIndex++, status);
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
                    rs.getString("category"),
                    rs.getString("status") // Giả sử bảng 'posts' có cột 'status'
                );
                latestPosts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return latestPosts;
    }

    // Phương thức ẩn/hiển thị bài viết
    public void updatePostStatus(int postId, String status) {
        String sql = "UPDATE posts SET status = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, postId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Phương thức chỉnh sửa bài viết
    public void editPost(Post post) {
        String sql = "UPDATE posts SET title = ?, thumbnail = ?, summary = ?, content = ?, author = ?, category = ? WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getThumbnail());
            ps.setString(3, post.getSummary());
            ps.setString(4, post.getContent());
            ps.setString(5, post.getAuthor());
            ps.setString(6, post.getCategory());
            ps.setInt(7, post.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
