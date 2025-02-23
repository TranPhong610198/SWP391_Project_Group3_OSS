<%-- 
    Document   : productList
    Created on : Feb 24, 2025, 1:40:02 AM
    Author     : tphon
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${categoryName != null ? categoryName : 'All Products'} - Fashion Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .page-title {
                font-size: 2.2rem;
                font-weight: 300;
                text-align: center;
                margin: 40px 0;
                text-transform: uppercase;
                letter-spacing: 2px;
            }

            .product-card {
                border: none;
                transition: all 0.3s ease;
                margin-bottom: 30px;
                background: #fff;
            }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            }

            .product-image {
                height: 300px;
                object-fit: cover;
                border-radius: 4px;
            }

            .product-title {
                font-size: 1rem;
                font-weight: 500;
                margin: 15px 0 10px;
                color: #333;
                text-transform: capitalize;
            }

            .product-price {
                font-size: 1.1rem;
                color: #111;
                font-weight: 600;
            }

            .original-price {
                color: #999;
                font-size: 0.9rem;
                margin-left: 8px;
            }

            .btn-view-product {
                background: #000;
                color: #fff;
                border: none;
                padding: 8px 20px;
                transition: all 0.3s;
            }

            .btn-view-product:hover {
                background: #333;
                color: #fff;
            }

            .filter-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }

            .filter-group {
                display: flex;
                gap: 15px;
                align-items: center;
            }

            .form-select, .form-control {
                border-radius: 0;
                border: 1px solid #ddd;
                padding: 8px 15px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- Page Title -->
        <h1 class="page-title">${categoryName != null ? categoryName : 'Tất Cả Sản Phẩm'}</h1>

        <div class="container">
            <!-- Filter Section -->
            <div class="filter-container">
                <div class="filter-group">
                    <div class="price-filter">
                        <input type="number" class="form-control" name="minPrice" 
                               placeholder="Min Price" value="${minPrice}" style="width: 120px">
                        <span class="mx-2">-</span>
                        <input type="number" class="form-control" name="maxPrice" 
                               placeholder="Max Price" value="${maxPrice}" style="width: 120px">
                    </div>

                    <select class="form-select" name="sortBy" style="width: 180px">
                        <option value="">Sort By</option>
                        <option value="price_asc" ${sortBy == 'price_asc' ? 'selected' : ''}>Price: Low to High</option>
                        <option value="price_desc" ${sortBy == 'price_desc' ? 'selected' : ''}>Price: High to Low</option>
                        <option value="newest" ${sortBy == 'newest' ? 'selected' : ''}>Newest First</option>
                    </select>
                </div>
            </div>

            <!-- Products Grid -->
            <div class="row">
                <c:forEach items="${products}" var="product">
                    <div class="col-md-3">
                        <div class="product-card">
                            <img src="${product.thumbnail}" class="product-image" alt="${product.title}">
                            <div class="product-info p-3">
                                <h5 class="product-title">${product.title}</h5>
                                <div class="d-flex justify-content-between align-items-center mt-3">
                                    <div class="price-info">
                                        <span class="product-price">$${product.salePrice}</span>
                                        <span class="original-price text-decoration-line-through">$${product.originalPrice}</span>
                                    </div>
                                    <a href="productdetail?id=${product.id}" class="btn btn-view-product">
                                        View Details
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination -->
            <c:if test="${totalPages > 1}">
                <nav class="mt-5 mb-5">
                    <ul class="pagination justify-content-center">
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="listproduct?page=${i}&keyword=${keyword}&category=${selectedCategory}
                                   &minPrice=${minPrice}&maxPrice=${maxPrice}&sortBy=${sortBy}">
                                    ${i}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </c:if>
        </div>

        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
