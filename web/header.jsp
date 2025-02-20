<%-- 
    Document   : header
    Created on : Feb 18, 2025, 12:17:17 AM
    Author     : VuxD4t
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Header</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .navbar {
                padding: 0;
                background: #fff;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .navbar-brand img {
                height: 50px;
            }

            .nav-item {
                position: relative;
            }

            .nav-link {
                color: #333;
                font-weight: 500;
                padding: 1rem 1.5rem !important;
            }

            .mega-menu {
                position: absolute;
                left: 0;
                width: 100%;
                min-width: 800px;
                background: #fff;
                padding: 20px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                opacity: 0;
                visibility: hidden;
                transition: all 0.3s ease;
                z-index: 1000;
            }

            .nav-item:hover .mega-menu {
                opacity: 1;
                visibility: visible;
            }

            .mega-menu h5 {
                color: #333;
                font-size: 16px;
                font-weight: 600;
                margin-bottom: 15px;
            }

            .mega-menu ul {
                list-style: none;
                padding: 0;
            }

            .mega-menu ul li {
                margin-bottom: 8px;
            }

            .mega-menu ul li a {
                color: #666;
                text-decoration: none;
                font-size: 14px;
                transition: color 0.3s ease;
            }

            .mega-menu ul li a:hover {
                color: #ff4444;
            }

            .search-form {
                position: relative;
            }

            .search-form input {
                width: 200px;
                padding: 8px 15px;
                border: 1px solid #ddd;
                border-radius: 20px;
                outline: none;
            }

            .search-form button {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                border: none;
                background: none;
                color: #666;
            }

            .user-actions a {
                color: #333;
                text-decoration: none;
                margin-left: 20px;
            }

            .cart-count {
                position: absolute;
                top: -8px;
                right: -8px;
                background: #ff4444;
                color: #fff;
                font-size: 12px;
                padding: 2px 6px;
                border-radius: 50%;
            }
            body {
                padding-top: 70px; /* Điều chỉnh để tránh nội dung bị che */
            }
            .user-dropdown {
                position: relative;
                display: inline-block;
                margin-right: 15px;
            }

            .user-dropdown .fa-user {
                font-size: 20px;
                color: #666;
            }

            .user-dropdown-content {
                display: none;
                position: absolute;
                right: 0;
                top: 100%;
                background-color: #fff;
                min-width: 160px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                border-radius: 4px;
                padding: 8px 0;
                z-index: 1000;
            }

            .user-dropdown:hover .user-dropdown-content {
                display: block;
            }

            .user-dropdown-content a {
                color: #333;
                padding: 8px 16px;
                text-decoration: none;
                display: block;
                font-size: 14px;
            }

            .user-dropdown-content a:hover {
                background-color: #f5f5f5;
            }

            /* Style cho cart icon */
            .cart-icon {
                position: relative;
                display: inline-block;
            }

            .cart-count {
                position: absolute;
                top: -8px;
                right: -8px;
                background: #ff4444;
                color: #fff;
                font-size: 12px;
                padding: 0 5px;
                border-radius: 50%;
                min-width: 18px;
                height: 18px;
                text-align: center;
                line-height: 18px;
            }

            .search-form {
                position: relative;
                margin-right: 15px;
            }

            .search-form input {
                padding: 8px 15px;
                border: 1px solid #ddd;
                border-radius: 20px;
                width: 200px;
                outline: none;
            }

            .user-actions {
                display: flex;
                align-items: center;
            }

            .fa-shopping-cart {
                font-size: 20px;
                color: #666;
            }

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand" href="#">

                    <img src="/fashionshop/uploads/logo/logoHuy.png" alt="Logo"/>
                </a>

                <!-- Navbar Toggle Button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Main Navigation -->
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <!-- NAM -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">NAM</a>
                            <div class="mega-menu">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h5>ÁO</h5>
                                        <ul>
                                            <li><a href="#">Áo Polo</a></li>
                                            <li><a href="#">Áo Măng Tô</a></li>
                                            <li><a href="#">Áo Gile</a></li>
                                            <li><a href="#">Áo T-Shirt</a></li>
                                            <li><a href="#">Áo Sơ Mi</a></li>
                                            <li><a href="#">Áo Ba Lỗ</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3">
                                        <h5>QUẦN</h5>
                                        <ul>
                                            <li><a href="#">Quần Âu</a></li>
                                            <li><a href="#">Quần Nỉ</a></li>
                                            <li><a href="#">Quần Jean</a></li>
                                            <li><a href="#">Quần Kaki</a></li>
                                            <li><a href="#">Quần Gió</a></li>
                                            <li><a href="#">Quần Đùi</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3">
                                        <h5>ĐỒ BỘ</h5>
                                        <ul>
                                            <li><a href="#">Bộ Vest</a></li>
                                            <li><a href="#">Bộ Đồ Hè</a></li>
                                            <li><a href="#">Bộ Nỉ</a></li>
                                            <li><a href="#">Bộ Gió</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3">
                                        <h5>PHỤ KIỆN</h5>
                                        <ul>
                                            <li><a href="#">Giày Da</a></li>
                                            <li><a href="#">Ví Da</a></li>
                                            <li><a href="#">Thắt Lưng</a></li>
                                            <li><a href="#">Cà Vạt</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <!-- NỮ -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">NỮ</a>
                            <!-- Tương tự như menu NAM -->
                        </li>

                        <!-- TRẺ EM -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">TRẺ EM</a>
                        </li>

                        <!-- ĐỒNG PHỤC -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">ĐỒNG PHỤC</a>
                        </li>

                        <!-- BỘ SƯU TẬP -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">BỘ SƯU TẬP</a>
                        </li>

                        <!-- SALE OFF -->
                        <li class="nav-item">
                            <a class="nav-link" href="#">SALE OFF</a>
                        </li>
                    </ul>

                    <!-- Right Side Items -->
                    <div class="d-flex align-items-center">
                        <!-- Search Form -->
                        <form class="search-form">
                            <input type="text" placeholder="Tìm kiếm...">
                            <button type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>

                        <!-- User Actions -->
                        <div class="user-actions">
    <!-- User Profile/Login -->
    <div class="user-dropdown">
        <a href="#" class="position-relative">
            <i class="fas fa-user"></i>
        </a>
        <div class="user-dropdown-content">
            <c:choose>
                <c:when test="${not empty sessionScope.acc}">
                    <!-- Hiển thị khi đã đăng nhập -->
                    <a href="profile"><i class="fas fa-user-circle"></i> Profile</a>
                    <a href="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                </c:when>
                <c:otherwise>
                    <!-- Hiển thị khi chưa đăng nhập -->
                    <a href="login"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a>
                    <a href="register"><i class="fas fa-user-plus"></i> Đăng ký</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- Cart -->
    <a href="cartdetail" class="cart-icon">
        <i class="fas fa-shopping-cart"></i>
        <span class="cart-count">0</span>
    </a>
</div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Font Awesome for icons -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
