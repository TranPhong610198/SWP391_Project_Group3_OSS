<%-- 
    Document   : resetPassword
    Created on : Feb 9, 2025, 11:40:15 AM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quên Mật Khẩu</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .forgot-password-container {
                min-height: 100vh;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            }
            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
            }
            .form-control {
                border-radius: 10px;
                padding: 12px;
                margin-bottom: 20px;
            }
            .btn-primary {
                border-radius: 10px;
                padding: 12px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border: none;
                font-weight: bold;
            }
            .btn-primary:hover {
                background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
                transform: translateY(-2px);
                transition: all 0.3s ease;
            }
            .card-header {
                background: none;
                border-bottom: none;
                padding-bottom: 0;
            }
            .form-icon {
                font-size: 3rem;
                color: #764ba2;
                margin-bottom: 1rem;
            }
        </style>
    </head>
    <body>
        <div class="forgot-password-container d-flex align-items-center justify-content-center py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-5 mb-4">
                        <div class="card">
                            <div class="card-header text-center pt-4">
                                <i class="fas fa-envelope form-icon"></i>
                                <h3 class="fw-bold">Xác Nhận Email</h3>
                                <p class="text-muted">Nhập email của bạn để nhận mã xác nhận</p>
                                <c:if test="${!mess.isEmpty()}">
                                    <c:if test="${mess.equals('Hệ thống đã gửi email xác nhận, vui lòng kiểm tra hộp thư.')}">
                                        <p style="color: green; margin-bottom: 10px;">
                                            ${mess}
                                        </p>
                                    </c:if>
                                    <c:if test="${!(mess.equals('Hệ thống đã gửi email xác nhận, vui lòng kiểm tra hộp thư.'))}">
                                        <p style="color: red; margin-bottom: 10px;">
                                            ${mess}
                                        </p>
                                    </c:if>
                                </c:if>
                            </div>
                            <div class="card-body p-4">
                                <form action="forgotpassword" method="POST">
                                    <div class="mb-3">
                                        <input type="email" class="form-control" name="email" 
                                               placeholder="Nhập địa chỉ email" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100">
                                        Gửi Mã Xác Nhận
                                    </button>
                                </form>
                                <div class="text-center mt-3">
                                    <a href="login" class="text-decoration-none">Quay lại đăng nhập</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    <!--    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Forgot Password</title>
    </head>
    <body class="bg-light d-flex align-items-center justify-content-center vh-100">
    <div class="card shadow-sm p-4 w-100" style="max-width: 400px;">
        <h2 class="text-center mb-4">Quên mật khẩu</h2>
        <form action="sendResetLink" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email: </label>
                <input type="email" id="email" name="email" class="form-control" placeholder="Nhập email của bạn" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Gửi yêu cầu</button>
        </form>
    </div>
</body>-->
</html>
