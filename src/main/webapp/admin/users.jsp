<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between align-items-center">
        <h6 class="m-0 font-weight-bold text-primary">Daftar User Restoran</h6>
        <a href="#" class="btn btn-sm btn-success"><i class="fa fa-plus"></i> Tambah User</a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-striped" width="100%" cellspacing="0">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UserDAO dao = new UserDAO();
                        List<User> users = dao.getAllUsers();
                        if(users != null && !users.isEmpty()) {
                            for(User u : users) {
                    %>
                    <tr>
                        <td><%= u.getId() %></td>
                        <td><%= u.getUsername() %></td>
                        <td><%= u.getRole() %></td>
                        <td>
                            <a href="#" class="btn btn-sm btn-warning"><i class="fa fa-edit"></i></a>
                            <a href="#" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    <%      } 
                        } else {
                    %>
                        <tr><td colspan="4" class="text-center">Tidak ada data.</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>