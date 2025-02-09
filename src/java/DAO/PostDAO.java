//package DAO;
//
//import DAO.PostDAO;
//import Context.DBContext;
//import entity.Post;
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class PostDAO {
//    private Connection conn;
//    private PreparedStatement ps;
//    private ResultSet rs;
//
//    public List<Post> getAllPosts(String search, String category, String author, String status, 
//                                String sortBy, String sortOrder, int page, int pageSize) {
//        List<Post> list = new ArrayList<>();
//        String query = "SELECT p.*, c.name as category_name, u.full_name as author_name " +
//                      "FROM posts p " +
//                      "JOIN categories c ON p.category_id = c.id " +
//                      "JOIN users u ON p.author_id = u.id " +
//                      "WHERE 1=1 ";
//        
//        if (search != null && !search.trim().isEmpty()) {
//            query += "AND p.title LIKE ? ";
//        }
//        if (category != null && !category.trim().isEmpty()) {
//            query += "AND c.name LIKE ? ";
//        }
//        if (author != null && !author.trim().isEmpty()) {
//            query += "AND u.full_name LIKE ? ";
//        }
//        if (status != null && !status.trim().isEmpty()) {
//            query += "AND p.status = ? ";
//        }
//        
//        // Add sorting
//        if (sortBy != null && !sortBy.trim().isEmpty()) {
//            query += "ORDER BY " + sortBy + " " + (sortOrder != null ? sortOrder : "ASC");
//        } else {
//            query += "ORDER BY p.created_at DESC";
//        }
//        
//        // Add pagination
//        query += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
//        
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            
//            int paramIndex = 1;
//            if (search != null && !search.trim().isEmpty()) {
//                ps.setString(paramIndex++, "%" + search + "%");
//            }
//            if (category != null && !category.trim().isEmpty()) {
//                ps.setString(paramIndex++, "%" + category + "%");
//            }
//            if (author != null && !author.trim().isEmpty()) {
//                ps.setString(paramIndex++, "%" + author + "%");
//            }
//            if (status != null && !status.trim().isEmpty()) {
//                ps.setString(paramIndex++, status);
//            }
//            
//            ps.setInt(paramIndex++, (page - 1) * pageSize);
//            ps.setInt(paramIndex, pageSize);
//            
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Post post = new Post();
//                post.setId(rs.getInt("id"));
//                post.setTitle(rs.getString("title"));
//                post.setThumbnail(rs.getString("thumbnail"));
//                post.setCategoryId(rs.getInt("category_id"));
//                post.setCategoryName(rs.getString("category_name"));
//                post.setSummary(rs.getString("summary"));
//                post.setContent(rs.getString("content"));
//                post.setAuthorId(rs.getInt("author_id"));
//                post.setAuthorName(rs.getString("author_name"));
//                post.setIsFeatured(rs.getBoolean("is_featured"));
//                post.setStatus(rs.getString("status"));
//                post.setCreatedAt(rs.getTimestamp("created_at"));
//                post.setUpdatedAt(rs.getTimestamp("updated_at"));
//                list.add(post);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeResources();
//        }
//        return list;
//    }
//
//    public int getTotalPosts(String search, String category, String author, String status) {
//        String query = "SELECT COUNT(*) FROM posts p " +
//                      "JOIN categories c ON p.category_id = c.id " +
//                      "JOIN users u ON p.author_id = u.id " +
//                      "WHERE 1=1 ";
//        
//        if (search != null && !search.trim().isEmpty()) {
//            query += "AND p.title LIKE ? ";
//        }
//        if (category != null && !category.trim().isEmpty()) {
//            query += "AND c.name LIKE ? ";
//        }
//        if (author != null && !author.trim().isEmpty()) {
//            query += "AND u.full_name LIKE ? ";
//        }
//        if (status != null && !status.trim().isEmpty()) {
//            query += "AND p.status = ? ";
//        }
//        
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            
//            int paramIndex = 1;
//            if (search != null && !search.trim().isEmpty()) {
//                ps.setString(paramIndex++, "%" + search + "%");
//            }
//            if (category != null && !category.trim().isEmpty()) {
//                ps.setString(paramIndex++, "%" + category + "%");
//            }
//            if (author != null && !author.trim().isEmpty()) {
//                ps.setString(paramIndex++, "%" + author + "%");
//            }
//            if (status != null && !status.trim().isEmpty()) {
//                ps.setString(paramIndex, status);
//            }
//            
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                return rs.getInt(1);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeResources();
//        }
//        return 0;
//    }
//
//    public Post getPostById(int id) {
//        String query = "SELECT p.*, c.name as category_name, u.full_name as author_name " +
//                      "FROM posts p " +
//                      "JOIN categories c ON p.category_id = c.id " +
//                      "JOIN users u ON p.author_id = u.id " +
//                      "WHERE p.id = ?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            
//            if (rs.next()) {
//                Post post = new Post();
//                post.setId(rs.getInt("id"));
//                post.setTitle(rs.getString("title"));
//                post.setThumbnail(rs.getString("thumbnail"));
//                post.setCategoryId(rs.getInt("category_id"));
//                post.setCategoryName(rs.getString("category_name"));
//                post.setSummary(rs.getString("summary"));
//                post.setContent(rs.getString("content"));
//                post.setAuthorId(rs.getInt("author_id"));
//                post.setAuthorName(rs.getString("author_name"));
//                post.setIsFeatured(rs.getBoolean("is_featured"));
//                post.setStatus(rs.getString("status"));
//                post.setCreatedAt(rs.getTimestamp("created_at"));
//                post.setUpdatedAt(rs.getTimestamp("updated_at"));
//                return post;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeResources();
//        }
//        return null;
//    }
//
//    public boolean updatePost(Post post) {
//        String query = "UPDATE posts SET title=?, thumbnail=?, category_id=?, summary=?, " +
//                      "content=?, is_featured=?, status=? WHERE id=?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, post.getTitle());
//            ps.setString(2, post.getThumbnail());
//            ps.setInt(3, post.getCategoryId());
//            ps.setString(4, post.getSummary());
//            ps.setString(5, post.getContent());
//            ps.setBoolean(6, post.getIsFeatured());
//            ps.setString(7, post.getStatus());
//            ps.setInt(8, post.getId());
//            
//            return ps.executeUpdate() > 0;
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeResources();
//        }
//        return false;
//    }
//
//    public boolean insertPost(Post post) {
//        String query = "INSERT INTO posts (title, thumbnail, category_id, summary, content, " +
//                      "author_id, is_featured, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, post.getTitle());
//            ps.setString(2, post.getThumbnail());
//            ps.setInt(3, post.getCategoryId());
//            ps.setString(4, post.getSummary());
//            ps.setString(5, post.getContent());
//            ps.setInt(6, post.getAuthorId());
//            ps.setBoolean(7, post.getIsFeatured());
//            ps.setString(8, post.getStatus());
//            
//            return ps.executeUpdate() > 0;
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeResources();
//        }
//        return false;
//    }
//
//    public List<Post> getRelatedPosts(int currentPostId, int categoryId, int limit) {
//        List<Post> list = new ArrayList<>();
//        String query = "SELECT TOP ? p.*, c.name as category_name, u.full_name as author_name " +
//                      "FROM posts p " +
//                      "JOIN categories c ON p.category_id = c.id " +
//                      "JOIN users u ON p.author_id = u.id " +
//                      "WHERE p.category_id = ? AND p.id != ? AND p.status = 'published' " +
//                      "ORDER BY p.created_at DESC";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, limit);
//            ps.setInt(2, categoryId);
//            ps.setInt(3, currentPostId);
//            rs = ps.executeQuery();
//            
//            while (rs.next()) {
//                Post post = new Post();
//                post.setId(rs.getInt("id"));
//                post.setTitle(rs.getString("title"));
//                post.setThumbnail(rs.getString("thumbnail"));
//                post.setCategoryId(rs.getInt("category_id"));
//                post.setCategoryName(rs.getString("category_name"));
//                post.setSummary(rs.getString("summary"));
//                post.setAuthorId(rs.getInt("author_id"));
//                post.setAuthorName(rs.getString("author_name"));
//                post.setCreatedAt(rs.getTimestamp("created_at"));
//                list.add(post);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeResources();
//        }
//        return list;
//    }
//
//    private void closeResources() {
//        try {
//            if (rs != null) rs.close();
//            if (ps != null) ps.close();
//            if (conn != null) conn.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//    
//    public boolean deletePost(int postId) throws SQLException {
//        String sql = "DELETE FROM posts WHERE id = ?";
//        
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, postId);
//            
//            int rowsAffected = ps.executeUpdate();
//            return rowsAffected > 0;
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new SQLException(e);
//        } finally {
//            closeResources();
//        }
//    }
//
//
//}