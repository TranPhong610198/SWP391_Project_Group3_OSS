<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán không thành công</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .container {
            padding-top: 50px;
            padding-bottom: 50px;
        }
        
        .failed-container {
            text-align: center;
            max-width: 600px;
            margin: 0 auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        
        .failed-icon {
            font-size: 70px;
            color: #dc3545;
            margin-bottom: 20px;
        }
        
        .failed-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .failed-message {
            font-size: 16px;
            color: #6c757d;
            margin-bottom: 30px;
        }
        
        .error-details {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
            text-align: left;
            border-left: 4px solid #dc3545;
        }
        
        .btn-action {
            margin: 5px;
            min-width: 180px;
        }
    </style>
</head>
<body>
    <div><jsp:include page="/header.jsp" /></div>
    
    <div class="container">
        <div class="failed-container">
            <div class="failed-icon">
                <i class="fas fa-times-circle"></i>
            </div>
            <h1 class="failed-title">Thanh toán không thành công</h1>
            <p class="failed-message">Đã xảy ra lỗi trong quá trình thanh toán. Vui lòng thử lại sau hoặc chọn phương thức thanh toán khác.</p>
            
            <c:if test="${not empty errorMessage}">
                <div class="error-details">
                    <p class="mb-0">${errorMessage}</p>
                </div>
            </c:if>
            
            <div class="d-flex justify-content-center">
                <a href="cartcontact" class="btn btn-primary btn-action">
                    <i class="fas fa-sync-alt me-2"></i> Thử lại
                </a>
                <a href="cartdetail" class="btn btn-outline-secondary btn-action">
                    <i class="fas fa-shopping-cart me-2"></i> Giỏ hàng
                </a>
            </div>
        </div>
    </div>
    
    <div><jsp:include page="/footer.jsp" /></div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>