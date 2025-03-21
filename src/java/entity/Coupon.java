/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author nguye
 */
import java.sql.Timestamp;

public class Coupon {
    private int id;
    private String code;
    private String discount_type;
    private double discount_value;
    private double min_order_amount;
    private double max_discount;
    private int usage_limit;
    private int used_count;
    private Timestamp expiry_date;  
    private Timestamp activation_date;  
    private Timestamp created_at; 
    private String couponType;
    private String status;

    public Coupon() {
    }

    public Coupon(int id, String code, String discount_type, double discount_value, double min_order_amount, double max_discount, 
                  int usage_limit, int used_count, Timestamp expiry_date, Timestamp activation_date, Timestamp created_at, String couponType, String status) {
        this.id = id;
        this.code = code;
        this.discount_type = discount_type;
        this.discount_value = discount_value;
        this.min_order_amount = min_order_amount;
        this.max_discount = max_discount;
        this.usage_limit = usage_limit;
        this.used_count = used_count;
        this.expiry_date = expiry_date;
        this.activation_date = activation_date;
        this.created_at = created_at;
        this.couponType = couponType;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDiscount_type() {
        return discount_type;
    }

    public void setDiscount_type(String discount_type) {
        this.discount_type = discount_type;
    }

    public double getDiscount_value() {
        return discount_value;
    }

    public void setDiscount_value(double discount_value) {
        this.discount_value = discount_value;
    }

    public double getMin_order_amount() {
        return min_order_amount;
    }

    public void setMin_order_amount(double min_order_amount) {
        this.min_order_amount = min_order_amount;
    }

    public double getMax_discount() {
        return max_discount;
    }

    public void setMax_discount(double max_discount) {
        this.max_discount = max_discount;
    }

    public int getUsage_limit() {
        return usage_limit;
    }

    public void setUsage_limit(int usage_limit) {
        this.usage_limit = usage_limit;
    }

    public int getUsed_count() {
        return used_count;
    }

    public void setUsed_count(int used_count) {
        this.used_count = used_count;
    }

    public Timestamp getExpiry_date() {
        return expiry_date;
    }

    public void setExpiry_date(Timestamp expiry_date) {
        this.expiry_date = expiry_date;
    }

    public Timestamp getActivation_date() {
        return activation_date;
    }

    public void setActivation_date(Timestamp activation_date) {
        this.activation_date = activation_date;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public String getCouponType() {
        return couponType;
    }

    public void setCouponType(String couponType) {
        this.couponType = couponType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Coupon{" + "id=" + id + ", code=" + code + ", discount_type=" + discount_type + ", discount_value=" + discount_value + ", min_order_amount=" + min_order_amount + ", max_discount=" + max_discount + ", usage_limit=" + usage_limit + ", used_count=" + used_count + ", expiry_date=" + expiry_date + ", activation_date=" + activation_date + ", created_at=" + created_at + ", couponType=" + couponType + ", status=" + status + '}';
    }
}
