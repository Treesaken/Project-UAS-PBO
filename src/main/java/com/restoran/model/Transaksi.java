package com.restoran.model;
import java.util.Date;

public class Transaksi {
    private int id;
    private Date tanggal;
    private double totalBayar;
    private double nominalBayar;
    private double kembalian;
    private int idUser;

    // Getter dan Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public double getTotalBayar() { return totalBayar; }
    public void setTotalBayar(double totalBayar) { this.totalBayar = totalBayar; }
    public double getNominalBayar() { return nominalBayar; }
    public void setNominalBayar(double nominalBayar) { this.nominalBayar = nominalBayar; }
    public double getKembalian() { return kembalian; }
    public void setKembalian(double kembalian) { this.kembalian = kembalian; }
    public int getIdUser() { return idUser; }
    public void setIdUser(int idUser) { this.idUser = idUser; }
}