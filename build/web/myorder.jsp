<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đơn hàng của tôi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 15px;
        }
        
        .page-header {
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #dee2e6;
        }
        
        .page-header h1 {
            font-size: 28px;
            font-weight: 700;
            color: #212529;
            margin-bottom: 0;
        }
        
        .search-section {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }
        
        .order-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 25px;
            overflow: hidden;
            transition: transform 0.3s;
        }
        
        .order-card:hover {
            transform: translateY(-3px);
        }
        
        .order-header {
            background-color: #f8f9fa;
            padding: 15px 20px;
            border-bottom: 1px solid #e9ecef;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .order-id {
            font-weight: 700;
            font-size: 16px;
            color: #0d6efd;
        }
        
        .order-date {
            font-size: 14px;
            color: #6c757d;
        }
        
        .order-status {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
        }
        
        .status-pending {
            background-color: #fff3cd;
            color: #664d03;
        }
        
        .status-processing {
            background-color: #cff4fc;
            color: #055160;
        }
        
        .status-shipping {
            background-color: #d1e7ff;
            color: #084298;
        }
        
        .status-completed {
            background-color: #d1e7dd;
            color: #0f5132;
        }
        
        .status-cancelled {
            background-color: #f8d7da;
            color: #842029;
        }
        
        .order-body {
            padding: 20px;
        }
        
        .order-items {
            margin-bottom: 20px;
        }
        
        .item-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e9ecef;
        }
        
        .item-row:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }
        
        .item-image {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 15px;
        }
        
        .item-details {
            flex-grow: 1;
        }
        
        .item-title {
            font-weight: 600;
            margin-bottom: 5px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        .item-variant {
            font-size: 14px;
            color: #6c757d;
        }
        
        .item-price {
            font-weight: 600;
            color: #212529;
            text-align: right;
            min-width: 120px;
        }
        
        .order-summary {
            padding-top: 15px;
            border-top: 1px dashed #dee2e6;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .summary-row:last-child {
            margin-bottom: 0;
            padding-top: 10px;
            border-top: 1px solid #dee2e6;
            font-weight: 700;
        }
        
        .order-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #dee2e6;
        }
        
        .btn-order-detail {
            background-color: #0d6efd;
            color: #fff;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.2s;
        }
        
        .btn-order-detail:hover {
            background-color: #0b5ed7;
            color: #fff;
        }
        
        .btn-cancel-order {
            background-color: #dc3545;
            color: #fff;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.2s;
        }
        
        .btn-cancel-order:hover {
            background-color: #bb2d3b;
            color: #fff;
        }
        
        .btn-reorder {
            background-color: #6c757d;
            color: #fff;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.2s;
        }
        
        .btn-reorder:hover {
            background-color: #5c636a;
            color: #fff;
        }
        
        .pagination {
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }
        
        .pagination .page-item .page-link {
            color: #0d6efd;
            background-color: #fff;
            border: 1px solid #dee2e6;
            padding: 8px 16px;
            margin: 0 5px;
            border-radius: 5px;
            transition: all 0.2s;
        }
        
        .pagination .page-item .page-link:hover {
            background-color: #e9ecef;
        }
        
        .pagination .page-item.active .page-link {
            background-color: #0d6efd;
            color: #fff;
            border-color: #0d6efd;
        }
        
        .pagination .page-item.disabled .page-link {
            color: #6c757d;
            pointer-events: none;
            background-color: #fff;
            border-color: #dee2e6;
        }
        
        .empty-orders {
            text-align: center;
            padding: 50px 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        .empty-icon {
            font-size: 48px;
            color: #6c757d;
            margin-bottom: 15px;
        }
        
        .empty-message {
            font-size: 18px;
            color: #343a40;
            margin-bottom: 20px;
        }
        
        .alert {
            margin-bottom: 20px;
        }
        
        @media (max-width: 767.98px) {
            .order-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .order-status {
                margin-top: 10px;
            }
            
            .item-row {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .item-image {
                margin-bottom: 10px;
            }
            
            .item-price {
                text-align: left;
                margin-top: 10px;
            }
            
            .order-actions {
                flex-direction: column;
            }
            
            .order-actions .btn {
                margin-bottom: 10px;
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <div class="page-header">
            <h1>Đơn hàng của tôi</h1>
        </div>
        
        <!-- Thông báo -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        
        <!-- Tìm kiếm và lọc -->
        <div class="search-section">
            <form action="myorder" method="GET">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="input-group">
                            <input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="Tìm kiếm đơn hàng...">
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search"></i> Tìm kiếm
                            </button>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <select class="form-select" name="status" onchange="this.form.submit()">
                            <option value="" ${empty status ? 'selected' : ''}>Tất cả trạng thái</option>
                            <option value="pending" ${status == 'pending' ? 'selected' : ''}>Chờ xác nhận</option>
                            <option value="processing" ${status == 'processing' ? 'selected' : ''}>Đang xử lý</option>
                            <option value="shipped" ${status == 'shipped' ? 'selected' : ''}>Đang vận chuyển</option>
                            <option value="completed" ${status == 'completed' ? 'selected' : ''}>Đã hoàn thành</option>
                            <option value="cancelled" ${status == 'cancelled' ? 'selected' : ''}>Đã hủy</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <a href="myorder" class="btn btn-outline-secondary w-100">
                            <i class="fas fa-redo"></i> Làm mới
                        </a>
                    </div>
                </div>
            </form>
        </div>
        
        <!-- Danh sách đơn hàng -->
        <c:choose>
            <c:when test="${empty orders}">
                <div class="empty-orders">
                    <div class="empty-icon">
                        <i class="fas fa-shopping-bag"></i>
                    </div>
                    <div class="empty-message">Bạn chưa có đơn hàng nào</div>
                    <a href="listproduct" class="btn btn-primary">Tiếp tục mua sắm</a>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${orders}" var="order">
                    <div class="order-card">
                        <div class="order-header">
                            <div>
                                <div class="order-id">Đơn hàng #${order.orderCode}</div>
                                <div class="order-date">Ngày đặt: <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></div>
                            </div>
                            <div>
                                <c:choose>
                                    <c:when test="${order.status == 'pending'}">
                                        <span class="order-status status-pending">Chờ xác nhận</span>
                                    </c:when>
                                    <c:when test="${order.status == 'processing'}">
                                        <span class="order-status status-processing">Đang xử lý</span>
                                    </c:when>
                                    <c:when test="${order.status == 'shipped'}">
                                        <span class="order-status status-shipping">Đang vận chuyển</span>
                                    </c:when>
                                    <c:when test="${order.status == 'completed'}">
                                        <span class="order-status status-completed">Đã hoàn thành</span>
                                    </c:when>
                                    <c:when test="${order.status == 'cancelled'}">
                                        <span class="order-status status-cancelled">Đã hủy</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="order-status">${order.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="order-body">
                            <div class="order-items">
                                <c:forEach items="${order.items}" var="item" varStatus="loop">
                                    <c:if test="${loop.index < 2}">
                                        <div class="item-row">
                                            <img src="${item.productThumbnail}" alt="${item.productTitle}" class="item-image">
                                            <div class="item-details">
                                                <div class="item-title">${item.productTitle}</div>
                                                <div class="item-variant">Size: ${item.size} | Màu: ${item.color} | Số lượng: ${item.quantity}</div>
                                            </div>
                                            <div class="item-price">
                                                <fmt:formatNumber value="${item.productPrice * item.quantity}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                                
                                <c:if test="${order.items.size() > 2}">
                                    <div class="text-center mt-2">
                                        <span class="text-muted">Còn ${order.items.size() - 2} sản phẩm khác</span>
                                    </div>
                                </c:if>
                            </div>
                            
                            <div class="order-summary">
                                <div class="summary-row">
                                    <span>Địa chỉ giao hàng:</span>
                                    <span>${order.address}</span>
                                </div>
                                <div class="summary-row">
                                    <span>Phương thức thanh toán:</span>
                                    <span>
                                        <c:choose>
                                            <c:when test="${order.paymentMethod == 'cod'}">Thanh toán khi nhận hàng (COD)</c:when>
                                            <c:when test="${order.paymentMethod == 'bank_transfer'}">Chuyển khoản ngân hàng</c:when>
                                            <c:otherwise>${order.paymentMethod}</c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="summary-row">
                                    <span>Tổng thanh toán:</span>
                                    <span><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></span>
                                </div>
                            </div>
                            
                            <div class="order-actions">
                                <a href="orderdetail?id=${order.id}" class="btn-order-detail">
                                    <i class="fas fa-eye"></i> Xem chi tiết
                                </a>
                                
                                <div>
                                    <c:if test="${order.status == 'pending'}">
                                        <a href="myorder?action=cancel&id=${order.id}" class="btn-cancel-order" onclick="return confirm('Bạn có chắc muốn hủy đơn hàng này?')">
                                            <i class="fas fa-times"></i> Hủy đơn hàng
                                        </a>
                                    </c:if>
                                    
                                    <c:if test="${order.status == 'completed'}">
                                        <a href="buyagain?orderId=${order.id}" class="btn-reorder">
                                            <i class="fas fa-redo"></i> Mua lại
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                <!-- Phân trang -->
                <c:if test="${noOfPages > 1}">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="myorder?page=${currentPage - 1}${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty status ? '&status='.concat(status) : ''}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            
                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="myorder?page=${i}${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty status ? '&status='.concat(status) : ''}">${i}</a>
                                </li>
                            </c:forEach>
                            
                            <li class="page-item ${currentPage == noOfPages ? 'disabled' : ''}">
                                <a class="page-link" href="myorder?page=${currentPage + 1}${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty status ? '&status='.concat(status) : ''}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
            </c:otherwise>
        </c:choose>
    </div>
    
    <jsp:include page="footer.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Ẩn thông báo sau 5 giây
        window.setTimeout(function() {
            var alerts = document.querySelectorAll('.alert');
            alerts.forEach(function(alert) {
                var bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            });
        }, 5000);
    </script>
</body>
</html>