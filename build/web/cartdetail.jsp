<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .product-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }
        .quantity-control {
            max-width: 120px;
        }
        .cart-summary {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
        }
        .search-box {
            max-width: 300px;
        }
        .form-check-input {
            cursor: pointer;
        }
    </style>
</head>
<body class="bg-light">
    <jsp:include page="/header.jsp" />
    <div class="container py-5">
        <!-- Header with Search -->
        <div class="row align-items-center mb-4">
            <div class="col">
                <h1 class="h3">Giỏ hàng của bạn</h1>
            </div>
            <div class="col-auto">
                <form action="products" method="get" class="search-box">
                    <div class="input-group">
                        <input type="text" class="form-control" name="search" 
                               placeholder="Tìm kiếm sản phẩm...">
                        <button class="btn btn-outline-primary" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Contact Links -->
        <div class="bg-white p-3 rounded mb-4">
            <div class="row text-center">
                <div class="col-md-4">
                    <a href="contact" class="text-decoration-none">
                        <i class="fas fa-envelope me-2"></i>Liên hệ
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="about" class="text-decoration-none">
                        <i class="fas fa-info-circle me-2"></i>Về chúng tôi
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="help" class="text-decoration-none">
                        <i class="fas fa-question-circle me-2"></i>Trợ giúp
                    </a>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Cart Items -->
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${empty cart.items}">
                                <div class="text-center py-5">
                                    <i class="fas fa-shopping-cart fa-3x text-muted mb-3"></i>
                                    <h5>Giỏ hàng trống</h5>
                                    <p class="text-muted">Hãy thêm sản phẩm vào giỏ hàng của bạn</p>
                                    <a href="products" class="btn btn-primary">
                                        <i class="fas fa-shopping-bag me-2"></i>Chọn thêm sản phẩm
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check">
                                                        <input type="checkbox" class="form-check-input" id="selectAll" 
                                                               onchange="toggleAllProducts()">
                                                        <label class="form-check-label" for="selectAll">Tất cả</label>
                                                    </div>
                                                </th>
                                                <th>Sản phẩm</th>
                                                <th>Giá</th>
                                                <th>Số lượng</th>
                                                <th>Tổng tiền</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${cart.items}" var="item">
                                                <tr>
                                                    <td>
                                                        <div class="form-check">
                                                            <input type="checkbox" class="form-check-input product-select" 
                                                                   value="${item.id}" data-price="${item.productPrice}" 
                                                                   data-quantity="${item.quantity}"
                                                                   onchange="updateTotalAmount()">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <img src="${item.productThumbnail}" alt="${item.productTitle}" 
                                                                 class="product-image me-3">
                                                            <div>
                                                                <h6 class="mb-0">${item.productTitle}</h6>
                                                                <small class="text-muted">
                                                                    Size: ${item.size} | Màu: ${item.color}
                                                                </small>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber value="${item.productPrice}" type="currency" 
                                                                        currencySymbol="₫" maxFractionDigits="0"/>
                                                    </td>
                                                    <td>
                                                        <form action="cartdetail" method="post" class="quantity-control">
                                                            <input type="hidden" name="action" value="update">
                                                            <input type="hidden" name="cartItemId" value="${item.id}">
                                                            <div class="input-group">
                                                                <button type="button" class="btn btn-outline-secondary" 
                                                                        onclick="updateQuantity(this, -1)">-</button>
                                                                <input type="number" name="quantity" value="${item.quantity}" 
                                                                       min="1" class="form-control text-center quantity-input"
                                                                       data-item-id="${item.id}"
                                                                       onchange="handleQuantityChange(this)">
                                                                <button type="button" class="btn btn-outline-secondary" 
                                                                        onclick="updateQuantity(this, 1)">+</button>
                                                            </div>
                                                        </form>
                                                    </td>
                                                    <td class="item-total">
                                                        <fmt:formatNumber value="${item.productPrice * item.quantity}" 
                                                                        type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                    </td>
                                                    <td>
                                                        <form action="cartdetail" method="post" class="d-inline">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="cartItemId" value="${item.id}">
                                                            <button type="submit" class="btn btn-link text-danger" 
                                                                    onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?')">
                                                                <i class="fas fa-trash"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Add More Products Button -->
                <div class="text-center my-4">
                    <a href="products" class="btn btn-outline-primary">
                        <i class="fas fa-plus me-2"></i>Chọn thêm sản phẩm
                    </a>
                </div>
            </div>

            <!-- Cart Summary -->
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Tổng đơn hàng</h5>
                        <div class="d-flex justify-content-between mb-3">
                            <span>Số sản phẩm đã chọn:</span>
                            <span id="selectedCount">0</span>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <span>Tổng tiền hàng:</span>
                            <span id="selectedTotal">₫0</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-4">
                            <strong>Tổng thanh toán:</strong>
                            <strong class="text-primary" id="finalTotal">₫0</strong>
                        </div>
                        
                        <c:if test="${not empty cart.items}">
                            <button onclick="checkout()" class="btn btn-primary w-100" id="checkoutBtn" disabled>
                                Thanh toán<i class="fas fa-arrow-right ms-2"></i>
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleAllProducts() {
            const selectAll = document.getElementById('selectAll');
            const checkboxes = document.getElementsByClassName('product-select');
            for (let checkbox of checkboxes) {
                checkbox.checked = selectAll.checked;
            }
            updateTotalAmount();
        }

        function formatCurrency(amount) {
            return '₫' + new Intl.NumberFormat('vi-VN').format(amount);
        }

        function updateTotalAmount() {
            const checkboxes = document.getElementsByClassName('product-select');
            let totalAmount = 0;
            let selectedCount = 0;

            for (let checkbox of checkboxes) {
                if (checkbox.checked) {
                    const price = parseFloat(checkbox.dataset.price);
                    const quantity = parseInt(checkbox.dataset.quantity);
                    totalAmount += price * quantity;
                    selectedCount++;
                }
            }

            // Update summary information
            document.getElementById('selectedCount').textContent = selectedCount;
            document.getElementById('selectedTotal').textContent = formatCurrency(totalAmount);
            document.getElementById('finalTotal').textContent = formatCurrency(totalAmount);
            
            // Enable/disable checkout button
            document.getElementById('checkoutBtn').disabled = selectedCount === 0;
        }

        function updateQuantity(button, change) {
            const form = button.closest('form');
            const input = form.querySelector('input[name="quantity"]');
            const itemId = input.dataset.itemId;
            const currentValue = parseInt(input.value);
            const newValue = currentValue + change;
            
            if (newValue >= 1) {
                input.value = newValue;
                updateItemData(itemId, newValue);
                submitQuantityUpdate(form);
            }
        }

        function handleQuantityChange(input) {
            const itemId = input.dataset.itemId;
            const newValue = parseInt(input.value);
            if (newValue >= 1) {
                updateItemData(itemId, newValue);
                submitQuantityUpdate(input.form);
            }
        }

        function updateItemData(itemId, newQuantity) {
            const checkbox = document.querySelector(`.product-select[value="${itemId}"]`);
            if (checkbox) {
                checkbox.dataset.quantity = newQuantity;
                updateTotalAmount();
            }
        }

        function submitQuantityUpdate(form) {
            form.submit();
        }

        function checkout() {
            const selectedItems = [];
            const checkboxes = document.getElementsByClassName('product-select');
            
            for (let checkbox of checkboxes) {
                if (checkbox.checked) {
                    selectedItems.push(checkbox.value);
                }
            }

            if (selectedItems.length > 0) {
                // Store selected items in session storage
                sessionStorage.setItem('selectedItems', JSON.stringify(selectedItems));
                // Redirect to checkout page
                window.location.href = 'cartcontact.jsp';
            }
        }

        // Initialize total on page load
        document.addEventListener('DOMContentLoaded', updateTotalAmount);
    </script>
</body>
</html>