<%-- 
    Document   : productList
    Created on : Feb 24, 2025, 1:40:02 AM
    Author     : tphon
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${categoryName != null ? categoryName : 'All Products'} - Fashion Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .container {
                max-width: 1600px;
                margin: 0 auto;
                padding: 5px;
            }

            /* Sidebar Filter Styles */
            .sidebar-filters {
                background: white;
                padding: 12px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-bottom: 15px;
                position: sticky;
                top: 20px;
            }

            .filter-section {
                margin-bottom: 25px;
            }

            .filter-title {
                font-size: 1.1rem;
                font-weight: 600;
                margin-bottom: 15px;
                color: #333;
                border-bottom: 1px solid #eee;
                padding-bottom: 8px;
            }

            .price-range {
                display: flex;
                gap: 10px;
                align-items: center;
                margin-bottom: 15px;
            }

            .price-input {
                width: 100%;
            }

            .price-radio-options {
                margin-top: 15px;
            }

            .radio-option {
                margin-bottom: 8px;
            }

            /* Product Grid Styles */
            .product-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 15px;
            }

            /* Card sản phẩm - đồng bộ với homepage */
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

            .product-badge {
                position: absolute;
                top: 1rem;
                right: 1rem;
                background: red;
                color: white;
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-size: 0.8rem;
                font-weight: 500;
            }

            .pagination {
                margin-top: 40px;
                justify-content: center;
            }

            .page-link {
                color: #333;
                border: none;
                margin: 0 5px;
                border-radius: 4px;
                padding: 8px 16px;
            }

            .page-link:hover {
                background: #333;
                color: white;
            }

            .page-item.active .page-link {
                background: #333;
                border-color: #333;
            }

            .sort-select {
                min-width: 200px;
            }

            .search-box {
                position: relative;
            }

            .search-input {
                padding-right: 40px;
            }

            .search-button {
                position: absolute;
                right: 0;
                top: 0;
                height: 100%;
                width: 40px;
                background: none;
                border: none;
                color: #666;
            }

            .search-button:hover {
                color: #333;
            }

            .no-products {
                text-align: center;
                padding: 60px;
                background: white;
                border-radius: 8px;
                margin-top: 30px;
            }

            .no-products i {
                font-size: 80px;
                color: #ddd;
                margin-bottom: 25px;
            }

            .no-products h3 {
                color: #666;
                margin-bottom: 15px;
                font-size: 24px;
            }

            .no-products p {
                color: #999;
                font-size: 16px;
            }

            .apply-filters-btn {
                width: 100%;
                margin-top: 20px;
            }

            /* Responsive adjustments */
            @media (max-width: 992px) {
                .sidebar-filters {
                    position: static;
                    margin-bottom: 30px;
                }
            }

            @media (max-width: 768px) {
                .product-grid {
                    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                    gap: 15px;
                }

                .price-range {
                    flex-direction: column;
                    align-items: stretch;
                }

                .price-input {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="container">
            <!-- Page Title -->
            <h1 class="h2 mb-4 text-center">${categoryName != null ? categoryName : 'Tất Cả Sản Phẩm'}</h1>

            <div class="row">
                <!-- Sidebar Filters -->
                <div class="col-lg-3">
                    <div class="sidebar-filters">
                        <form action="listproduct" method="GET" id="filterForm">
                            <input type="hidden" name="category" value="${category}">

                            <!-- Price Range Filter -->
                            <div class="filter-section">
                                <div class="filter-title">Khoảng Giá (đ)</div>
                                <div class="d-flex flex-column">
                                    <div class="price-range">
                                        <input type="text" id="minPrice" name="minPrice"
                                               class="form-control me-2 price-input" placeholder="Thấp Nhất" value="${minPrice}">
                                        <span class="align-self-center">-</span>
                                        <input type="text" id="maxPrice" name="maxPrice"
                                               class="form-control ms-2 price-input" placeholder="Cao Nhất" value="${maxPrice}">
                                    </div>

                                    <!-- Price Range Radio Options -->
                                    <div class="price-radio-options">
                                        <div class="radio-option">
                                            <input type="radio" id="price_all" name="priceRange" value="" class="form-check-input"
                                                   ${empty minPrice && empty maxPrice ? 'checked' : ''}>
                                            <label for="price_all" class="form-check-label">Tất cả mức giá</label>
                                        </div>
                                        <div class="radio-option">
                                            <input type="radio" id="price_under_100k" name="priceRange" value="0-100000" class="form-check-input"
                                                   ${minPrice == '0' && maxPrice == '100000' ? 'checked' : ''}>
                                            <label for="price_under_100k" class="form-check-label">Dưới 100.000đ</label>
                                        </div>
                                        <div class="radio-option">
                                            <input type="radio" id="price_100k_300k" name="priceRange" value="100000-300000" class="form-check-input"
                                                   ${minPrice == '100000' && maxPrice == '300000' ? 'checked' : ''}>
                                            <label for="price_100k_300k" class="form-check-label">100.000đ - 300.000đ</label>
                                        </div>
                                        <div class="radio-option">
                                            <input type="radio" id="price_300k_500k" name="priceRange" value="300000-500000" class="form-check-input"
                                                   ${minPrice == '300000' && maxPrice == '500000' ? 'checked' : ''}>
                                            <label for="price_300k_500k" class="form-check-label">300.000đ - 500.000đ</label>
                                        </div>
                                        <div class="radio-option">
                                            <input type="radio" id="price_500k_1000k" name="priceRange" value="500000-1000000" class="form-check-input"
                                                   ${minPrice == '500000' && maxPrice == '1000000' ? 'checked' : ''}>
                                            <label for="price_500k_1000k" class="form-check-label">500.000đ - 1.000.000đ</label>
                                        </div>
                                        <div class="radio-option">
                                            <input type="radio" id="price_over_1000k" name="priceRange" value="1000000-99999000" class="form-check-input"
                                                   ${minPrice == '1000000' && maxPrice == '3000000' ? 'checked' : ''}>
                                            <label for="price_over_1000k" class="form-check-label">Trên 1.000.000đ</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Sorting Filter -->
                            <div class="filter-section">
                                <div class="filter-title">Sắp xếp</div>
                                <select name="sortBy" class="form-select">
                                    <option value="">Mặc Định</option>
                                    <option value="price_asc" ${sortBy == 'price_asc' ? 'selected' : ''}>Giá: Thấp đến Cao</option>
                                    <option value="price_desc" ${sortBy == 'price_desc' ? 'selected' : ''}>Giá: Cao xuống Thấp</option>
                                    <option value="newest" ${sortBy == 'newest' ? 'selected' : ''}>Mới nhất</option>
                                </select>
                            </div>

                            <button class="btn btn-primary apply-filters-btn" type="submit">
                                <i class="fa-solid fa-filter me-2"></i>Áp dụng bộ lọc
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Products Content -->
                <div class="col-lg-9">
                    <!-- Products Grid -->
                    <c:choose>
                        <c:when test="${not empty products}">
                            <div class="product-grid">
                                <c:forEach items="${products}" var="product">
                                    <div class="card product-card">
                                        <a href="productdetail?id=${product.id}" style="text-decoration:none;">
                                            <div class="position-relative">
                                                <img src="${product.thumbnail}" class="product-image" alt="${product.title}">
                                                <c:if test="${product.isCombo}">
                                                    <span class="product-badge">Combo</span>
                                                </c:if>
                                            </div>
                                            <div class="product-info">
                                                <h5 class="product-title">${product.title}</h5>
                                                <div class="product-price">
                                                    <span><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="no-products">
                                <i class="fas fa-box-open"></i>
                                <h3>Không tìm thấy sản phẩm</h3>
                                <p>Hãy thử điều chỉnh tiêu chí tìm kiếm hoặc duyệt danh mục của chúng tôi</p>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <!-- Pagination -->
                    <c:if test="${totalPages > 1}">
                        <nav aria-label="Product pagination">
                            <ul class="pagination">
                                <!-- Previous page -->
                                <c:if test="${currentPage > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="listproduct?page=${currentPage - 1}&keyword=${keyword}&category=${selectedCategory}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}">
                                            <i class="fas fa-chevron-left"></i>
                                        </a>
                                    </li>
                                </c:if>

                                <!-- Page numbers -->
                                <c:forEach begin="1" end="${totalPages}" var="i">
                                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                                        <a class="page-link" href="listproduct?page=${i}&keyword=${keyword}&category=${selectedCategory}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}">
                                            ${i}
                                        </a>
                                    </li>
                                </c:forEach>

                                <!-- Next page -->
                                <c:if test="${currentPage < totalPages}">
                                    <li class="page-item">
                                        <a class="page-link" href="listproduct?page=${currentPage + 1}&keyword=${keyword}&category=${selectedCategory}&minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}">
                                            <i class="fas fa-chevron-right"></i>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </c:if>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            function formatNumberInput(input) {
                let value = input.value.replace(/\D/g, '');
                console.log(value);
                if (value) {
                    value = parseInt(value, 10).toLocaleString('vi-VN');
                    input.value = value;
                } else {
                    input.value = '';
                }
            }

            // Chạy sau khi trang đã tải
            document.addEventListener('DOMContentLoaded', function () {
                const minPriceInput = document.getElementById('minPrice');
                const maxPriceInput = document.getElementById('maxPrice');

                minPriceInput.addEventListener('input', function () {
                    formatNumberInput(this);
                    if (minPriceInput.value.replace(/\./g, '') > 99999999) {
                        alert('Giới hạn nhập vào là 99.999.999 đ');
                        $('#minPrice').val('99.999.999');
                    }
                });


                maxPriceInput.addEventListener('input', function () {
                    formatNumberInput(this);
                    if (maxPriceInput.value.replace(/\./g, '') > 99999999) {
                        alert('Giới hạn nhập vào là 99.999.999 đ');
                        $('#maxPrice').val('99.999.999');
                    }
                });
            });

            $(document).ready(function () {
                $('input[name="priceRange"]').on('change', function () {
                    if (this.value) {
                        const [min, max] = this.value.split('-');
                        $('#minPrice').val(parseInt(min, 10).toLocaleString('vi-VN'));
                        $('#maxPrice').val(parseInt(max, 10).toLocaleString('vi-VN'));
                    } else {
                        // All prices option
                        $('#minPrice').val('');
                        $('#maxPrice').val('');
                    }
                });

                $('#minPrice, #maxPrice').on('input', function () {
                    $('input[name="priceRange"]').prop('checked', false);
                });

                // Kiểm duyệt giá nhập vào
                $('#maxPrice').on('change', function () {
                    const maxPrice = parseInt($('#maxPrice').val().replace(/\./g, '')) || 0;
                    const minPrice = parseInt($('#minPrice').val().replace(/\./g, '')) || 0;

                    console.log('minPrice: ' + minPrice);
                    console.log('maxPrice: ' + maxPrice);
                    if (maxPrice < minPrice) {
                        alert('Giá tối đa không được nhỏ hơn giá tối thiểu!');
                        $('#maxPrice').val(parseInt(minPrice, 10).toLocaleString('vi-VN'));
                    }
                });
            });
        </script>
    </body>
</html>