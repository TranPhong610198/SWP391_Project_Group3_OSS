<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký tài khoản</title>
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
        <div class="container right-panel-active" id="main">
            <div class="sign-up">
                <form action="register" method="post">
                    <h1>Đăng ký tài khoản</h1>
                    <div class="social-container">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
&redirect_uri=http://localhost:9999/fashionshop/login
&response_type=code
&client_id=371802530617-nupp3tq4lnrphcd50jnj3r4e2j31suea.apps.googleusercontent.com
&approval_prompt=force" class="social"><i class="fab fa-google-plus-g"></i></a>
                    </div>
                    <p>hoặc sử dụng email của bạn để đăng ký</p>

                    <c:if test="${not empty error}">
                        <div style="color: red; margin-bottom: 10px;">
                            ${error}
                        </div>
                    </c:if>

                    <input type="text" name="fullname" placeholder="Họ và tên" required title="Vui lòng nhập họ và tên hợp lệ." 
                           value="${fullname != null ? fullname : ''}">
                    <input type="username" name="username" placeholder="Tên đăng nhập" required minlength="4" maxlength="20" 
                           pattern="[A-Za-z0-9]+" title="Tên người dùng phải dài từ 4-20 ký tự và không được chứa ký tự đặc biệt." 
                           value="${username != null ? username : ''}">
                    <input type="password" name="password" placeholder="Mật khẩu">
                    <input type="password" name="repassword" placeholder="Nhập lại mật khẩu" required>
                    <input type="email" name="email" placeholder="Email" required 
                           value="${email != null ? email : ''}">
                    <input type="tel" name="phone" placeholder="Số điện thoại" required 
                           pattern="(\+84|0)[1-9][0-9]{8,9}" title="Vui lòng nhập số điện thoại Việt Nam hợp lệ." 
                           value="${phone != null ? phone : ''}">
                    <div class="gender-wrapper">
                        <label>Giới tính:</label>
                        <label>
                            <input type="radio" name="gender" value="male" required 
                                   ${gender == 'male' ? 'checked' : ''}> Nam
                        </label>
                        <label>
                            <input type="radio" name="gender" value="female"
                                   ${gender == 'female' ? 'checked' : ''}> Nữ
                        </label>
                    </div>
                    <button>Đăng ký</button>
                </form>
            </div>

            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-left">
                        <h1>Chào mừng trở lại!</h1>
                        <p>Để giữ liên lạc với chúng tôi, vui lòng đăng nhập bằng thông tin cá nhân của bạn</p>
                        <button id="signIn">Đăng nhập</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            const signInButton = document.getElementById('signIn');
            signInButton.addEventListener('click', () => {
                main.classList.add("fade-out");
                setTimeout(() => {
                    window.location.href = `${pageContext.request.contextPath}/login`;
                }, 500);
            });
        </script>
    </body>
</html>