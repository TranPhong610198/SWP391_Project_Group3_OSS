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
        <link href="assests/css/Header.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand" href="home">

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
                            <div class="user-menu">
                                <c:if test="${not empty sessionScope.acc}">
                                    <div class="dropdown">
                                        <button class="dropbtn">
                                            <img src="${sessionScope.acc.avatar}" alt="avatar" class="avatar-img" 
                                                 onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
                                            <div class="user-info">
                                                <span class="full-name">${sessionScope.acc.fullName}</span>
                                                <span class="username">${sessionScope.acc.username}</span>
                                            </div>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="logout">Đăng xuất</a>
                                            <a href="profile">Profile</a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${empty sessionScope.acc}">
                                    <div class="dropdown">
                                        <button class="dropbtn-guest">
                                            <i class="fas fa-user"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="login">Đăng nhập</a>
                                            <a href="register">Đăng ký</a>
                                        </div>
                                    </div>
                                </c:if>
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
