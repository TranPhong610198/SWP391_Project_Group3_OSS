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
            <!-- Header -->
            <div class="row mb-4">
                <div class="col">
                    <h1 class="h3">Giỏ hàng của bạn</h1>
                </div>
            </div>

            <!-- Links -->
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
                    <div class="card mb-4">
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${empty cart.items}">
                                    <div class="text-center py-5">
                                        <i class="fas fa-shopping-cart fa-3x text-muted mb-3"></i>
                                        <h5>Giỏ hàng trống</h5>
                                        <p class="text-muted">Hãy thêm sản phẩm vào giỏ hàng của bạn</p>
                                        <a href="listproduct" class="btn btn-primary">
                                            <i class="fas fa-shopping-bag me-2"></i>Chọn sản phẩm
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <form id="checkoutForm" action="cartdetail" method="POST">
                                        <input type="hidden" name="action" value="checkout">
                                        <div class="table-responsive">
                                            <table class="table align-middle">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">
                                                            <div class="form-check">
                                                                <input type="checkbox" class="form-check-input" id="selectAll" onchange="toggleAllProducts()">
                                                                <label class="form-check-label" for="selectAll">Tất cả</label>
                                                            </div>
                                                        </th>
                                                        <th scope="col">Sản phẩm</th>
                                                        <th scope="col">Giá</th>
                                                        <th scope="col">Số lượng</th>

                                                        <th scope="col"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${cart.items}" var="item">
                                                        <tr data-id="${item.id}">
                                                            <td>
                                                                <div class="form-check">
                                                                    <input type="checkbox" class="form-check-input product-select" 
                                                                           name="selectedItems" value="${item.id}"
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
                                                                <fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                            </td>
                                                            <td>
                                                                <div class="quantity-control">
                                                                    <div class="input-group">
                                                                        <button type="button" class="btn btn-outline-secondary" 
                                                                                onclick="updateQuantity(this, -1)">-</button>
                                                                        <input type="number" value="${item.quantity}" min="1" 
                                                                               class="form-control text-center quantity-input"
                                                                               data-item-id="${item.id}"
                                                                               onchange="handleQuantityChange(this)">
                                                                        <button type="button" class="btn btn-outline-secondary" 
                                                                                onclick="updateQuantity(this, 1)">+</button>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <button type="button" class="btn btn-link text-danger" 
                                                                        onclick="deleteItem(${item.id})">
                                                                    <i class="fas fa-trash"></i>
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="text-center mb-4">
                        <a href="listproduct" class="btn btn-outline-primary">
                            <i class="fas fa-plus me-2"></i>Thêm sản phẩm
                        </a>
                    </div>
                </div>

                <!-- Cart Summary -->
                <div class="col-lg-4">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title mb-3">Mã giảm giá</h5>
                            <select class="form-select mb-2" name="couponCode" onchange="updateTotalAmount()">
                                <option value="">Chọn mã giảm giá</option>
                                <c:forEach items="${availableCoupons}" var="coupon">
                                    <option value="${coupon.code}" 
                                            data-type="${coupon.discount_type}"
                                            data-value="${coupon.discount_value}"
                                            data-min="${coupon.min_order_amount}"
                                            data-max="${coupon.max_discount}">
                                        ${coupon.code} - 
                                        <c:choose>
                                            <c:when test="${coupon.discount_type == 'percentage'}">
                                                Giảm ${coupon.discount_value}%
                                            </c:when>
                                            <c:otherwise>
                                                Giảm ₫<fmt:formatNumber value="${coupon.discount_value}" type="number"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

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
                            <div class="d-flex justify-content-between mb-3 text-success" id="discountRow" style="display: none;">
                                <span>Giảm giá:</span>
                                <span id="discountAmount">-₫0</span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between mb-4">
                                <strong>Tổng thanh toán:</strong>
                                <strong class="text-primary" id="finalTotal">₫0</strong>
                            </div>

                            <button type="button" onclick="submitCheckout()" class="btn btn-primary w-100" id="checkoutBtn" disabled>
                                Thanh toán<i class="fas fa-arrow-right ms-2"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                function submitCheckout() {
                                    const form = document.getElementById('checkoutForm');
                                    const checkboxes = document.getElementsByClassName('product-select');
                                    let hasSelectedItems = false;

                                    // Thêm input hidden cho số lượng của từng sản phẩm được chọn
                                    for (let checkbox of checkboxes) {
                                        if (checkbox.checked) {
                                            hasSelectedItems = true;
                                            const row = checkbox.closest('tr');
                                            const itemId = checkbox.value;
                                            const quantity = row.querySelector('.quantity-input').value;

                                            // Thêm input hidden cho số lượng
                                            const quantityInput = document.createElement('input');
                                            quantityInput.type = 'hidden';
                                            quantityInput.name = 'quantity_' + itemId;
                                            quantityInput.value = quantity;
                                            form.appendChild(quantityInput);
                                        }
                                    }

                                    if (!hasSelectedItems) {
                                        alert('Vui lòng chọn ít nhất một sản phẩm');
                                        return;
                                    }

                                    // Thêm thông tin mã giảm giá vào form
                                    const couponSelect = document.querySelector('select[name="couponCode"]');
                                    if (couponSelect.value) {
                                        const couponInput = document.createElement('input');
                                        couponInput.type = 'hidden';
                                        couponInput.name = 'couponCode';
                                        couponInput.value = couponSelect.value;
                                        form.appendChild(couponInput);
                                    }

                                    form.submit();
                                }

                                function updateTotalAmount() {
                                    const checkboxes = document.getElementsByClassName('product-select');
                                    let totalAmount = 0;
                                    let selectedCount = 0;

                                    for (let checkbox of checkboxes) {
                                        if (checkbox.checked) {
                                            const row = checkbox.closest('tr');
                                            const priceText = row.querySelector('td:nth-child(3)').textContent;
                                            const price = parseFloat(priceText.replace(/[^\d]/g, ''));
                                            const quantity = parseInt(row.querySelector('.quantity-input').value);
                                            totalAmount += price * quantity;
                                            selectedCount++;
                                        }
                                    }

                                    document.getElementById('selectedCount').textContent = selectedCount;
                                    document.getElementById('selectedTotal').textContent = formatCurrency(totalAmount);

                                    let discount = calculateDiscount(totalAmount);
                                    updateDiscountDisplay(discount);

                                    const finalTotal = Math.max(0, totalAmount - discount);
                                    document.getElementById('finalTotal').textContent = formatCurrency(finalTotal);

                                    document.getElementById('checkoutBtn').disabled = selectedCount === 0;
                                }

                                function calculateDiscount(totalAmount) {
                                    let discount = 0;
                                    const select = document.querySelector('select[name="couponCode"]');
                                    if (select.value && totalAmount > 0) {
                                        const option = select.options[select.selectedIndex];
                                        const type = option.dataset.type;
                                        const value = parseFloat(option.dataset.value);
                                        const minAmount = parseFloat(option.dataset.min || 0);
                                        const maxDiscount = parseFloat(option.dataset.max || 0);

                                        if (totalAmount >= minAmount) {
                                            if (type === 'percentage') {
                                                discount = (totalAmount * value) / 100;
                                                if (maxDiscount > 0 && discount > maxDiscount) {
                                                    discount = maxDiscount;
                                                }
                                            } else {
                                                discount = value;
                                            }
                                        }
                                    }
                                    return discount;
                                }

                                function updateDiscountDisplay(discount) {
                                    const discountRow = document.getElementById('discountRow');
                                    if (discount > 0) {
                                        document.getElementById('discountAmount').textContent = '-' + formatCurrency(discount);
                                        discountRow.style.display = 'flex';
                                    } else {
                                        discountRow.style.display = 'none';
                                    }
                                }

                                function formatCurrency(amount) {
                                    return '₫' + amount.toLocaleString('vi-VN');
                                }

                                function toggleAllProducts() {
                                    const selectAll = document.getElementById('selectAll');
                                    const checkboxes = document.getElementsByClassName('product-select');
                                    for (let checkbox of checkboxes) {
                                        checkbox.checked = selectAll.checked;
                                    }
                                    updateTotalAmount();
                                }

                                function updateQuantity(button, change) {
                                    const input = button.parentElement.querySelector('input');
                                    const currentValue = parseInt(input.value) || 1; // Đảm bảo giá trị luôn là số
                                    const newValue = currentValue + change;

                                    if (newValue >= 1) {
                                        input.value = newValue;
                                        const itemId = input.dataset.itemId;
                                        if (itemId) {
                                            updateQuantityOnServer(itemId, newValue);
                                            updateTotalAmount();
                                        }
                                    }
                                }

                                function handleQuantityChange(input) {
                                    let value = parseInt(input.value) || 1; // Đảm bảo giá trị luôn là số

                                    // Đảm bảo giá trị tối thiểu là 1
                                    if (value < 1) {
                                        value = 1;
                                    }

                                    input.value = value; // Cập nhật giá trị input

                                    const itemId = input.dataset.itemId;
                                    if (itemId) {
                                        updateQuantityOnServer(itemId, value);
                                        updateTotalAmount();
                                    }
                                }

                                function updateQuantityOnServer(itemId, quantity) {
                                    // Kiểm tra tính hợp lệ của dữ liệu
                                    if (!itemId || !quantity || quantity < 1) {
                                        console.error('Invalid itemId or quantity');
                                        return;
                                    }

                                    const formData = new URLSearchParams();
                                    formData.append('action', 'update');
                                    formData.append('cartItemId', itemId);
                                    formData.append('quantity', quantity);

                                    fetch('cartdetail', {
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/x-www-form-urlencoded',
                                        },
                                        body: formData.toString()
                                    })
                                            .then(response => {
                                                if (!response.ok) {
                                                    throw new Error('Network response was not ok');
                                                }
                                            })
                                            .catch(error => {
                                                console.error('Error updating quantity:', error);
                                                // Có thể thêm thông báo lỗi cho người dùng ở đây
                                            });
                                }
                                function deleteItem(itemId) {
                                    if (confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?')) {
                                        const formData = new URLSearchParams();
                                        formData.append('action', 'delete');
                                        formData.append('cartItemId', itemId);

                                        fetch('cartdetail', {
                                            method: 'POST',
                                            headers: {
                                                'Content-Type': 'application/x-www-form-urlencoded',
                                            },
                                            body: formData.toString()
                                        })
                                                .then(response => {
                                                    if (!response.ok) {
                                                        throw new Error('Network response was not ok');
                                                    }
                                                    // Nếu xóa thành công, cập nhật UI
                                                    location.reload(); // Tải lại trang để cập nhật giỏ hàng
                                                })
                                                .catch(error => {
                                                    console.error('Error deleting item:', error);
                                                    alert('Có lỗi xảy ra khi xóa sản phẩm. Vui lòng thử lại sau.');
                                                });
                                    }
                                }
        </script>
    </body>
</html>