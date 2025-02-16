<%-- 
    Document   : InventoryDetail
    Created on : Feb 17, 2025, 12:14:33 AM
    Author     : nguye
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inventory Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .model-table-container {
                max-height: 300px;
                overflow-y: auto;
            }
            .read-only-field {
                background-color: #e9ecef;
                cursor: not-allowed;
            }
            .action-buttons .btn {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container py-4">
            <!-- Error/Success Messages -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <!-- Product Info Section - Read Only -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control read-only-field" id="productName" 
                               value="${inventory.productName}" readonly>
                        <label for="productName">Tên sản phẩm</label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control read-only-field" id="category" 
                               value="${inventory.category}" readonly>
                        <label for="category">Danh mục</label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control read-only-field" id="totalStock" 
                               value="${inventory.totalQuantity}" readonly>
                        <label for="totalStock">Tổng số lượng tồn kho</label>
                    </div>
                </div>
            </div>

            <!-- Add New Model -->
            <div class="d-flex justify-content-end mb-3">
                <a href="addModel?productId=${inventory.productId}" class="btn btn-success">
                    <i class="bi bi-plus-circle"></i> Thêm Model Mới
                </a>
            </div>

            <!-- Model Table -->
            <div class="model-table-container mb-4">
                <table class="table table-bordered table-hover">
                    <thead class="table-light sticky-top">
                        <tr>
                            <th>Màu sắc</th>
                            <th>Kích thước</th>
                            <th>Số lượng</th>
                            <th>Ngày cập nhật</th>
                            <th>Sửa/Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${variants}" var="variant">
                            <tr>
                                <td>${variant.color.name}</td>
                                <td>${variant.size.name}</td>
                                <td>${variant.quantity}</td>
                                <td><fmt:formatDate value="${variant.lastRestockDate}" pattern="dd/MM/yyyy"/></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="editModel?variantId=${variant.id}&productId=${inventory.productId}" 
                                           class="btn btn-outline-primary btn-sm">Sửa</a>
                                        <form action="inventoryDetail" method="POST" style="display: inline;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="productId" value="${inventory.productId}">
                                            <input type="hidden" name="variantId" value="${variant.id}">
                                            <button type="submit" class="btn btn-outline-danger btn-sm" 
                                                    onclick="return confirm('Bạn có chắc chắn muốn xóa mẫu này?')">Xóa</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="mt-4">
                <a href="inventorylist" class="btn btn-secondary">Quay lại</a>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
