package com.restoran.dao;

import com.restoran.model.Transaction;
import com.restoran.model.TransactionDetail;
import com.restoran.util.KoneksiDB;
import java.sql.*;

public class TransactionDAO {

    public boolean saveTransaction(Transaction trans) {
        Connection conn = null;
        PreparedStatement psHeader = null;
        PreparedStatement psDetail = null;
        boolean berhasil = false;

        try {
            conn = KoneksiDB.getConnection();
            
            // 1. Matikan Auto Commit (Mulai Transaksi Manual)
            conn.setAutoCommit(false);

            // 2. Simpan HEADER (Tabel transactions)
            String sqlHeader = "INSERT INTO transactions (user_id, total_amount) VALUES (?, ?)";
            // RETURN_GENERATED_KEYS agar kita bisa tahu ID transaksi nomor berapa yang baru dibuat
            psHeader = conn.prepareStatement(sqlHeader, Statement.RETURN_GENERATED_KEYS);
            psHeader.setInt(1, trans.getUserId());
            psHeader.setDouble(2, trans.getTotalAmount());
            psHeader.executeUpdate();

            // Ambil ID Transaksi yang baru saja dibuat
            ResultSet rs = psHeader.getGeneratedKeys();
            int transId = 0;
            if (rs.next()) {
                transId = rs.getInt(1);
            }

            // 3. Simpan DETAILS (Tabel transaction_details)
            String sqlDetail = "INSERT INTO transaction_details (transaction_id, product_id, qty, subtotal) VALUES (?, ?, ?, ?)";
            psDetail = conn.prepareStatement(sqlDetail);

            for (TransactionDetail detail : trans.getDetails()) {
                psDetail.setInt(1, transId); // Pakai ID dari langkah 2
                psDetail.setInt(2, detail.getProductId());
                psDetail.setInt(3, detail.getQty());
                psDetail.setDouble(4, detail.getSubtotal());
                
                psDetail.addBatch(); // Kumpulkan dulu datanya
            }
            
            psDetail.executeBatch(); // Eksekusi sekaligus

            // 4. Jika semua lancar, COMMIT (Simpan permanen)
            conn.commit();
            berhasil = true;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback(); // BATALKAN SEMUA jika ada error
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                if (conn != null) conn.setAutoCommit(true); // Kembalikan ke mode normal
            } catch (Exception e) {}
        }
        
        return berhasil;
    }
    
    public java.util.List<Transaction> getAllTransactions() {
        java.util.List<Transaction> list = new java.util.ArrayList<>();
        try {
            Connection conn = KoneksiDB.getConnection();
            // Join tabel transactions dengan users untuk dapat nama kasir
            String sql = "SELECT t.*, u.fullname FROM transactions t " +
                         "JOIN users u ON t.user_id = u.id " +
                         "ORDER BY t.transaction_date DESC"; // Urutkan dari yang terbaru
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transaction t = new Transaction();
                t.setId(rs.getInt("id"));
                t.setUserId(rs.getInt("user_id"));
                t.setDate(rs.getTimestamp("transaction_date"));
                t.setTotalAmount(rs.getDouble("total_amount"));
                
                // Ambil nama kasir dari hasil JOIN tadi
                t.setCashierName(rs.getString("fullname")); 
                
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}