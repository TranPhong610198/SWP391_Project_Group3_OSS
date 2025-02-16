<%-- 
    Document   : EditModel
    Created on : Feb 17, 2025, 2:31:30 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Model</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-4">
        <h2 class="mb-4">Chỉnh Sửa Model</h2>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <form action="editModel" method="POST">
            <input type="hidden" name="productId" value="${variant.productId}">
            <input type="hidden" name="variantId" value="${variant.id}">
            
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="color" name="color" 
                               value="${variant.color.name}" required>
                        <label for="color">Màu sắc</label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="size" name="size" 
                               value="${variant.size.name}" required>
                        <label for="size">Kích thước</label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="quantity" name="quantity" 
                               value="${variant.quantity}" required min="0">
                        <label for="quantity">Số lượng</label>
                    </div>
                </div>
            </div>
            
            <div class="d-flex justify-content-between">
                <a href="inventoryDetail?id=${variant.productId}" class="btn btn-secondary">Quay lại</a>
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
