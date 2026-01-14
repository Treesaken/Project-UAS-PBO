package com.restoran.dao;

import com.restoran.model.User;
import com.restoran.util.KoneksiDB; // Import koneksi kamu
import java.sql.*;

public class UserDAO {
    
    // Method untuk validasi Login
    public User validate(String username, String password) {
        User user = null;
        try {
            // 1. Panggil Method dari Class KoneksiDB kamu
            Connection conn = KoneksiDB.getConnection();
            
            // 2. Query cek user
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                // 3. Jika ketemu, masukkan data db ke object User
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setFullname(rs.getString("fullname")); // Pastikan di DB kolomnya fullname
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}