package com.restoran.dao;

import com.restoran.model.Jenis;
import com.restoran.util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JenisDAO {
    
    // Mengambil semua data kategori untuk Dropdown di Modal Admin
    public List<Jenis> getAll() {
        List<Jenis> list = new ArrayList<>();
        String sql = "SELECT * FROM jenis ORDER BY nama ASC";
        
        try (Connection c = KoneksiDB.getConnection();
             Statement s = c.createStatement();
             ResultSet rs = s.executeQuery(sql)) {
            
            while (rs.next()) {
                Jenis j = new Jenis();
                j.setId(rs.getInt("id"));
                j.setNama(rs.getString("nama"));
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Mencari 1 data jenis berdasarkan ID (Berguna untuk relasi di Produk)
    public Jenis getById(int id) {
        Jenis j = null;
        String sql = "SELECT * FROM jenis WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                j = new Jenis();
                j.setId(rs.getInt("id"));
                j.setNama(rs.getString("nama"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return j;
    }
}