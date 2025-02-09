<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${post == null ? 'Create New Post' : 'Edit Post'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-section {
            background: linear-gradient(135deg, #2c3e50, #34495e);
            padding: 3rem 0;
            color: white;
        }
        
        .form-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            color: #2c3e50;
        }
        
        .preview-image {
            max-width: 200px;
            max-height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="form-section">
        <div class="container">
            <h1 class="text-center mb-4">${post == null ? 'Create New Post' : 'Edit Post'}</h1>
            
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="form-container">
                        <c:if test="${error != null}">
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </c:if>
                        
                        <form method="post" action="${pageContext.request.contextPath}/post">
                            <input type="hidden" name="action" value="${post == null ? 'create' : 'update'}">
                            <c:if test="${post != null}">
                                <input type="hidden" name="id" value="${post.id}">
                            </c:if>
                            
                            <div class="mb-3">
                                <label for="title" class="form-label">Title</label>
                                <input type="text" class="form-control" id="title" name="title" 
                                       value="${post.title}" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="thumbnail" class="form-label">Thumbnail URL</label>
                                <input type="url" class="form-control" id="thumbnail" name="thumbnail"
                                       value="${post.thumbnail}" required onchange="previewImage(this)">
                                <img id="thumbnail-preview" src="${post.thumbnail}" 
                                     class="preview-image" style="display: ${post.thumbnail == null ? 'none' : 'block'}">
                            </div>
                            
                            <div class="mb-3">
                                <label for="categoryId" class="form-label">Category</label>
                                <select class="form-select" id="categoryId" name="categoryId" required>
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.id}" 
                                                ${post.categoryId == category.id ? 'selected' : ''}>
                                            ${category.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label for="summary" class="form-label">Summary</label>
                                <textarea class="form-control" id="summary" name="summary" 
                                          rows="3" required>${post.summary}</textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label for="content" class="form-label">Content</label>
                                <textarea class="form-control" id="content" name="content" 
                                          rows="10" required>${post.content}</textarea>
                            </div>
                            
                            <div class="mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="isFeatured" 
                                           name="isFeatured" ${post.isFeatured ? 'checked' : ''}>
                                    <label class="form-check-label" for="isFeatured">
                                        Featured Post
                                    </label>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="draft" ${post.status == 'draft' ? 'selected' : ''}>Draft</option>
                                    <option value="published" ${post.status == 'published' ? 'selected' : ''}>Published</option>
                                </select>
                            </div>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">
                                    ${post == null ? 'Create Post' : 'Update Post'}
                                </button>
                                <a href="${pageContext.request.contextPath}/post" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function previewImage(input) {
            const preview = document.getElementById('thumbnail-preview');
            if (input.value) {
                preview.src = input.value;
                preview.style.display = 'block';
            } else {
                preview.style.display = 'none';
            }
        }
    </script>
</body>
</html>