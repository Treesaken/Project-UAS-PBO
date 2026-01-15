package com.restoran.dao;

import com.restoran.model.User;
import com.restoran.util.KoneksiDB; // Import koneksi kamu
import java.sql.*;

public class UserDAO {
    
    public User validate(String username, String password) {
        User user = null;
        try {
            Connection conn = KoneksiDB.getConnection();
            
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFullname(rs.getString("fullname"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}