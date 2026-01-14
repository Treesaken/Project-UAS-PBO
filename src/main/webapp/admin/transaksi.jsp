<%@page import="com.restoran.model.TransactionDetail"%>
<%@page import="com.restoran.model.Transaction"%>
<%@page import="java.util.List"%>
<%@page import="com.restoran.dao.ProductDAO"%>
<%@page import="com.restoran.model.Product"%>
<%@page import="com.restoran.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) { response.sendRedirect("../login.jsp"); return; }

    // Ambil Keranjang dari Session
    Transaction cart = (Transaction) session.getAttribute("cart");
    double totalBayar = 0;
    if (cart != null) {
        totalBayar = cart.getTotalAmount();
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Kasir - SatSet Resto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Bungee&family=Poppins:wght@400;700&display=swap" rel="stylesheet">

    <style>
        :root { --fast-red: #e74c3c; --fast-yellow: #f1c40f; --fast-dark: #2d3436; }
        body { font-family: 'Poppins', sans-serif; background: #f4f4f4; }
        
        .neo-card {
            background: white; border: 3px solid var(--fast-dark);
            box-shadow: 6px 6px 0px var(--fast-dark); border-radius: 15px; overflow: hidden;
        }
        .btn-neo {
            border: 2px solid var(--fast-dark); font-weight: bold; box-shadow: 3px 3px 0px var(--fast-dark);
        }
        .btn-neo:active { transform: translate(2px, 2px); box-shadow: 0 0 0; }
        .font-bungee { font-family: 'Bungee', cursive; }
    </style>
</head>
<body class="p-3">

    <div class="d-flex justify-content-between align-items-center mb-4 neo-card p-3 bg-dark text-white">
        <h3 class="m-0 font-bungee text-warning">SATSET KASIR</h3>
        <div>
            Kasir: <strong><%= user.getFullname() %></strong>
            <a href="dashboard.jsp" class="btn btn-sm btn-light ms-3 fw-bold">Kembali</a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-7">
            <div class="neo-card p-4 h-100">
                <h4 class="font-bungee mb-4 border-bottom pb-2">PILIH MENU</h4>
                
                <div class="row g-3">
                    <%
                        ProductDAO dao = new ProductDAO();
                        List<Product> products = dao.getAllProducts();
                        for(Product p : products) {
                    %>
                    <div class="col-md-4 col-sm-6">
                        <div class="card h-100 border-2 border-dark">
                            <img src="../assets/images/<%= p.getImage() %>" class="card-img-top" 
                                 style="height: 100px; object-fit: cover;" onerror="this.src='https://via.placeholder.com/100'">
                            <div class="card-body p-2 text-center">
                                <h6 class="fw-bold mb-1"><%= p.getName() %></h6>
                                <div class="text-danger fw-bold mb-2">Rp <%= String.format("%,.0f", p.getPrice()) %></div>
                                
                                <form action="TransactionServlet" method="POST" class="d-flex gap-1 justify-content-center">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="productId" value="<%= p.getId() %>">
                                    <input type="number" name="qty" value="1" min="1" class="form-control form-control-sm border-dark text-center px-1" style="width: 50px;">
                                    <button type="submit" class="btn btn-sm btn-warning btn-neo"><i class="bi bi-plus-lg"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>

        <div class="col-md-5">
            <div class="neo-card p-4 h-100 bg-white">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="font-bungee m-0">KERANJANG</h4>
                    <a href="TransactionServlet?action=clear" class="btn btn-sm btn-danger btn-neo">Reset</a>
                </div>

                <div class="table-responsive mb-3" style="max-height: 400px; overflow-y: auto;">
                    <table class="table table-bordered border-dark text-center">
                        <thead class="table-dark">
                            <tr>
                                <th>Menu</th>
                                <th>Qty</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (cart != null && !cart.getDetails().isEmpty()) { 
                                for(TransactionDetail item : cart.getDetails()) { %>
                                <tr>
                                    <td class="text-start"><%= item.getProductName() %></td>
                                    <td><%= item.getQty() %></td>
                                    <td><%= String.format("%,.0f", item.getSubtotal()) %></td>
                                </tr>
                            <%  } 
                               } else { %>
                                <tr><td colspan="3" class="text-muted py-4">Keranjang Kosong</td></tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>

                <div class="bg-light p-3 border border-2 border-dark rounded mb-3">
                    <div class="d-flex justify-content-between fs-4 fw-bold">
                        <span>TOTAL:</span>
                        <span class="text-danger">Rp <%= String.format("%,.0f", totalBayar) %></span>
                    </div>
                </div>

                <form action="TransactionServlet" method="POST">
                    <input type="hidden" name="action" value="checkout">
                    <button type="submit" class="btn btn-success w-100 py-3 fs-5 fw-bold btn-neo text-uppercase"
                            <%= (cart == null || cart.getDetails().isEmpty()) ? "disabled" : "" %>>
                        <i class="bi bi-cash-coin"></i> BAYAR SEKARANG
                    </button>
                </form>

                <% if(request.getParameter("status") != null && request.getParameter("status").equals("sukses")) { %>
                    <div class="alert alert-success mt-3 border-2 border-dark fw-bold text-center">
                        ✅ Transaksi Berhasil Disimpan!
                    </div>
                <% } %>
            </div>
        </div>
    </div>

</body>
</html>