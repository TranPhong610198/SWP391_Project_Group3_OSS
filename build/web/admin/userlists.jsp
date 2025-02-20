<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý người dùng</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
                --hover-color: #f8f9fa;
            }

            body {
                background-color: #f8f9fa;
            }

            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 20px;
                min-height: 100vh;
            }

            .card {
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                border: 1px solid var(--border-color);
                margin-bottom: 20px;
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 15px 20px;
                font-weight: 600;
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .filter-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .search-box {
                border-radius: 50px;
                padding-left: 15px;
                border: 1px solid var(--border-color);
            }

            .sort-link {
                text-decoration: none;
                color: var(--primary-color);
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .sort-link:hover {
                color: var(--accent-color);
            }

            .table {
                margin-bottom: 0;
            }

            .table th {
                font-weight: 600;
                border-top: none;
                background-color: rgba(52, 152, 219, 0.05);
                vertical-align: middle;
            }

            .table td {
                vertical-align: middle;
            }

            .table tbody tr:hover {
                background-color: var(--hover-color);
            }

            .badge {
                padding: 6px 12px;
                border-radius: 50px;
            }

            .btn-action {
                padding: 5px 10px;
                margin: 0 2px;
            }

            .pagination .page-link {
                color: var(--primary-color);
                border: 1px solid var(--border-color);
                min-width: 40px;
                text-align: center;
                margin: 0 3px;
            }

            .pagination .page-item.active .page-link {
                background-color: var(--accent-color);
                border-color: var(--accent-color);
                color: white;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .sidebar-toggle {
                    display: block;
                }
            }

            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
                border-radius: 50%;
                width: 42px;
                height: 42px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            @media (max-width: 768px) {
                .sidebar-toggle {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
            }
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="/admin/adminsidebar.jsp" />

        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-users me-2"></i>Quản lý người dùng
                </h2>

                <!-- Filter Section -->
                <div class="card filter-card">
                    <div class="card-header">
                        <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="userlists" method="get" class="row g-3">
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-text bg-white">
                                        <i class="fas fa-search text-muted"></i>
                                    </span>
                                    <input type="text" name="search" value="${search}" class="form-control search-box" 
                                           placeholder="Tìm kiếm theo tên, email, số điện thoại">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <select name="gender" class="form-select">
                                    <option value="">Tất cả giới tính</option>
                                    <option value="Male" ${gender == 'Male' ? 'selected' : ''}>Nam</option>
                                    <option value="Female" ${gender == 'Female' ? 'selected' : ''}>Nữ</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select name="role" class="form-select">
                                    <option value="">Tất cả vai trò</option>
                                    <option value="Admin" ${role == 'Admin' ? 'selected' : ''}>Admin</option>
                                    <option value="Customer" ${role == 'Customer' ? 'selected' : ''}>Customer</option>
                                    <option value="Sale" ${role == 'Sale' ? 'selected' : ''}>Sale</option>
                                    <option value="Marketing" ${role == 'Marketing' ? 'selected' : ''}>Marketing</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select name="status" class="form-select">
                                    <option value="">Tất cả trạng thái</option>
                                    <option value="Active" ${status == 'Active' ? 'selected' : ''}>Active</option>
                                    <option value="Inactive" ${status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                                    <option value="Pending" ${status == 'Pending' ? 'selected' : ''}>Pending</option>
                                </select>
                            </div>

                            <div class="col-md-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-filter me-2"></i>Lọc
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Users Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <i class="fas fa-list me-2"></i>Danh sách người dùng
                        </div>
                        <div>
                            <a href="exporttoexcel" class="btn btn-success btn-sm me-2">
                                <i class="fas fa-file-excel me-2"></i>Xuất Excel
                            </a>
                            <a href="exporttopdf" class="btn btn-danger btn-sm me-2">
                                <i class="fas fa-file-pdf me-2"></i>Xuất PDF
                            </a>
                            <a href="addUser" class="btn btn-primary btn-sm">
                                <i class="fas fa-user-plus me-2"></i>Thêm người dùng mới
                            </a>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead>
                                    <tr class="bg-light">
                                        <th class="text-center" style="width: 60px;">STT</th>
                                        <th>
                                            <a href="userlists?sortField=full_name&sortDir=${sortField == 'full_name' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&role=${role}&status=${status}&search=${search}" 
                                               class="sort-link">
                                                Tên
                                                <span class="sort-icons">
                                                    ${sortField == 'full_name' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="userlists?sortField=username&sortDir=${sortField == 'username' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&role=${role}&status=${status}&search=${search}"
                                               class="sort-link">
                                                Tên đăng nhập
                                                <span class="sort-icons">
                                                    ${sortField == 'username' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="userlists?sortField=gender&sortDir=${sortField == 'gender' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&role=${role}&status=${status}&search=${search}"
                                               class="sort-link">
                                                Giới tính
                                                <span class="sort-icons">
                                                    ${sortField == 'gender' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="userlists?sortField=email&sortDir=${sortField == 'email' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&role=${role}&status=${status}&search=${search}"
                                               class="sort-link">
                                                Email
                                                <span class="sort-icons">
                                                    ${sortField == 'email' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="userlists?sortField=mobile&sortDir=${sortField == 'mobile' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&role=${role}&status=${status}&search=${search}"
                                               class="sort-link">
                                                Số điện thoại
                                                <span class="sort-icons">
                                                    ${sortField == 'mobile' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="userlists?sortField=role&sortDir=${sortField == 'role' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&role=${role}&status=${status}&search=${search}"
                                               class="sort-link">
                                                Vai trò
                                                <span class="sort-icons">
                                                    ${sortField == 'role' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th>
                                            <a href="userlists?sortField=status&sortDir=${sortField == 'status' && sortDir == 'asc' ? 'desc' : 'asc'}&page=${currentPage}&gender=${gender}&role=${role}&status=${status}&search=${search}"
                                               class="sort-link">
                                                Trạng thái
                                                <span class="sort-icons">
                                                    ${sortField == 'status' ? (sortDir == 'asc' ? '<i class="fas fa-sort-up"></i>' : '<i class="fas fa-sort-down"></i>') : '<i class="fas fa-sort text-muted"></i>'}
                                                </span>
                                            </a>
                                        </th>
                                        <th class="text-center">Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty users}">
                                            <c:forEach var="user" items="${users}" varStatus="status">
                                                <tr>
                                                    <td class="text-center">${status.index + 1 + (currentPage - 1) * 10}</td>
                                                    <td>${user.fullName}</td>
                                                    <td>${user.username}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${user.gender == 'male' or user.gender == 'Male'}">Nam</c:when>
                                                            <c:when test="${user.gender == 'female' or user.gender == 'Female'}">Nữ</c:when>
                                                            <c:otherwise>Khác</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${user.email}</td>
                                                    <td>${user.mobile}</td>
                                                    <td><span class="badge bg-secondary rounded-pill">${user.role}</span></td>
                                                    <td>
                                                        <span class="badge bg-${user.status == 'active' ? 'success' : (user.status == 'inactive' ? 'danger' : 'warning')}">
                                                            ${user.status}
                                                        </span>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="userdetail/edit?id=${user.id}" class="btn btn-primary btn-sm btn-action">
                                                            <i class="fas fa-edit"></i>
                                                        </a>
                                                        <a href="userdetail/delete?id=${user.id}" class="btn btn-danger btn-sm btn-action"
                                                           onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này không?');">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="9" class="text-center p-4">
                                                    <i class="fas fa-user-slash fa-3x mb-3 text-muted"></i>
                                                    <p class="text-muted">Không tìm thấy người dùng nào. Vui lòng thử lại với điều kiện tìm kiếm khác.</p> 
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <div class="d-flex justify-content-center align-items-center mt-3">

                    <nav>
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="userlists?page=${currentPage-1}&gender=${gender}&role=${role}&status=${status}&search=${search}&sortField=${sortField}&sortDir=${sortDir}">
                                        <i class="fas fa-chevron-left"></i>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="userlists?page=${i}&gender=${gender}&role=${role}&status=${status}&search=${search}&sortField=${sortField}&sortDir=${sortDir}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="userlists?page=${currentPage+1}&gender=${gender}&role=${role}&status=${status}&search=${search}&sortField=${sortField}&sortDir=${sortDir}">
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                               $(document).ready(function () {
                                   // Toggle sidebar
                                   $('.sidebar-toggle').on('click', function () {
                                       $('.sidebar').toggleClass('active');
                                       $('.main-content').toggleClass('active');
                                       $(this).hide();
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

                                   // Highlight active menu item
                                   $('.menu-item').removeClass('active');
                                   $('.menu-item a[href="userlists"]').closest('.menu-item').addClass('active');

                                   // Initialize tooltips
                                   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                                   var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                                       return new bootstrap.Tooltip(tooltipTriggerEl)
                                   });
                               });
        </script>
    </body>
</html>