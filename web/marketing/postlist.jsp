<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Posts</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>


<body>
    <div class="container mt-4">
        <h2>Các bài đăng</h2>

        <!-- Filter and Search Form -->
        <form method="get" action="${pageContext.request.contextPath}/postList" class="mb-4">
            <div class="row g-3">
                <!-- Author Selection -->
                <div class="col-md-2">
                    <select name="authorId" class="form-select">
                        <option value="0">Tất cả tác giả</option>
                        <c:forEach var="author" items="${authors}">
                            <option value="${author.id}">${author.role}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Status Selection -->
                <div class="col-md-2">
                    <select name="status" class="form-select">
                        <option value="">Tất cả trạng thái</option>
                        <option value="published" ${status == 'published' ? 'selected' : ''}>Đã xuất bản</option>
                        <option value="draft" ${status == 'draft' ? 'selected' : ''}>Bản thảo</option>
                    </select>
                </div>

                <!-- Search Box -->
                <div class="col-md-6">
                    <input type="text" name="search" class="form-control" placeholder="Nhập tiêu đề..." value="${param.search}">
                </div>

                <!-- Search Button -->
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </div>
            </div>
        </form>

        <!-- Action Buttons -->
        <div class="mb-3">
            <a href="${pageContext.request.contextPath}/addPost" class="btn btn-primary float-end">
                <i class="fas fa-plus me-2"></i>Thêm bài mới
            </a>
        </div>

        <!-- Posts Table -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Hình ảnh</th>
                    <th>Tiêu đề</th>
                    <th>Tác giả</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>
                    <th>Nổi bật</th>
                    <th>Hoạt động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="post" items="${posts}">
                    <tr>
                        <td>${post.getId()}</td>
                        <td>
                            <img src="${post.getThumbnail()}" alt="${post.getTitle()}" style="width: 50px; height: 50px; object-fit: cover;">
                        </td>
                        <td>${post.getTitle()}</td>
                        <td>${post.getUser().getFullName()}</td>
                        <td>${post.getCreatedAt()}</td>
                        <td>
    <c:choose>
        <c:when test="${post.getStatus() == 'published'}">Đã xuất bản</c:when>
        <c:when test="${post.getStatus() == 'draft'}">Bản thảo</c:when>
        <c:otherwise>${post.getStatus()}</c:otherwise>
    </c:choose>
</td>
                        <td>${post.isIsFeatured() ? 'Có' : 'Không'}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/detailPost?id=${post.getId()}" 
                               class="btn btn-warning btn-sm">Sửa</a>
                               
                            
                            <a href="${pageContext.request.contextPath}/deletePost?id=${post.getId()}" 
                           class="btn btn-danger btn-sm" 
                           onclick="return confirm('Are you sure you want to delete this post?');">
                            Xóa
                        </a>
                            
                            <c:choose>
                                <c:when test="${post.getStatus() == 'draft'}">
                                    <button class="btn btn-danger btn-sm toggle-visibility" data-id="${post.getId()}">Ẩn</button>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-success btn-sm toggle-visibility" data-id="${post.getId()}">Hiện</button>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Pagination -->
        <nav>
            <ul class="pagination">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/postList?page=${currentPage-1}&search=${param.search}&authorId=${param.authorId}&status=${param.status}">Trước</a>
                    </li>
                </c:if>
                
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/postList?page=${i}&search=${param.search}&authorId=${param.authorId}&status=${param.status}">${i}</a>
                    </li>
                </c:forEach>
                
                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/postList?page=${currentPage+1}&search=${param.search}&authorId=${param.authorId}&status=${param.status}">Sau</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>