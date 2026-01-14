package com.restoran.dao;

import com.restoran.model.Product;
import com.restoran.util.KoneksiDB; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // --- 1. READ (Ambil Semua Data untuk Tabel) ---
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "SELECT * FROM products ORDER BY id ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // --- 2. GET BY ID (Ambil 1 Data untuk Form Edit) ---
    public Product getProductById(int id) {
        Product p = null;
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "SELECT * FROM products WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id"));
                p.setCode(rs.getString("code"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    // --- 3. CREATE (Tambah Data Baru) ---
    // Method ini yang KEMARIN HILANG/ERROR
    public boolean addProduct(Product p) {
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "INSERT INTO products (code, name, category, price, stock, image) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getCode());
            ps.setString(2, p.getName());
            ps.setString(3, p.getCategory());
            ps.setDouble(4, p.getPrice());
            ps.setInt(5, p.getStock());
            ps.setString(6, p.getImage());
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // --- 4. UPDATE (Simpan Perubahan Edit) ---
    // Method ini yang KEMARIN HILANG/ERROR
    public boolean updateProduct(Product p) {
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "UPDATE products SET code=?, name=?, category=?, price=?, stock=?, image=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getCode());
            ps.setString(2, p.getName());
            ps.setString(3, p.getCategory());
            ps.setDouble(4, p.getPrice());
            ps.setInt(5, p.getStock());
            ps.setString(6, p.getImage());
            ps.setInt(7, p.getId()); // ID dipakai di WHERE
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // --- 5. DELETE (Hapus Data) ---
    public void deleteProduct(int id) {
        try {
            Connection conn = KoneksiDB.getConnection();
            String sql = "DELETE FROM products WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}