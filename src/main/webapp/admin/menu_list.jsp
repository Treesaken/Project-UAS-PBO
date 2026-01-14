<%@page import="java.util.List"%>
<%@page import="com.restoran.dao.ProductDAO"%>
<%@page import="com.restoran.model.Product"%>
<%@page import="com.restoran.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) { response.sendRedirect("../login.jsp"); return; }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Kelola Menu - SatSet Resto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Bungee&family=Poppins:wght@400;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --fast-red: #e74c3c;
            --fast-yellow: #f1c40f;
            --fast-dark: #2d3436;
            --fast-white: #ffffff;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f0f0;
            background-image: radial-gradient(var(--fast-dark) 1px, transparent 1px);
            background-size: 20px 20px; /* Efek kertas titik-titik */
        }

        /* --- STYLE KHUSUS --- */
        .neo-card {
            background: var(--fast-white);
            border: 3px solid var(--fast-dark);
            box-shadow: 8px 8px 0px var(--fast-dark);
            border-radius: 15px;
            overflow: hidden;
        }

        .neo-btn {
            border: 2px solid var(--fast-dark);
            box-shadow: 4px 4px 0px var(--fast-dark);
            font-weight: bold;
            transition: all 0.1s;
            border-radius: 8px;
        }
        .neo-btn:active {
            transform: translate(2px, 2px);
            box-shadow: 0px 0px 0px var(--fast-dark);
        }

        /* Tombol Tambah */
        .btn-add {
            background: var(--fast-yellow);
            color: var(--fast-dark);
        }

        /* Tabel Kustom */
        .table-neo {
            border: 2px solid var(--fast-dark);
        }
        .table-neo thead {
            background: var(--fast-dark);
            color: white;
            font-family: 'Bungee', cursive;
        }
        .table-neo th, .table-neo td {
            border: 2px solid var(--fast-dark);
            vertical-align: middle;
            padding: 15px;
        }

        /* Badge Kategori */
        .badge-neo {
            border: 2px solid var(--fast-dark);
            color: var(--fast-dark);
            font-weight: 800;
            box-shadow: 2px 2px 0px rgba(0,0,0,0.2);
        }
        .bg-makanan { background-color: #ff9f43; }
        .bg-minuman { background-color: #54a0ff; }
        .bg-snack { background-color: #1dd1a1; }

        /* Navbar Simple */
        .navbar-custom {
            background: var(--fast-red);
            border-bottom: 4px solid var(--fast-dark);
            font-family: 'Bungee', cursive;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-custom navbar-dark mb-5 py-3">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp"><i class="bi bi-arrow-left-circle-fill"></i> KEMBALI KE DASHBOARD</a>
            <span class="text-white">KELOLA MENU</span>
        </div>
    </nav>

    <div class="container pb-5">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold" style="text-shadow: 2px 2px 0px white;">DAFTAR MENU</h2>
            <a href="menu_form.jsp" class="btn neo-btn btn-add px-4 py-2">
                <i class="bi bi-plus-lg"></i> TAMBAH MENU BARU
            </a>
        </div>

        <div class="neo-card p-4">
            <table class="table table-neo table-hover mb-0">
                <thead>
                    <tr>
                        <th>KODE</th>
                        <th>GAMBAR</th>
                        <th>NAMA MENU</th>
                        <th>KATEGORI</th>
                        <th>HARGA</th>
                        <th>STOK</th>
                        <th>AKSI</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    <%
                        ProductDAO dao = new ProductDAO();
                        List<Product> listMenu = dao.getAllProducts();
                        
                        if(listMenu.size() > 0) {
                            for(Product p : listMenu) {
                    %>
                    <tr>
                        <td class="fw-bold"><%= p.getCode() %></td>
                        <td>
                            <div style="width: 60px; height: 60px; border: 2px solid var(--fast-dark); border-radius: 8px; overflow: hidden; background: #eee;">
                                <img src="../assets/images/<%= p.getImage() %>" alt="img" 
                                     style="width: 100%; height: 100%; object-fit: cover;"
                                     onerror="this.src='https://via.placeholder.com/60?text=No+Img'">
                            </div>
                        </td>
                        <td class="fw-bold text-uppercase"><%= p.getName() %></td>
                        <td>
                            <% 
                                String cssClass = "bg-snack";
                                if("Makanan".equalsIgnoreCase(p.getCategory())) cssClass = "bg-makanan";
                                else if("Minuman".equalsIgnoreCase(p.getCategory())) cssClass = "bg-minuman";
                            %>
                            <span class="badge badge-neo <%= cssClass %>">
                                <%= p.getCategory() %>
                            </span>
                        </td>
                        <td class="fw-bold">Rp <%= String.format("%,.0f", p.getPrice()) %></td>
                        <td>
                            <span class="fw-bold <%= p.getStock() < 5 ? "text-danger" : "text-success" %>">
                                <%= p.getStock() %>
                            </span>
                        </td>
                        <td>
                            <div class="d-flex gap-2">
                                <a href="menu_form.jsp?id=<%= p.getId() %>" class="btn btn-sm btn-light neo-btn" style="background: white;">
                                    <i class="bi bi-pencil-fill text-primary"></i>
                                </a>
                                <a href="delete_menu.jsp?id=<%= p.getId() %>" 
                                   class="btn btn-sm btn-light neo-btn" 
                                   style="background: #ff6b6b;"
                                   onclick="return confirm('Hapus menu ini?')">
                                   <i class="bi bi-trash-fill text-white"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <% 
                            } 
                        } else { 
                    %>
                    <tr>
                        <td colspan="7" class="text-center py-5 fw-bold text-muted">
                            <i class="bi bi-box-seam display-4 d-block mb-3"></i>
                            Belum ada menu. Yuk tambah sekarang!
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>