<%-- 
    Document   : listInventory
    Created on : Feb 16, 2025, 2:08:22 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Inventory Management</title>
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
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <!-- Filter Section -->
            <div class="row my-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="inventorylist" method="GET" class="row g-3">
                                <div class="col-md-3">
                                    <input type="text" name="search" value="${searchKeyword}" class="form-control" placeholder="Tìm kiếm sản phẩm ...">
                                </div>
                                <div class="col-md-2">
                                    <select name="category" class="form-select">
                                        <option value="">Tất cả danh mục</option>
                                        <c:forEach items="${categoryList}" var="cat">
                                            <option value="${cat.id}" ${cat.id == selectedCategory ? 'selected' : ''}>${cat.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary">Lọc</button>
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
                                        <th><a href="inventorylist" class="sort-link">STT</a></th>
                                        <th><a href="inventorylist?search=${searchKeyword}&category=${selectedCategory}&sortField=product_name&sortOrder=${sortField == 'product_name' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">Tên sản phẩm ${sortField == 'product_name' ? (sortOrder == 'asc' ? '↑' : '↓') : '↑↓'}</a></th>
                                        <th><a href="inventorylist?search=${searchKeyword}&category=${selectedCategory}&sortField=category&sortOrder=${sortField == 'category' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">Danh mục ${sortField == 'category' ? (sortOrder == 'asc' ? '↑' : '↓') : '↑↓'}</a></th>
                                        <th>Màu sắc</th>
                                        <th>Kích thước</th>
                                        <th><a href="inventorylist?search=${searchKeyword}&category=${selectedCategory}&sortField=totalQuantity&sortOrder=${sortField == 'totalQuantity' && sortOrder == 'asc' ? 'desc' : 'asc'}" class="sort-link">Tổng số lượng ${sortField == 'totalQuantity' ? (sortOrder == 'asc' ? '↑' : '↓') : '↑↓'}</a></th>
                                        <th>Chi tiết</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${inventoryList}" var="item" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${item.productName}</td>
                                            <td>${item.category}</td>
                                            <td>${item.colorString}</td>
                                            <td>${item.sizeString}</td>
                                            <td>${item.totalQuantity}</td>
                                            <td><a href="inventoryDetail?id=${item.productId}" class="btn btn-info">Xem</a></td>
                                        </tr>
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
                    <nav>
                        <ul class="pagination justify-content-center">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="inventorylist?page=${currentPage-1}&sortField=${sortField}&sortOrder=${sortOrder}&search=${searchKeyword}&category=${selectedCategory}"><</a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="inventorylist?page=${i}&sortField=${sortField}&sortOrder=${sortOrder}&search=${searchKeyword}&category=${selectedCategory}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="inventorylist?page=${currentPage+1}&sortField=${sortField}&sortOrder=${sortOrder}&search=${searchKeyword}&category=${selectedCategory}">></a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
