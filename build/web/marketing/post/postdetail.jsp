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
         <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
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
    
    <div class="row d-flex align-items-stretch">
        <!-- Main Content - Chiếm 50% màn hình -->
        <div class="col-lg-6 d-flex">
            <article class="post-content flex-fill h-100 p-4 bg-white shadow rounded">
                <img src="${post.getThumbnail()}" alt="${post.getTitle()}" class="post-thumbnail">
                
                <div class="content">
                    <p><strong>Thông tin tóm tắt:</strong> ${post.getSummary()}</p>
                    <p><strong>Mô tả:</strong> ${post.getContent()}</p>
                </div>
            </article>
        </div>

        <!-- Sidebar - Chiếm 50% màn hình -->
        <div class="col-lg-6 d-flex">
    <aside class="sidebar flex-fill h-100 p-4 bg-white shadow rounded">

        <!-- Edit Post Section -->
        <div class="edit-post mb-4">
    <h2 class="fw-bold">Chỉnh sửa bài viết</h2>
    <form method="POST" action="${pageContext.request.contextPath}/marketing/detailPost" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${post.getId()}">

    <div class="mb-3">
        <label for="title" class="form-label fw-bold">Tiêu đề</label>
        <input type="text" class="form-control" id="title" name="title" value="${post.getTitle()}" required>
    </div>

    <div class="mb-3">
        <label for="thumbnail" class="form-label fw-bold">Ảnh nguồn</label>
        <input type="file" class="form-control" id="thumbnail" name="thumbnail" accept="image/*">
        <input type="hidden" name="old_thumbnail" value="${post.getThumbnail()}">
        <c:if test="${not empty post.getThumbnail()}">
            <div class="mt-2">
                <img src="${post.getThumbnail()}" alt="Current thumbnail" style="max-width: 200px;" class="img-thumbnail">
                <p class="text-muted">Ảnh hiện tại</p>
            </div>
        </c:if>
    </div>

    <div class="mb-3">
        <label for="summary" class="form-label fw-bold">Thông tin tóm tắt</label>
        <textarea class="form-control" id="summary" name="summary" required>${post.getSummary()}</textarea>
    </div>

    <div class="mb-3">
        <label for="content" class="form-label fw-bold">Mô tả</label>
        <textarea class="form-control" id="content" name="content" rows="6" required>${post.getContent()}</textarea>
    </div>

    <div class="mb-3">
        <label for="status" class="form-label fw-bold">Trạng thái</label>
        <select class="form-select" id="status" name="status" required>
            <option value="published" ${post.getStatus() == 'published' ? 'selected' : ''}>Đã xuất bản</option>
            <option value="draft" ${post.getStatus() == 'draft' ? 'selected' : ''}>Bản thảo</option>
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
    <a href="javascript:history.back()" class="btn btn-outline-secondary ms-2">
        <i class="fas fa-arrow-left me-2"></i>Hủy
    </a>
</form>
</div>


        <!-- Search Box -->
        <div class="search-box">
            <form method="get" action="${pageContext.request.contextPath}/marketing/postList">
                <div class="input-group mb-4">
                    <input type="text" name="search" class="form-control" placeholder="Search...">
                    <button class="btn btn-primary" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>
        </div>

    </aside>
</div>

    </div>
</div>

<script>
    CKEDITOR.replace('content', {
    filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',
    filebrowserUploadMethod: 'form',
    height: 400,
    toolbar: [
        { name: 'document', items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
        { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
        { name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
        { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
        '/',
        { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
        { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
        { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
        { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
        '/',
        { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
        { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
        { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] }
    ],
    removeButtons: '',
    format_tags: 'p;h1;h2;h3;pre',
    removeDialogTabs: 'image:advanced;link:advanced'
});

</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


                
