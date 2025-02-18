<%-- 
    Document   : addProduct
    Created on : Feb 19, 2025, 2:24:06 AM
    Author     : tphon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thêm sản phẩm mới</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
            }

            body {
                background-color: #f8f9fa;
            }

            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 20px;
                min-height: 100vh;
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .card {
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                border: 1px solid var(--border-color);
            }

            .preview-image {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 4px;
                border: 1px solid var(--border-color);
                margin: 5px;
            }

            .image-preview-container {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-top: 10px;
            }

            .remove-image {
                position: absolute;
                top: -10px;
                right: -10px;
                background: red;
                color: white;
                border-radius: 50%;
                width: 20px;
                height: 20px;
                text-align: center;
                line-height: 20px;
                cursor: pointer;
            }

            .preview-item {
                position: relative;
                display: inline-block;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
            }

            .ck-editor__editable {
                min-height: 200px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../sidebar.jsp" />

        <div class="main-content">
            <div class="container-fluid">
                <h2 class="page-title">
                    <i class="fas fa-plus-circle me-2"></i>Thêm sản phẩm mới
                </h2>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <div class="card">
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/admin/product/add" method="POST" 
                              enctype="multipart/form-data" id="productForm">
                            <div class="row mb-3">
                                <div class="col-md-8">
                                    <label class="form-label">Tên sản phẩm <span class="text-danger">*</span></label>
                                    <input type="text" name="title" class="form-control" required 
                                           value="${param.title}">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Danh mục <span class="text-danger">*</span></label>
                                    <select name="categoryId" class="form-select" required>
                                        <option value="">Chọn danh mục</option>
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.id}" 
                                                    ${param.categoryId == category.id ? 'selected' : ''}>
                                                ${category.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <label class="form-label">Giá nhập <span class="text-danger">*</span></label>
                                    <input type="number" name="originalPrice" class="form-control" required 
                                           min="0" value="${param.originalPrice}">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Giá bán <span class="text-danger">*</span></label>
                                    <input type="number" name="salePrice" class="form-control" required 
                                           min="0" value="${param.salePrice}">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Trạng thái</label>
                                    <select name="status" class="form-select">
                                        <option value="active" ${param.status == 'active' ? 'selected' : ''}>
                                            Khả bán
                                        </option>
                                        <option value="inactive" ${param.status == 'inactive' ? 'selected' : ''}>
                                            Không khả bán
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Ảnh đại diện <span class="text-danger">*</span></label>
                                <input type="file" name="thumbnail" class="form-control" accept="image/*" required 
                                       onchange="previewThumbnail(this)">
                                <div id="thumbnailPreview" class="mt-2"></div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Ảnh phụ (Tối đa 5 ảnh)</label>
                                <input type="file" name="productImages" class="form-control" accept="image/*" 
                                       multiple onchange="previewImages(this)">
                                <div id="imagePreview" class="image-preview-container"></div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mô tả chi tiết</label>
                                <textarea name="description" id="editor">${param.description}</textarea>
                            </div>

                            <div class="d-flex justify-content-end gap-2">
                                <a href="${pageContext.request.contextPath}/admin/productlist" 
                                   class="btn btn-secondary">
                                    <i class="fas fa-times me-2"></i>Hủy
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Lưu
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                                           // Initialize CKEditor
                                           ClassicEditor
                                                   .create(document.querySelector('#editor'))
                                                   .catch(error => {
                                                       console.error(error);
                                                   });

                                           // Preview thumbnail
                                           function previewThumbnail(input) {
                                               const preview = document.getElementById('thumbnailPreview');
                                               preview.innerHTML = '';

                                               if (input.files && input.files[0]) {
                                                   const reader = new FileReader();
                                                   reader.onload = function (e) {
                                                       const img = document.createElement('img');
                                                       img.src = e.target.result;
                                                       img.className = 'preview-image';
                                                       preview.appendChild(img);
                                                   }
                                                   reader.readAsDataURL(input.files[0]);
                                               }
                                           }

                                           // Preview multiple images
                                           function previewImages(input) {
                                               const preview = document.getElementById('imagePreview');
                                               preview.innerHTML = '';

                                               if (input.files) {
                                                   const maxImages = 5;
                                                   const files = Array.from(input.files).slice(0, maxImages);

                                                   files.forEach(file => {
                                                       const reader = new FileReader();
                                                       reader.onload = function (e) {
                                                           const previewItem = document.createElement('div');
                                                           previewItem.className = 'preview-item';

                                                           const img = document.createElement('img');
                                                           img.src = e.target.result;
                                                           img.className = 'preview-image';

                                                           const removeButton = document.createElement('div');
                                                           removeButton.className = 'remove-image';
                                                           removeButton.innerHTML = '×';
                                                           removeButton.onclick = function () {
                                                               previewItem.remove();
                                                           };

                                                           previewItem.appendChild(img);
                                                           previewItem.appendChild(removeButton);
                                                           preview.appendChild(previewItem);
                                                       }
                                                       reader.readAsDataURL(file);
                                                   });
                                               }
                                           }

                                           // Form validation
                                           document.getElementById('productForm').onsubmit = function (e) {
                                               const originalPrice = parseFloat(document.querySelector('[name="originalPrice"]').value);
                                               const salePrice = parseFloat(document.querySelector('[name="salePrice"]').value);

                                               if (salePrice < originalPrice) {
                                                   alert('Giá bán không thể thấp hơn giá nhập!');
                                                   e.preventDefault();
                                                   return false;
                                               }

                                               return true;

        </script>
