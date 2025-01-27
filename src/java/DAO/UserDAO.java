package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entity.User;
import Context.DBContext;
import utils.BCrypt;

/**
 *
 * @author nguye
 */
public class UserDAO extends DBContext {

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public User checkAccount(String username, String password) {
        String sql = "select * from users where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String storedPasswordHash = rs.getString("password_hash");
                if (BCrypt.checkpw(password, storedPasswordHash)) {
                    return new User(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            storedPasswordHash,
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(8),
                            rs.getString(9),
                            rs.getString(10),
                            rs.getString(11),
                            rs.getString(12)
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public User checkExistUsername(String username) {
        String sql = "select * from users\n"
                + "where Username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User checkExistEmail(String email) {
        String sql = "select * from users\n"
                + "where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User checkExistPhone(String mobile) {
        String sql = "select * from users\n"
                + "where mobile = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mobile);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public int insertUserWithPendingStatus(User user) {
        String sql = "INSERT INTO users (username, email, password_hash, full_name, gender, mobile, role, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, 'customer', 'pending')";
        try (PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPasswordHash());
            st.setString(4, user.getFullName());
            st.setString(5, user.getGender());
            st.setString(6, user.getMobile());

            int InsertedRow = st.executeUpdate();
            if (InsertedRow > 0) {
                try (ResultSet rs = st.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public boolean activateUser(int userId) {
        String sql = "UPDATE users SET status = 'active' WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12)
                );
            }
        } catch (SQLException e) {
            System.out.println("Error fetching user by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     * *****************************************************
     */
    /**
     * *****************************************************
     */
    
    private String generateUniqueUsername(String baseUsername) {
        String username = baseUsername;
        int counter = 1;
        UserDAO UserDAO = new UserDAO();
        while (UserDAO.checkExistUsername(username) != null) {
            username = baseUsername + counter;
            counter++;
        }

        return username;
    }
        
        public void insertGoogleUser(String googleId, String email, String fullName, String picture) {
        String sql = "INSERT INTO users (username, email, password_hash, full_name, gender, avatar, role, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            // Tách username từ @ trc email 
            String baseUsername = email.substring(0, email.indexOf('@'));
            String username = generateUniqueUsername(baseUsername);
            
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, BCrypt.hashpw(googleId, BCrypt.gensalt()));
            st.setString(4, fullName);
            st.setString(5, "other");
            st.setString(6, picture);
            st.setString(7, "customer");
            st.setString(8, "active");
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        UserDAO UserDAO = new UserDAO();
        System.out.println(UserDAO.checkExistUsername("1234"));
    }
}
