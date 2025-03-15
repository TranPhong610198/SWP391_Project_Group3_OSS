<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán thành công</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <meta http-equiv="refresh" content="10;url=orderdetail?id=${orderId}">
    <style>
        .container {
            padding: 50px 0;
        }
        
        .success-card {
            max-width: 700px;
            margin: 0 auto;
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .success-header {
            background-color: #28a745;
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .success-icon {
            font-size: 50px;
            margin-bottom: 10px;
        }
        
        .success-title {
            font-weight: 700;
            margin-bottom: 0;
        }
        
        .success-body {
            padding: 30px;
        }
        
        .order-summary {
            border: 1px solid #e9ecef;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
        }
        
        .order-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .order-row:last-child {
            border-bottom: none;
        }
        
        .label {
            font-weight: 600;
            color: #495057;
        }
        
        .value {
            color: #212529;
        }
        
        .value-success {
            color: #28a745;
            font-weight: 600;
        }
        
        .timeline {
            margin-bottom: 30px;
        }
        
        .timeline-item {
            position: relative;
            padding-left: 30px;
            padding-bottom: 20px;
        }
        
        .timeline-item:before {
            content: "";
            position: absolute;
            left: 0;
            top: 5px;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background-color: #28a745;
        }
        
        .timeline-item:after {
            content: "";
            position: absolute;
            left: 7px;
            top: 20px;
            bottom: 0;
            width: 2px;
            background-color: #dee2e6;
        }
        
        .timeline-item:last-child:after {
            display: none;
        }
        
        .timeline-title {
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .timeline-text {
            color: #6c757d;
            margin-bottom: 0;
            font-size: 14px;
        }
        
        .btn-section {
            text-align: center;
            margin-top: 20px;
        }
        
        .btn-primary {
            padding: 10px 25px;
        }
        
        .redirect-message {
            text-align: center;
            color: #6c757d;
            font-size: 14px;
            margin-top: 15px;
        }
        
        .countdown {
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div><jsp:include page="/header.jsp" /></div>
    
    <div class="container">
        <div class="card success-card">
            <div class="success-header">
                <div class="success-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h2 class="success-title">Thanh toán thành công</h2>
            </div>
            
            <div class="success-body">
                <p class="text-center mb-4">
                    Cảm ơn quý khách đã đặt hàng. Đơn hàng của quý khách đã được thanh toán thành công và đang được xử lý.
                </p>
                
                <div class="order-summary">
                    <h5 class="mb-3">Thông tin đơn hàng</h5>
                    
                    <div class="order-row">
                        <div class="label">Mã đơn hàng:</div>
                        <div class="value">${orderCode}</div>
                    </div>
                    
                    <div class="order-row">
                        <div class="label">Ngày đặt hàng:</div>
                        <div class="value">
                            <jsp:useBean id="now" class="java.util.Date"/>
                            <fmt:formatDate value="${now}" pattern="dd/MM/yyyy HH:mm:ss"/>
                        </div>
                    </div>
                    
                    <div class="order-row">
                        <div class="label">Phương thức thanh toán:</div>
                        <div class="value">Thanh toán trực tuyến (VNPay)</div>
                    </div>
                    
                    <div class="order-row">
                        <div class="label">Trạng thái thanh toán:</div>
                        <div class="value-success">Đã thanh toán</div>
                    </div>
                    
                    <div class="order-row">
                        <div class="label">Tổng tiền:</div>
                        <div class="value">
                            <c:if test="${not empty order}">
                                <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                            </c:if>
                        </div>
                    </div>
                </div>
                
                <div class="timeline">
                    <h5 class="mb-3">Tiến trình đơn hàng</h5>
                    
                    <div class="timeline-item">
                        <div class="timeline-title">Đặt hàng thành công</div>
                        <p class="timeline-text">
                            <jsp:useBean id="orderDate" class="java.util.Date"/>
                            <fmt:formatDate value="${orderDate}" pattern="dd/MM/yyyy HH:mm:ss"/>
                        </p>
                    </div>
                    
                    <div class="timeline-item">
                        <div class="timeline-title">Thanh toán hoàn tất</div>
                        <p class="timeline-text">
                            <jsp:useBean id="paymentDate" class="java.util.Date"/>
                            <fmt:formatDate value="${paymentDate}" pattern="dd/MM/yyyy HH:mm:ss"/>
                        </p>
                    </div>
                    
                    <div class="timeline-item">
                        <div class="timeline-title">Đang xử lý</div>
                        <p class="timeline-text">Đơn hàng của bạn đang được xử lý</p>
                    </div>
                </div>
                
                <div class="btn-section">
                    <a href="orderdetail?id=${orderId}" class="btn btn-primary">
                        <i class="fas fa-clipboard-list me-2"></i>Chi tiết đơn hàng
                    </a>
                </div>
                
                <p class="redirect-message">
                    Bạn sẽ được chuyển đến trang chi tiết đơn hàng trong <span id="countdown" class="countdown">10</span> giây
                </p>
            </div>
        </div>
    </div>
    
    <div><jsp:include page="/footer.jsp" /></div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Countdown timer
        let seconds = 10;
        const countdownElement = document.getElementById('countdown');
        
        const countdownTimer = setInterval(function() {
            seconds--;
            countdownElement.textContent = seconds;
            
            if (seconds <= 0) {
                clearInterval(countdownTimer);
            }
        }, 1000);
    </script>
</body>
</html>