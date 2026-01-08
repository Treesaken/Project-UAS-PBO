/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author bilal
 */
public class KoneksiDB {
    public static Connection getConnection() {
        try {
            String url = "jdbc:postgresql://localhost:5432/dbrestoran";
            String user = "postgres";
            String pass = "0501";
            
            return DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Koneksi gagal: " + e.getMessage());
            return null;
        }
    }

    public static void main(String[] args) {
        if (KoneksiDB.getConnection() != null) {
            System.out.println("Koneksi berhasil!");
        }
    }
}
