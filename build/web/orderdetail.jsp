<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết đơn hàng #${order.orderCode}</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            .container {
                padding-top: 30px;
                padding-bottom: 30px;
            }

            .page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
                padding-bottom: 15px;
                border-bottom: 1px solid #e9ecef;
            }

            .page-title {
                font-weight: 700;
                margin: 0;
            }

            .back-button {
                text-decoration: none;
            }

            .card {
                border: none;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.05);
                margin-bottom: 20px;
                overflow: hidden;
            }

            .card-header {
                background-color: #f8f9fa;
                border-bottom: 1px solid #e9ecef;
                padding: 15px 20px;
            }

            .card-title {
                margin: 0;
                font-weight: 600;
            }

            .card-body {
                padding: 20px;
            }

            .order-section {
                margin-bottom: 30px;
            }

            .section-title {
                font-weight: 600;
                margin-bottom: 15px;
                padding-bottom: 10px;
                border-bottom: 1px solid #e9ecef;
            }

            .info-item {
                display: flex;
                margin-bottom: 10px;
            }

            .info-label {
                width: 150px;
                font-weight: 500;
                color: #6c757d;
            }

            .product-item {
                padding: 15px 0;
                border-bottom: 1px solid #e9ecef;
            }

            .product-item:last-child {
                border-bottom: none;
            }

            .product-img {
                width: 70px;
                height: 70px;
                object-fit: cover;
                border-radius: 5px;
            }

            .product-name {
                font-weight: 600;
                margin-bottom: 5px;
            }

            .product-variant {
                font-size: 0.85rem;
                color: #6c757d;
            }

            .price {
                font-weight: 600;
                color: #212529;
            }

            .order-summary {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 5px;
            }

            .summary-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            .summary-row:last-child {
                margin-bottom: 0;
                padding-top: 10px;
                border-top: 1px solid #e9ecef;
                font-weight: 700;
            }

            .order-status {
                display: inline-block;
                padding: 5px 10px;
                border-radius: 5px;
                font-size: 0.9rem;
                font-weight: 600;
                text-transform: uppercase;
            }

            .status-pending {
                background-color: #fff3cd;
                color: #856404;
            }

            .status-processing {
                background-color: #cce5ff;
                color: #004085;
            }

            .status-shipped {
                background-color: #d1ecf1;
                color: #0c5460;
            }

            .status-completed {
                background-color: #d4edda;
                color: #155724;
            }

            .status-cancelled {
                background-color: #f8d7da;
                color: #721c24;
            }

            .timeline {
                position: relative;
                padding: 20px 0;
            }

            .timeline-line {
                position: absolute;
                left: 15px;
                top: 0;
                bottom: 0;
                width: 2px;
                background-color: #e9ecef;
            }

            .timeline-item {
                position: relative;
                padding-left: 40px;
                padding-bottom: 20px;
            }

            .timeline-item:last-child {
                padding-bottom: 0;
            }

            .timeline-dot {
                position: absolute;
                left: 10px;
                top: 0;
                width: 12px;
                height: 12px;
                border-radius: 50%;
                background-color: #0d6efd;
            }

            .timeline-content {
                position: relative;
                padding: 15px;
                background-color: #f8f9fa;
                border-radius: 5px;
            }

            .timeline-date {
                font-size: 0.85rem;
                color: #6c757d;
                margin-bottom: 5px;
            }

            .timeline-text {
                margin-bottom: 0;
            }

            .action-buttons {
                margin-top: 20px;
            }

            .action-buttons .btn {
                margin-right: 10px;
            }

            .payment-info {
                margin-top: 15px;
            }

            .discount-badge {
                background-color: #28a745;
                color: white;
                padding: 2px 8px;
                border-radius: 4px;
                font-size: 0.8rem;
                display: inline-block;
                margin-left: 5px;
            }

            @media (max-width: 768px) {
                .info-item {
                    flex-direction: column;
                    margin-bottom: 15px;
                }

                .info-label {
                    width: 100%;
                    margin-bottom: 5px;
                }

                .product-img {
                    width: 60px;
                    height: 60px;
                }

                .action-buttons .btn {
                    display: block;
                    width: 100%;
                    margin-bottom: 10px;
                    margin-right: 0;
                }
            }
        </style>
    </head>
    <body>
        <div><jsp:include page="/header.jsp" /></div>

        <div class="container">
            <div class="page-header">
                <h2 class="page-title">Chi tiết đơn hàng #${order.orderCode}</h2>
                <a href="myorder" class="back-button">
                    <i class="fas fa-arrow-left"></i> Quay lại đơn hàng
                </a>
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

            <div class="row">
                <div class="col-md-8">
                    <!-- Thông tin đơn hàng -->
                    <div class="card order-section">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="card-title">Thông tin đơn hàng</h5>
                            <c:choose>
                                <c:when test="${order.status eq 'pending'}">
                                    <span class="order-status status-pending">Chờ xử lý</span>
                                </c:when>
                                <c:when test="${order.status eq 'processing'}">
                                    <span class="order-status status-processing">Đang xử lý</span>
                                </c:when>
                                <c:when test="${order.status eq 'shipped'}">
                                    <span class="order-status status-shipped">Đang giao hàng</span>
                                </c:when>
                                <c:when test="${order.status eq 'completed'}">
                                    <span class="order-status status-completed">Hoàn thành</span>
                                </c:when>
                                <c:when test="${order.status eq 'cancelled'}">
                                    <span class="order-status status-cancelled">Đã hủy</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="order-status">${order.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <div class="info-item">
                                <div class="info-label">Mã đơn hàng:</div>
                                <div class="info-value">${order.orderCode}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Ngày đặt hàng:</div>
                                <div class="info-value">
                                    <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm:ss"/>
                                </div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Phương thức thanh toán:</div>
                                <div class="info-value">
                                    <c:choose>
                                        <c:when test="${order.paymentMethod eq 'cod'}">
                                            <i class="fas fa-money-bill-wave me-1"></i> Thanh toán khi nhận hàng (COD)
                                        </c:when>
                                        <c:when test="${order.paymentMethod eq 'bank_transfer' || order.paymentMethod eq 'bank'}">
                                            <i class="fas fa-university me-1"></i> Chuyển khoản ngân hàng
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-credit-card me-1"></i> ${order.paymentMethod}
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="payment-info text-muted">
                                        <small>Trạng thái thanh toán: 
                                            <c:choose>
                                                <c:when test="${order.paymentStatus eq 'pending'}">Chờ thanh toán</c:when>
                                                <c:when test="${order.paymentStatus eq 'completed'}">Đã thanh toán</c:when>
                                                <c:when test="${order.paymentStatus eq 'failed'}">Thanh toán thất bại</c:when>
                                                <c:when test="${order.paymentStatus eq 'refunded'}">Đã hoàn tiền</c:when>
                                                <c:otherwise>${order.paymentStatus}</c:otherwise>
                                            </c:choose>
                                        </small>
                                    </div>
                                </div>
                            </div>

                            <!-- Hiện thị thông tin vận chuyển nếu có -->
                            <div class="info-item">
                                <div class="info-label">Phương thức vận chuyển:</div>
                                <div class="info-value">
                                    <c:choose>
                                        <c:when test="${order.shippingMethod eq 'standard'}">
                                            <i class="fas fa-truck me-1"></i> Giao hàng tiêu chuẩn (3-5 ngày)
                                            <div class="small text-muted mt-1">Phí vận chuyển: 30,000₫</div>
                                        </c:when>
                                        <c:when test="${order.shippingMethod eq 'express'}">
                                            <i class="fas fa-shipping-fast me-1"></i> Giao hàng nhanh (1-2 ngày)
                                            <div class="small text-muted mt-1">Phí vận chuyển: 45,000₫</div>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-truck me-1"></i> ${order.shippingMethod}
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <!-- Nút hành động -->
                            <c:if test="${order.status eq 'pending'}">
                                <div class="action-buttons">
                                    <a href="orderdetail?action=cancel&id=${order.id}" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng này?')">
                                        <i class="fas fa-times"></i> Hủy đơn hàng
                                    </a>
                                </div>
                            </c:if>
                            <c:if test="${order.status eq 'completed'}">
                                <div class="action-buttons">
                                    <a href="feedback?order=${order.id}" class="btn btn-primary">
                                        <i class="fas fa-star"></i> Đánh giá sản phẩm
                                    </a>
                                    <a href="orderdetail?action=reorder&id=${order.id}" class="btn btn-outline-primary">
                                        <i class="fas fa-redo"></i> Đặt lại
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Danh sách sản phẩm -->
                    <div class="card order-section">
                        <div class="card-header">
                            <h5 class="card-title">Sản phẩm đã đặt</h5>
                        </div>
                        <div class="card-body">
                            <c:forEach items="${order.items}" var="item">
                                <div class="product-item">
                                    <div class="row align-items-center">
                                        <div class="col-2 col-md-1">
                                            <img src="${item.productThumbnail}" alt="${item.productTitle}" class="product-img">
                                        </div>
                                        <div class="col-10 col-md-6">
                                            <div class="product-name">${item.productTitle}</div>
                                            <div class="product-variant">Size: ${item.size} | Màu: ${item.color}</div>
                                        </div>
                                        <div class="col-md-2 text-center d-none d-md-block">
                                            <div class="quantity">x${item.quantity}</div>
                                        </div>
                                        <div class="col-md-3 text-end d-none d-md-block">
                                            <div class="price">
                                                <fmt:formatNumber value="${item.productPrice * item.quantity}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </div>
                                            <small class="text-muted">
                                                <fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/> / sản phẩm
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <!-- Tổng kết -->
                            <div class="order-summary mt-4">
                                <div class="summary-row">
                                    <span>Tổng tiền hàng:</span>
                                    <span>
                                        <c:set var="subtotal" value="0" />
                                        <c:forEach items="${order.items}" var="item">
                                            <c:set var="subtotal" value="${subtotal + (item.productPrice * item.quantity)}" />
                                        </c:forEach>
                                        <fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </span>
                                </div>

                                <!-- Hiển thị giảm giá -->
                                <div class="summary-row text-success">
                                    <span>
                                        Giảm giá:
                                        <c:if test="${not empty order.couponCode}">
                                            <span class="discount-badge">
                                                Mã ${order.couponCode}
                                            </span>
                                        </c:if>
                                    </span>
                                    <span>
                                        <c:choose>
                                            <c:when test="${not empty order.discountAmount && order.discountAmount > 0}">
                                                -<fmt:formatNumber value="${order.discountAmount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                            </c:when>
                                            <c:otherwise>
                                                0₫
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>

                                <!-- Phí vận chuyển -->
                                <div class="summary-row">
                                    <span>Phí vận chuyển:</span>
                                    <span>
                                        <c:set var="shipping" value="${order.shippingMethod eq 'express' ? 45000 : 30000}" />
                                        <fmt:formatNumber value="${shipping}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                    </span>
                                </div>

                                <div class="summary-row">
                                    <span>Tổng thanh toán:</span>
                                    <span><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <!-- Thông tin giao hàng -->
                    <div class="card order-section">
                        <div class="card-header">
                            <h5 class="card-title">Thông tin giao hàng</h5>
                        </div>
                        <div class="card-body">
                            <div class="info-item">
                                <div class="info-label">Người nhận:</div>
                                <div class="info-value">${order.recipientName}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Số điện thoại:</div>
                                <div class="info-value">${order.phone}</div>
                            </div>
                            <div class="info-item">
                                <div class="info-label">Địa chỉ:</div>
                                <div class="info-value">${order.address}</div>
                            </div>
                        </div>
                    </div>

                    <!-- Lịch sử đơn hàng -->
                    <div class="card order-section">
                        <div class="card-header">
                            <h5 class="card-title">Lịch sử đơn hàng</h5>
                        </div>
                        <div class="card-body">
                            <div class="timeline">
                                <div class="timeline-line"></div>

                                <!-- Sự kiện đặt hàng -->
                                <div class="timeline-item">
                                    <div class="timeline-dot"></div>
                                    <div class="timeline-content">
                                        <div class="timeline-date">
                                            <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/>
                                        </div>
                                        <p class="timeline-text">
                                            <strong>Đơn hàng đã được tạo</strong><br>
                                            Mã đơn hàng: ${order.orderCode}
                                        </p>
                                    </div>
                                </div>

                                <!-- Lịch sử cập nhật trạng thái -->
                                <c:forEach items="${orderHistory}" var="history">
                                    <div class="timeline-item">
                                        <div class="timeline-dot"></div>
                                        <div class="timeline-content">
                                            <div class="timeline-date">
                                                <fmt:formatDate value="${history.updatedAt}" pattern="dd/MM/yyyy HH:mm"/>
                                            </div>
                                            <p class="timeline-text">
                                                <strong>
                                                    <c:choose>
                                                        <c:when test="${history.status eq 'pending'}">Chờ xử lý</c:when>
                                                        <c:when test="${history.status eq 'processing'}">Đơn hàng đang được xử lý</c:when>
                                                        <c:when test="${history.status eq 'shipped'}">Đơn hàng đang được giao</c:when>
                                                        <c:when test="${history.status eq 'completed'}">Đơn hàng đã hoàn thành</c:when>
                                                        <c:when test="${history.status eq 'cancelled'}">Đơn hàng đã bị hủy</c:when>
                                                        <c:otherwise>${history.status}</c:otherwise>
                                                    </c:choose>
                                                </strong><br> 
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div><jsp:include page="/footer.jsp" /></div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                        // Ẩn thông báo sau 5 giây
                                        window.setTimeout(function () {
                                            var alerts = document.querySelectorAll('.alert');
                                            alerts.forEach(function (alert) {
                                                var bsAlert = new bootstrap.Alert(alert);
                                                bsAlert.close();
                                            });
                                        }, 5000);
        </script>
    </body>
</html>