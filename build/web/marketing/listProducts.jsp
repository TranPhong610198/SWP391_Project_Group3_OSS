<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Management</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .sort-link {
                text-decoration: none;
                color: black;
            }
            .sort-link:hover {
                color: #0d6efd;
            }
            .product-thumbnail {
                width: 100px;
                height: 100px;
                object-fit: cover;
            }
            .combo-product {
                margin-left: 50px;
                border-left: 3px solid #0d6efd;
                padding-left: 10px;
            }
            .combo-product:hover {
                background-color: #e9ecef;
            }

            /*css combo*/
            /*            .combo-product {
                            background-color: #f8f9fa;
                        }
                        .combo-product td {
                            border-left: 3px solid #0d6efd;
                        }
                        .combo-product:hover {
                            background-color: #e9ecef;
                        }*/
            /*_____________________________________*/

        </style>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Filter Section -->
            <div class="row my-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="productlist" method="GET" class="row g-3">
                                <div class="col-md-3">
                                    <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Search by title...">
                                </div>
                                <div class="col-md-2">
                                    <select name="categoryId" class="form-select">
                                        <option value="">All Categories</option>
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.id}" ${categoryId == category.id ? 'selected' : ''}>
                                                ${category.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <select name="status" class="form-select">
                                        <option value="all">All Status</option>
                                        <option value="active" ${status == 'active' ? 'selected' : ''}>Active</option>
                                        <option value="inactive" ${status == 'inactive' ? 'selected' : ''}>Inactive</option>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary">Apply Filters</button>
                                </div>
                                <div class="col-md-2">
                                    <a href="product/new" class="btn btn-success">Add New Product</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Products Table -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>
                                            <a href="productlist?sortField=id&sortDir=${sortField == 'id' && sortDir == 'asc' ? 'desc' : 'asc'}&keyword=${keyword}&categoryId=${categoryId}&status=${status}" class="sort-link">
                                                ID ${sortField == 'id' ? (sortDir == 'asc' ? '↑' : '↓') : ''}
                                            </a>
                                        </th>
                                        <th>Image</th>
                                        <th>
                                            <a href="productlist?sortField=title&sortDir=${sortField == 'title' && sortDir == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Title ${sortField == 'title' ? (sortDir == 'asc' ? '↑' : '↓') : ''}
                                            </a>
                                        </th>
                                        <th>
                                            <a href="productlist?sortField=category_id&sortDir=${sortField == 'category_id' && sortDir == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Category ${sortField == 'category_id' ? (sortDir == 'asc' ? '↑' : '↓') : ''}
                                            </a>
                                        </th>
                                        <th>
                                            <a href="productlist?sortField=original_price&sortDir=${sortField == 'original_price' && sortDir == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Original Price ${sortField == 'original_price' ? (sortDir == 'asc' ? '↑' : '↓') : ''}
                                            </a>
                                        </th>
                                        <th>
                                            <a href="productlist?sortField=sale_price&sortDir=${sortField == 'sale_price' && sortDir == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Sale Price ${sortField == 'sale_price' ? (sortDir == 'asc' ? '↑' : '↓') : ''}
                                            </a>
                                        </th>
                                        <th>
                                            <a href="productlist?sortField=status&sortDir=${sortField == 'status' && sortDir == 'asc' ? 'desc' : 'asc'}" class="sort-link">
                                                Status ${sortField == 'status' ? (sortDir == 'asc' ? '↑' : '↓') : ''}
                                            </a>
                                        </th>
                                        <th>Stock</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${products}" var="product">
                                        <!--đoạn này sẽ chứa code để thêm sản phẩm cùng combo ngay dưới-->
                                        <c:if test="${not empty product.comboProducts}">
                                            <c:if test="${product.id == product.comboProducts.get(0).id}">
                                                <c:forEach items="${product.comboProducts}" var="comboProduct">

                                                    <tr class="combo-product">
                                                        <td>${comboProduct.id}</td>
                                                        <td>
                                                            <img src="${comboProduct.thumbnail}" alt="${comboProduct.title}" class="product-thumbnail">
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-info me-2">Combo</span>
                                                            ${comboProduct.title}
                                                        </td>
                                                        <td>
                                                            <c:forEach items="${categories}" var="cate">
                                                                ${(comboProduct.categoryId==cate.id)?cate.name:''}
                                                            </c:forEach>
                                                        </td>
                                                        <td><fmt:formatNumber value="${comboProduct.originalPrice}" type="currency"/></td>
                                                        <td><fmt:formatNumber value="${comboProduct.salePrice}" type="currency"/></td>
                                                        <td>
                                                            <span class="badge bg-${comboProduct.status == 'active' ? 'success' : 'danger'}">
                                                                ${comboProduct.status}
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <a href="product/inventory?id=${comboProduct.id}" class="btn btn-link">
                                                                ${comboProduct.stock}
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="product/view?id=${comboProduct.id}" class="btn btn-sm btn-info">
                                                                <i class="fas fa-eye"></i>
                                                            </a>
                                                            <a href="product/edit?id=${comboProduct.id}" class="btn btn-sm btn-primary">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                                                            <button onclick="deleteProduct(${comboProduct.id})" class="btn btn-sm btn-danger">
                                                                <i class="fas fa-trash"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>
                                        <!--___________________________________________________________________________________________________________________________-->
                                        <!--đoạn này sẽ chứa code để thêm những sản phẩm không thuộc combo-->
                                        <c:if test="${empty product.comboProducts}">
                                            <tr>
                                                <td>${product.id}</td>
                                                <td>
                                                    <img src="${product.thumbnail}" alt="${product.title}" class="product-thumbnail">
                                                </td>
                                                <td>${product.title}</td>
                                                <td>
                                                    <c:forEach items="${categories}" var="cate">
                                                        ${(product.categoryId==cate.id)?cate.name:''}
                                                    </c:forEach>
                                                </td>
                                                <td><fmt:formatNumber value="${product.originalPrice}" type="currency"/></td>
                                                <td><fmt:formatNumber value="${product.salePrice}" type="currency"/></td>
                                                <td>
                                                    <span class="badge bg-${product.status == 'active' ? 'success' : 'danger'}">
                                                        ${product.status}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="product/inventory?id=${product.id}" class="btn btn-link">
                                                        ${product.stock}
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="product/view?id=${product.id}" class="btn btn-sm btn-info">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                    <a href="product/edit?id=${product.id}" class="btn btn-sm btn-primary">
                                                        <i class="fas fa-edit"></i>
                                                    </a>
                                                    <button onclick="deleteProduct(${product.id})" class="btn btn-sm btn-danger">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:if>
                                        <!--___________________________________________________________________________________________________________________________-->
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pagination -->
            <div class="row mt-3">
                <div class="col-12">
                    <nav>${temp1}
                        ${temp2}
                        <ul class="pagination justify-content-center">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="productlist?page=${currentPage-1}&keyword=${keyword}&categoryId=${categoryId}&status=${status}&sortField=${sortField}&sortDir=${sortDir}">Previous</a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="productlist?page=${i}&keyword=${keyword}&categoryId=${categoryId}&status=${status}&sortField=${sortField}&sortDir=${sortDir}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="productlist?page=${currentPage+1}&keyword=${keyword}&categoryId=${categoryId}&status=${status}&sortField=${sortField}&sortDir=${sortDir}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>