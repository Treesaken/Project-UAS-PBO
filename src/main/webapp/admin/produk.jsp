<%@page import="dao.ProdukDAO, dao.JenisDAO, model.Produk, model.Jenis, java.util.List"%>
<div class="d-flex justify-content-between align-items-center mb-4">
    <h3>Manajemen Menu Makanan</h3>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalProduk">
        <i class="fas fa-plus"></i> Tambah Menu
    </button>
</div>

<div class="card p-3">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>No</th><th>Kode</th><th>Nama</th><th>Kategori</th><th>Harga</th><th>Stok</th><th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <%
                ProdukDAO dao = new ProdukDAO();
                List<Produk> list = dao.getAll();
                int no = 1;
                for (Produk p : list) {
            %>
            <tr>
                <td><%= no++ %></td>
                <td><%= p.getKode() %></td>
                <td><%= p.getNama() %></td>
                <td><%= (p.getJenis() != null) ? p.getJenis().getNama() : "-" %></td> [cite: 600-601]
                <td><%= p.getHarga() %></td>
                <td><%= p.getStok() %></td>
                <td>
                    <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#modalProduk"
                        data-id="<%= p.getId() %>" data-kode="<%= p.getKode() %>" data-nama="<%= p.getNama() %>"
                        data-jenis="<%= p.getJenis().getId() %>" data-harga="<%= p.getHarga() %>" 
                        data-stok="<%= p.getStok() %>"> <i class="fas fa-edit"></i> </button> [cite: 716-727]

                    <form action="../ProdukServlet" method="POST" class="d-inline">
                        <input type="hidden" name="id" value="<%= p.getId() %>">
                        <button type="submit" name="proses" value="Hapus" class="btn btn-sm btn-danger" 
                                onclick="return confirm('Hapus menu ini?')"> <i class="fas fa-trash"></i> </button> [cite: 729-738]
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<div class="modal fade" id="modalProduk" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="../ProdukServlet" method="POST">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Tambah Menu</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id">
                    <div class="mb-3">
                        <label>Kode</label>
                        <input type="text" name="kode" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Nama Menu</label>
                        <input type="text" name="nama" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Kategori</label>
                        <select name="jenis" class="form-select">
                            <%
                                JenisDAO jdao = new JenisDAO();
                                for (Jenis j : jdao.getAll()) {
                            %>
                                <option value="<%= j.getId() %>"><%= j.getNama() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Harga</label>
                            <input type="number" name="harga" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Stok</label>
                            <input type="number" name="stok" class="form-control" required>
                        </div>
                    </div>
                    <input type="hidden" name="kondisi" value="baru">
                </div>
                <div class="modal-footer">
                    <button type="submit" name="proses" value="Simpan" id="btnSimpan" class="btn btn-primary w-100">Simpan Menu</button>
                    <button type="submit" name="proses" value="Ubah" id="btnUbah" class="btn btn-warning w-100 d-none">Update Menu</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    const modalProduk = document.getElementById('modalProduk');
    modalProduk.addEventListener('show.bs.modal', function (event) {
        const btn = event.relatedTarget;
        const form = modalProduk.querySelector('form');
        const title = document.getElementById('modalTitle');
        const btnSimpan = document.getElementById('btnSimpan');
        const btnUbah = document.getElementById('btnUbah');

        if (btn.dataset.id) { [cite: 749-758]
            title.innerText = "Ubah Data Menu";
            btnSimpan.classList.add('d-none');
            btnUbah.classList.remove('d-none');
            form.id.value = btn.dataset.id;
            form.kode.value = btn.dataset.kode;
            form.nama.value = btn.dataset.nama;
            form.jenis.value = btn.dataset.jenis;
            form.harga.value = btn.dataset.harga;
            form.stok.value = btn.dataset.stok;
        } else { [cite: 759-763]
            title.innerText = "Tambah Menu Baru";
            form.reset();
            btnSimpan.classList.remove('d-none');
            btnUbah.classList.add('d-none');
        }
    });
</script>