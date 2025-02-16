<%-- 
    Document   : AddModel
    Created on : Feb 17, 2025, 2:18:57 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add New Model</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container py-4">
        <h2 class="mb-4">Thêm Model Mới</h2>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <form action="addModel" method="POST">
            <input type="hidden" name="productId" value="${productId}">
            
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="color" name="color" required>
                        <label for="color">Màu sắc</label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="size" name="size" required>
                        <label for="size">Kích thước</label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="quantity" name="quantity" required min="0">
                        <label for="quantity">Số lượng</label>
                    </div>
                </div>
            </div>
            
            <div class="d-flex justify-content-between">
                <a href="inventoryDetail?id=${productId}" class="btn btn-secondary">Quay lại</a>
                <button type="submit" class="btn btn-primary">Thêm mới</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
