package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entity.User;
import Context.DBContext;
import entity.UserAddress;
import java.util.ArrayList;
import java.util.List;
import utils.BCrypt;
import java.sql.Connection;

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
        String sql = "SELECT * FROM users WHERE username =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    String storedPasswordHash = rs.getString("password_hash");
                    if (BCrypt.checkpw(password, storedPasswordHash)) {
                        return new User(
                                rs.getInt("id"),
                                rs.getString("username"),
                                rs.getString("email"),
                                storedPasswordHash, // Important: Use the stored hash
                                rs.getString("full_name"),
                                rs.getString("gender"),
                                rs.getString("mobile"),
                                rs.getString("avatar"),
                                rs.getString("role"),
                                rs.getString("status"),
                                rs.getString("created_at"),
                                rs.getString("updated_at")
                        );
                    }
                }
            }
        } catch (SQLException e) {
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
        String sql = "SELECT * FROM users WHERE id =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getString("password_hash"),
                            rs.getString("full_name"),
                            rs.getString("gender"),
                            rs.getString("mobile"),
                            rs.getString("avatar"),
                            rs.getString("role"),
                            rs.getString("status"),
                            rs.getString("created_at"),
                            rs.getString("updated_at")
                    );
                }
            }
        } catch (SQLException e) {
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
    public String generateUniqueUsername(String baseUsername) {
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

    public boolean updatePassword(int userId, String newPassword) {
        String sql = "UPDATE users SET password_hash =?, updated_at = GETDATE() WHERE id =?"; // Or your database's equivalent for getting the current time
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(12)); // Hash the new password
            st.setString(1, hashedPassword);
            st.setInt(2, userId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE users SET full_name=?, gender=?, mobile=?, avatar=?, updated_at=GETDATE() WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getFullName());
            st.setString(2, user.getGender());
            st.setString(3, user.getMobile());
            st.setString(4, user.getAvatar());
            st.setInt(5, user.getId());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean updateProfile(User user) {
        String sql = "UPDATE users SET full_name=?, gender=?, mobile=?, updated_at=GETDATE()  WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getFullName());
            st.setString(2, user.getGender());
            st.setInt(4, user.getId());
            st.setString(3, user.getMobile());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public List<UserAddress> getUserAddresses(int userId) {
        List<UserAddress> addresses = new ArrayList<>();
        String sql = "SELECT * FROM user_addresses WHERE user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserAddress address = new UserAddress(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("recipient_name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getBoolean("is_default")
                );
                addresses.add(address);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return addresses;
    }

    public boolean addUserAddress(UserAddress address) {
        String sql = "INSERT INTO user_addresses (user_id, recipient_name, phone, address, is_default) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, address.getUserId());
            st.setString(2, address.getRecipientName());
            st.setString(3, address.getPhone());
            st.setString(4, address.getAddress());
            st.setBoolean(5, address.isDefault());
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean deleteUserAddress(int addressId, int userId) {
        String sql = "DELETE FROM user_addresses WHERE id = ? AND user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, addressId);
            st.setInt(2, userId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean setDefaultAddress(int addressId, int userId) {
        String clearDefaults = "UPDATE user_addresses SET is_default = 0 WHERE user_id = ?";
        String setDefault = "UPDATE user_addresses SET is_default = 1 WHERE id = ? AND user_id = ?";
        try (PreparedStatement st1 = connection.prepareStatement(clearDefaults); PreparedStatement st2 = connection.prepareStatement(setDefault)) {
            st1.setInt(1, userId);
            st1.executeUpdate();

            st2.setInt(1, addressId);
            st2.setInt(2, userId);
            return st2.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

public boolean updateAvatar(int userId, String avatarPath) {
    String sql = "UPDATE users SET avatar = ?, updated_at = GETDATE() WHERE id = ?;";
    try ( 
         PreparedStatement st = connection.prepareStatement(sql)) {
        st.setString(1, avatarPath);
        st.setInt(2, userId);
        return st.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();  // Ghi log lỗi thay vì chỉ in
        return false;
    }
}

///////VTD

    public List<User> getUsersByFilter(String sql, List<Object> params) {
        List<User> users = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            // Set parameters
            for (int i = 0; i < params.size(); i++) {
                st.setObject(i + 1, params.get(i));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password_hash"),
                        rs.getString("full_name"),
                        rs.getString("gender"),
                        rs.getString("mobile"),
                        rs.getString("avatar"),
                        rs.getString("role"),
                        rs.getString("status"),
                        rs.getString("created_at"),
                        rs.getString("updated_at")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getTotalFilteredRecords(String sql, List<Object> params) {
        // Chuyển đổi câu SQL để đếm tổng số bản ghi
        String countSql = sql.replaceFirst("SELECT \\*", "SELECT COUNT(*)");
        // Loại bỏ phần ORDER BY và OFFSET ... FETCH
        int orderByIndex = countSql.toLowerCase().indexOf("order by");
        if (orderByIndex != -1) {
            countSql = countSql.substring(0, orderByIndex);
        }
        int offsetIndex = countSql.toLowerCase().indexOf("offset");
        if (offsetIndex != -1) {
            countSql = countSql.substring(0, offsetIndex);
        }

        try (PreparedStatement st = connection.prepareStatement(countSql)) {
            // Set parameters (bỏ qua 2 tham số cuối cùng là offset và limit)
            for (int i = 0; i < params.size() - 2; i++) {
                st.setObject(i + 1, params.get(i));
            }

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int insertUser(User user) {
        String sql = "INSERT INTO users (username, email, password_hash, full_name, gender, mobile, role, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, 'active')";
        try (PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setString(1, user.getUsername());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPasswordHash());
            st.setString(4, user.getFullName());
            st.setString(5, user.getGender());
            st.setString(6, user.getMobile());
            st.setString(7, user.getRole().toLowerCase());

            int affectedRows = st.executeUpdate();
            if (affectedRows > 0) {
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
////////

    public static void main(String[] args) {
        UserDAO UserDAO = new UserDAO();
        System.out.println(UserDAO.checkExistUsername("1234"));
    }
}
