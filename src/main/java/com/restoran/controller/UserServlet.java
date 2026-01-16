package com.restoran.controller;

import com.restoran.dao.UserDAO;
import com.restoran.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UserServlet", urlPatterns = {"/admin/UserServlet"})
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User u = new User();
        u.setUsername(username);
        u.setFullname(fullname);
        u.setPassword(password);
        u.setRole(role);

        UserDAO dao = new UserDAO();

        if (idStr == null || idStr.isEmpty()) {
            // MODE TAMBAH
            dao.addUser(u);
        } else {
            // MODE EDIT
            u.setId(Integer.parseInt(idStr));
            dao.updateUser(u);
        }

        response.sendRedirect("user_list.jsp");
    }
}