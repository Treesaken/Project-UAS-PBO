package com.restoran.controller;
import com.restoran.dao.ProdukDAO;
import com.restoran.model.Produk;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "ProdukServlet", urlPatterns = {"/ProdukServlet"})
public class ProdukServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProdukDAO dao = new ProdukDAO();
        String proses = request.getParameter("proses");

        if ("Hapus".equalsIgnoreCase(proses)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.hapus(id);
        } else {
            Produk p = new Produk();
            p.setKode(request.getParameter("kode"));
            p.setNama(request.getParameter("nama"));
            p.setIdjenis(Integer.parseInt(request.getParameter("jenis")));
            p.setKondisi(request.getParameter("kondisi"));
            p.setHarga(Double.parseDouble(request.getParameter("harga")));
            p.setStok(Integer.parseInt(request.getParameter("stok")));

            if ("Simpan".equalsIgnoreCase(proses)) {
                dao.simpan(p);
            } else if ("Ubah".equalsIgnoreCase(proses)) {
                p.setId(Integer.parseInt(request.getParameter("id")));
                dao.ubah(p);
            }
        }
        response.sendRedirect("admin/index.jsp?halaman=produk");
    }
}