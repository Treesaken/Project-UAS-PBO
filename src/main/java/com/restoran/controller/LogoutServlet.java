package com.restoran.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil session saat ini
        HttpSession session = request.getSession(false); // false = jangan buat baru jika tidak ada
        
        // 2. Hapus session
        if (session != null) {
            session.invalidate(); // Hancurkan session
        }
        
        // 3. Kembalikan ke halaman login
        response.sendRedirect("login.jsp");
    }
}