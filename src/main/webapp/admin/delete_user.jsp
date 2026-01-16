<%@page import="com.restoran.dao.UserDAO"%>
<%@page import="com.restoran.model.User"%>

<%
    User currentUser = (User) session.getAttribute("currentUser");
    // Proteksi: Cuma Admin yang boleh & harus login
    if (currentUser == null || !"Admin".equalsIgnoreCase(currentUser.getRole())) {
        response.sendRedirect("dashboard.jsp");
        return;
    }

    String idStr = request.getParameter("id");
    if (idStr != null) {
        int id = Integer.parseInt(idStr);
        // Cegah hapus diri sendiri
        if (id != currentUser.getId()) {
            UserDAO dao = new UserDAO();
            dao.deleteUser(id);
        }
    }
    response.sendRedirect("user_list.jsp");
%>