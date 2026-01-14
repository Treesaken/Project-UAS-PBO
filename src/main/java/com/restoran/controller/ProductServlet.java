package com.restoran.controller;

import com.restoran.dao.ProductDAO;
import com.restoran.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductServlet", urlPatterns = {"/admin/ProductServlet"})
public class ProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1. Ambil data dari Form JSP
            String idStr = request.getParameter("id"); // ID (kosong jika Tambah, ada isi jika Edit)
            String code = request.getParameter("code");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");
            String stockStr = request.getParameter("stock");
            String image = request.getParameter("image");

            // Konversi tipe data (String ke Double/Int)
            double price = (priceStr != null && !priceStr.isEmpty()) ? Double.parseDouble(priceStr) : 0;
            int stock = (stockStr != null && !stockStr.isEmpty()) ? Integer.parseInt(stockStr) : 0;

            // Masukkan ke Objek Product
            Product p = new Product();
            p.setCode(code);
            p.setName(name);
            p.setCategory(category);
            p.setPrice(price);
            p.setStock(stock);
            p.setImage(image);

            ProductDAO dao = new ProductDAO();

            // 2. Cek Mode: Tambah atau Edit?
            if (idStr == null || idStr.isEmpty()) {
                // Jika ID kosong, berarti MODE TAMBAH
                dao.addProduct(p);
            } else {
                // Jika ID ada, berarti MODE EDIT
                p.setId(Integer.parseInt(idStr));
                dao.updateProduct(p);
            }

            // 3. Redirect kembali ke tabel
            response.sendRedirect("menu_list.jsp");
            
        } catch (NumberFormatException e) {
            // Jaga-jaga jika input harga bukan angka
            e.printStackTrace();
            response.sendRedirect("menu_form.jsp?error=InputSalah");
        }
    }
}