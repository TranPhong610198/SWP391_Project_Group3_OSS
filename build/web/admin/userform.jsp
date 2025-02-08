<%-- 
    Document   : userform
    Created on : Feb 6, 2025, 5:16:51 PM
    Author     : VuxD4t
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create New User</title>
        <style>
            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }

            h1 {
                color: #333;
                text-align: center;
                margin-bottom: 30px;
            }

            form {
                background: #f5f5f5;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #333;
            }

            .form-group input,
            .form-group select,
            .form-group textarea {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .form-group input:focus,
            .form-group select:focus,
            .form-group textarea:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0,123,255,0.3);
            }

            .form-group input[type="file"] {
                padding: 5px;
                border: none;
                background: #fff;
            }

            .form-group textarea {
                height: 100px;
                resize: vertical;
            }

            .form-actions {
                margin-top: 20px;
                text-align: right;
            }

            button {
                background: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            button:hover {
                background: #0056b3;
            }

            .btn-cancel {
                display: inline-block;
                padding: 10px 20px;
                margin-left: 10px;
                text-decoration: none;
                color: #666;
                background: #eee;
                border-radius: 4px;
                transition: background 0.3s ease;
            }

            .btn-cancel:hover {
                background: #ddd;
            }

            .required::after {
                content: " *";
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Create New User</h1>
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>
            <c:if test="${not empty param.message}">
                <div class="alert alert-success" role="alert">
                    ${param.message}
                </div>
            </c:if>
            <form action="addUser" method="post">
                <div class="form-group">
                    <label class="required">Full Name:</label>
                    <input type="text" name="fullname" required>
                </div>
                <div class="form-group">
                    <label class="required">Username:</label>
                    <input type="username" name="username" placeholder="Tên đăng nhập" 
                           required minlength="4" maxlength="20" 
                           pattern="[A-Za-z0-9]+" 
                           title="Tên người dùng phải dài từ 4-20 ký tự và không được chứa ký tự đặc biệt." 
                           value="${username != null ? username : ''}">
                </div>
                <div class="form-group">
                    <label class="required">Password:</label>
                    <input type="password" name="password" placeholder="Mật khẩu" 
                           >
                </div>
                <div class="form-group">
                    <label class="required">Re-Password:</label>
                    <input type="password" name="repassword" placeholder="Nhập lại mật khẩu" required>
                </div>    
                <div class="form-group">
                    <label class="required">Email:</label>
                    <input type="email" name="email" required>
                </div>
                <div class="form-group">
                    <label class="required">Mobile:</label>
                    <input type="tel" name="phone" required
                           pattern="[0-9]{10}"
                           title="Số điện thoại phải có 10 chữ số">
                </div>    
                <div class="form-group">
                    <label class="required">Gender:</label>
                    <select name="gender" required>
                        <option value="male">Nam</option>
                        <option value="female">Nữ</option>
                        <option value="other">Khác</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="required">Role:</label>
                    <select name="role" required>
                        <option value="">Select Role</option>
                        <option value="customer">Customer</option>
                        <option value="admin">Admin</option>
                        <option value="sale">Sale</option>
                        <option value="marketing">Marketing</option>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit">Create User</button>
                    <a href="userlists" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </body>
</html>
