<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-header {
            border-radius: 10px 10px 0 0 !important;
            font-weight: bold;
        }
        .status-badge {
            padding: 8px 12px;
            border-radius: 20px;
            color: white;
            font-weight: 500;
        }
        .bg-pending { background-color: #f6c23e; }
        .bg-processing { background-color: #4e73df; }
        .bg-shipped { background-color: #1cc88a; }
        .bg-completed { background-color: #36b9cc; }
        .bg-cancelled { background-color: #e74a3b; }
        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
        }
        .icon-box {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }
        .bg-gradient-primary { background: linear-gradient(to right, #4e73df, #224abe); }
        .bg-gradient-success { background: linear-gradient(to right, #1cc88a, #13855c); }
        .bg-gradient-info { background: linear-gradient(to right, #36b9cc, #258391); }
        .bg-gradient-warning { background: linear-gradient(to right, #f6c23e, #dda20a); }
    </style>
</head>

<body class="bg-light">
    <jsp:include page="header.jsp" />
    <div class="container-fluid py-4">
        <div class="row mb-4">
            <div class="col-md-8">
                <h1 class="h3 mb-0 text-gray-800">Bảng điều khiển bán hàng</h1>
                <p class="text-muted">Xem hiệu suất bán hàng và số liệu thống kê của bạn</p>
            </div>
            <div class="col-md-4">
                <form action="${pageContext.request.contextPath}/sale/dashboard" method="GET" class="d-flex">
                    <div class="input-group me-2">
                        <span class="input-group-text">Từ</span>
                        <input type="date" name="startDate" class="form-control" value="${param.startDate != null ? param.startDate : sevenDaysAgo}">
                    </div>
                    <div class="input-group me-2">
                        <span class="input-group-text">Đến</span>
                        <input type="date" name="endDate" class="form-control" value="${param.endDate != null ? param.endDate : today}">
                    </div>
                    <button type="submit" class="btn btn-primary">Lọc</button>
                </form>
            </div>
        </div>

        <!-- Overview Cards -->
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card border-left-primary">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-gradient-primary text-white">
                                <i class="fas fa-coins fa-lg"></i>
                            </div>
                            <div>
                                <div class="text-xs fw-bold text-uppercase mb-1 text-muted">Tổng doanh thu</div>
                                <div class="h5 mb-0 fw-bold">
                                    <fmt:formatNumber value="${salesOverview.totalRevenue}" type="currency" currencySymbol="$" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="card border-left-success">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-gradient-success text-white">
                                <i class="fas fa-shopping-cart fa-lg"></i>
                            </div>
                            <div>
                                <div class="text-xs fw-bold text-uppercase mb-1 text-muted">Tổng đơn hàng</div>
                                <div class="h5 mb-0 fw-bold">${salesOverview.totalSales}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="card border-left-info">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-gradient-info text-white">
                                <i class="fas fa-user-crown fa-lg"></i>
                            </div>
                            <div>
                                <div class="text-xs fw-bold text-uppercase mb-1 text-muted">Khách hàng VIP</div>
                                <div class="h5 mb-0 fw-bold">${salesOverview.vipCustomers}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6">
                <div class="card border-left-warning">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="icon-box bg-gradient-warning text-white">
                                <i class="fas fa-users fa-lg"></i>
                            </div>
                            <div>
                                <div class="text-xs fw-bold text-uppercase mb-1 text-muted">Khách hàng thông thường</div>
                                <div class="h5 mb-0 fw-bold">${salesOverview.normalCustomers}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Order Status Section -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Trạng thái đơn hàng</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <div class="status-badge bg-pending mb-2">
                                    <i class="fas fa-clock me-1"></i> Đang phê duyệt
                                </div>
                                <h4>${salesOverview.pendingOrders}</h4>
                            </div>
                            <div class="col text-center">
                                <div class="status-badge bg-processing mb-2">
                                    <i class="fas fa-spinner me-1"></i> Đang xử lí
                                </div>
                                <h4>${salesOverview.processingOrders}</h4>
                            </div>
                            <div class="col text-center">
                                <div class="status-badge bg-shipped mb-2">
                                    <i class="fas fa-shipping-fast me-1"></i> Đã giao
                                </div>
                                <h4>${salesOverview.shippedOrders}</h4>
                            </div>
                            <div class="col text-center">
                                <div class="status-badge bg-completed mb-2">
                                    <i class="fas fa-check-circle me-1"></i> Đã hoàn thành
                                </div>
                                <h4>${salesOverview.completedOrders}</h4>
                            </div>
                            <div class="col text-center">
                                <div class="status-badge bg-cancelled mb-2">
                                    <i class="fas fa-times-circle me-1"></i> Đã hủy
                                </div>
                                <h4>${salesOverview.cancelledOrders}</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts Section -->
        <div class="row">
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Xu hướng đơn hàng hằng ngày</h5>
                    </div>
                    <div class="card-body">
                        <div class="chart-container">
                            <canvas id="orderTrendChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Đơn hàng theo danh mục</h5>
                    </div>
                    <div class="card-body">
                        <div class="chart-container">
                            <canvas id="categoryChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Doanh thu đơn hàng hằng ngày</h5>
                    </div>
                    <div class="card-body">
                        <div class="chart-container">
                            <canvas id="revenueChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Phân phối trạng thái đơn hàng</h5>
                    </div>
                    <div class="card-body">
                        <div class="chart-container">
                            <canvas id="statusDistributionChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sales by Category Table -->
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">Đơn hàng theo danh mục (D)</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Danh mục</th>
                                        <th>Các mặt hàng đã bán</th>
                                        <th>Doanh thu</th>
                                        <th>% Tổng số</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${categorySales}" var="category">
                                        <tr>
                                            <td>${category.categoryName}</td>
                                            <td>${category.totalItems}</td>
                                            <td><fmt:formatNumber value="${category.totalAmount}" type="currency" currencySymbol="$" /></td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" 
                                                         style="width: ${(category.totalAmount / totalCategoryAmount) * 100}%" 
                                                         aria-valuenow="${(category.totalAmount / totalCategoryAmount) * 100}" 
                                                         aria-valuemin="0" aria-valuemax="100">
                                                        <fmt:formatNumber value="${(category.totalAmount / totalCategoryAmount) * 100}" 
                                                                         type="number" maxFractionDigits="1"/>%
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Charts JS -->
    <script>
        // Daily Order Trend Chart
        document.addEventListener('DOMContentLoaded', function() {
            const orderTrendCtx = document.getElementById('orderTrendChart').getContext('2d');
            const orderTrendChart = new Chart(orderTrendCtx, {
                type: 'line',
                data: {
                    labels: [
                        <c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">
                            '${status.orderDate}'${!loop.last ? ',' : ''}
                        </c:forEach>
                    ],
                    datasets: [{
                        label: 'Đang phê duyệt',
                        data: [
                            <c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">
                                ${status.pendingCount}${!loop.last ? ',' : ''}
                            </c:forEach>
                        ],
                        borderColor: '#f6c23e',
                        backgroundColor: 'rgba(246, 194, 62, 0.1)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đang xử lí',
                        data: [
                            <c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">
                                ${status.processingCount}${!loop.last ? ',' : ''}
                            </c:forEach>
                        ],
                        borderColor: '#4e73df',
                        backgroundColor: 'rgba(78, 115, 223, 0.1)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đã giao',
                        data: [
                            <c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">
                                ${status.shippedCount}${!loop.last ? ',' : ''}
                            </c:forEach>
                        ],
                        borderColor: '#1cc88a',
                        backgroundColor: 'rgba(28, 200, 138, 0.1)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đã hoàn thành',
                        data: [
                            <c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">
                                ${status.completedCount}${!loop.last ? ',' : ''}
                            </c:forEach>
                        ],
                        borderColor: '#36b9cc',
                        backgroundColor: 'rgba(54, 185, 204, 0.1)',
                        tension: 0.3,
                        fill: true
                    }, {
                        label: 'Đã hủy',
                        data: [
                            <c:forEach items="${orderStatusCounts}" var="status" varStatus="loop">
                                ${status.cancelledCount}${!loop.last ? ',' : ''}
                            </c:forEach>
                        ],
                        borderColor: '#e74a3b',
                        backgroundColor: 'rgba(231, 74, 59, 0.1)',
                        tension: 0.3,
                        fill: true
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    },
                    interaction: {
                        intersect: false,
                        mode: 'index'
                    }
                }
            });

            // Revenue Chart
            const revenueCtx = document.getElementById('revenueChart').getContext('2d');
            const revenueChart = new Chart(revenueCtx, {
                type: 'bar',
                data: {
                    labels: [
                        <c:forEach items="${dailySalesData}" var="data" varStatus="loop">
                            '${data.saleDate}'${!loop.last ? ',' : ''}
                        </c:forEach>
                    ],
                    datasets: [{
                        label: 'Doanh thu',
                        data: [
                            <c:forEach items="${dailySalesData}" var="data" varStatus="loop">
                                ${data.totalAmount}${!loop.last ? ',' : ''}
                            </c:forEach>
                        ],
                        backgroundColor: 'rgba(78, 115, 223, 0.8)'
                    }, {
                        label: 'Đơn hàng',
                        data: [
                            <c:forEach items="${dailySalesData}" var="data" varStatus="loop">
                                ${data.orderCount}${!loop.last ? ',' : ''}
                            </c:forEach>
                        ],
                        backgroundColor: 'rgba(28, 200, 138, 0.8)',
                        yAxisID: 'y1'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Doanh thu ($)'
                            }
                        },
                        y1: {
                            beginAtZero: true,
                            position: 'right',
                            grid: {
                                drawOnChartArea: false
                            },
                            title: {
                                display: true,
                                text: 'Đơn hàng'
                            }
                        }
                    }
                }
            });

            // Category Chart
            const categoryCtx = document.getElementById('categoryChart').getContext('2d');
            const categoryChart = new Chart(categoryCtx, {
                type: 'doughnut',
                data: {
                    labels: [
                        <c:forEach items="${categorySales}" var="category" varStatus="loop">
                            '${category.categoryName}'${!loop.last ? ',' : ''}
                        </c:forEach>
                    ],
                    datasets: [{
                        data: [
                            <c:forEach items="${categorySales}" var="category" varStatus="loop">
                                ${category.totalAmount}${!loop.last ? ',' : ''}
                            </c:forEach>
                        ],
                        backgroundColor: [
                            'rgba(78, 115, 223, 0.8)',
                            'rgba(28, 200, 138, 0.8)',
                            'rgba(54, 185, 204, 0.8)',
                            'rgba(246, 194, 62, 0.8)',
                            'rgba(231, 74, 59, 0.8)'
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });

            // Status Distribution Chart
            const statusDistCtx = document.getElementById('statusDistributionChart').getContext('2d');
            const statusDistChart = new Chart(statusDistCtx, {
                type: 'pie',
                data: {
                    labels: ['Đang phê duyệt', 'Đang xử lí', 'Đã giao', 'Đã hoàn thành', 'Đã hủy'],
                    datasets: [{
                        data: [
                            ${salesOverview.pendingOrders},
                            ${salesOverview.processingOrders},
                            ${salesOverview.shippedOrders},
                            ${salesOverview.completedOrders},
                            ${salesOverview.cancelledOrders}
                        ],
                        backgroundColor: [
                            '#f6c23e',
                            '#4e73df',
                            '#1cc88a',
                            '#36b9cc',
                            '#e74a3b'
                        ]
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>