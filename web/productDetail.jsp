<%-- 
    Document   : productDetail
    Created on : Feb 25, 2025, 2:04:38 AM
    Author     : tphon
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${product.title} - Fashion Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .product-container {
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                padding: 30px;
                margin-bottom: 30px;
            }

            .product-image-main {
                width: 100%;
                height: 400px;
                object-fit: contain;
                margin-bottom: 20px;
                border-radius: 4px;
            }

            .thumbnail-container {
                display: flex;
                gap: 10px;
                margin-bottom: 20px;
                overflow-x: auto;
                padding-bottom: 10px;
            }

            .thumbnail {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 4px;
                cursor: pointer;
                border: 2px solid transparent;
                transition: all 0.3s ease;
            }

            .thumbnail:hover, .thumbnail.active {
                border-color: #333;
                transform: translateY(-2px);
            }

            .product-title {
                font-size: 1.8rem;
                font-weight: 600;
                margin-bottom: 15px;
                color: #333;
            }

            .product-price {
                display: flex;
                align-items: baseline;
                gap: 15px;
                margin-bottom: 20px;
            }

            .sale-price {
                font-size: 1.8rem;
                font-weight: 600;
                color: #0984e3; /* Changed to blue color */
            }

            .original-price {
                font-size: 1.2rem;
                color: #999;
                text-decoration: line-through;
            }

            .product-description {
                margin-bottom: 30px;
                color: #666;
                line-height: 1.6;
            }

            .quantity-selector {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .quantity-input {
                width: 70px;
                text-align: center;
            }

            .option-selector {
                margin-bottom: 20px;
            }

            .option-label {
                font-weight: 500;
                margin-bottom: 8px;
                display: block;
            }

            .action-buttons {
                display: flex;
                gap: 15px;
                margin-top: 30px;
            }

            .btn-buy-now {
                flex: 1;
                padding: 12px 20px;
                background: #e44d26;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .btn-add-cart {
                flex: 1;
                padding: 12px 20px;
                background: #333;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .btn-buy-now:hover {
                background: #c53d1d;
                transform: translateY(-2px);
            }

            .btn-add-cart:hover {
                background: #000;
                transform: translateY(-2px);
            }

            .product-meta {
                margin-top: 20px;
                padding-top: 20px;
                border-top: 1px solid #eee;
                font-size: 0.9rem;
                color: #777;
            }

            .meta-item {
                margin-bottom: 8px;
            }

            .feedback-section {
                margin-top: 50px;
            }

            .feedback-title {
                font-size: 1.4rem;
                font-weight: 600;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #eee;
            }

            .feedback-item {
                padding: 20px;
                border-bottom: 1px solid #eee;
                display: flex;
                gap: 20px;
            }

            .feedback-avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background: #eee;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #777;
                font-size: 1.2rem;
            }

            .feedback-content {
                flex: 1;
            }

            .feedback-author {
                font-weight: 500;
                margin-bottom: 5px;
            }

            .feedback-rating {
                color: #f5c518;
                margin-bottom: 8px;
            }

            .feedback-text {
                color: #666;
            }

            .feedback-date {
                font-size: 0.8rem;
                color: #999;
                margin-top: 5px;
            }
            .feedback-images {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-top: 10px;
            }

            .feedback-images img {
                border-radius: 4px;
            }
            .reply {
                background-color: #f9f9f9;
                padding: 10px;
                border-radius: 4px;
                margin-top: 10px;
            }
            .reply .feedback-author {
                color: #2c3e50;
                font-weight: 600;
            }

            /* Similar Products Section - Matching productList.jsp */
            .similar-products-section {
                margin-top: 50px;
                margin-bottom: 50px;
            }

            .similar-products-title {
                font-size: 1.4rem;
                font-weight: 600;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #eee;
            }

            /* Product grid styles copied from productList.jsp */
            .product-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 25px;
                margin-top: 20px;
            }

            /* Card sản phẩm - đồng bộ với productList.jsp */
            .product-card {
                border: none;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 4px 15px rgba(0,0,0,0.08);
                transition: all 0.3s ease;
                height: 100%;
                background: white;
            }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            }

            .product-image {
                height: 250px;
                object-fit: cover;
                width: 100%;
                transition: all 0.5s ease;
            }

            .product-card:hover .product-image {
                transform: scale(1.05);
            }

            .product-info {
                padding: 1.5rem;
                background: white;
            }

            .product-title {
                font-size: 1.1rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
                color: #2d3436;
                height: auto;
                overflow: hidden;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
            }

            .product-price {
                font-size: 1.2rem;
                color: #0984e3;
                font-weight: 700;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            /* Các style mới được thêm vào */
            .options-row {
                display: flex;
                flex-wrap: wrap;
                gap: 15px;
                margin-bottom: 20px;
            }

            .options-col {
                flex: 1;
                min-width: 120px;
            }

            .stock-status {
                display: flex;
                align-items: center;
                margin-left: 15px;
                padding: 6px 0;
            }

            .stock-status.in-stock {
                color: #28a745;
            }

            .stock-status.out-of-stock {
                color: #dc3545;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .action-buttons {
                    flex-direction: column;
                }

                .product-image-main {
                    height: 300px;
                }

                .options-row {
                    flex-direction: column;
                }

                .options-col {
                    width: 100%;
                }

                .product-grid {
                    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                    gap: 15px;
                }
            }
            #feedback_section {
                scroll-margin-top: 100px; /* Điều chỉnh giá trị này theo chiều cao header */
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container">
            <div class="product-container">
                <c:if test="${alert != null && !alert.trim().isEmpty()}">
                    <c:choose>
                        <c:when test="${alert.equals('EOS')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Sản phẩm đã hết hàng hoặc ngừng kinh doanh.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('SS')}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                Thêm vào giỏ hàng thành công.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                        <c:when test="${alert.equals('ERR')}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                Lỗi không xác định.
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:when>
                    </c:choose>
                </c:if>
                <div class="row">
                    <!-- Product Images Column -->
                    <div class="col-md-6">
                        <img src="${product.thumbnail}" class="product-image-main" id="main-product-image" alt="${product.title}">

                        <div class="thumbnail-container">
                            <c:forEach items="${product.subImages}" var="image" varStatus="status">
                                <img src="${image}" class="thumbnail ${status.index == 0 ? 'active' : ''}" 
                                     alt="${product.title} - Image ${status.index + 1}"
                                     onclick="changeMainImage(this.src)">
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Product Details Column -->
                    <div class="col-md-6">
                        <h1 class="product-title">${product.title}</h1>

                        <div class="product-price">
                            <div class="sale-price">
                                <fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                            </div>
                            <%--<c:if test="${product.originalPrice > product.salePrice}">--%>
                            <!--<div class="original-price">-->
                            <%--<fmt:formatNumber value="${product.originalPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>--%>
                            <!--</div>-->
                            <%--</c:if>--%>
                        </div>
                        ${product.description}

                        <form action="productdetail" method="POST">
                            <input type="hidden" name="id" value="${product.id}">

                            <!-- Size và Color Selector trên cùng một hàng -->
                            <div class="options-row">
                                <div class="options-col">
                                    <label for="sizeId" class="option-label">Chọn Size</label>
                                    <select id="sizeId" name="sizeId" class="form-select" required="" onchange="changeSize(this.value)">
                                        <option value="">Chọn Size</option>
                                        <c:forEach items="${sizes}" var="size">
                                            <option value="${size.id}" ${sizeId == size.id ? 'selected' : ''}>${size.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="options-col">
                                    <label for="colorId" class="option-label">Chọn Màu</label>
                                    <select id="colorId" name="colorId" class="form-select" required="" onchange="changeColor(this.value)">
                                        <option value="">Chọn Màu</option>
                                        <c:forEach items="${colors}" var="color">
                                            <option value="${color.id}" ${colorId == color.id ? 'selected' : ''}>${color.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <!-- Quantity Selector và tình trạng hàng trên cùng một hàng -->
                            <div class="options-row align-items-end">
                                <div class="options-col">
                                    <label for="quantity" class="option-label">Số Lượng</label>
                                    <div class="quantity-selector">
                                        <button type="button" class="btn btn-outline-secondary" onclick="decrementQuantity()">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <input type="number" id="quantity" name="quantity" class="form-control quantity-input" value="1" min="1" max="${product.stock}">
                                        <button type="button" class="btn btn-outline-secondary" onclick="incrementQuantity()">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                </div>

                                <div class="options-col">
                                    <div class="stock-status ${product.stock>0 && product.status.equals('active') ? 'in-stock' : 'out-of-stock'}">
                                        <i class="fas ${product.stock > 0 ? 'fa-check-circle' : 'fa-times-circle'}"></i>
                                        <span class="ms-2">
                                            <!--${product.stock > 0 ? 'Còn Hàng (' : 'Hết Hàng'}--> 
                                            <!--${product.stock > 0 ? product.stock : ''}-->
                                            <!--${product.stock > 0 ? ')' : ''}-->
                                            ${product.stock>0 && product.status.equals('active') ? 'Còn Hàng' : product.status.equals('inactive') ? 'Ngưng Bán' : 'Hết Hàng'} 
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <c:if test="${sessionScope.acc.role == 'customer' || sessionScope.acc.role == null}">
                                <div class="action-buttons">
                                    <button type="submit" name="action" value="buyNow" class="btn-buy-now">
                                        <i class="fas fa-bolt"></i> Mua Ngay
                                    </button>
                                    <button type="submit" name="action" value="addToCart" class="btn-add-cart">
                                        <i class="fas fa-shopping-cart"></i> Thêm Vào Giỏ
                                    </button>
                                </div>
                            </c:if>
                        </form>

                        <!-- Product Metadata -->
                        <div class="product-meta">
                            <div class="meta-item">
                                <strong>Danh Mục:</strong> <a href="listproduct?category=${product.categoryId}">${categoryName}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!---------------------Hiển thị danh sách đánh giá sản phẩm, nhưng chưa phát triển-------------------------------------------------->
            <!-- Feedback Section -->
            <div id="feedback_section" class="feedback-section">
                <h2 class="feedback-title">Đánh Giá (${feedbacks.size()>0 ? feedbacks.size() : 0})</h2>
                <!-- Trung Bình Sao và Nút Lọc -->
                <div class="row mb-3">
                    <div class="col-md-3">
                        <div class="average-rating">
                            <h3>${averageRating} trên 5</h3>
                            <div class="star-rating">
                                <c:forEach begin="1" end="5" var="i">
                                    <i class="fas fa-star ${i <= averageRating ? 'text-warning' : 'text-muted'}"></i>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="filter-buttons">
                            <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}#feedback_section">Tất Cả</a>
                            <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=5#feedback_section">5 Sao (${fiveStarCount})</a>
                            <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=4#feedback_section">4 Sao (${fourStarCount})</a>
                            <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=3#feedback_section">3 Sao (${threeStarCount})</a>
                            <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=2#feedback_section">2 Sao (${twoStarCount})</a>
                            <a class="btn btn-outline-secondary me-2" href="productdetail?id=${product.id}&filterStar=1#feedback_section">1 Sao (${oneStarCount})</a>
                        </div>
                    </div>
                </div>
                <!-- Đánh giá -->
                <c:choose>
                    <c:when test="${not empty feedbacks}">
                        <c:forEach items="${feedbacks}" var="feedback">
                            <div class="feedback-item">
                                <div class="feedback-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div class="feedback-content">
                                    <div class="feedback-author">${feedback.userName}</div>
                                    <div class="feedback-rating">
                                        <c:forEach begin="1" end="5" var="i">
                                            <i class="fas fa-star ${i <= feedback.rating ? '' : 'text-muted'}"></i>
                                        </c:forEach>
                                    </div>
                                    <div class="feedback-text">${feedback.comment}</div>
                                    <!-- Show ảnh -->
                                    <div class="feedback-images">
                                        <c:forEach items="${feedback.feedbackImages}" var="imageUrl">
                                            <img src="${imageUrl}" alt="Feedback Image" style="width: 100px; height: 100px; object-fit: cover; margin-right: 10px;" onclick="showImageModal(this.src)">
                                        </c:forEach>
                                    </div>
                                    <!-- Modal cho ảnh -->
                                    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <img id="modalImage" src="" alt="Large Image" style="width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feedback-date">
                                        <fmt:formatDate value="${feedback.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                                    </div>
                                    <!-- Hiển thị phản hồi của cửa hàng -->
                                    <c:if test="${not empty feedback.replies}">
                                        <c:forEach items="${feedback.replies}" var="reply">
                                            <div class="reply" style="margin-left: 40px; margin-top: 10px;">
                                                <div class="feedback-author">Cửa hàng (${reply.userFullName})</div>
                                                <div class="feedback-text">${reply.comment}</div>
                                                <div class="feedback-date">
                                                    <fmt:formatDate value="${reply.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <i class="fas fa-comment-alt text-muted" style="font-size: 48px;"></i>
                            <p class="mt-3 text-muted">Chưa có đánh giá nào cho sản phẩm này</p>
                        </div>
                    </c:otherwise>
                </c:choose>

                <!-- Phân trang -->
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <!-- Nút Previous -->
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="productdetail?id=${product.id}&filterStar=${filterStar}&page=${currentPage - 1}#feedback_section" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <!-- Các trang -->
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link" href="productdetail?id=${product.id}&filterStar=${filterStar}&page=${i}#feedback_section">${i}</a>
                            </li>
                        </c:forEach>
                        <!-- Nút Next -->
                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="productdetail?id=${product.id}&filterStar=${filterStar}&page=${currentPage + 1}#feedback_section" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>

            <!-- Similar Products Section - Displays up to 4 similar products from the same category -->
            <div class="similar-products-section">
                <h2 class="similar-products-title">Sản Phẩm Tương Tự</h2>

                <div class="product-grid">
                    <c:forEach items="${similarProducts}" var="similarProduct" varStatus="status">
                        <c:if test="${status.index < 4}">
                            <div class="card product-card">
                                <a href="productdetail?id=${similarProduct.id}" style="text-decoration:none;">
                                    <div class="position-relative">
                                        <img src="${similarProduct.thumbnail}" class="product-image" alt="${similarProduct.title}">
                                    </div>
                                    <div class="product-info">
                                        <h5 class="product-title">${similarProduct.title}</h5>
                                        <div class="product-price">
                                            <span><fmt:formatNumber value="${similarProduct.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                                function changeMainImage(src) {
                                                    document.getElementById('main-product-image').src = src;
                                                    // Update active thumbnail
                                                    const thumbnails = document.querySelectorAll('.thumbnail');
                                                    thumbnails.forEach(thumb => {
                                                        if (thumb.src === src) {
                                                            thumb.classList.add('active');
                                                        } else {
                                                            thumb.classList.remove('active');
                                                        }
                                                    });
                                                }

                                                function changeSize(sizeID) {
                                                    setTimeout(() => { // Đợi một chút để đảm bảo giá trị mới được cập nhật
                                                        const colorID = document.getElementById('colorId').value;
                                                        window.location.href = 'productdetail?id=${product.id}&sizeId=' + sizeID + '&colorId=' + colorID;
                                                    }, 10);
                                                }

                                                function changeColor(colorID) {
                                                    setTimeout(() => {
                                                        const sizeID = document.getElementById('sizeId').value;
                                                        window.location.href = 'productdetail?id=${product.id}&sizeId=' + sizeID + '&colorId=' + colorID;
                                                    }, 10);
                                                }

                                                function incrementQuantity() {
                                                    const quantityInput = document.getElementById('quantity');
                                                    const maxQuantity = ${product.stock};
                                                    if (parseInt(quantityInput.value) < maxQuantity) {
                                                        quantityInput.value = parseInt(quantityInput.value) + 1;
                                                    }
                                                }

                                                function decrementQuantity() {
                                                    const quantityInput = document.getElementById('quantity');
                                                    if (parseInt(quantityInput.value) > 1) {
                                                        quantityInput.value = parseInt(quantityInput.value) - 1;
                                                    }
                                                }

                                                // Kiểm tra số lượng
                                                document.getElementById('quantity').addEventListener('change', function () {
                                                    const value = parseInt(this.value);
                                                    const maxQuantity = ${product.stock};
                                                    if (value < 1) {
                                                        this.value = 1;
                                                    } else if (value > maxQuantity) {
                                                        this.value = maxQuantity;
                                                        alert('Số lượng tối đa có sẵn là ' + maxQuantity);
                                                    }
                                                });
                                                // Phóng to ảnh
                                                function showImageModal(src) {
                                                    document.getElementById('modalImage').src = src;
                                                    var modal = new bootstrap.Modal(document.getElementById('imageModal'));
                                                    modal.show();
                                                }


        </script>
    </script>
</body>
</html>