package dao;

import model.Produk;
import model.Jenis;
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdukDAO {

    // 1. Menampilkan Semua Data Produk (Read) [cite: 582-588]
    public List<Produk> getAll() {
        List<Produk> list = new ArrayList<>();
        String sql = "SELECT p.*, j.nama AS namajenis FROM produk p "
                   + "LEFT JOIN jenis j ON p.idjenis = j.id ORDER BY p.id DESC";
        
        try (Connection c = KoneksiDB.getConnection();
             Statement s = c.createStatement();
             ResultSet r = s.executeQuery(sql)) {
            
            while (r.next()) {
                Produk p = new Produk();
                p.setId(r.getInt("id"));
                p.setKode(r.getString("kode"));
                p.setNama(r.getString("nama"));
                p.setIdjenis(r.getInt("idjenis"));
                p.setKondisi(r.getString("kondisi"));
                p.setHarga(r.getDouble("harga"));
                p.setStok(r.getInt("stok"));
                
                // Set Relasi Jenis [cite: 599-601]
                Jenis j = new Jenis();
                j.setId(r.getInt("idjenis"));
                j.setNama(r.getString("namajenis"));
                p.setJenis(j);
                
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Simpan Data Produk (Create) [cite: 613-617]
    public void simpan(Produk obj) {
        String sql = "INSERT INTO produk (kode, nama, idjenis, kondisi, harga, stok) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = KoneksiDB.getConnection().prepareStatement(sql)) {
            ps.setString(1, obj.getKode());
            ps.setString(2, obj.getNama());
            ps.setInt(3, obj.getIdjenis());
            ps.setString(4, obj.getKondisi());
            ps.setDouble(5, obj.getHarga());
            ps.setInt(6, obj.getStok());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 3. Ubah Data Produk (Update) [cite: 633-635]
    public void ubah(Produk obj) {
        String sql = "UPDATE produk SET kode=?, nama=?, idjenis=?, kondisi=?, harga=?, stok=? WHERE id=?";
        try (PreparedStatement ps = KoneksiDB.getConnection().prepareStatement(sql)) {
            ps.setString(1, obj.getKode());
            ps.setString(2, obj.getNama());
            ps.setInt(3, obj.getIdjenis());
            ps.setString(4, obj.getKondisi());
            ps.setDouble(5, obj.getHarga());
            ps.setInt(6, obj.getStok());
            ps.setInt(7, obj.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 4. Hapus Data Produk (Delete) [cite: 647, 652-653]
    public void hapus(int id) {
        String sql = "DELETE FROM produk WHERE id=?";
        try (PreparedStatement ps = KoneksiDB.getConnection().prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}