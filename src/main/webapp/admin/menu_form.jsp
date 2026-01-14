<%@page import="com.restoran.dao.ProductDAO"%>
<%@page import="com.restoran.model.Product"%>
<%@page import="com.restoran.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) { response.sendRedirect("../login.jsp"); return; }

    String id = request.getParameter("id");
    Product p = new Product();
    String judul = "TAMBAH MENU";
    String btnText = "SIMPAN MENU";
    
    if(id != null) {
        ProductDAO dao = new ProductDAO();
        p = dao.getProductById(Integer.parseInt(id));
        judul = "EDIT MENU";
        btnText = "UPDATE MENU";
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title><%= judul %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bungee&family=Poppins:wght@400;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --fast-red: #e74c3c;
            --fast-yellow: #f1c40f;
            --fast-dark: #2d3436;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--fast-yellow); /* Background Kuning ngejreng */
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-card {
            background: white;
            border: 4px solid var(--fast-dark);
            box-shadow: 10px 10px 0px var(--fast-dark);
            border-radius: 20px;
            padding: 30px;
            width: 100%;
            max-width: 600px;
        }

        .page-title {
            font-family: 'Bungee', cursive;
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 4px solid var(--fast-dark);
            padding-bottom: 10px;
        }

        /* Input Style Brutal */
        .form-label { font-weight: 800; color: var(--fast-dark); }
        
        .form-control, .form-select {
            border: 3px solid var(--fast-dark);
            border-radius: 10px;
            padding: 10px 15px;
            font-weight: 500;
            background: #f9f9f9;
        }

        .form-control:focus, .form-select:focus {
            box-shadow: none;
            background: white;
            border-color: var(--fast-red); /* Berubah Merah saat diketik */
        }

        /* Tombol */
        .btn-action {
            border: 3px solid var(--fast-dark);
            box-shadow: 5px 5px 0px var(--fast-dark);
            font-weight: 800;
            padding: 12px;
            border-radius: 10px;
            text-transform: uppercase;
            transition: all 0.1s;
        }
        .btn-save { background: var(--fast-red); color: white; }
        .btn-cancel { background: white; color: var(--fast-dark); }

        .btn-action:hover { transform: translate(-2px, -2px); box-shadow: 7px 7px 0px var(--fast-dark); }
        .btn-action:active { transform: translate(2px, 2px); box-shadow: 0px 0px 0px var(--fast-dark); }
    </style>
</head>
<body>

    <div class="container p-3">
        <div class="form-card mx-auto">
            <h2 class="page-title"><%= judul %></h2>

            <form action="ProductServlet" method="POST">
                <input type="hidden" name="id" value="<%= (id != null) ? p.getId() : "" %>">

                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label">KODE</label>
                        <input type="text" name="code" class="form-control" placeholder="Cth: MK01" 
                               value="<%= (p.getCode() != null) ? p.getCode() : "" %>" required>
                    </div>
                    <div class="col-md-8 mb-3">
                        <label class="form-label">NAMA MENU</label>
                        <input type="text" name="name" class="form-control" placeholder="Cth: Nasi Goreng Spesial"
                               value="<%= (p.getName() != null) ? p.getName() : "" %>" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">KATEGORI</label>
                    <select name="category" class="form-select">
                        <option value="Makanan" <%= "Makanan".equals(p.getCategory()) ? "selected" : "" %>>Makanan Berat</option>
                        <option value="Minuman" <%= "Minuman".equals(p.getCategory()) ? "selected" : "" %>>Minuman Segar</option>
                        <option value="Snack" <%= "Snack".equals(p.getCategory()) ? "selected" : "" %>>Cemilan / Snack</option>
                    </select>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">HARGA (RP)</label>
                        <input type="number" name="price" class="form-control" placeholder="0"
                               value="<%= (int) p.getPrice() %>" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">STOK AWAL</label>
                        <input type="number" name="stock" class="form-control" placeholder="0"
                               value="<%= p.getStock() %>" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label">FOTO PRODUK</label>
                    <input type="text" name="image" class="form-control" placeholder="namafile.jpg"
                           value="<%= (p.getImage() != null) ? p.getImage() : "default.jpg" %>">
                    <small class="text-muted fw-bold">*Pastikan file sudah ada di folder assets</small>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-action btn-save"><%= btnText %></button>
                    <a href="menu_list.jsp" class="btn btn-action btn-cancel text-center text-decoration-none">BATAL KEMBALI</a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>