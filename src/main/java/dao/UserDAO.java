package dao;

import model.User;
import util.KoneksiDB;
import java.sql.*;

public class UserDAO {
    
    // Fitur LOGIN: Mengecek kecocokan user di database
    public User login(String username, String password) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        
        try (Connection c = KoneksiDB.getConnection(); 
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // Fitur REGISTER: Menambah staf baru ke database
    public boolean register(User user) {
        String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
        try (Connection c = KoneksiDB.getConnection(); 
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getRole());
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}