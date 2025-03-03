<%-- 
    Document   : productList
    Created on : Feb 24, 2025, 1:40:02 AM
    Author     : tphon
--%>

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
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .filters {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-bottom: 30px;
            }

            .filter-title {
                font-size: 1.1rem;
                font-weight: 600;
                margin-bottom: 15px;
                color: #333;
            }

            .price-range {
                display: flex;
                gap: 10px;
                align-items: center;
                margin-bottom: 15px;
            }

            .price-input {
                width: 120px;
            }

            .product-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 25px;
                margin-top: 30px;
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
                padding: 40px;
                background: white;
                border-radius: 8px;
                margin-top: 30px;
            }

            .no-products i {
                font-size: 48px;
                color: #ddd;
                margin-bottom: 20px;
            }

            .no-products h3 {
                color: #666;
                margin-bottom: 10px;
            }

            .no-products p {
                color: #999;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .product-grid {
                    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                    gap: 15px;
                }

                .filters .row > div {
                    margin-bottom: 20px;
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

            <!-- Filters Section -->
            <div class="filters">
                <form action="listproduct" method="GET" id="filterForm">
                    <input type="hidden" name="category" value="${category}">
                    <div class="row align-items-end">
                        <div class="col-md-4">
                            <div class="filter-title">Khoảng Giá</div>
                            <div class="d-flex">
                                <input type="number" id="minPrice" name="minPrice" step="1000" min="0" max="3000000" class="form-control me-2" placeholder="Thấp Nhất" value="${minPrice}">
                                <span class="align-self-center">-</span>
                                <input type="number" id="maxPrice" name="maxPrice" step="1000" min="0" max="3000000" class="form-control ms-2" placeholder="Cao Nhất" value="${maxPrice}">
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="filter-title">Sắp xếp</div>
                            <select name="sortBy" class="form-select">
                                <option value="">Mặc Định</option>
                                <option value="price_asc" ${sortBy == 'price_asc' ? 'selected' : ''}>Giá: Thấp đến Cao</option>
                                <option value="price_desc" ${sortBy == 'price_desc' ? 'selected' : ''}>Giá: Cao xuống Thấp</option>
                                <option value="newest" ${sortBy == 'newest' ? 'selected' : ''}>Mới nhất</option>
                            </select>
                        </div>

                        <div class="col-md-1">
                            <button class="btn btn-outline-secondary w-50" type="submit">
                                <i class="fa-solid fa-filter"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Products Grid -->
            <c:choose>
                <c:when test="${not empty products}">
                    <div class="product-grid">
                        <c:if test="${not empty product.comboProducts}">
                            <c:if test="${product.id == product.comboProducts.get(comboProducts.get(0)).id}">
                                <c:forEach items="${products}" var="product">
                                    <div class="card product-card">
                                        <a href="productdetail?id=${product.id}" style="text-decoration:none;">
                                            <div class="position-relative">
                                                <img src="${product.thumbnail}" class="product-image" alt="${product.title}">
                                                <span class="product-badge">Combo</span>
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
                            </c:if>
                        </c:if>
                        <c:if test="${empty product.comboProducts}">
                            <c:forEach items="${products}" var="product">
                                <div class="card product-card">
                                    <a href="productdetail?id=${product.id}" style="text-decoration:none;">
                                        <div class="position-relative">
                                            <img src="${product.thumbnail}" class="product-image" alt="${product.title}">
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
                        </c:if>
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

        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $('#maxPrice').on('change', function () {
                const maxPrice = parseFloat($('#maxPrice').val()) || 0;
                const minPrice = parseFloat($('#minPrice').val()) || 0;

                if (maxPrice < minPrice) {
                    alert('Giá khuyến mãi không được nhỏ hơn giá gốc!');
                    $('#maxPrice').val(minPrice);
                }
            });
        </script>
    </body>
</html>
