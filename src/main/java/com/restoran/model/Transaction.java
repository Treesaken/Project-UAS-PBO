package com.restoran.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Transaction {
    private int id;
    private int userId; 
    private Timestamp date;
    private double totalAmount;
    private String cashierName;
    
    // LIST: Menampung detail belanjaan
    private List<TransactionDetail> details = new ArrayList<>();

    public Transaction() {}

    // Method helper untuk nambah item
    public void addDetail(TransactionDetail detail) {
        this.details.add(detail);
        this.totalAmount += detail.getSubtotal();
    }
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; } 
    public void setUserId(int userId) { this.userId = userId; }
    
    public String getCashierName() { return cashierName; }
    public void setCashierName(String cashierName) { this.cashierName = cashierName; }

    public Timestamp getDate() { return date; }
    public void setDate(Timestamp date) { this.date = date; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public List<TransactionDetail> getDetails() { return details; }
    public void setDetails(List<TransactionDetail> details) { this.details = details; }
}