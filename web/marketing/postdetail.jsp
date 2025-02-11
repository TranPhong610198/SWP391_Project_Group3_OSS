<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${post.title} - Blog Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
            }

            body {
                background-color: #f8f9fa;
                color: var(--primary-color);
                font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
                line-height: 1.8;
            }

            .post-header {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                padding: 4rem 0;
                margin-bottom: 3rem;
            }

            .post-title {
                font-size: 2.5rem;
                font-weight: 300;
                margin-bottom: 1rem;
            }

            .post-meta {
                color: rgba(255, 255, 255, 0.8);
                font-size: 0.9rem;
            }

            .post-meta i {
                margin-right: 0.5rem;
                color: var(--accent-color);
            }

            .post-content {
                background: white;
                padding: 2rem;
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            }

            .post-thumbnail {
                width: 100%;
                height: 400px;
                object-fit: cover;
                border-radius: 10px;
                margin-bottom: 2rem;
            }

            .category-badge {
                background-color: var(--accent-color);
                color: white;
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-size: 0.9rem;
                margin-bottom: 1rem;
                display: inline-block;
            }

            .sidebar {
                background: white;
                padding: 1.5rem;
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            }

            .sidebar-title {
                font-size: 1.2rem;
                margin-bottom: 1rem;
                padding-bottom: 0.5rem;
                border-bottom: 2px solid var(--accent-color);
            }

            .related-post {
                padding: 0.8rem 0;
                border-bottom: 1px solid #eee;
            }

            .related-post:last-child {
                border-bottom: none;
            }

            .related-post a {
                color: var(--primary-color);
                text-decoration: none;
                transition: color 0.3s;
            }

            .related-post a:hover {
                color: var(--accent-color);
            }

            .search-box {
                margin-bottom: 2rem;
            }

            .back-button {
                margin-top: 2rem;
            }

            .back-button .btn {
                padding: 0.8rem 1.5rem;
                font-weight: 500;
            }
        </style>
    </head>
    <body>
        <!-- Post Header -->
       


        <header class="post-header" style="background-image: url('https://png.pngtree.com/thumb_back/fw800/background/20231012/pngtree-seasonal-attire-for-kids-delightful-autumn-winter-outfits-hanging-on-a-image_13647902.png'); background-size: cover; background-position: center; color: white; padding: 50px 0;">
            <div class="container">
                <h1 class="post-title">${post.getTitle()}</h1>
                <div class="post-meta">
                    <span class="me-3"><i class="fas fa-user"></i>${post.getUser().getFullName()}</span>
                    <span class="me-3"><i class="fas fa-clock"></i>${post.getCreatedAt()}</span>
                    
                </div>
            </div>
        </header>

        <div class="container">
             <c:if test="${error != null}">
            <div class="alert alert-danger" role="alert">
                ${error}
            </div>
        </c:if>
            <div class="row">
                <!-- Main Content -->
                <div class="col-lg-8">
                    <article class="post-content">
                        <img src="${post.getThumbnail()}" alt="${post.getTitle()}" class="post-thumbnail">
                        
                        <div class="content">
                            <p><strong>Thông tin tóm tắt:</strong> ${post.getSummary()}</p>
                            <p><strong>Mô tả:</strong> ${post.getContent()}</p>
                        </div>

                        <!-- Edit Form (if user has permission) -->

                        <hr>
                        <h3>Chỉnh sửa bài</h3>
                        <form method="POST" action="${pageContext.request.contextPath}/detailPost">
                            <input type="hidden" name="id" value="${post.getId()}">
                            <div class="mb-3">
                                <label for="title" class="form-label">Tiêu đề</label>
                                <input type="text" class="form-control" id="title" name="title" value="${post.getTitle()}" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="thumbnail" class="form-label">Ảnh nguồn</label>
                                <input type="text" class="form-control" id="thumbnail" name="thumbnail" value="${post.getThumbnail()}" required>
                            </div>
                            <div class="mb-3">
                                <label for="summary" class="form-label">Thông tin tóm tắt</label>
                                <textarea class="form-control" id="summary" name="summary" required>${post.getSummary()}</textarea>
                            </div>
                            <div class="mb-3">
                                <label for="content" class="form-label">Mô tả</label>
                                <textarea class="form-control" id="content" name="content" rows="6" required>${post.getContent()}</textarea>
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Trạng thái</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="published" ${post.getStatus() == 'published' ? 'selected' : ''}>Đã xuất bản</option>
                                    <option value="draft" ${post.getStatus() == 'draft' ? 'selected' : ''}>Bản thảo</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                        </form>

                    </article>

                    <div class="back-button">
                        <a href="javascript:history.back()" class="btn btn-primary">
                            <i class="fas fa-arrow-left me-2"></i>Quay về các bài đăng
                        </a>


                        <a href="${pageContext.request.contextPath}/addPost" class="btn btn-success">
                            <i class="fas fa-plus me-2"></i>Thêm bài
                        </a>
                        <a href="${pageContext.request.contextPath}/deletePost?id=${post.getId()}" 
                           class="btn btn-danger" 
                           onclick="return confirm('Are you sure you want to delete this post?');">
                            <i class="fas fa-trash me-2"></i>Xóa bài
                        </a>

                    </div>
                </div>

                <!-- Sidebar -->
                <div class="col-lg-4">
                    <aside class="sidebar">
                        <!-- Search Box -->
                        <div class="search-box">
                            <h3 class="sidebar-title">Tìm kiếm bài</h3>
                            <form method="get" action="${pageContext.request.contextPath}/postList">
                                <div class="input-group">
                                    <input type="text" name="search" class="form-control" placeholder="Search...">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </form>
                        </div>

                        <!-- Related Posts -->
                        <div class="related-posts">
                            <h3 class="sidebar-title fs-6">Phong cách <i class="fas fa-heart text-danger"></i></h3>
                            <c:forEach var="relatedPost" items="${relatedPosts}">
                                <div class="related-post">
                                    <a href="${pageContext.request.contextPath}/postlist.jsp?id=${relatedPost.id}">
                                        <h6 class="mb-1">${relatedPost.title}</h6>
                                        <small class="text-muted">
                                            <i class="fas fa-calendar-alt me-1"></i>${relatedPost.updatedAt}
                                        </small>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>


                    </aside>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
