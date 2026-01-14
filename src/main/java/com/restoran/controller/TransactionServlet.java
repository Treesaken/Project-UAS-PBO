package com.restoran.controller;

import com.restoran.dao.ProductDAO;
import com.restoran.dao.TransactionDAO;
import com.restoran.model.Product;
import com.restoran.model.Transaction;
import com.restoran.model.TransactionDetail;
import com.restoran.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "TransactionServlet", urlPatterns = {"/admin/TransactionServlet"})
public class TransactionServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        
        // 1. Ambil atau Buat Keranjang Belanja (Disimpan di Session)
        Transaction cart = (Transaction) session.getAttribute("cart");
        if (cart == null) {
            cart = new Transaction();
            session.setAttribute("cart", cart);
        }

        // 2. Cek Aksi User (Tambah / Checkout / Batal)
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            // --- LOGIKA TAMBAH BARANG ---
            try {
                int productId = Integer.parseInt(request.getParameter("productId"));
                int qty = Integer.parseInt(request.getParameter("qty"));
                
                // Ambil data produk dari database (untuk tahu harganya)
                ProductDAO pDao = new ProductDAO();
                Product p = pDao.getProductById(productId);
                
                if (p != null) {
                    // Buat detail item
                    TransactionDetail detail = new TransactionDetail();
                    detail.setProductId(p.getId());
                    detail.setProductName(p.getName()); // Simpan nama buat tampilan
                    detail.setQty(qty);
                    detail.setSubtotal(p.getPrice() * qty);
                    
                    // Masukkan ke keranjang
                    cart.addDetail(detail);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("transaksi.jsp");

        } else if ("clear".equals(action)) {
            // --- LOGIKA KOSONGKAN KERANJANG ---
            session.removeAttribute("cart");
            response.sendRedirect("transaksi.jsp");

        } else if ("checkout".equals(action)) {
            // --- LOGIKA BAYAR (SIMPAN KE DB) ---
            if (cart.getDetails().isEmpty()) {
                response.sendRedirect("transaksi.jsp?error=KeranjangKosong");
                return;
            }

            // Lengkapi data Header Transaksi
            cart.setUserId(user.getId()); // Siapa kasirnya
            
            // Panggil DAO untuk simpan
            TransactionDAO tDao = new TransactionDAO();
            boolean sukses = tDao.saveTransaction(cart);
            
            if (sukses) {
                session.removeAttribute("cart"); // Hapus keranjang kalau sukses
                response.sendRedirect("transaksi.jsp?status=sukses");
            } else {
                response.sendRedirect("transaksi.jsp?status=gagal");
            }
        } else {
            response.sendRedirect("transaksi.jsp");
        }
    }
}