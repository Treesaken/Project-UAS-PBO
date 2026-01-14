<%@page import="com.restoran.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // --- 1. PROTEKSI SESSION (TETAP ADA) ---
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("../login.jsp");
        return; 
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Dashboard Admin - SatSet Resto</title>
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
            /* Background Pola atau Gambar Restoran (sama seperti login tapi lebih terang dikit overlaynya) */
            background: linear-gradient(rgba(255,255,255,0.9), rgba(255,255,255,0.9)), 
                        url('https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-attachment: fixed;
            min-height: 100vh;
        }

        /* Navbar Style */
        .navbar-custom {
            background: var(--fast-red);
            border-bottom: 4px solid var(--fast-dark);
            padding: 15px 0;
        }
        
        .brand-text {
            font-family: 'Bungee', cursive;
            color: var(--fast-white);
            text-shadow: 2px 2px 0px var(--fast-dark);
            font-size: 1.5rem;
            text-decoration: none;
        }

        /* Card Menu Style */
        .card-menu {
            background: var(--fast-white);
            border: 4px solid var(--fast-dark);
            border-radius: 20px;
            box-shadow: 8px 8px 0px var(--fast-dark);
            transition: all 0.2s ease;
            height: 100%;
            overflow: hidden;
            text-decoration: none;
            display: block;
            color: var(--fast-dark);
        }

        .card-menu:hover {
            transform: translate(-4px, -4px);
            box-shadow: 12px 12px 0px var(--fast-dark);
            border-color: var(--fast-dark);
        }

        .card-menu:active {
            transform: translate(4px, 4px);
            box-shadow: 0px 0px 0px var(--fast-dark);
        }

        .icon-box {
            font-size: 4rem;
            margin-bottom: 15px;
        }

        .card-title-custom {
            font-family: 'Bungee', cursive;
            font-size: 1.5rem;
        }

        /* Tombol Logout */
        .btn-logout {
            background: var(--fast-yellow);
            color: var(--fast-dark);
            font-weight: 800;
            border: 3px solid var(--fast-dark);
            box-shadow: 4px 4px 0px var(--fast-dark);
            padding: 5px 15px;
            border-radius: 10px;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-logout:hover {
            background: #fff;
            transform: translate(-2px, -2px);
            box-shadow: 6px 6px 0px var(--fast-dark);
            color: var(--fast-dark);
        }

        .welcome-badge {
            background: var(--fast-dark);
            color: var(--fast-white);
            padding: 5px 15px;
            border-radius: 50px;
            font-weight: bold;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-custom mb-5">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="#" class="brand-text">
                <i class="bi bi-lightning-charge-fill text-warning"></i> SATSET ADMIN
            </a>
            <div class="d-flex align-items-center gap-3">
                <span class="welcome-badge d-none d-md-block">
                    Halo, <%= user.getFullname() %> (<%= user.getRole() %>)
                </span>
                <a href="../LogoutServlet" class="btn-logout">
                    LOGOUT <i class="bi bi-box-arrow-right"></i>
                </a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row mb-4">
            <div class="col-12 text-center">
                <h2 style="font-family: 'Bungee', cursive; color: var(--fast-dark);">Mau Ngapain Hari Ini?</h2>
                <p class="fw-bold text-muted">Pilih menu di bawah untuk mulai bekerja</p>
            </div>
        </div>

        <div class="row g-4 justify-content-center">
            
            <div class="col-md-5 col-lg-4">
                <a href="menu_list.jsp" class="card-menu p-4 text-center">
                    <div class="icon-box text-danger">
                        <i class="bi bi-egg-fried"></i>
                    </div>
                    <h3 class="card-title-custom">KELOLA MENU</h3>
                    <p class="mb-0 fw-bold">Tambah, Edit & Hapus Menu Makanan</p>
                </a>
            </div>

            <div class="col-md-5 col-lg-4">
                <a href="transaksi.jsp" class="card-menu p-4 text-center">
                    <div class="icon-box text-warning">
                        <i class="bi bi-calculator-fill"></i>
                    </div>
                    <h3 class="card-title-custom">KASIR</h3>
                    <p class="mb-0 fw-bold">Buat Pesanan Pelanggan Baru</p>
                </a>
            </div>

            <div class="col-md-5 col-lg-4">
                <a href="laporan.jsp" class="card-menu p-4 text-center">
                    <div class="icon-box text-primary">
                        <i class="bi bi-clipboard-data-fill"></i>
                    </div>
                    <h3 class="card-title-custom">LAPORAN</h3>
                    <p class="mb-0 fw-bold">Lihat Riwayat Penjualan Harian</p>
                </a>
            </div>
        </div>
        
        <div class="text-center mt-5 text-muted fw-bold" style="font-size: 0.8rem;">
            &copy; 2024 SatSet Resto App. Built with Java & Love.
        </div>
    </div>

</body>
</html>