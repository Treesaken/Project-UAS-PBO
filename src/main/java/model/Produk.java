package model;
import java.io.Serializable;

public class Produk implements Serializable {
    private int id;
    private String kode;
    private String nama;
    private int idjenis;
    private String kondisi; // Pastikan variabel ini ada
    private double harga;
    private int stok;
    private Jenis jenis; // Simbol 'Jenis' harus merujuk ke model.Jenis

    public Produk() {}

    // Getter & Setter (Pastikan nama metode SAMA PERSIS dengan error log)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getKode() { return kode; }
    public void setKode(String kode) { this.kode = kode; }
    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }
    public int getIdjenis() { return idjenis; }
    public void setIdjenis(int idjenis) { this.idjenis = idjenis; }
    public String getKondisi() { return kondisi; }
    public void setKondisi(String kondisi) { this.kondisi = kondisi; } // Perbaikan error setKondisi
    public double getHarga() { return harga; }
    public void setHarga(double harga) { this.harga = harga; }
    public int getStok() { return stok; }
    public void setStok(int stok) { this.stok = stok; }
    public Jenis getJenis() { return jenis; }
    public void setJenis(Jenis jenis) { this.jenis = jenis; }
}