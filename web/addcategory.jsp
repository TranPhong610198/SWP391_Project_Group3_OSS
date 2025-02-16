<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm danh mục</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            .container {
                max-width: 600px;
                margin: 40px auto;
                background: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            .form-label {
                font-weight: bold;
            }

            .btn-primary {
                width: 100%;
                padding: 10px;
                font-size: 16px;
            }

            .btn-secondary {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                background: #6c757d;
            }

            .alert {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Thêm danh mục</h1>

            <!-- Hiển thị thông báo lỗi -->
            <c:if test="${not empty param.error}">
                <div class="alert alert-danger">${param.error}</div>
            </c:if>

            <!-- Hiển thị thông báo thành công -->
            <c:if test="${not empty param.message}">
                <div class="alert alert-success">${param.message}</div>
            </c:if>

            <form action="categoryadd" method="post">
                <div class="mb-3">
                    <label class="form-label">Tên danh mục:</label>
                    <input type="text" name="name" class="form-control" required placeholder="Nhập tên danh mục">
                </div>

                <div class="mb-3">
                    <label class="form-label">Mô tả:</label>
                    <textarea name="description" class="form-control" rows="3" placeholder="Nhập mô tả"></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Trạng thái:</label>
                    <select name="status" class="form-select">
                        <option value="active">Hoạt động</option>
                        <option value="inactive">Không hoạt động</option>
                    </select>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="categorylists" class="btn btn-secondary">Hủy</a>
                    <button type="submit" class="btn btn-primary">Thêm danh mục</button>
                </div>

            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
