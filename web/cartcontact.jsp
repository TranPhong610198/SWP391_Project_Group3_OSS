<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin giao hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
            margin: 30px auto;
        }
        .cart-contact {
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
        }
        .title {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }
        .section-title {
            font-size: 18px;
            color: #555;
            margin: 15px 0;
        }
        .address-list {
            max-height: 200px;
            overflow-y: auto;
        }
        .address-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .address-item.selected {
            border-color: #007bff;
            background-color: #f8f9fa;
        }
        .address-actions {
            margin-top: 10px;
        }
        .order-summary {
            background: #f8f9fa;
            border-radius: 5px;
            padding: 15px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="cart">Giỏ hàng</a></li>
                <li class="breadcrumb-item active">Thông tin giao hàng</li>
            </ol>
        </nav>

        <div class="cart-contact">
            <h1 class="title">Thông tin giao hàng</h1>

            <!-- Địa chỉ giao hàng -->
            <h2 class="section-title">
                <i class="fas fa-map-marker-alt me-2"></i>Địa chỉ giao hàng
            </h2>
            
            <!-- Danh sách địa chỉ -->
            <div class="address-list">
                <c:if test="${not empty addresses}">
                    <c:forEach items="${addresses}" var="address">
                        <div class="address-item ${address.isDefault ? 'selected' : ''}">
                            <div class="form-check">
                                <input type="radio" class="form-check-input" 
                                       name="shipping_address" 
                                       value="${address.id}"
                                       ${address.isDefault ? 'checked' : ''}>
                                <label class="form-check-label">
                                    <strong>${address.recipientName}</strong>
                                    <c:if test="${address.isDefault}">
                                        <span class="badge bg-primary ms-2">Mặc định</span>
                                    </c:if>
                                    <br>
                                    <span class="text-muted">
                                        <i class="fas fa-phone me-1"></i>${address.phone}
                                    </span><br>
                                    <span>${address.address}</span>
                                </label>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

            <!-- Thêm địa chỉ mới -->
            <button class="btn btn-outline-primary mt-3" data-bs-toggle="modal" data-bs-target="#addAddressModal">
                <i class="fas fa-plus me-2"></i>Thêm địa chỉ mới
            </button>

            <!-- Phương thức vận chuyển -->
            <h2 class="section-title mt-4">
                <i class="fas fa-truck me-2"></i>Phương thức vận chuyển
            </h2>
            <div class="shipping-methods">
                <div class="form-check mb-2">
                    <input type="radio" class="form-check-input" name="shipping_method" value="standard" checked>
                    <label class="form-check-label">
                        <span>Giao hàng tiêu chuẩn</span>
                        <br>
                        <small class="text-muted">3-5 ngày - 30.000₫</small>
                    </label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="shipping_method" value="express">
                    <label class="form-check-label">
                        <span>Giao hàng nhanh</span>
                        <br>
                        <small class="text-muted">1-2 ngày - 45.000₫</small>
                    </label>
                </div>
            </div>

            <!-- Phương thức thanh toán -->
            <h2 class="section-title mt-4">
                <i class="fas fa-credit-card me-2"></i>Phương thức thanh toán
            </h2>
            <div class="payment-methods">
                <div class="form-check mb-2">
                    <input type="radio" class="form-check-input" name="payment_method" value="cod" checked>
                    <label class="form-check-label">
                        Thanh toán khi nhận hàng (COD)
                    </label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="payment_method" value="bank">
                    <label class="form-check-label">
                        Chuyển khoản ngân hàng
                    </label>
                </div>
            </div>

            <!-- Tóm tắt đơn hàng -->
            <div class="order-summary">
                <h3 class="section-title">Tóm tắt đơn hàng</h3>
                <div class="d-flex justify-content-between mb-2">
                    <span>Tạm tính:</span>
                    <span>500.000₫</span>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <span>Phí vận chuyển:</span>
                    <span>30.000₫</span>
                </div>
                <div class="d-flex justify-content-between fw-bold">
                    <span>Tổng cộng:</span>
                    <span>530.000₫</span>
                </div>
            </div>

            <!-- Nút điều hướng -->
            <div class="d-flex justify-content-between mt-4">
                <a href="cart" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Quay lại giỏ hàng
                </a>
                <a href="cartcompletion.jsp" class="btn btn-primary">
                    Đặt hàng<i class="fas fa-arrow-right ms-2"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- Modal thêm địa chỉ -->
    <div class="modal fade" id="addAddressModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm địa chỉ mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="addressForm">
                        <div class="mb-3">
                            <label class="form-label">Họ tên người nhận</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số điện thoại</label>
                            <input type="tel" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tỉnh/Thành phố</label>
                            <select class="form-select" required>
                                <option value="">Chọn tỉnh/thành phố</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Quận/Huyện</label>
                            <select class="form-select" required>
                                <option value="">Chọn quận/huyện</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phường/Xã</label>
                            <select class="form-select" required>
                                <option value="">Chọn phường/xã</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Địa chỉ cụ thể</label>
                            <input type="text" class="form-control" 
                                   placeholder="Số nhà, tên đường" required>
                        </div>
                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" id="defaultAddress">
                            <label class="form-check-label" for="defaultAddress">
                                Đặt làm địa chỉ mặc định
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Thêm địa chỉ</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>