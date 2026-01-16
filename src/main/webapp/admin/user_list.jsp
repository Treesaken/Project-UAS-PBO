<%@page import="java.util.List"%>
<%@page import="com.restoran.dao.UserDAO"%>
<%@page import="com.restoran.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Proteksi: Cuma Admin yang boleh masuk
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !"Admin".equalsIgnoreCase(currentUser.getRole())) { 
        response.sendRedirect("dashboard.jsp"); return; 
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Kelola User - SatSet Resto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Bungee&family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    
    <style>
        /* CSS SATSET DESIGN */
        :root { --fast-red: #e74c3c; --fast-yellow: #f1c40f; --fast-dark: #2d3436; --fast-white: #ffffff; }
        body { font-family: 'Poppins', sans-serif; background-color: #f0f0f0; background-image: radial-gradient(var(--fast-dark) 1px, transparent 1px); background-size: 20px 20px; }
        .navbar-custom { background: var(--fast-red); border-bottom: 4px solid var(--fast-dark); font-family: 'Bungee', cursive; }
        .neo-card { background: var(--fast-white); border: 3px solid var(--fast-dark); box-shadow: 8px 8px 0px var(--fast-dark); border-radius: 15px; overflow: hidden; }
        .table-neo { border: 2px solid var(--fast-dark); }
        .table-neo thead { background: var(--fast-dark); color: white; font-family: 'Bungee', cursive; }
        .table-neo th, .table-neo td { border: 2px solid var(--fast-dark); vertical-align: middle; padding: 15px; }
        .neo-btn { border: 2px solid var(--fast-dark); box-shadow: 4px 4px 0px var(--fast-dark); font-weight: bold; transition: all 0.1s; border-radius: 8px; }
        .neo-btn:active { transform: translate(2px, 2px); box-shadow: 0px 0px 0px var(--fast-dark); }
        .badge-role { border: 2px solid var(--fast-dark); padding: 5px 10px; font-weight: bold; }
    </style>
</head>
<body>

    <nav class="navbar navbar-custom navbar-dark mb-5 py-3">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp"><i class="bi bi-arrow-left-circle-fill"></i> KEMBALI KE DASHBOARD</a>
            <span class="text-white">KELOLA PENGGUNA</span>
        </div>
    </nav>

    <div class="container pb-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold bg-white px-2 border border-2 border-dark">DAFTAR STAFF</h2>
            <a href="user_form.jsp" class="btn neo-btn btn-warning px-4 py-2">
                <i class="bi bi-person-plus-fill"></i> TAMBAH USER BARU
            </a>
        </div>

        <div class="neo-card p-4">
            <table class="table table-neo table-hover mb-0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>FULLNAME</th>
                        <th>USERNAME</th>
                        <th>ROLE</th>
                        <th>AKSI</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    <%
                        UserDAO dao = new UserDAO();
                        List<User> listUser = dao.getAllUsers();
                        for(User u : listUser) {
                    %>
                    <tr>
                        <td class="fw-bold">#<%= u.getId() %></td>
                        <td class="fw-bold"><%= u.getFullname() %></td>
                        <td><%= u.getUsername() %></td>
                        <td>
                            <span class="badge badge-role <%= u.getRole().equals("Admin") ? "bg-danger text-white" : "bg-info text-dark" %>">
                                <%= u.getRole() %>
                            </span>
                        </td>
                        <td>
                            <% if(currentUser.getId() != u.getId()) { // Gabisa hapus diri sendiri %>
                            <div class="d-flex gap-2">
                                <a href="user_form.jsp?id=<%= u.getId() %>" class="btn btn-sm btn-light neo-btn"><i class="bi bi-pencil-fill"></i></a>
                                <a href="delete_user.jsp?id=<%= u.getId() %>" class="btn btn-sm btn-danger neo-btn" onclick="return confirm('Yakin pecat staff ini?')"><i class="bi bi-trash-fill"></i></a>
                            </div>
                            <% } else { %>
                                <span class="text-muted small fw-bold">(Saya)</span>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>