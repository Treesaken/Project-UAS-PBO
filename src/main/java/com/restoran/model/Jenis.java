package com.restoran.model;

import java.io.Serializable;

public class Jenis implements Serializable {
    private int id;
    private String nama;

    public Jenis() {}

    // Getter dan Setter (Wajib ada agar simbol ditemukan)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    @Override
    public String toString() {
        return nama;
    }
}