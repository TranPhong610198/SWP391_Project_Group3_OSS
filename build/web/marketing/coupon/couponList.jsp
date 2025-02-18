<%-- 
    Document   : couponList
    Created on : Feb 18, 2025, 8:59:00 PM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách Coupon</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Copy styles từ listInventory.jsp của bạn vào đây */
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

            .sort-icons {
                margin-left: 5px;
            }

            /* Main content styles */
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

            .action-btn {
                padding: 5px 15px;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .action-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .btn-view {
                background-color: var(--accent-color);
                color: white;
            }

            .btn-view:hover {
                background-color: #2980b9;
                color: white;
            }

            .search-box {
                border-radius: 50px;
                padding-left: 15px;
                border: 1px solid var(--border-color);
            }

            .search-btn {
                border-radius: 50px;
                padding: 8px 20px;
            }

            .filter-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .sidebar {
                    left: -250px;
                }
                .sidebar.active {
                    left: 0;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="../sidebar.jsp" />
        <div class="main-content">
            <div class="container-fluid">
                <h2 class="page-title">
                    <i class="fas fa-tags me-2"></i>Danh sách mã giảm giá
                </h2>

                <div class="card">
                    <div class="card-header">
                        Bộ lọc tìm kiếm
                    </div>
                    <div class="card-body">
                        <form action="CouponList" method="get">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <div class="input-group">
                                            <span class="input-group-text bg-white">
                                                <i class="fas fa-search text-muted"></i>
                                            </span>
                                            <input type="text" name="searchCode" value="${searchCode}" class="form-control search-box" placeholder="Tìm kiếm mã...">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="mb-3">
                                        <select class="form-select" id="filterType" name="filterType">
                                            <option value="">Tất cả loại giảm giá</option>
                                            <option value="percentage" ${filterType == 'percentage' ? 'selected' : ''}>Phần trăm</option>
                                            <option value="fixed" ${filterType == 'fixed' ? 'selected' : ''}>Cố định</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="mb-3">
                                        <select class="form-select" id="filterStatus" name="filterStatus">
                                            <option value="">Tất cả trạng thái</option>
                                            <option value="active" ${filterStatus == 'active' ? 'selected' : ''}>Hoạt động</option>
                                            <option value="expired" ${filterStatus == 'expired' ? 'selected' : ''}>Hết hạn</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <button type="submit" class="btn btn-primary me-2">
                                        <i class="fas fa-filter me-2"></i>Lọc
                                    </button>
                                    <a href="productlist" class="btn btn-secondary">Xóa bộ lọc</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        Danh sách các mã giảm giá hiện có
                    </div>
                    <div class="card-body">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Code</th>
                                    <th>Loại giảm giá</th>
                                    <th>Giá trị giảm</th>
                                    <th>Giá trị đơn hàng tối thiểu</th>
                                    <th>Giảm tối đa</th>
                                    <th>Số lần sử dụng tối đa</th>
                                    <th>Số lần đã dùng</th>
                                    <th>Ngày hết hạn</th>
                                    <th>Ngày tạo</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="coupon" items="${couponList}">
                                    <tr>
                                        <td>${coupon.id}</td>
                                        <td>${coupon.code}</td>
                                        <td>${coupon.discount_type}</td>
                                        <td>${coupon.discount_value}</td>
                                        <td>${coupon.min_order_amount}</td>
                                        <td>${coupon.max_discount}</td>
                                        <td>${coupon.usage_limit}</td>
                                        <td>${coupon.used_count}</td>
                                        <td>${coupon.expiry_date}</td>
                                        <td>${coupon.created_at}</td>
                                        <td>${coupon.status}</td>
                                        <td>
                                            <a href="#" class="btn btn-sm btn-primary">Sửa</a>
                                            <a href="#" class="btn btn-sm btn-danger">Xóa</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Phân trang -->
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="CouponList?page=${currentPage - 1}&searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="CouponList?page=${i}&searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}">${i}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="CouponList?page=${currentPage + 1}&searchCode=${searchCode}&filterType=${filterType}&filterStatus=${filterStatus}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </body>
</html>


