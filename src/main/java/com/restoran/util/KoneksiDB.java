package com.restoran.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KoneksiDB {
    
    private static Connection koneksi;

    public static Connection getConnection() {
        try {
            // PERBAIKAN UTAMA DI SINI:
            // Cek apakah koneksi null ATAU sudah tertutup (closed)
            if (koneksi == null || koneksi.isClosed()) {
                
                // 1. Register Driver
                try {
                    Class.forName("org.postgresql.Driver");
                } catch (ClassNotFoundException e) {
                    System.out.println("Driver PostgreSQL tidak ditemukan!");
                }
                
                // 2. Setup URL & Credential
                String url = "jdbc:postgresql://localhost:5432/db_restoran_kasir";
                String user = "postgres";
                String password = "0501"; // Pastikan ini benar
                
                // 3. Buat Koneksi Baru
                koneksi = DriverManager.getConnection(url, user, password);
            }
        } catch (SQLException e) {
            System.out.println("Gagal membuka koneksi: " + e.getMessage());
        }
        return koneksi;
    }
}