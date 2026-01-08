<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Feane</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Inter', sans-serif; }
        .sidebar { min-width: 250px; max-width: 250px; background: #111827; color: white; min-height: 100vh; }
        .sidebar a { color: #9ca3af; text-decoration: none; padding: 10px 20px; display: block; }
        .sidebar a:hover, .sidebar a.active { background: #1f2937; color: white; border-radius: 8px; }
        .main-content { flex: 1; padding: 20px; }
        .card { border: none; box-shadow: 0 1px 3px rgba(0,0,0,0.1); border-radius: 12px; }
    </style>
</head>
<body>
    <div class="d-flex">
        <div class="sidebar p-3">
            <h4 class="text-white mb-4 px-2">Feane Admin</h4>
            <nav>
                <a href="index.jsp" class="active"><i class="fas fa-home me-2"></i> Dashboard</a>
                <a href="index.jsp?halaman=produk"><i class="fas fa-hamburger me-2"></i> Menu Makanan</a>
                <a href="index.jsp?halaman=jenis"><i class="fas fa-list me-2"></i> Kategori</a>
                <a href="index.jsp?halaman=laporan"><i class="fas fa-chart-line me-2"></i> Laporan</a>
                <hr>
                <a href="../logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a>
            </nav>
        </div>

        <div class="main-content">
            <%
                String hal = request.getParameter("halaman");
                if (hal == null || hal.equals("dashboard")) {
            %>
                <h2>Selamat Datang, Admin!</h2>
                <div class="row mt-4">
                    <div class="col-md-4">
                        <div class="card p-3 bg-primary text-white">
                            <h5>Total Menu</h5>
                            <h3>12</h3>
                        </div>
                    </div>
                </div>
            <%
                } else if (hal.equals("produk")) {
            %>
                <jsp:include page="produk.jsp" />
            <%
                }
            %>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>