<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Báo Cáo Kinh Doanh Chi Tiết</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 20px; 
        }
        .report-title { 
            text-align: center; 
            font-size: 1.5rem; 
            margin-bottom: 20px; 
        }
        .section-title { 
            font-size: 1.2rem; 
            margin-top: 30px; 
            margin-bottom: 10px; 
            border-bottom: 2px solid #007bff; 
            padding-bottom: 5px; 
        }
        .table-report { 
            width: 100%; 
            margin-bottom: 20px; 
            font-size: 0.9rem; 
        }
        .table-report th { 
            background-color: #007bff; 
            color: white; 
            padding: 8px; 
        }
        .table-report td { 
            padding: 6px; 
            vertical-align: top; 
        }
        .summary-box { 
            margin-bottom: 20px; 
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <!-- Report Header -->
    <h1 class="report-title">BÁO CÁO KINH DOANH CHI TIẾT</h1>
    <div class="summary-box">
        <p><strong>Khoảng thời gian:</strong> Từ <fmt:formatDate value="${salesReport.startDate}" pattern="dd/MM/yyyy"/> 
        đến <fmt:formatDate value="${salesReport.endDate}" pattern="dd/MM/yyyy"/></p>
    </div>

    <!-- Form lọc ngày -->
    <form action="${pageContext.request.contextPath}/sale/report" method="GET" class="mb-4">
        <div class="row">
            <div class="col-md-3">
                <label class="form-label">Từ Ngày</label>
                <input type="date" name="startDate" class="form-control" value="${startDate}" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Đến Ngày</label>
                <input type="date" name="endDate" class="form-control" value="${endDate}" required>
            </div>
            <div class="col-md-2 align-self-end">
                <button type="submit" class="btn btn-primary">Tạo Báo Cáo</button>
            </div>
        </div>
    </form>

    <!-- 1. Tổng Quan Doanh Thu -->
    <div class="section-title">1. Tổng Quan Doanh Thu</div>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Tổng Số Đơn Hàng</th>
                <th>Tổng Doanh Thu</th>
                <th>Giá Trị Đơn Hàng Trung Bình</th>
                <th>Tổng Số Khách Hàng</th>
                <th>Tổng Số Sản Phẩm Bán Được</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${salesReport.totalOrders}</td>
                <td><fmt:formatNumber value="${salesReport.totalRevenue}" type="currency"/></td>
                <td><fmt:formatNumber value="${salesReport.averageOrderValue}" type="currency"/></td>
                <td>${salesReport.totalCustomers}</td>
                <td>${salesReport.totalProducts}</td>
            </tr>
        </tbody>
    </table>

    <!-- 2. Doanh Thu Theo Thời Gian -->
    <div class="section-title">2. Doanh Thu Theo Thời Gian</div>
    <h6>2.1 Doanh Thu Hàng Ngày</h6>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Ngày</th>
                <th>Doanh Thu</th>
                <th>Số Đơn Hàng</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${salesReport.dailyRevenue}" var="entry">
                <tr>
                    <td>${entry.key}</td>
                    <td><fmt:formatNumber value="${entry.value}" type="currency"/></td>
                    <td>${salesReport.ordersPerDay[entry.key]}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h6>2.2 Doanh Thu Hàng Tháng</h6>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Tháng</th>
                <th>Doanh Thu</th>
                <th>Số Đơn Hàng</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${salesReport.monthlyRevenue}" var="entry">
                <tr>
                    <td>${entry.key}</td>
                    <td><fmt:formatNumber value="${entry.value}" type="currency"/></td>
                    <td>${salesReport.ordersPerMonth[entry.key]}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 3. Hiệu Suất Sản Phẩm -->
    <div class="section-title">3. Hiệu Suất Sản Phẩm</div>
    <h6>3.1 Top Sản Phẩm Theo Doanh Thu</h6>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Mã SP</th>
                <th>Tên Sản Phẩm</th>
                <th>Danh Mục</th>
                <th>Số Lượng Bán</th>
                <th>Doanh Thu</th>
                <th>Phân Phối Size</th>
                <th>Phân Phối Màu</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${salesReport.topProducts}" var="product">
                <tr>
                    <td>${product.productId}</td>
                    <td>${product.productName}</td>
                    <td>${product.category}</td>
                    <td>${product.totalQuantitySold}</td>
                    <td><fmt:formatNumber value="${product.totalRevenue}" type="currency"/></td>
                    <td>
                        <c:forEach items="${product.sizeDistribution}" var="sizeEntry">
                            ${sizeEntry.key}: ${sizeEntry.value}<br>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach items="${product.colorDistribution}" var="colorEntry">
                            ${colorEntry.key}: ${colorEntry.value}<br>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h6>3.2 Doanh Thu Theo Danh Mục</h6>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Danh Mục</th>
                <th>Doanh Thu</th>
                <th>Số Đơn Hàng</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${salesReport.revenueByCategoryMap}" var="entry">
                <tr>
                    <td>${entry.key}</td>
                    <td><fmt:formatNumber value="${entry.value}" type="currency"/></td>
                    <td>${salesReport.ordersByCategoryMap[entry.key]}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 4. Thông Tin Khách Hàng -->
    <div class="section-title">4. Thông Tin Khách Hàng</div>
    <h6>4.1 Tổng Quan Khách Hàng</h6>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Khách Hàng Mới</th>
                <th>Khách Hàng Quay Lại</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${salesReport.newCustomers}</td>
                <td>${salesReport.returningCustomers}</td>
            </tr>
        </tbody>
    </table>

    <h6>4.2 Phân Loại Theo Giới Tính</h6>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Giới Tính</th>
                <th>Số Lượng</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${salesReport.customersByGender}" var="entry">
                <tr>
                    <td>${entry.key}</td>
                    <td>${entry.value}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h6>4.3 Top Khách Hàng</h6>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Mã KH</th>
                <th>Tên</th>
                <th>Email</th>
                <th>Loại KH</th>
                <th>Tổng Đơn</th>
                <th>Tổng Chi Tiêu</th>
                <th>Đơn Đầu Tiên</th>
                <th>Đơn Cuối Cùng</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${salesReport.topCustomers}" var="customer">
                <tr>
                    <td>${customer.userId}</td>
                    <td>${customer.fullName}</td>
                    <td>${customer.email}</td>
                    <td>${customer.customerType}</td>
                    <td>${customer.totalOrders}</td>
                    <td><fmt:formatNumber value="${customer.totalSpend}" type="currency"/></td>
                    <td><fmt:formatDate value="${customer.firstOrderDate}" pattern="dd/MM/yyyy"/></td>
                    <td><fmt:formatDate value="${customer.lastOrderDate}" pattern="dd/MM/yyyy"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

   

    <!-- 6. Xử Lý Đơn Hàng -->
    <div class="section-title">5. Xử Lý Đơn Hàng</div>
    <h6>5.1 Phân Bố Trạng Thái Đơn Hàng</h6>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Trạng Thái</th>
                <th>Số Lượng</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${salesReport.ordersByStatus}" var="entry">
                <tr>
                    <td>${entry.key}</td>
                    <td>${entry.value}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h6>5.2 Thời Gian Xử Lý Trung Bình</h6>
    <table class="table table-bordered table-report">
        <thead>
            <tr>
                <th>Thời Gian Hoàn Thành Trung Bình (giờ)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><fmt:formatNumber value="${salesReport.averageFulfillmentTime}" type="number" maxFractionDigits="2"/></td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>