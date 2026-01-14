<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.restoran.dao.TransactionDAO"%>
<%@page import="com.restoran.model.Transaction"%>
<%@page import="com.restoran.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) { response.sendRedirect("../login.jsp"); return; }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Laporan Penjualan - SatSet Resto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Bungee&family=Poppins:wght@400;700&display=swap" rel="stylesheet">

    <style>
        :root { --fast-red: #e74c3c; --fast-yellow: #f1c40f; --fast-dark: #2d3436; --fast-white: #ffffff; }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f0f0;
            background-image: radial-gradient(var(--fast-dark) 1px, transparent 1px);
            background-size: 20px 20px;
        }
        .navbar-custom { background: var(--fast-red); border-bottom: 4px solid var(--fast-dark); font-family: 'Bungee', cursive; }
        .neo-card {
            background: var(--fast-white); border: 3px solid var(--fast-dark);
            box-shadow: 8px 8px 0px var(--fast-dark); border-radius: 15px; overflow: hidden;
        }
        .table-neo { border: 2px solid var(--fast-dark); }
        .table-neo thead { background: var(--fast-dark); color: white; font-family: 'Bungee', cursive; }
        .table-neo th, .table-neo td { border: 2px solid var(--fast-dark); vertical-align: middle; padding: 15px; }
        .badge-id { background: var(--fast-yellow); color: var(--fast-dark); border: 2px solid var(--fast-dark); font-weight: bold; }
    </style>
</head>
<body>

    <nav class="navbar navbar-custom navbar-dark mb-5 py-3">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp"><i class="bi bi-arrow-left-circle-fill"></i> KEMBALI KE DASHBOARD</a>
            <span class="text-white">LAPORAN PENJUALAN</span>
        </div>
    </nav>

    <div class="container pb-5">
        <div class="neo-card p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-bold m-0">RIWAYAT TRANSAKSI</h3>
                <button class="btn btn-dark fw-bold" onclick="window.print()"><i class="bi bi-printer"></i> PRINT LAPORAN</button>
            </div>

            <table class="table table-neo table-hover mb-0">
                <thead>
                    <tr>
                        <th>NO NOTA</th>
                        <th>TANGGAL & WAKTU</th>
                        <th>KASIR BERTUGAS</th>
                        <th>TOTAL BAYAR</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    <%
                        TransactionDAO dao = new TransactionDAO();
                        List<Transaction> listTrans = dao.getAllTransactions();
                        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy, HH:mm");
                        double grandTotal = 0;

                        if(listTrans.size() > 0) {
                            for(Transaction t : listTrans) {
                                grandTotal += t.getTotalAmount();
                    %>
                    <tr>
                        <td><span class="badge badge-id">TRX-<%= t.getId() %></span></td>
                        <td><%= sdf.format(t.getDate()) %> WIB</td>
                        <td class="fw-bold text-uppercase"><%= t.getCashierName() %></td>
                        <td class="fw-bold text-end">Rp <%= String.format("%,.0f", t.getTotalAmount()) %></td>
                    </tr>
                    <% 
                            } 
                        } else { 
                    %>
                    <tr>
                        <td colspan="4" class="text-center py-5 fw-bold text-muted">
                            Belum ada riwayat penjualan.
                        </td>
                    </tr>
                    <% } %>
                </tbody>
                <tfoot class="table-dark fw-bold fs-5">
                    <tr>
                        <td colspan="3" class="text-end border-white">TOTAL PENDAPATAN:</td>
                        <td class="text-end text-warning border-white">Rp <%= String.format("%,.0f", grandTotal) %></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

</body>
</html>