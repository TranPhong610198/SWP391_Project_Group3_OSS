/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 *
 * @author DELL
 */
/**
 * Entity class representing sales overview statistics
 */
public class SalesOverview {
    private int pendingOrders;
    private int processingOrders;
    private int shippedOrders;
    private int completedOrders;
    private int cancelledOrders;
    private BigDecimal totalRevenue;
    private int totalSales;
    private int vipCustomers;
    private int normalCustomers;
    private int completedSalesQuantity;
    
    public SalesOverview() {
        this.totalRevenue = BigDecimal.ZERO;
        this.completedSalesQuantity = 0;
    }
    
    // Getters and Setters
    public int getPendingOrders() {
        return pendingOrders;
    }
    
    public void setPendingOrders(int pendingOrders) {
        this.pendingOrders = pendingOrders;
    }
    
    public int getProcessingOrders() {
        return processingOrders;
    }
    
    public void setProcessingOrders(int processingOrders) {
        this.processingOrders = processingOrders;
    }
    
    public int getShippedOrders() {
        return shippedOrders;
    }
    
    public void setShippedOrders(int shippedOrders) {
        this.shippedOrders = shippedOrders;
    }
    
    public int getCompletedOrders() {
        return completedOrders;
    }
    
    public void setCompletedOrders(int completedOrders) {
        this.completedOrders = completedOrders;
    }
    
    public int getCancelledOrders() {
        return cancelledOrders;
    }
    
    public void setCancelledOrders(int cancelledOrders) {
        this.cancelledOrders = cancelledOrders;
    }
    
    public BigDecimal getTotalRevenue() {
        return totalRevenue;
    }
    
    public void setTotalRevenue(BigDecimal totalRevenue) {
        this.totalRevenue = totalRevenue != null ? totalRevenue : BigDecimal.ZERO;
    }
    
    public int getTotalSales() {
        return totalSales;
    }
    
    public void setTotalSales(int totalSales) {
        this.totalSales = totalSales;
    }
    
    public int getVipCustomers() {
        return vipCustomers;
    }
    
    public void setVipCustomers(int vipCustomers) {
        this.vipCustomers = vipCustomers;
    }
    
    public int getNormalCustomers() {
        return normalCustomers;
    }
    
    public void setNormalCustomers(int normalCustomers) {
        this.normalCustomers = normalCustomers;
    }
    
    public int getTotalCustomers() {
        return vipCustomers + normalCustomers;
    }
    
    public int getCompletedSalesQuantity() {
        return completedSalesQuantity;
    }
    
    public void setCompletedSalesQuantity(int completedSalesQuantity) {
        this.completedSalesQuantity = completedSalesQuantity;
    }
}