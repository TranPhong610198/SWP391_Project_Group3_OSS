<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .footer {
        background: #f8f9fa;
        padding: 50px 0 20px 0;
        color: #333;
    }
    
    .footer-content {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 30px;
        margin-bottom: 30px;
    }
    
    .footer-section h3 {
        margin-bottom: 20px;
        font-size: 18px;
        font-weight: bold;
        color: #333;
    }
    
    .footer-section ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    
    .footer-section ul li {
        margin-bottom: 10px;
    }
    
    .footer-section ul li a {
        color: #666;
        text-decoration: none;
        transition: color 0.3s;
    }
    
    .footer-section ul li a:hover {
        color: #ff4444;
    }
    
    .footer-bottom {
        text-align: center;
        padding-top: 20px;
        border-top: 1px solid #ddd;
    }

    .social-links a {
        display: inline-block;
        width: 35px;
        height: 35px;
        background: #333;
        color: white;
        text-align: center;
        line-height: 35px;
        border-radius: 50%;
        margin-right: 10px;
        transition: background 0.3s;
    }

    .social-links a:hover {
        background: #ff4444;
    }

    .contact-info i {
        width: 20px;
        margin-right: 10px;
        color: #666;
    }
</style>

<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <!-- Giới thiệu -->
            <div class="footer-section">
                <h3>Về chúng tôi</h3>
                <ul>
                    <li>SAVANI là thương hiệu thời trang nam được thành lập từ năm 2020, chuyên cung cấp các sản phẩm thời trang nam chất lượng cao.</li>
                    <li class="social-links mt-3">
                        <a href="https://www.facebook.com/Moriaty11"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                        <a href="#"><i class="fab fa-tiktok"></i></a>
                    </li>
                </ul>
            </div>

            <!-- Liên hệ -->
            <div class="footer-section">
                <h3>Thông tin liên hệ</h3>
                <ul class="contact-info">
                    <li><i class="fas fa-map-marker-alt"></i> 123 Đường ABC, Quận 1, TP.HCM</li>
                    <li><i class="fas fa-phone"></i> Hotline: 1900 1234</li>
                    <li><i class="fas fa-envelope"></i> Email: info@savani.com</li>
                    <li><i class="fas fa-clock"></i> Giờ làm việc: 8:00 - 22:00</li>
                </ul>
            </div>

            <!-- Chính sách -->
            <div class="footer-section">
                <h3>Chính sách</h3>
                <ul>
                    <li><a href="#">Chính sách bảo hành</a></li>
                    <li><a href="#">Chính sách đổi trả</a></li>
                    <li><a href="#">Chính sách bảo mật</a></li>
                    <li><a href="#">Điều khoản dịch vụ</a></li>
                    <li><a href="#">Hướng dẫn mua hàng</a></li>
                    <li><a href="#">Phương thức thanh toán</a></li>
                </ul>
            </div>

            <!-- Cửa hàng -->
            <div class="footer-section">
                <h3>Hệ thống cửa hàng</h3>
                <ul>
                    <li><strong>TP.HCM:</strong></li>
                    <li>- 123 Nguyễn Trãi, Q.1</li>
                    <li>- 456 Lê Văn Sỹ, Q.3</li>
                    <li><strong>Hà Nội:</strong></li>
                    <li>- 789 Láng Hạ, Q.Đống Đa</li>
                    <li>- 321 Cầu Giấy, Q.Cầu Giấy</li>
                </ul>
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>&copy; 2025 Đội Báo. Tất cả các quyền được bảo lưu.</p>
        </div>
    </div>
</footer>

<!-- Font Awesome cho icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">