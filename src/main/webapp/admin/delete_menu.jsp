<%@page import="com.restoran.dao.ProductDAO"%>
<%@page import="com.restoran.model.User"%>

<%
    // 1. Proteksi Session (Agar tidak bisa asal hapus lewat URL)
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // 2. Ambil ID dari URL (delete_menu.jsp?id=5)
    String idStr = request.getParameter("id");

    if (idStr != null && !idStr.isEmpty()) {
        try {
            int id = Integer.parseInt(idStr);
            
            // 3. Panggil DAO untuk menghapus
            ProductDAO dao = new ProductDAO();
            dao.deleteProduct(id);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 4. Balik lagi ke daftar menu
    response.sendRedirect("menu_list.jsp");
%>