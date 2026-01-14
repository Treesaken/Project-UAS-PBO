package com.restoran.model;

public class DetailTransaksi {
    private int id;
    private int idTransaksi;
    private int idProduk;
    private int jumlah;
    private double subtotal;

    // Getter dan Setter
    public int getIdProduk() { return idProduk; }
    public void setIdProduk(int idProduk) { this.idProduk = idProduk; }
    public int getJumlah() { return jumlah; }
    public void setJumlah(int jumlah) { this.jumlah = jumlah; }
    public double getSubtotal() { return subtotal; }
    public void setSubtotal(double subtotal) { this.subtotal = subtotal; }
    public void setIdTransaksi(int idTransaksi) { this.idTransaksi = idTransaksi; }
}