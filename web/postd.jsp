<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${post.title} - Chi tiết bài đăng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .article-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .post-title {
            font-size: 2rem;
            font-weight: 700;
            color: #333;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 15px;
        }
        .post-meta {
            padding: 10px 0;
            color: #6c757d;
            border-bottom: 1px solid #f0f0f0;
            margin-bottom: 20px;
        }
        .post-thumbnail {
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-height: 500px;
            object-fit: cover;
        }
        .post-content {
            line-height: 1.8;
            font-size: 1.1rem;
            color: #333;
        }
        .featured-badge {
            background-color: #ffc107;
            color: #212529;
        }
        .author-info i {
            color: #0d6efd;
        }
    </style>
</head>
<body>
    <!-- Include the header -->
    <jsp:include page="header.jsp" />
    <div class="container py-4">
        <!-- Hiển thị bài viết -->
        <div class="col-lg-12">
            <c:choose>
                <c:when test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:when>
                <c:when test="${not empty post}">
                    <article class="article-container p-4 p-md-5">
                        <h1 class="post-title mb-3">
                            ${post.title}
                            <c:if test="${post.isIsFeatured()}">
                                <span class="badge featured-badge ms-2"><i class="fas fa-star me-1"></i>Nổi bật</span>
                            </c:if>
                        </h1>
                        <div class="post-meta">
                            <div class="author-info d-flex align-items-center justify-content-between">
                                <div>
                                    <i class="fas fa-user me-2"></i><strong>Tác giả:</strong> ${post.user.fullName}
                                </div>
                                <div>
                                    <c:choose>
                                        <c:when test="${post.updatedAt != null}">
                                        <i class="fas fa-edit me-2"></i><strong>Cập nhật:</strong> ${post.updatedAt}
                                        </c:when>
                                        <c:otherwise>
                                        <i class="fas fa-calendar me-2"></i><strong>Ngày đăng:</strong> ${post.createdAt}
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>                     
                        <div class="text-center mb-4">
                            <img src="${post.getThumbnail()}" alt="${post.title}" class="img-fluid post-thumbnail">
                        </div>
                        <div class="post-content">${post.content}</div>
                        
                        <!-- Social sharing buttons -->
                        <div class="mt-4 pt-3 border-top">
                            <div class="d-flex gap-2 justify-content-end">
                                <button class="btn btn-sm btn-outline-primary"><i class="fas fa-share-alt me-2"></i>Chia sẻ</button>
                                <button class="btn btn-sm btn-outline-danger"><i class="far fa-heart me-2"></i>Lưu</button>
                                <button class="btn btn-sm btn-outline-success"><i class="fas fa-print me-2"></i>In</button>
                            </div>
                        </div>
                    </article>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-warning">Không có dữ liệu để hiển thị.</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- Include the footer -->
    <jsp:include page="footer.jsp" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>