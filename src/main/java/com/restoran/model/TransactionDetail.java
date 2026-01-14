package com.restoran.model;

public class TransactionDetail {
    private int id;
    private int transactionId;
    private int productId;
    private int qty;
    private double subtotal;
    
    // Tambahan: Simpan Nama Produk biar gampang ditampilkan nanti
    private String productName; 

    public TransactionDetail() {}

    public TransactionDetail(int productId, String productName, int qty, double price) {
        this.productId = productId;
        this.productName = productName;
        this.qty = qty;
        this.subtotal = price * qty;
    }

    // Getter Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getTransactionId() { return transactionId; }
    public void setTransactionId(int transactionId) { this.transactionId = transactionId; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public int getQty() { return qty; }
    public void setQty(int qty) { this.qty = qty; }

    public double getSubtotal() { return subtotal; }
    public void setSubtotal(double subtotal) { this.subtotal = subtotal; }
    
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
}