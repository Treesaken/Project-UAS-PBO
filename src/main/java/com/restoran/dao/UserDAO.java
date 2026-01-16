package com.restoran.dao;

import com.restoran.model.User;
import com.restoran.util.KoneksiDB;
import java.util.List;
import java.util.ArrayList;
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
    
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "SELECT * FROM users ORDER BY id ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password")); // Hati-hati menampilkan ini
                u.setFullname(rs.getString("fullname"));
                u.setRole(rs.getString("role"));
                list.add(u);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // --- 2. READ BY ID: Ambil 1 User untuk Edit ---
    public User getUserById(int id) {
        User u = null;
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "SELECT * FROM users WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFullname(rs.getString("fullname"));
                u.setRole(rs.getString("role"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return u;
    }

    // --- 3. CREATE: Tambah User Baru ---
    public boolean addUser(User u) {
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "INSERT INTO users (username, password, fullname, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullname());
            ps.setString(4, u.getRole());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }

    // --- 4. UPDATE: Edit User ---
    public boolean updateUser(User u) {
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "UPDATE users SET username=?, password=?, fullname=?, role=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullname());
            ps.setString(4, u.getRole());
            ps.setInt(5, u.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }

    // --- 5. DELETE: Hapus User ---
    public void deleteUser(int id) {
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "DELETE FROM users WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}