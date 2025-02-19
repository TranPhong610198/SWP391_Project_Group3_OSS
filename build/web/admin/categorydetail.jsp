<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết danh mục</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            .container {
                max-width: 800px;
                margin: 40px auto;
                background: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .category-info {
                background: #f8f9fa;
                padding: 20px;
                border-radius: 6px;
                margin-bottom: 20px;
            }
            .info-label {
                font-weight: 600;
                color: #495057;
                margin-bottom: 5px;
            }
            .edit-buttons {
                display: none;
            }
            .editing .edit-buttons {
                display: block;
            }
            .editing .view-content {
                display: none;
            }
            .edit-content {
                display: none;
            }
            .editing .edit-content {
                display: block;
            }
            .status-badge {
                padding: 6px 12px;
                border-radius: 20px;
                font-size: 14px;
            }
        </style>
    </head>
    <body class="bg-light">
        <jsp:include page="/admin/adminsidebar.jsp" />
        <div class="container">
            <!-- Thông báo -->
            <c:if test="${not empty param.message}">
                <div class="alert alert-success alert-dismissible fade show">
                    ${param.message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${not empty param.error}">
                <div class="alert alert-danger alert-dismissible fade show">
                    ${param.error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="categorylists">Danh sách danh mục</a></li>
                    <li class="breadcrumb-item active">Chi tiết danh mục</li>
                </ol>
            </nav>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1><i class="fas fa-folder-open"></i> Chi tiết danh mục</h1>
                <button onclick="toggleEdit()" class="btn btn-primary" id="editButton">
                    <i class="fas fa-edit"></i> Chỉnh sửa
                </button>
            </div>

            <!-- Form chỉnh sửa -->
            <form action="categorydetail" method="post" id="categoryForm" class="category-info">
                <input type="hidden" name="id" value="${category.id}">
                <div class="row">
                    <div class="col-md-6">
                        <!-- Tên danh mục -->
                        <div class="mb-3">
                            <div class="info-label">Tên danh mục</div>
                            <div class="view-content">${category.name}</div>
                            <div class="edit-content">
                                <input type="text" name="name" class="form-control" 
                                       value="${category.name}" required>
                            </div>
                        </div>

                        <!-- Cấp độ -->
                        <div class="mb-3">
                            <div class="info-label">Cấp độ</div>
                            <div class="view-content">Cấp ${category.level}</div>
                            <div class="edit-content">
                                <select name="parentId" class="form-select" id="parentCategory">
                                    <option value="">Không có (Danh mục cấp 1)</option>
                                    <c:forEach items="${potentialParents}" var="parent">
                                        <c:if test="${parent.id != category.id}">
                                            <option value="${parent.id}" 
                                                    ${parent.id == category.parentId ? 'selected' : ''}
                                                    data-level="${parent.level}">
                                                <c:if test="${parent.level == 2}">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                </c:if>
                                                ${parent.name}
                                                (Cấp ${parent.level})
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- Trạng thái -->
                        <div class="mb-3">
                            <div class="info-label">Trạng thái</div>
                            <div class="view-content">
                                <span class="badge status-badge ${category.status == 'active' ? 'bg-success' : 'bg-danger'}">
                                    ${category.status == 'active' ? 'Hoạt động' : 'Không hoạt động'}
                                </span>
                            </div>
                            <div class="edit-content">
                                <select name="status" class="form-select">
                                    <option value="active" ${category.status == 'active' ? 'selected' : ''}>
                                        Hoạt động
                                    </option>
                                    <option value="inactive" ${category.status == 'inactive' ? 'selected' : ''}>
                                        Không hoạt động
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <!-- Danh mục cha -->
                        <div class="mb-3">
                            <div class="info-label">Danh mục cha</div>
                            <div class="view-content">
                                <c:choose>
                                    <c:when test="${parentCategory != null}">
                                        <a href="categorydetail?id=${parentCategory.id}">${parentCategory.name}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-muted">Danh mục gốc</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Mô tả -->
                        <div class="mb-3">
                            <div class="info-label">Mô tả</div>
                            <div class="view-content">
                                ${category.description != null && !category.description.trim().isEmpty() ? category.description : 'Không có mô tả'}
                            </div>
                            <div class="edit-content">
                                <textarea name="description" class="form-control" rows="3">${category.description}</textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Nút lưu và hủy -->
                <div class="edit-buttons mt-3">
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-save"></i> Lưu thay đổi
                    </button>
                    <button type="button" class="btn btn-secondary" onclick="cancelEdit()">
                        <i class="fas fa-times"></i> Hủy
                    </button>
                </div>
            </form>

            <!-- Danh mục con -->
            <div class="child-categories">
                <h3 class="mb-3">
                    <i class="fas fa-sitemap"></i> Danh mục con
                </h3>
                
                <c:choose>
                    <c:when test="${!empty childCategories}">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Tên danh mục</th>
                                        <th>Mô tả</th>
                                        <th>Trạng thái</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${childCategories}" var="child">
                                        <tr>
                                            <td>${child.name}</td>
                                            <td>${child.description}</td>
                                            <td>
                                                <span class="badge ${child.status == 'active' ? 'bg-success' : 'bg-danger'}">
                                                    ${child.status == 'active' ? 'Hoạt động' : 'Không hoạt động'}
                                                </span>
                                            </td>
                                            <td>
                                                <a href="categorydetail?id=${child.id}" class="btn btn-info btn-sm">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i> Không có danh mục con
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Nút thao tác -->
            <div class="mt-4">
                <a href="categorylists" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Quay lại
                </a>
                <button onclick="deleteCategory(${category.id})" class="btn btn-danger">
                    <i class="fas fa-trash"></i> Xóa
                </button>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script>
            function toggleEdit() {
                document.querySelector('.category-info').classList.add('editing');
                document.getElementById('editButton').style.display = 'none';
            }

            function cancelEdit() {
                document.querySelector('.category-info').classList.remove('editing');
                document.getElementById('editButton').style.display = 'block';
            }

            function deleteCategory(categoryId) {
                if (confirm('Bạn có chắc chắn muốn xóa danh mục này?')) {
                    window.location.href = 'categorydelete?id=' + categoryId;
                }
            }

            // Cập nhật level tự động khi chọn danh mục cha
            document.getElementById('parentCategory').addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                const levelInput = document.getElementById('categoryLevel');
                
                if (this.value === '') {
                    levelInput.value = 1;
                } else {
                    const parentLevel = parseInt(selectedOption.dataset.level);
                    levelInput.value = parentLevel + 1;
                }
            });
        </script>
    </body>
</html>