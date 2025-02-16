/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author nguye
 */
public class Variant {
    private int id;
    private int productId;
    private Color color;
    private Size size;
    private int quantity;
    private Date lastRestockDate;

    public Variant(int id, int productId, Color color, Size size, int quantity, Date lastRestockDate) {
        this.id = id;
        this.productId = productId;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
        this.lastRestockDate = lastRestockDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getLastRestockDate() {
        return lastRestockDate;
    }

    public void setLastRestockDate(Date lastRestockDate) {
        this.lastRestockDate = lastRestockDate;
    }

    @Override
    public String toString() {
        return "Variant{" + "id=" + id + ", productId=" + productId + ", color=" + color + ", size=" + size + ", quantity=" + quantity + ", lastRestockDate=" + lastRestockDate + '}';
    }
    
    
}
