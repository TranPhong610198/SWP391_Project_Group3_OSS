<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create New Post</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .form-section {
                background: url('https://decorbanghieu.com/wp-content/uploads/2022/08/background-shop-quan-ao-1-1067x800.jpg') no-repeat center center;
                background-size: cover;
                padding: 3rem 0;
                color: white;
            }

            .form-container {
                background: rgba(255, 255, 255, 0.3); /* Nền trắng trong suốt 30% */
                padding: 2rem;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                color: #2c3e50;
                backdrop-filter: blur(10px); /* Hiệu ứng mờ phía sau */
            }

            .preview-image {
                max-width: 200px;
                max-height: 200px;
                object-fit: cover;
                border-radius: 5px;
                margin-top: 10px;
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="form-section">
            <div class="container">
                <h1 class="text-center mb-4">Thêm mới bài</h1>

                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="form-container">
                            <c:if test="${error != null}">
                                <div class="alert alert-danger" role="alert">
                                    ${error}
                                </div>
                            </c:if>

                            <form method="post" action="${pageContext.request.contextPath}/addPost" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="create">

                                <div class="mb-3">
                                    <label for="title" class="form-label">Tiêu đề</label>
                                    <input type="text" class="form-control" id="title" name="title" required>
                                </div>

                                <div class="mb-3">
                                    <label for="thumbnail" class="form-label">Ảnh nguồn</label>
                                    <input type="file" class="form-control" id="thumbnail" name="thumbnail" accept="image/*" required>
                                </div>


                                <!--                                <div class="mb-3">
                                    <label for="authorId" class="form-label">Author</label>
                                    <select class="form-select" id="authorId" name="authorId" required>
                                        <option value="0">All Authors</option>
                                        <c:forEach var="user" items="${users}">
                                            <option value="${user.id}">${user.fullName}</option>
                                        </c:forEach>
                                    </select>
                                </div>-->

                                <div class="mb-3">
                                    <label for="summary" class="form-label">Thông tin tóm tắt</label>
                                    <textarea class="form-control" id="summary" name="summary" rows="3" required></textarea>
                                </div>

                                <div class="mb-3">
                                    <label for="content" class="form-label">Mô tả</label>
                                    <textarea class="form-control" id="content" name="content" rows="10" required></textarea>
                                </div>

                                <div class="mb-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="isFeatured" name="isFeatured">
                                        <label class="form-check-label" for="isFeatured">
                                            Bài nổi bật
                                        </label>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="status" class="form-label">Trạng thái</label>
                                    <select class="form-select" id="status" name="status" required>
                                        <option value="draft">Bản thảo</option>
                                        <option value="published">Đã xuất bản</option>
                                    </select>
                                </div>

                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-primary">Thêm bài</button>
                                    <a href="javascript:history.back()" class="btn btn-secondary">Hủy</a>
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
