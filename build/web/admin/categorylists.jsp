<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Quản lý danh mục</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            .pagination .page-link {
                padding: 0.5rem 0.75rem;
                margin: 0 2px;
                border-radius: 4px;
            }
            .pagination .page-item.active .page-link {
                background-color: #0d6efd;
                border-color: #0d6efd;
            }
            .pagination .page-item.disabled .page-link {
                color: #6c757d;
                pointer-events: none;
                background-color: #fff;
                border-color: #dee2e6;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <!-- Hiển thị thông báo -->
            <c:if test="${param.message != null}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${param.message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${param.error != null}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${param.error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Danh sách danh mục</h2>
                <a href="categoryadd" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Thêm danh mục
                </a>
            </div>

            <!-- Form tìm kiếm -->
            <form action="categorylists" method="GET" class="mb-4">
                <div class="row g-3">
                    <div class="col-md-4">
                        <input type="text" name="search" value="${searchQuery}" 
                               class="form-control" placeholder="Tìm kiếm theo tên...">
                    </div>
                    <div class="col-md-3">
                        <select name="status" class="form-select">
                            <option value="">Tất cả trạng thái</option>
                            <option value="active" ${statusFilter == 'active' ? 'selected' : ''}>Hoạt động</option>
                            <option value="inactive" ${statusFilter == 'inactive' ? 'selected' : ''}>Không hoạt động</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select name="sort" class="form-select">
                            <option value="">Sắp xếp mặc định</option>
                            <option value="name" ${sortBy == 'name' ? 'selected' : ''}>Tên</option>
                            <option value="status" ${sortBy == 'status' ? 'selected' : ''}>Trạng thái</option>
                            <option value="level" ${sortBy == 'level' ? 'selected' : ''}>Cấp độ</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100">
                            <i class="fas fa-search"></i> Tìm kiếm
                        </button>
                    </div>
                </div>
            </form>

            <!-- Bảng danh mục -->
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Tên danh mục</th>
                            <th>Danh mục cha</th>
                            <th>Cấp độ</th>
                            <th>Mô tả</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${categories}" var="category">
                            <tr>
                                <td>
                                    <c:forEach begin="1" end="${category.level}" step="1">
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:forEach>
                                    ${category.name}
                                </td>
                                <td>${category.parentName != null ? category.parentName : 'Danh mục gốc'}</td>
                                <td>${category.level}</td>
                                <td>${category.description}</td>
                                <td>
                                    <span class="badge ${category.status == 'active' ? 'bg-success' : 'bg-danger'}">
                                        ${category.status == 'active' ? 'Hoạt động' : 'Không hoạt động'}
                                    </span>
                                </td>
                                <td>
                                    <a href="categorydetail?id=${category.id}" class="btn btn-warning btn-sm">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button type="button" class="btn btn-danger btn-sm" onclick="deleteCategory(${category.id})">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Phân trang -->
            <!-- Phân trang -->
            <!-- Phân trang -->
<c:if test="${totalPages > 1}">
    <div class="d-flex justify-content-between align-items-center mt-4">
        <div class="text-muted">
            <c:set var="startItem" value="${(currentPage-1)*pageSize + 1}" />
            <c:set var="endItem" value="${currentPage*pageSize}" />
            <c:if test="${endItem > totalCategories}">
                <c:set var="endItem" value="${totalCategories}" />
            </c:if>
            Hiển thị ${startItem} đến ${endItem} trong tổng số ${totalCategories} danh mục
        </div>
        <nav aria-label="Page navigation">
            <ul class="pagination mb-0">
                <!-- Nút Previous -->
                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="categorylists?page=${currentPage - 1}${not empty searchQuery ? '&search='.concat(searchQuery) : ''}${not empty statusFilter ? '&status='.concat(statusFilter) : ''}${not empty sortBy ? '&sort='.concat(sortBy) : ''}" ${currentPage == 1 ? 'tabindex="-1" aria-disabled="true"' : ''}>
                        <i class="fas fa-chevron-left"></i>
                    </a>
                </li>
                
                <!-- Các số trang -->
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="categorylists?page=${i}${not empty searchQuery ? '&search='.concat(searchQuery) : ''}${not empty statusFilter ? '&status='.concat(statusFilter) : ''}${not empty sortBy ? '&sort='.concat(sortBy) : ''}">${i}</a>
                    </li>
                </c:forEach>
                
                <!-- Nút Next -->
                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="categorylists?page=${currentPage + 1}${not empty searchQuery ? '&search='.concat(searchQuery) : ''}${not empty statusFilter ? '&status='.concat(statusFilter) : ''}${not empty sortBy ? '&sort='.concat(sortBy) : ''}" ${currentPage == totalPages ? 'tabindex="-1" aria-disabled="true"' : ''}>
                        <i class="fas fa-chevron-right"></i>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</c:if>
        </div>

        <script>
            function deleteCategory(categoryId) {
                if (confirm('Bạn có chắc chắn muốn xóa danh mục này?')) {
                    window.location.href = 'categorydelete?id=' + categoryId;
                }
            }
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>