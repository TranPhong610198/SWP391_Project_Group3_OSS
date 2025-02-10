<%-- 
    Document   : sidebar
    Created on : Feb 9, 2025, 8:52:55 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Thêm style cho sidebar -->
        <style>
            /* Sidebar styles */
            .sidebar {
                position: fixed;
                left: 0;
                top: 0;
                bottom: 0;
                width: 250px;
                background: #2c3e50;
                color: #ecf0f1;
                transition: all 0.3s;
                z-index: 1000;
            }

            .sidebar-header {
                padding: 20px;
                background: #243342;
                text-align: center;
            }

            .sidebar-header img {
                width: 50px;
                height: 50px;
                border-radius: 10px;
            }

            .sidebar-menu {
                padding: 0;
                list-style: none;
            }

            .menu-item {
                position: relative;
            }

            .menu-item a {
                padding: 15px 20px;
                color: #ecf0f1;
                text-decoration: none;
                display: flex;
                align-items: center;
                transition: 0.3s;
            }

            .menu-item a:hover {
                background: #34495e;
                color: #3498db;
            }

            .menu-item.active a {
                background: #34495e;
                color: #3498db;
                border-left: 4px solid #3498db;
            }

            .menu-item i {
                margin-right: 10px;
                width: 20px;
                text-align: center;
            }

            .submenu {
                padding-left: 0;
                list-style: none;
                background: #243342;
                display: none;
            }

            .menu-item.active .submenu {
                display: block;
            }

            .submenu-item a {
                padding: 10px 20px 10px 56px;
                font-size: 0.9em;
            }

            /* Adjust main content */
            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .sidebar {
                    margin-left: -250px;
                }
                .sidebar.active {
                    margin-left: 0;
                }
                .main-content {
                    margin-left: 0;
                }
                .main-content.active {
                    margin-left: 250px;
                }
            }

            /* Toggle button */
            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
            }

            @media (max-width: 768px) {
                .sidebar-toggle {
                    display: block;
                }
            }

            /* User profile section */
            .user-profile {
                padding: 15px 20px;
                border-bottom: 1px solid #34495e;
                margin-bottom: 15px;
            }

            .user-profile img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .user-info {
                color: #ecf0f1;
                font-size: 0.9em;
            }

            .user-role {
                color: #95a5a6;
                font-size: 0.8em;
            }

            /* Notification badge */
            .notification-badge {
                position: absolute;
                top: 12px;
                right: 15px;
                background: #e74c3c;
                color: white;
                border-radius: 50%;
                padding: 2px 6px;
                font-size: 0.7em;
            }
        </style>
    </head>
    <body>

        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="sidebar-header">
            <!--Nhét cái logo vào bên dưới là đẹp rồi-->
            <!--<img src="/api/placeholder/50/50" alt="Logo">--> 
            <h5 class="mt-2 mb-0">Marketing Dashboard</h5>
        </div>

<!--         User Profile 
        <div class="user-profile d-flex align-items-center">
            <img src="/api/placeholder/40/40" alt="User Avatar">
            <div class="ms-2">
                <div class="user-info">John Doe</div>
                <div class="user-role">Marketing Manager</div>
            </div>
        </div>-->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="menu-item">
                <a href="dashboard">
                    <i class="fas fa-home"></i>
                    Dashboard
                </a>
            </li>

            <li class="menu-item active">
                <a href="listProducts">
                    <i class="fas fa-box"></i>
                    Quản lý sản phẩm
                </a>
            </li>

            <li class="menu-item">
                <a href="#campaignSubmenu" data-bs-toggle="collapse">
                    <i class="fas fa-bullhorn"></i>
                    Chiến dịch Marketing
                    <i class="fas fa-chevron-down ms-auto"></i>
                </a>
                <ul class="submenu collapse" id="campaignSubmenu">
                    <li class="submenu-item">
                        <a href="campaigns/email.jsp">Email Marketing</a>
                    </li>
                    <li class="submenu-item">
                        <a href="campaigns/social.jsp">Social Media</a>
                    </li>
                    <li class="submenu-item">
                        <a href="campaigns/seo.jsp">SEO</a>
                    </li>
                </ul>
            </li>

            <li class="menu-item">
                <a href="promotions.jsp">
                    <i class="fas fa-tags"></i>
                    Khuyến mãi
                    <span class="notification-badge">3</span>
                </a>
            </li>

            <li class="menu-item">
                <a href="analytics.jsp">
                    <i class="fas fa-chart-line"></i>
                    Phân tích dữ liệu
                </a>
            </li>

            <li class="menu-item">
                <a href="#contentSubmenu" data-bs-toggle="collapse">
                    <i class="fas fa-newspaper"></i>
                    Quản lý nội dung
                    <i class="fas fa-chevron-down ms-auto"></i>
                </a>
                <ul class="submenu collapse" id="contentSubmenu">
                    <li class="submenu-item">
                        <a href="content/blog.jsp">Blog</a>
                    </li>
                    <li class="submenu-item">
                        <a href="content/social-posts.jsp">Social Posts</a>
                    </li>
                    <li class="submenu-item">
                        <a href="content/newsletter.jsp">Newsletter</a>
                    </li>
                </ul>
            </li>

            <li class="menu-item">
                <a href="customer-feedback.jsp">
                    <i class="fas fa-comments"></i>
                    Phản hồi khách hàng
                </a>
            </li>

            <li class="menu-item">
                <a href="reports.jsp">
                    <i class="fas fa-file-alt"></i>
                    Báo cáo
                </a>
            </li>

            <li class="menu-item">
                <a href="settings.jsp">
                    <i class="fas fa-cog"></i>
                    Cài đặt
                </a>
            </li>
        </ul>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Add JavaScript for sidebar functionality -->
        <script>
            $(document).ready(function () {
                // Toggle sidebar
                $('.sidebar-toggle').on('click', function () {
                    $('.sidebar').toggleClass('active');
                    $('.main-content').toggleClass('active');
                    $('.sidebar-toggle').hide();
                });

                // Highlight active menu item
                $('.menu-item a').on('click', function () {
                    $('.menu-item').removeClass('active');
                    $(this).closest('.menu-item').addClass('active');
                });

                // Handle submenu
                $('.menu-item a[data-bs-toggle="collapse"]').on('click', function () {
                    $(this).find('.fas.fa-chevron-down').toggleClass('rotate-180');
                });

                // Close sidebar when clicking outside on mobile
                $(document).on('click', function (e) {
                    if ($(window).width() <= 768) {
                        if (!$(e.target).closest('.sidebar').length && !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });
            });
        </script>

    </body>
</html>
