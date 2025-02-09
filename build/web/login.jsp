<%-- 
    Document   : login
    Created on : Jan 24, 2025, 4:33:31 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập</title>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assests/css/LoginRegister.css">
    </head>
    <style>
        .fade-out {
            opacity: 0;
            transition: opacity 0.5s ease-out;
        }
    </style>
    <body>
        <div class="container" id="main">
            <div class="sign-in">
                <form action="login" method="post">
                    <h1>Đăng nhập</h1>
                    <div class="social-container">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
&redirect_uri=http://localhost:9999/fashionshop/login
&response_type=code
&client_id=371802530617-nupp3tq4lnrphcd50jnj3r4e2j31suea.apps.googleusercontent.com
&approval_prompt=force" class="social"><i class="fab fa-google-plus-g"></i></a>
                    </div>
                    <p>hoặc sử dụng tài khoản của bạn</p>

                    <c:if test="${not empty mess}">
                        <div class="error-message" style="color: red; margin-bottom: 10px;">
                            ${mess}
                        </div>
                    </c:if>
                    <input type="text" name="username" placeholder="Tên đăng nhập" required="">
                    <input type="password" name="password" placeholder="Mật khẩu" required="">
                    <a href="requestEmail">Quên mật khẩu?</a>
                    <button>Đăng nhập</button>
                </form>
            </div>

            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-right">
                        <h1>Xin chào quý khách</h1>
                        <p>Nhập thông tin cá nhân của bạn và bắt đầu mua sắm tại cửa hàng của chúng tôi</p>
                        <button id="signUp">Đăng ký</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            const signUpButton = document.getElementById('signUp');
            signUpButton.addEventListener('click', () => {
                main.classList.add("fade-out");
                setTimeout(() => {
                    window.location.href = `${pageContext.request.contextPath}/register`;
                }, 500);
            });
        </script>
    </body>
</html>
