<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Slider</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .main-content {
                padding: 20px;
                background-color: #f8f9fa;
            }
            .post-image {
                width: 80px;
                height: 50px;
                object-fit: cover;
                border-radius: 5px;
            }
            .badge-status {
                padding: 5px 10px;
                border-radius: 5px;
                font-weight: bold;
            }
            .badge-published {
                background-color: #28a745;
                color: white;
            }
            .badge-draft {
                background-color: #dc3545;
                color: white;
            }
            .action-btn {
                padding: 5px 10px;
            }
            .table {
                table-layout: fixed;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid px-3">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-3 col-lg-2">
                    <jsp:include page="../sidebar.jsp" />
                </div>

                <!-- Nội dung chính -->
                <div class="col-md-9 col-lg-10 main-content">
                    <h2 class="page-title">
                        <i class="fas fa-images me-2"></i>Quản lý Slider
                    </h2>

                    <!-- Bộ lọc -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-filter me-2"></i>Bộ lọc tìm kiếm
                        </div>
                        <div class="card-body">
                            <form method="get" action="${pageContext.request.contextPath}/marketing/sliderList" class="row g-3">
                                <div class="col-md-5">
                                    <div class="input-group">
                                        <span class="input-group-text bg-white">
                                            <i class="fas fa-search text-muted"></i>
                                        </span>
                                        <input type="text" name="search" class="form-control" placeholder="Tìm kiếm slider..." value="${param.search}">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <select name="status" class="form-select">
                                        <option value="">Tất cả trạng thái</option>
                                        <option value="active" ${param.status == 'active' ? 'selected' : ''}>Hiển thị</option>
                                        <option value="inactive" ${param.status == 'inactive' ? 'selected' : ''}>Ẩn</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <button type="submit" class="btn btn-primary w-100">
                                        <i class="fas fa-filter me-2"></i>Lọc
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Danh sách slider -->
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <span><i class="fas fa-list me-2"></i>Danh sách Slider</span>
                            <a href="${pageContext.request.contextPath}/marketing/addSlider" class="btn btn-primary">
                                <i class="fas fa-plus me-2"></i>Thêm Slider
                            </a>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr class="bg-light">
                                            <th class="text-center">ID</th>
                                            <th>Tiêu đề</th>
                                            <th>Hình ảnh</th>
                                            <th>Liên kết ngược</th>
                                            <th class="text-center">Trạng thái</th>
                                            <th class="text-center" style="width: 150px;">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${not empty sliders}">
                                                <c:forEach var="slider" items="${sliders}">
                                                    <tr>
                                                        <td class="text-center">${slider.id}</td>
                                                        <td>${slider.title}</td>
                                                        <td class="text-center">
                                                            <img src="${slider.image}" alt="${slider.title}" class="post-image">
                                                        </td>
                                                        <td>${slider.backlink}</td>
                                                        <td class="text-center">
                                                            <span class="badge-status ${slider.status == 'active' ? 'badge-published' : 'badge-draft'}">
                                                                ${slider.status == 'active' ? 'Hiển thị' : 'Ẩn'}
                                                            </span>
                                                        </td>
                                                        <td class="text-center">
                                                            <a href="${pageContext.request.contextPath}/marketing/sliderDetail?id=${slider.id}" 
                                                               class="btn btn-primary btn-sm action-btn">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                                                            <a href="${pageContext.request.contextPath}/marketing/deleteSlider?id=${slider.id}" 
                                                               class="btn btn-danger btn-sm action-btn"
                                                               onclick="return confirm('Bạn có chắc chắn muốn xóa slider này?');">
                                                                <i class="fas fa-trash"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="6" class="text-center">Không tìm thấy slider nào.</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div> <!-- Kết thúc .main-content -->
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
