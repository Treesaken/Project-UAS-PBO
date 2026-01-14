package com.restoran.controller;

import com.restoran.dao.UserDAO;
import com.restoran.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException; // Ganti 'jakarta' dengan 'javax' jika error (Tergantung Tomcat)
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil input dari form
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        
        // 2. Panggil DAO untuk cek database
        UserDAO dao = new UserDAO();
        User user = dao.validate(u, p);
        
        if (user != null) {
            // --- LOGIN SUKSES ---
            
            // 3. BUAT SESSION (Ini poin utamanya)
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user); // Simpan object user ke memori session
            
            // 4. Cek Role untuk redirect (Opsional, bisa langsung ke dashboard)
            if ("admin".equals(user.getRole())) {
                response.sendRedirect("admin/dashboard.jsp");
            } else {
                response.sendRedirect("admin/dashboard.jsp"); // Kasir juga ke dashboard
            }
            
        } else {
            // --- LOGIN GAGAL ---
            request.setAttribute("errorMessage", "Username atau Password Salah!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}