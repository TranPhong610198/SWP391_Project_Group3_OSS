package entity;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class DashboardStats {
    private Date startDate;
    private Date endDate;
    
    // Product stats
    private int totalProducts;
    private int activeProducts;
    private int outOfStockProducts;
    private Map<String, Integer> productsByCategory;
    
    // Inventory stats
    private int totalStock;
    private List<LowStockProduct> lowStockProducts;
    
    // Customer stats
    private int totalCustomers;
    private int activeCustomers;
    private Map<Date, Integer> newCustomersByDay;
    
    // Post stats
    private int totalPosts;
    private int publishedPosts;
    private int draftPosts;
    
    // Feedback stats
    private int totalFeedback;
    private double averageRating;
    private Map<Integer, Integer> feedbackByRating; // Map of rating -> count
    
    // Slider stats
    private int totalSliders;
    private int activeSliders;
    
    // Coupon stats
    private int totalCoupons;
    private int activeCoupons;
    private int expiredCoupons;
    private Map<String, Integer> couponUsage;

    // Thêm constructor không tham số
    public DashboardStats() {
        // Constructor không tham số
    }

    public DashboardStats(Date startDate, Date endDate, int totalProducts, int activeProducts, int outOfStockProducts, Map<String, Integer> productsByCategory, int totalStock, List<LowStockProduct> lowStockProducts, int totalCustomers, int activeCustomers, Map<Date, Integer> newCustomersByDay, int totalPosts, int publishedPosts, int draftPosts, int totalFeedback, double averageRating, Map<Integer, Integer> feedbackByRating, int totalSliders, int activeSliders, int totalCoupons, int activeCoupons, int expiredCoupons, Map<String, Integer> couponUsage) {
    this.startDate = startDate;
    this.endDate = endDate;
    this.totalProducts = totalProducts;
    this.activeProducts = activeProducts;
    this.outOfStockProducts = outOfStockProducts;
    this.productsByCategory = productsByCategory;
    this.totalStock = totalStock;
    this.lowStockProducts = lowStockProducts;
    this.totalCustomers = totalCustomers;
    this.activeCustomers = activeCustomers;
    this.newCustomersByDay = newCustomersByDay;
    this.totalPosts = totalPosts;
    this.publishedPosts = publishedPosts;
    this.draftPosts = draftPosts;
    this.totalFeedback = totalFeedback;
    this.averageRating = averageRating;
    this.feedbackByRating = feedbackByRating;
    this.totalSliders = totalSliders;
    this.activeSliders = activeSliders;
    this.totalCoupons = totalCoupons;
    this.activeCoupons = activeCoupons;
    this.expiredCoupons = expiredCoupons;
    this.couponUsage = couponUsage;
}
    
    public int getTotalProducts() {
        return totalProducts;
    }

    public void setTotalProducts(int totalProducts) {
        this.totalProducts = totalProducts;
    }

    public int getActiveProducts() {
        return activeProducts;
    }

    public void setActiveProducts(int activeProducts) {
        this.activeProducts = activeProducts;
    }

    public int getOutOfStockProducts() {
        return outOfStockProducts;
    }

    public void setOutOfStockProducts(int outOfStockProducts) {
        this.outOfStockProducts = outOfStockProducts;
    }

    public Map<String, Integer> getProductsByCategory() {
        return productsByCategory;
    }

    public void setProductsByCategory(Map<String, Integer> productsByCategory) {
        this.productsByCategory = productsByCategory;
    }

    public int getTotalStock() {
        return totalStock;
    }

    public void setTotalStock(int totalStock) {
        this.totalStock = totalStock;
    }

    public List<LowStockProduct> getLowStockProducts() {
        return lowStockProducts;
    }

    public void setLowStockProducts(List<LowStockProduct> lowStockProducts) {
        this.lowStockProducts = lowStockProducts;
    }

    public int getTotalCustomers() {
        return totalCustomers;
    }

    public void setTotalCustomers(int totalCustomers) {
        this.totalCustomers = totalCustomers;
    }

    public int getActiveCustomers() {
        return activeCustomers;
    }

    public void setActiveCustomers(int activeCustomers) {
        this.activeCustomers = activeCustomers;
    }

    public Map<Date, Integer> getNewCustomersByDay() {
        return newCustomersByDay;
    }

    public void setNewCustomersByDay(Map<Date, Integer> newCustomersByDay) {
        this.newCustomersByDay = newCustomersByDay;
    }

    public int getTotalPosts() {
        return totalPosts;
    }

    public void setTotalPosts(int totalPosts) {
        this.totalPosts = totalPosts;
    }

    public int getPublishedPosts() {
        return publishedPosts;
    }

    public void setPublishedPosts(int publishedPosts) {
        this.publishedPosts = publishedPosts;
    }

    public int getDraftPosts() {
        return draftPosts;
    }

    public void setDraftPosts(int draftPosts) {
        this.draftPosts = draftPosts;
    }

    public int getTotalFeedback() {
        return totalFeedback;
    }

    public void setTotalFeedback(int totalFeedback) {
        this.totalFeedback = totalFeedback;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public Map<Integer, Integer> getFeedbackByRating() {
        return feedbackByRating;
    }

    public void setFeedbackByRating(Map<Integer, Integer> feedbackByRating) {
        this.feedbackByRating = feedbackByRating;
    }

    public int getTotalSliders() {
        return totalSliders;
    }

    public void setTotalSliders(int totalSliders) {
        this.totalSliders = totalSliders;
    }

    public int getActiveSliders() {
        return activeSliders;
    }

    public void setActiveSliders(int activeSliders) {
        this.activeSliders = activeSliders;
    }

    public int getTotalCoupons() {
        return totalCoupons;
    }

    public void setTotalCoupons(int totalCoupons) {
        this.totalCoupons = totalCoupons;
    }

    public int getActiveCoupons() {
        return activeCoupons;
    }

    public void setActiveCoupons(int activeCoupons) {
        this.activeCoupons = activeCoupons;
    }

    public int getExpiredCoupons() {
        return expiredCoupons;
    }

    public void setExpiredCoupons(int expiredCoupons) {
        this.expiredCoupons = expiredCoupons;
    }

    public Map<String, Integer> getCouponUsage() {
        return couponUsage;
    }

    public void setCouponUsage(Map<String, Integer> couponUsage) {    
        this.couponUsage = couponUsage;
    }

    public Date getStartDate() {
        return startDate;
    }
    
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date getEndDate() {
        return endDate;
    }
    
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}