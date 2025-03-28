<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Reports</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
        <style>
            /* Add spacing between report sections */
            .report-card {
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                margin-bottom: 30px;
            }

            /* Custom headers for each section */
            .report-card .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 20px;
                font-weight: bold;
                font-size: 1.1rem;
            }

            /* Table styling */
            .table {
                margin-bottom: 0;
            }

            .table thead th {
                font-weight: bold;
            }

            .summary-row {
                font-weight: bold;
            }

            /* Filter section styling */
            .filters {
                border: 1px solid rgba(0, 0, 0, 0.1);
            }

            /* Badge styling for better visibility */
            .badge {
                font-size: 85%;
                padding: 0.35em 0.65em;
            }

            /* Export buttons styling */
            .btn-export {
                font-weight: 500;
            }
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
                --hover-color: #f8f9fa;
                --success-color: #28a745;
                --danger-color: #dc3545;
                --warning-color: #ffc107;
                --info-color: #17a2b8;
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

            .dashboard-card {
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
                border: 1px solid var(--border-color);
                margin-bottom: 20px;
            }

            .dashboard-card:hover {
                transform: translateY(-5px);
            }

            .icon-bg {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .stat-title {
                font-size: 14px;
                color: #6c757d;
            }

            .stat-value {
                font-size: 24px;
                font-weight: bold;
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 15px 20px;
                font-weight: 600;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .filters {
                background: white;
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            }

            .table-container {
                max-height: 500px;
                overflow-y: auto;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                background-color: white;
            }

            .table {
                margin-bottom: 0;
            }

            .table th {
                position: sticky;
                top: 0;
                background-color: var(--primary-color);
                color: white;
                font-weight: 600;
                z-index: 1;
            }

            .table-hover tbody tr:hover {
                background-color: var(--hover-color);
            }

            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            .btn-export {
                background-color: var(--accent-color);
                color: white;
                border: none;
                border-radius: 4px;
                padding: 0.375rem 0.75rem;
                transition: background-color 0.3s;
            }

            .btn-export:hover {
                background-color: #2980b9;
                color: white;
            }

            .summary-row {
                background-color: var(--light-color);
                font-weight: bold;
            }

            .status-badge {
                font-size: 0.8rem;
                padding: 0.35em 0.65em;
                border-radius: 30px;
                font-weight: 500;
            }

            .dataTables_wrapper .dataTables_length,
            .dataTables_wrapper .dataTables_filter,
            .dataTables_wrapper .dataTables_info,
            .dataTables_wrapper .dataTables_processing,
            .dataTables_wrapper .dataTables_paginate {
                margin-top: 10px;
                margin-bottom: 10px;
                padding: 0 15px;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button {
                border-radius: 4px;
                margin: 0 2px;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button.current {
                background: var(--accent-color);
                border-color: var(--accent-color);
                color: white !important;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
                background: var(--hover-color);
                border-color: var(--border-color);
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .sidebar-toggle {
                    display: block;
                }
            }
            /* Add these new styles for navigation and report switching */
            .report-nav {
                margin-bottom: 20px;
            }
            .report-section {
                display: none;
            }
            .report-section.active {
                display: block;
            }
        </style>
    </head>
    <body class="bg-light">
        <!-- Include the sidebar -->
        <jsp:include page="/admin/adminsidebar.jsp" />

        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title">
                    <i class="fas fa-file-alt me-2"></i>Báo cáo dữ liệu
                </h2>

                <!-- Navigation Bar for Reports -->
                <ul class="nav nav-pills report-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="#user-report" data-report="user-report">Báo cáo người dùng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#order-report" data-report="order-report">Báo cáo đơn hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#product-report" data-report="product-report">Báo cáo sản phẩm</a>
                    </li>
                </ul>

                <!-- Stats Cards -->
                <div class="row g-3 mb-4">
                    <!-- User Stats -->
                    <div class="col-md-4">
                        <div class="card dashboard-card h-100">
                            <div class="card-body d-flex justify-content-between align-items-start">
                                <div>
                                    <p class="stat-title mb-1">Tổng người dùng</p>
                                    <h3 class="stat-value">${userSummary.totalUsers}</h3>
                                    <div class="mt-2">
                                        <span class="badge bg-success">${userSummary.activeCount} Hoạt động</span>
                                        <span class="badge bg-danger">${userSummary.inactiveCount} Không hoạt động</span>
                                        <span class="badge bg-warning">${userSummary.pendingCount} Chờ xác nhận</span>
                                    </div>
                                </div>
                                <div class="icon-bg bg-primary bg-opacity-10">
                                    <i class="fas fa-users text-primary fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Order Stats -->
                    <div class="col-md-4">
                        <div class="card dashboard-card h-100">
                            <div class="card-body d-flex justify-content-between align-items-start">
                                <div>
                                    <p class="stat-title mb-1">Tổng đơn hàng</p>
                                    <h3 class="stat-value">${orderSummary.totalOrders}</h3>
                                    <div class="mt-2">
                                        <span class="badge bg-success">${orderSummary.completedCount} Hoàn thành</span>
                                        <span class="badge bg-warning">${orderSummary.pendingPayCount + orderSummary.pendingCount + orderSummary.processingCount + orderSummary.shippingCount} Đang xử lý</span>
                                        <span class="badge bg-danger">${orderSummary.cancelledCount} Đã hủy</span>
                                    </div>
                                </div>
                                <div class="icon-bg bg-success bg-opacity-10">
                                    <i class="fas fa-shopping-cart text-success fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Stats -->
                    <div class="col-md-4">
                        <div class="card dashboard-card h-100">
                            <div class="card-body d-flex justify-content-between align-items-start">
                                <div>
                                    <p class="stat-title mb-1">Tổng sản phẩm</p>
                                    <h3 class="stat-value">${productSummary.totalProducts}</h3>
                                    <div class="mt-2">
                                        <span class="badge bg-success">${productSummary.activeCount} Có sẵn</span>
                                        <span class="badge bg-danger">${productSummary.inactiveCount} Không hoạt động</span>
                                        <span class="badge bg-warning">${productSummary.eoStockCount} Hết hàng</span>
                                    </div>
                                </div>
                                <div class="icon-bg bg-warning bg-opacity-10">
                                    <i class="fas fa-boxes text-warning fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- User Reports Section -->
                <div id="user-report" class="report-section report-card active">
                    <div class="card-header bg-primary text-white">
                        <span><i class="fas fa-users me-2"></i>Báo cáo người dùng</span>
                        <button class="btn btn-light" id="exportUserBtn">
                            <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                        </button>
                    </div>
                    <div class="card-body">
                        <!-- User Role Table -->
                        <div class="table-responsive mt-3">
                            <table class="table table-striped table-hover" id="userTable">
                                <thead class="table-primary">
                                    <tr>
                                        <th>Vai trò</th>
                                        <th>Tổng số người dùng</th>
                                        <th>Đang hoạt động</th>
                                        <th>Không hoạt động</th>
                                        <th>Tổng doanh thu từ khách</th>
                                        <th>Tổng số đơn hàng</th>
                                        <th>Giá trị đơn trung bình</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userRoleReports}" var="report">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${report.role eq 'admin'}">
                                                        <span class="badge bg-danger">Quản trị viên</span>
                                                    </c:when>
                                                    <c:when test="${report.role eq 'sale'}">
                                                        <span class="badge bg-primary">Nhân viên bán hàng</span>
                                                    </c:when>
                                                    <c:when test="${report.role eq 'marketing'}">
                                                        <span class="badge bg-info">Nhân viên marketing</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">Khách hàng</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${report.totalUsers}</td>
                                            <td>${report.activeCount}</td>
                                            <td>${report.inactiveCount}</td>
                                            <td><fmt:formatNumber type="currency" value="${report.totalRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td>${report.totalOrders}</td>
                                            <td><fmt:formatNumber type="currency" value="${report.avgOrderValue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot class="table-primary fw-bold">
                                    <tr class="summary-row">
                                        <td>Tổng cộng</td>
                                        <td>${userCount}</td>
                                        <td>${userRoleTotalActive}</td>
                                        <td>${userRoleTotalInactive}</td>
                                        <td><fmt:formatNumber type="currency" value="${userRoleTotalRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td>${userRoleTotalOrders}</td>
                                        <td><fmt:formatNumber type="currency" value="${userRoleAvgOrderValue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Order Reports Section -->
                <div id="order-report" class="report-section report-card">
                    <div class="card-header bg-success text-white">
                        <span><i class="fas fa-shopping-cart me-2"></i>Báo cáo đơn hàng</span>
                        <button class="btn btn-light" id="exportOrderBtn">
                            <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                        </button>
                    </div>
                    <div class="card-body">
                        <!-- Filters -->
                        <div class="filters p-3 bg-light rounded mb-3">
                            <form action="${pageContext.request.contextPath}/admin/report" method="get" class="row">
                                <div class="col-md-10 mb-3 mb-md-0">
                                    <label for="orderStatus" class="form-label">Trạng thái đơn hàng</label>
                                    <select class="form-select" id="orderStatus" name="orderStatus" onchange="this.form.submit()">
                                        <option value="all" ${orderStatusFilter eq 'all' ? 'selected' : ''}>Tất cả trạng thái</option>
                                        <option value="pending_pay" ${orderStatusFilter eq 'pending_pay' ? 'selected' : ''}>Chờ thanh toán</option>
                                        <option value="pending" ${orderStatusFilter eq 'pending' ? 'selected' : ''}>Đang chờ</option>
                                        <option value="processing" ${orderStatusFilter eq 'processing' ? 'selected' : ''}>Đang xử lý</option>
                                        <option value="shipped" ${orderStatusFilter eq 'shipped' ? 'selected' : ''}>Đã gửi hàng</option>
                                        <option value="completed" ${orderStatusFilter eq 'completed' ? 'selected' : ''}>Đã hoàn thành</option>
                                        <option value="cancelled" ${orderStatusFilter eq 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                                    </select>
                                </div>
                                <div class="col-md-2 d-flex align-items-end">
                                    <button type="submit" class="btn btn-success w-100">Lọc</button>
                                </div>
                            </form>
                        </div>

                        <!-- Order Table -->
                        <div class="table-responsive mt-3">
                            <table class="table table-striped table-hover" id="orderTable">
                                <thead class="table-success">
                                    <tr>
                                        <th>Trạng thái đơn hàng</th>
                                        <th>Tổng số đơn hàng</th>
                                        <th>Tổng giá trị đơn</th>
                                        <th>Doanh thu thực tế</th>
                                        <th>Tổng giảm giá áp dụng</th>
                                        <th>Đơn hàng dùng mã giảm giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${orderReports}" var="order">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${order.status eq 'pending_pay'}">
                                                        <span class="badge bg-secondary">Chờ thanh toán</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'pending'}">
                                                        <span class="badge bg-warning">Đang chờ</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'processing'}">
                                                        <span class="badge bg-info">Đang xử lý</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'shipped'}">
                                                        <span class="badge bg-primary">Đã gửi hàng</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'completed'}">
                                                        <span class="badge bg-success">Đã hoàn thành</span>
                                                    </c:when>
                                                    <c:when test="${order.status eq 'cancelled'}">
                                                        <span class="badge bg-danger">Đã hủy</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-dark">Không xác định</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${order.orderCount}</td>
                                            <td><fmt:formatNumber type="currency" value="${order.totalAmount}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td><fmt:formatNumber type="currency" value="${order.actualRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td><fmt:formatNumber type="currency" value="${order.totalDiscount}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td>${order.discountedOrderCount}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot class="table-success fw-bold">
                                    <tr class="summary-row">
                                        <td>Tổng cộng</td>
                                        <td>${orderReportTotalOrders}</td>
                                        <td><fmt:formatNumber type="currency" value="${orderReportTotalAmount}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td><fmt:formatNumber type="currency" value="${orderReportTotalActualRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td><fmt:formatNumber type="currency" value="${orderReportTotalDiscount}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td>${orderReportTotalDiscountedOrders}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Product Reports Section -->
                <div id="product-report" class="report-section report-card">
                    <div class="card-header bg-warning text-dark">
                        <span><i class="fas fa-boxes me-2"></i>Báo cáo sản phẩm</span>
                        <div>
                            <button class="btn btn-danger me-2" id="showLowStockBtn" data-bs-toggle="modal" data-bs-target="#lowStockModal">
                                <i class="fas fa-exclamation-triangle me-1"></i>Sản phẩm tồn thấp
                            </button>
                            <button class="btn btn-dark" id="exportProductBtn">
                                <i class="fas fa-file-export me-1"></i>Xuất báo cáo
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- Filters -->
                        <div class="filters p-3 bg-light rounded mb-3">
                            <form action="${pageContext.request.contextPath}/admin/report" method="get" class="row">
                                <div class="col-md-10 mb-3 mb-md-0">
                                    <label for="productStatus" class="form-label">Trạng thái sản phẩm</label>
                                    <select class="form-select" id="productStatus" name="productStatus" onchange="this.form.submit()">
                                        <option value="all" ${productStatusFilter eq 'all' ? 'selected' : ''}>Tất cả trạng thái</option>
                                        <option value="active" ${productStatusFilter eq 'active' ? 'selected' : ''}>Hoạt động</option>
                                        <option value="inactive" ${productStatusFilter eq 'inactive' ? 'selected' : ''}>Không hoạt động</option>
                                        <option value="EOStock" ${productStatusFilter eq 'EOStock' ? 'selected' : ''}>Hết hàng</option>
                                    </select>
                                </div>
                                <div class="col-md-2 d-flex align-items-end">
                                    <button type="submit" class="btn btn-warning w-100">Lọc</button>
                                </div>
                            </form>
                        </div>

                        <!-- Product Inventory Table -->
                        <div class="table-responsive mt-3">
                            <table class="table table-striped table-hover" id="productTable">
                                <thead class="table-warning">
                                    <tr>
                                        <th>Trạng thái sản phẩm</th>
                                        <th>Tổng số sản phẩm</th>
                                        <th>Tổng tồn kho</th>
                                        <th>Sản phẩm tồn thấp</th>
                                        <th>Tổng số lượng bán ra</th>
                                        <th>Tổng doanh thu</th>
                                        <th>Sản phẩm bán chạy</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty productInventoryReports}">
                                        <tr>
                                            <td colspan="7" class="text-center">Không có dữ liệu để hiển thị</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach items="${productInventoryReports}" var="product">
                                        <tr>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${product.status eq 'active'}">
                                                        <span class="badge bg-success">Hoạt động</span>
                                                    </c:when>
                                                    <c:when test="${product.status eq 'inactive'}">
                                                        <span class="badge bg-danger">Không hoạt động</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark">Hết hàng</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${product.totalProducts}</td>
                                            <td>${product.totalStock}</td>
                                            <td>${product.lowStockCount}</td>
                                            <td>${product.totalSoldQuantity}</td>
                                            <td><fmt:formatNumber type="currency" value="${product.totalRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                            <td>${product.bestSellerCount}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot class="table-warning fw-bold">
                                    <tr class="summary-row">
                                        <td>Tổng cộng</td>
                                        <td>${productCount}</td>
                                        <td>${totalStock}</td>
                                        <td>${totalLowStockCount}</td>
                                        <td>${totalSoldQuantity}</td>
                                        <td><fmt:formatNumber type="currency" value="${productTotalRevenue}" currencySymbol="₫" maxFractionDigits="0"/></td>
                                        <td>${totalBestSellerCount}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Low Stock Products Modal -->
                <div class="modal fade" id="lowStockModal" tabindex="-1" aria-labelledby="lowStockModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header bg-danger text-white">
                                <h5 class="modal-title" id="lowStockModalLabel"><i class="fas fa-exclamation-triangle me-2"></i>Sản phẩm tồn thấp</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover" id="lowStockTable">
                                        <thead class="table-danger">
                                            <tr>
                                                <th>Mã sản phẩm</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Danh mục</th>
                                                <th>Kích thước</th>
                                                <th>Màu sắc</th>
                                                <th>Số lượng tồn kho</th>
                                            </tr>
                                        </thead>
                                        <tbody id="lowStockTableBody">
                                            <!-- Data will be loaded via AJAX -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="button" class="btn btn-danger" id="exportLowStockBtn">Xuất báo cáo</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- jQuery -->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <!-- Bootstrap JS Bundle with Popper -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <!-- DataTables JS -->
                <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
                <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
                <!-- SheetJS (XLSX) for exporting -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

                <script>
                                        $(document).ready(function () {
                                            // Initialize DataTables
                                            const userTable = $('#userTable').DataTable({
                                                "language": {
                                                    "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
                                                    "zeroRecords": "Không tìm thấy dữ liệu",
                                                    "info": "Trang _PAGE_ trên _PAGES_",
                                                    "infoEmpty": "Không có dữ liệu",
                                                    "infoFiltered": "(lọc từ _MAX_ tổng số dòng)",
                                                    "search": "Tìm kiếm:",
                                                    "paginate": {
                                                        "first": "Đầu",
                                                        "last": "Cuối",
                                                        "next": "Tiếp",
                                                        "previous": "Trước"
                                                    }
                                                }
                                            });

                                            const orderTable = $('#orderTable').DataTable({
                                                "language": {
                                                    "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
                                                    "zeroRecords": "Không tìm thấy dữ liệu",
                                                    "info": "Trang _PAGE_ trên _PAGES_",
                                                    "infoEmpty": "Không có dữ liệu",
                                                    "infoFiltered": "(lọc từ _MAX_ tổng số dòng)",
                                                    "search": "Tìm kiếm:",
                                                    "paginate": {
                                                        "first": "Đầu",
                                                        "last": "Cuối",
                                                        "next": "Tiếp",
                                                        "previous": "Trước"
                                                    }
                                                }
                                            });

                                            const productTable = $('#productTable').DataTable({
                                                "language": {
                                                    "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
                                                    "zeroRecords": "Không tìm thấy dữ liệu",
                                                    "info": "Trang _PAGE_ trên _PAGES_",
                                                    "infoEmpty": "Không có dữ liệu",
                                                    "infoFiltered": "(lọc từ _MAX_ tổng số dòng)",
                                                    "search": "Tìm kiếm:",
                                                    "paginate": {
                                                        "first": "Đầu",
                                                        "last": "Cuối",
                                                        "next": "Tiếp",
                                                        "previous": "Trước"
                                                    }
                                                }
                                            });

                                            // Report navigation
                                            $('.nav-link').click(function (e) {
                                                e.preventDefault();
                                                $('.nav-link').removeClass('active');
                                                $(this).addClass('active');

                                                const reportId = $(this).data('report');
                                                $('.report-section').removeClass('active');
                                                $('#' + reportId).addClass('active');
                                            });

                                            // Export functions
                                            function exportTableToExcel(tableId, fileName) {
                                                const table = document.getElementById(tableId);
                                                const wb = XLSX.utils.table_to_book(table, {sheet: "Sheet1"});
                                                XLSX.writeFile(wb, fileName + '.xlsx');
                                            }

                                            $('#exportUserBtn').click(function () {
                                                exportTableToExcel('userTable', 'user_report');
                                            });

                                            $('#exportOrderBtn').click(function () {
                                                exportTableToExcel('orderTable', 'order_report');
                                            });

                                            $('#exportProductBtn').click(function () {
                                                exportTableToExcel('productTable', 'product_report');
                                            });

                                            // Low Stock Modal AJAX (unchanged)
                                            $('#lowStockModal').on('shown.bs.modal', function () {
                                                $.ajax({
                                                    url: '${pageContext.request.contextPath}/admin/low-stock-products',
                                                    method: 'GET',
                                                    dataType: 'json',
                                                    success: function (data) {
                                                        let table = $('#lowStockTable');
                                                        if ($.fn.DataTable.isDataTable(table)) {
                                                            table.DataTable().destroy();
                                                        }
                                                        table.DataTable({
                                                            "language": {
                                                                "lengthMenu": "Hiển thị _MENU_ dòng mỗi trang",
                                                                "zeroRecords": "Không tìm thấy dữ liệu",
                                                                "info": "Trang _PAGE_ trên _PAGES_",
                                                                "infoEmpty": "Không có dữ liệu",
                                                                "infoFiltered": "(lọc từ _MAX_ tổng số dòng)",
                                                                "search": "Tìm kiếm:",
                                                                "paginate": {
                                                                    "first": "Đầu",
                                                                    "last": "Cuối",
                                                                    "next": "Tiếp",
                                                                    "previous": "Trước"
                                                                }
                                                            },
                                                            "data": data,
                                                            "columns": [
                                                                {"data": "id"},
                                                                {"data": "title"},
                                                                 {"data": "categoryName", "defaultContent": ""},
                                                                {"data": "size", "defaultContent": ""},
                                                                {"data": "color", "defaultContent": ""},
                                                                {"data": "stockQuantity"}
                                                            ]
                                                        });
                                                    },
                                                    error: function (xhr, status, error) {
                                                        console.error('Error loading low stock products:', error);
                                                        $('#lowStockTableBody').html('<tr><td colspan="6" class="text-center">Lỗi khi tải dữ liệu</td></tr>');
                                                    }
                                                });
                                            });

                                            $('#exportLowStockBtn').click(function () {
                                                const table = document.getElementById('lowStockTable');
                                                const wb = XLSX.utils.table_to_book(table, {sheet: "Sheet1"});
                                                XLSX.writeFile(wb, 'low_stock_products.xlsx');
                                            });
                                        });
                </script>

    </body>
</html>
