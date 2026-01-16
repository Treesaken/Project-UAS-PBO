package com.restoran.controller;

import com.restoran.dao.ProductDAO;
import com.restoran.model.Product;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig; // Wajib import ini
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part; // Wajib import ini

@WebServlet(name = "ProductServlet", urlPatterns = {"/admin/ProductServlet"})
@MultipartConfig // ANOTASI PENTING: Supaya bisa terima File Upload
public class ProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Ambil data teks biasa
            String idStr = request.getParameter("id");
            String code = request.getParameter("code");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");
            String stockStr = request.getParameter("stock");
            
            // Konversi angka
            double price = (priceStr != null && !priceStr.isEmpty()) ? Double.parseDouble(priceStr) : 0;
            int stock = (stockStr != null && !stockStr.isEmpty()) ? Integer.parseInt(stockStr) : 0;

            // --- 2. LOGIKA UPLOAD GAMBAR ---
            String imageFileName = request.getParameter("oldImage"); // Default pakai gambar lama
            
            // Ambil file yang diupload user
            Part filePart = request.getPart("image"); 
            
            // Cek apakah user mengupload file baru?
            if (filePart != null && filePart.getSize() > 0) {
                // Ambil nama file asli (misal: sate.jpg)
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                
                // Pastikan nama file unik (opsional, biar ga bentrok)
                // Bisa pakai: String uniqueName = System.currentTimeMillis() + "_" + fileName;
                
                // Tentukan lokasi folder penyimpanan (assets/images)
                String uploadPath = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "images";
                
                // Buat folder jika belum ada
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                
                // Simpan file ke server
                filePart.write(uploadPath + File.separator + fileName);
                
                // Update nama file database
                imageFileName = fileName;
            }
            // -------------------------------

            // 3. Masukkan ke Objek Product
            Product p = new Product();
            p.setCode(code);
            p.setName(name);
            p.setCategory(category);
            p.setPrice(price);
            p.setStock(stock);
            p.setImage(imageFileName); // Pakai nama file hasil upload/lama

            ProductDAO dao = new ProductDAO();

            // 4. Cek Mode: Tambah atau Edit?
            if (idStr == null || idStr.isEmpty()) {
                dao.addProduct(p);
            } else {
                p.setId(Integer.parseInt(idStr));
                dao.updateProduct(p);
            }

            response.sendRedirect("menu_list.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("menu_form.jsp?error=GagalSimpan");
        }
    }
}