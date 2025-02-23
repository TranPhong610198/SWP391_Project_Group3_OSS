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
            /* Header.css */
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

            /* Global Styles */
            body {
                font-family: 'Poppins', sans-serif;
                padding-top: 80px;
            }

            /* Navbar Styles */
            .navbar {
                background: rgba(255, 255, 255, 0.98);
                padding: 15px 0;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
                transition: all 0.3s ease;
            }

            /* Container adjustment for balanced 20px padding on both sides */
            .container {
                padding-left: 20px;
                padding-right: 20px;
                max-width: 1400px; /* Giới hạn chiều rộng tối đa để cân đối */
                width: 100%;
                margin: 0 auto;
            }

            /* Logo and Navbar Brand */
            .navbar-brand {
                display: flex;
                align-items: center;
                padding: 0;
            }

            .navbar-brand img {
                height: 80px;
                width: auto;
                object-fit: contain;
                transition: transform 0.3s ease;
                margin: -15px 0;
            }

            .navbar-brand:hover img {
                transform: scale(1.05);
            }

            /* Main Navigation */
            .navbar-nav {
                flex-grow: 1; /* Cho phép navbar-nav giãn ra để cân đối */
                justify-content: center; /* Căn giữa các mục điều hướng */
                flex-wrap: nowrap;
            }

            .nav-link {
                color: #34495e;
                font-weight: 600;
                font-size: 16px;
                padding: 0.8rem 1.2rem !important;
                transition: all 0.3s ease;
                position: relative;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .nav-link::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                width: 0;
                height: 2px;
                background: #3498db;
                transition: all 0.3s ease;
                transform: translateX(-50%);
            }

            .nav-link:hover {
                color: #3498db;
            }

            .nav-link:hover::after {
                width: 70%;
            }

            /* Mega Menu */
            .mega-menu {
                background: rgba(255, 255, 255, 0.98);
                border-radius: 12px;
                padding: 25px;
                box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
                border-top: 3px solid #3498db;
                position: absolute;
                left: 0;
                width: 100%;
                min-width: 800px;
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
                color: #2c3e50;
                font-weight: 600;
                margin-bottom: 15px;
                padding-bottom: 10px;
                border-bottom: 2px solid #f1f1f1;
            }

            .mega-menu ul {
                list-style: none;
                padding: 0;
            }

            .mega-menu ul li a {
                color: #34495e;
                padding: 8px 0;
                display: block;
                transition: all 0.3s ease;
                text-decoration: none;
            }

            .mega-menu ul li a:hover {
                color: #3498db;
                transform: translateX(5px);
            }

            /* Search Form */
            .search-form {
                position: relative;
                margin-right: 15px; /* Giảm margin để cân đối với padding 20px */
            }

            .search-form input {
                width: 240px;
                padding: 10px 45px 10px 15px;
                border: 2px solid #e1e8ed;
                border-radius: 25px;
                font-size: 14px;
                transition: all 0.3s ease;
                background: #f8f9fa;
            }

            .search-form input:focus {
                border-color: #3498db;
                background: #fff;
                box-shadow: 0 0 10px rgba(52, 152, 219, 0.1);
            }

            .search-form button {
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #95a5a6;
                transition: all 0.3s ease;
                border: none;
                background: none;
            }

            .search-form button:hover {
                color: #3498db;
            }

            /* User Menu and Actions */
            .user-actions {
                display: flex;
                align-items: center;
                gap: 15px;
                flex-wrap: nowrap;
            }

            .user-menu {
                position: relative;
                display: inline-block;
                margin-left: 15px; /* Giảm margin để cân đối */
            }

            .dropbtn, .dropbtn-guest {
                background: #f8f9fa;
                border-radius: 25px;
                padding: 8px 16px;
                transition: all 0.3s ease;
                border: 2px solid #e1e8ed;
                cursor: pointer;
                display: flex;
                align-items: center;
            }

            .dropbtn:hover, .dropbtn-guest:hover {
                background: #fff;
                border-color: #3498db;
                box-shadow: 0 0 10px rgba(52, 152, 219, 0.1);
            }

            .avatar-img {
                width: 35px;
                height: 35px;
                border-radius: 50%;
                border: 2px solid #3498db;
                margin-right: 8px;
                object-fit: cover;
            }

            .user-info-header {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                margin-left: 8px;
            }

            .full-name {
                font-weight: 500;
                color: #34495e;
                font-size: 14px;
                max-width: 150px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            .username {
                font-size: 12px;
                color: #95a5a6;
                max-width: 150px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            .dropdown {
                position: relative;
                display: inline-block;
                min-width: fit-content;
            }

            .dropdown-content {
                position: absolute;
                background: #fff;
                min-width: 100%;
                white-space: nowrap;
                border-radius: 12px;
                box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
                margin-top: 10px;
                right: 0;
                display: none;
                z-index: 1001;
                overflow: hidden;
            }

            .dropdown-content::before {
                content: '';
                position: absolute;
                top: -10px;
                left: 0;
                width: 100%;
                height: 10px;
            }

            .dropdown:hover .dropdown-content,
            .dropdown:focus-within .dropdown-content,
            .dropdown-content:hover {
                display: block;
            }

            .dropdown-content a {
                padding: 12px 20px;
                color: #34495e;
                font-weight: 500;
                text-decoration: none;
                display: block;
                transition: all 0.3s ease;
            }

            .dropdown-content a:hover {
                background: #f8f9fa;
                color: #3498db;
            }

            /* Cart Icon */
            .cart-icon {
                position: relative;
                text-decoration: none;
                color: #34495e;
                font-size: 22px;
                padding: 8px;
                border-radius: 50%;
                transition: all 0.3s ease;
            }

            .cart-icon:hover {
                color: #3498db;
                background: #f8f9fa;
            }

            .cart-count {
                position: absolute;
                top: -8px;
                right: -8px;
                background: #3498db;
                color: #fff;
                font-size: 11px;
                font-weight: 600;
                min-width: 20px;
                height: 20px;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0 5px;
            }

            /* Responsive Adjustments */
            @media (max-width: 992px) {
                .container {
                    padding-left: 15px;
                    padding-right: 15px;
                }

                .user-info-header {
                    display: flex;
                    max-width: 150px;
                }

                .full-name, .username {
                    max-width: 150px;
                }

                .search-form input {
                    width: 200px;
                }
            }

            @media (max-width: 768px) {
                .navbar-nav {
                    text-align: center;
                    justify-content: center; /* Đảm bảo căn giữa trên mobile */
                }
                
                .user-actions {
                    justify-content: center;
                    margin-top: 15px;
                }
                
                .search-form {
                    margin: 15px auto;
                    width: 100%;
                    max-width: 300px;
                }
                
                .search-form input {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand" href="home">
                    <img src="${pageContext.request.contextPath}/uploads/logo/logoHuy.png" alt="Logo"/>
                </a>

                <!-- Navbar Toggle Button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Main Navigation -->
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <c:forEach items="${level1Categories}" var="level1">
                            <li class="nav-item">
                                <a class="nav-link" href="marketing/productlist?categoryId=${level1.id}">${level1.name}</a>
                                <div class="mega-menu">
                                    <div class="row">
                                        <c:forEach items="${level2ByParent[level1.id]}" var="level2">
                                            <div class="col-md-3">
                                                <h5><a href="marketing/productlist?categoryId=${level2.id}">${level2.name}</a></h5>
                                                <ul>
                                                    <c:forEach items="${level3ByParent[level2.id]}" var="level3">
                                                        <li><a href="marketing/productlist?categoryId=${level3.id}">${level3.name}</a></li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                        <li class="nav-item">
                            <a class="nav-link" href="DucChuaLam">Các bài đăng</a>
                        </li>
                    </ul>

                    <!-- Right Side Items -->
                    <div class="d-flex align-items-center justify-content-end">
                        <!-- Search Form -->
                        <form class="search-form" action="marketing/productlist" method="GET">
                            <input type="text" name="keyword" placeholder="Tìm kiếm...">
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
                                            <div class="user-info-header">
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

        <!-- Custom JavaScript for navbar toggle -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var navbarToggler = document.querySelector('.navbar-toggler');
                var navbarCollapse = document.querySelector('.navbar-collapse');

                navbarToggler.addEventListener('click', function () {
                    var isExpanded = navbarToggler.getAttribute('aria-expanded') === 'true';
                    navbarToggler.setAttribute('aria-expanded', !isExpanded);
                });

                document.addEventListener('click', function (event) {
                    var isClickInside = navbarCollapse.contains(event.target) || navbarToggler.contains(event.target);

                    if (!isClickInside && navbarCollapse.classList.contains('show')) {
                        navbarCollapse.classList.remove('show');
                        navbarToggler.classList.add('collapsed');
                        navbarToggler.setAttribute('aria-expanded', 'false');
                    }
                });

                var navLinks = document.querySelectorAll('.nav-link');
                navLinks.forEach(function (navLink) {
                    navLink.addEventListener('click', function () {
                        if (window.innerWidth < 992) {
                            navbarCollapse.classList.remove('show');
                            navbarToggler.classList.add('collapsed');
                            navbarToggler.setAttribute('aria-expanded', 'false');
                        }
                    });
                });
            });
        </script>
    </body>
</html>