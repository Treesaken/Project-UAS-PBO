<%@page import="com.restoran.dao.UserDAO"%>
<%@page import="com.restoran.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Proteksi Admin
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !"Admin".equalsIgnoreCase(currentUser.getRole())) { response.sendRedirect("dashboard.jsp"); return; }

    String id = request.getParameter("id");
    User u = new User();
    String judul = "TAMBAH USER";
    
    if(id != null) {
        UserDAO dao = new UserDAO();
        u = dao.getUserById(Integer.parseInt(id));
        judul = "EDIT USER";
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title><%= judul %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bungee&family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* CSS SATSET FORM */
        :root { --fast-red: #e74c3c; --fast-yellow: #f1c40f; --fast-dark: #2d3436; }
        body { font-family: 'Poppins', sans-serif; background-color: var(--fast-yellow); min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .form-card { background: white; border: 4px solid var(--fast-dark); box-shadow: 10px 10px 0px var(--fast-dark); border-radius: 20px; padding: 30px; width: 100%; max-width: 500px; }
        .form-control, .form-select { border: 3px solid var(--fast-dark); border-radius: 10px; padding: 10px; font-weight: bold; }
        .btn-action { border: 3px solid var(--fast-dark); box-shadow: 5px 5px 0px var(--fast-dark); font-weight: 800; padding: 10px; border-radius: 10px; }
        .btn-action:active { transform: translate(2px, 2px); box-shadow: 0 0 0; }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-card mx-auto">
            <h2 class="text-center mb-4" style="font-family: 'Bungee'; border-bottom: 4px solid black;"><%= judul %></h2>
            
            <form action="UserServlet" method="POST">
                <input type="hidden" name="id" value="<%= (id != null) ? u.getId() : "" %>">
                
                <div class="mb-3">
                    <label>Nama Lengkap</label>
                    <input type="text" name="fullname" class="form-control" value="<%= (u.getFullname() != null) ? u.getFullname() : "" %>" required>
                </div>
                
                <div class="mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" value="<%= (u.getUsername() != null) ? u.getUsername() : "" %>" required>
                </div>

                <div class="mb-3">
                    <label>Password</label>
                    <input type="text" name="password" class="form-control" value="<%= (u.getPassword() != null) ? u.getPassword() : "" %>" required>
                    <% if(id != null) { %> <small class="text-danger">*Ganti jika ingin merubah password</small> <% } %>
                </div>

                <div class="mb-4">
                    <label>Role / Jabatan</label>
                    <select name="role" class="form-select">
                        <option value="Kasir" <%= "Kasir".equals(u.getRole()) ? "selected" : "" %>>Kasir (Staff)</option>
                        <option value="Admin" <%= "Admin".equals(u.getRole()) ? "selected" : "" %>>Admin (Pemilik)</option>
                    </select>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-danger btn-action text-white">SIMPAN DATA</button>
                    <a href="user_list.jsp" class="btn btn-light btn-action">BATAL</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>