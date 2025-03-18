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
public class OrderStatusCount {
    private LocalDate orderDate;
    private int pendingCount;
    private int processingCount;
    private int shippedCount;
    private int completedCount;
    private int cancelledCount;
    
    public OrderStatusCount() {
        this.pendingCount = 0;
        this.processingCount = 0;
        this.shippedCount = 0;
        this.completedCount = 0;
        this.cancelledCount = 0;
    }
    
    // Getters and Setters
    public LocalDate getOrderDate() {
        return orderDate;
    }
    
    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }
    
    public int getPendingCount() {
        return pendingCount;
    }
    
    public void setPendingCount(int pendingCount) {
        this.pendingCount = pendingCount;
    }
    
    public int getProcessingCount() {
        return processingCount;
    }
    
    public void setProcessingCount(int processingCount) {
        this.processingCount = processingCount;
    }
    
    public int getShippedCount() {
        return shippedCount;
    }
    
    public void setShippedCount(int shippedCount) {
        this.shippedCount = shippedCount;
    }
    
    public int getCompletedCount() {
        return completedCount;
    }
    
    public void setCompletedCount(int completedCount) {
        this.completedCount = completedCount;
    }
    
    public int getCancelledCount() {
        return cancelledCount;
    }
    
    public void setCancelledCount(int cancelledCount) {
        this.cancelledCount = cancelledCount;
    }
    
    public int getTotalCount() {
        return pendingCount + processingCount + shippedCount + completedCount + cancelledCount;
    }
}
