package dao;

import model.Transaksi;
import model.DetailTransaksi;
import util.KoneksiDB;
import java.sql.*;
import java.util.List;

public class TransaksiDAO {
    
    public boolean simpanTransaksi(Transaksi t, List<DetailTransaksi> listDetail) {
        Connection c = null;
        try {
            c = KoneksiDB.getConnection();
            c.setAutoCommit(false); // Memulai mode transaksi database

            // 1. Simpan Header Transaksi (Gunakan RETURNING id untuk PostgreSQL)
            String sqlT = "INSERT INTO transaksi (total_bayar, nominal_bayar, kembalian, id_user) VALUES (?, ?, ?, ?) RETURNING id";
            PreparedStatement psT = c.prepareStatement(sqlT);
            psT.setDouble(1, t.getTotalBayar());
            psT.setDouble(2, t.getNominalBayar());
            psT.setDouble(3, t.getKembalian());
            psT.setInt(4, t.getIdUser());
            
            ResultSet rs = psT.executeQuery();
            int idTransaksiBaru = 0;
            if (rs.next()) {
                idTransaksiBaru = rs.getInt(1);
            }

            // 2. Simpan Detail Transaksi (Looping item)
            String sqlD = "INSERT INTO detail_transaksi (id_transaksi, id_produk, jumlah, subtotal) VALUES (?, ?, ?, ?)";
            PreparedStatement psD = c.prepareStatement(sqlD);
            
            for (DetailTransaksi d : listDetail) {
                psD.setInt(1, idTransaksiBaru);
                psD.setInt(2, d.getIdProduk());
                psD.setInt(3, d.getJumlah());
                psD.setDouble(4, d.getSubtotal());
                psD.addBatch(); // Gunakan batch agar lebih cepat
            }
            psD.executeBatch();

            c.commit(); // Jika semua ok, simpan permanen
            return true;
        } catch (Exception e) {
            try { if (c != null) c.rollback(); } catch (SQLException se) {}
            e.printStackTrace();
            return false;
        } finally {
            try { if (c != null) c.close(); } catch (SQLException e) {}
        }
    }
}