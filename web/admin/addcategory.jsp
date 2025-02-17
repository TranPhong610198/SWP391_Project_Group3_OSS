<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm danh mục</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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
                margin-bottom: 30px;
                color: #333;
                font-weight: 600;
            }
            .form-label {
                font-weight: 500;
                margin-bottom: 8px;
            }
            .form-control, .form-select {
                border-radius: 6px;
                border: 1px solid #ddd;
                padding: 10px 15px;
            }
            .form-text {
                margin-top: 8px;
                color: #666;
            }
            .btn-group {
                display: flex;
                gap: 15px;
                margin-top: 30px;
            }
            .btn {
                padding: 10px 20px;
                border-radius: 6px;
                font-weight: 500;
            }
            .btn-primary {
                background-color: #0d6efd;
                border: none;
            }
            .btn-secondary {
                background-color: #6c757d;
                border: none;
            }
            .alert {
                padding: 15px;
                border-radius: 6px;
                margin-bottom: 25px;
            }
            .required-field::after {
                content: " *";
                color: red;
            }
        </style>
    </head>
    <body class="bg-light">
        <div class="container">
            <h1><i class="fas fa-folder-plus"></i> Thêm danh mục</h1>

            <!-- Hiển thị thông báo -->
            <c:if test="${not empty param.error}">
                <div class="alert alert-danger alert-dismissible fade show">
                    <i class="fas fa-exclamation-circle"></i> ${param.error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${not empty param.message}">
                <div class="alert alert-success alert-dismissible fade show">
                    <i class="fas fa-check-circle"></i> ${param.message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <form action="categoryadd" method="post" class="needs-validation" novalidate>
                <!-- Tên danh mục -->
                <div class="mb-3">
                    <label class="form-label required-field">Tên danh mục</label>
                    <input type="text" name="name" class="form-control" required 
                           placeholder="Nhập tên danh mục">
                    <div class="invalid-feedback">
                        Vui lòng nhập tên danh mục
                    </div>
                </div>

                <!-- Danh mục cha -->
                <div class="mb-3">
                    <label class="form-label">Danh mục cha</label>
                    <select name="parentId" class="form-select" id="parentCategory">
                        <option value="">Không có (Danh mục cấp 1)</option>
                        <c:forEach items="${potentialParents}" var="parent">
                            <option value="${parent.id}" data-level="${parent.level}">
                                <c:if test="${parent.level == 2}">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </c:if>
                                ${parent.name}
                                <c:if test="${parent.level == 1}">
                                    (Cấp 1)
                                </c:if>
                                <c:if test="${parent.level == 2}">
                                    (Cấp 2)
                                </c:if>
                            </option>
                        </c:forEach>
                    </select>
                    <div class="form-text">
                        <i class="fas fa-info-circle"></i> Cấp độ danh mục:<br>
                        - Không chọn: tạo danh mục cấp 1<br>
                        - Chọn danh mục cấp 1: tạo danh mục cấp 2<br>
                        - Chọn danh mục cấp 2: tạo danh mục cấp 3
                    </div>
                </div>

                <!-- Mô tả -->
                <div class="mb-3">
                    <label class="form-label">Mô tả</label>
                    <textarea name="description" class="form-control" rows="3" 
                              placeholder="Nhập mô tả cho danh mục"></textarea>
                </div>

                <!-- Trạng thái -->
                <div class="mb-3">
                    <label class="form-label">Trạng thái</label>
                    <select name="status" class="form-select">
                        <option value="active">Hoạt động</option>
                        <option value="inactive">Không hoạt động</option>
                    </select>
                </div>

                <!-- Trường ẩn lưu level -->
                <input type="hidden" name="level" id="categoryLevel" value="1">

                <!-- Nút submit và cancel -->
                <div class="btn-group">
                    <a href="categorylists" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Quay lại
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Thêm danh mục
                    </button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Form validation
            (function () {
                'use strict'
                var forms = document.querySelectorAll('.needs-validation')
                Array.prototype.slice.call(forms).forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            })()

            // Tự động cập nhật level
            document.getElementById('parentCategory').addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                const levelInput = document.getElementById('categoryLevel');
                
                if (this.value === '') {
                    levelInput.value = 1; // Không chọn parent -> level 1
                } else {
                    const parentLevel = parseInt(selectedOption.dataset.level);
                    levelInput.value = parentLevel + 1; // Level = level của cha + 1
                }
            });
        </script>
    </body>
</html>