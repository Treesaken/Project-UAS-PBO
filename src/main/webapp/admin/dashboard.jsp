<%@page import="com.restoran.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // --- 1. PROTEKSI SESSION (WAJIB ADA) ---
    // Cek apakah ada orang login?
    User user = (User) session.getAttribute("currentUser"); // Sesuaikan nama atribut dengan LoginServlet

    // Jika user kosong (belum login), tendang ke halaman login
    if (user == null) {
        response.sendRedirect("../login.jsp");
        return; 
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Admin</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet"> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container">
            <a class="navbar-brand" href="#">Restoran Admin</a>
            <div class="d-flex text-white align-items-center">
                <span class="me-3">Halo, <%= user.getFullname() %>!</span>
                <a href="../LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="card shadow">
            <div class="card-body text-center p-5">
                <h2>Selamat Datang di Halaman Admin</h2>
                <p class="lead">Anda login sebagai: <strong><%= user.getRole() %></strong></p>
                
                <hr>
                
                <div class="d-grid gap-2 d-md-block">
                    <a href="menu_list.jsp" class="btn btn-primary btn-lg">
                        <i class="bi bi-list-ul"></i> Kelola Menu (CRUD)
                    </a>
                    <a href="#" class="btn btn-success btn-lg">
                        <i class="bi bi-cart"></i> Transaksi Kasir
                    </a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>