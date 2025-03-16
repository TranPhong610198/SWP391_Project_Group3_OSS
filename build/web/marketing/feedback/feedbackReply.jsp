<%-- 
    Document   : feedbackReply
    Created on : Mar 17, 2025, 3:11:08 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Phản hồi phản hồi khách hàng</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #2c3e50;
                --secondary-color: #34495e;
                --accent-color: #3498db;
                --light-color: #ecf0f1;
                --border-color: #dee2e6;
                --hover-color: #f8f9fa;
                --danger-color: #e74c3c;
                --success-color: #2ecc71;
                --warning-color: #f39c12;
            }

            body {
                background-color: #f8f9fa;
            }

            .sort-link {
                text-decoration: none;
                color: var(--primary-color);
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .sort-link:hover {
                color: var(--accent-color);
            }

            .sort-icons {
                margin-left: 5px;
            }

            /* Main content styles */
            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 20px;
                min-height: 100vh;
            }

            .card {
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                border: 1px solid var(--border-color);
                margin-bottom: 20px;
            }

            .card-header {
                background-color: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 15px 20px;
                font-weight: 600;
            }

            .table {
                margin-bottom: 0;
            }

            .table th {
                font-weight: 600;
                border-top: none;
                background-color: rgba(52, 152, 219, 0.05);
                vertical-align: middle;
            }

            .table td {
                vertical-align: middle;
            }

            .table tbody tr:hover {
                background-color: var(--hover-color);
            }

            .action-btn {
                padding: 5px 15px;
                border-radius: 4px;
                transition: all 0.3s;
            }

            .action-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .btn-view {
                background-color: var(--accent-color);
                color: white;
            }

            .btn-view:hover {
                background-color: #2980b9;
                color: white;
            }

            .search-box {
                border-radius: 50px;
                padding-left: 15px;
                border: 1px solid var(--border-color);
            }

            .search-btn {
                border-radius: 50px;
                padding: 8px 20px;
            }

            .filter-card {
                background-color: white;
                border-radius: 8px;
                margin-bottom: 20px;
            }

            .page-title {
                color: var(--primary-color);
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--accent-color);
                display: inline-block;
            }

            .empty-state {
                padding: 40px;
                text-align: center;
                color: #6c757d;
            }

            /* Badge Styles */
            .badge-status {
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
            }

            .badge-active {
                background-color: var(--success-color);
                color: white;
            }

            .badge-expired {
                background-color: var(--danger-color);
                color: white;
            }

            .badge-discount-type {
                background-color: rgba(52, 152, 219, 0.2);
                color: var(--accent-color);
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
                white-space: nowrap;
            }

            /* Toggle button */
            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
                border-radius: 50%;
                width: 42px;
                height: 42px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            /* Pagination styling */
            .pagination .page-item .page-link {
                color: var(--primary-color);
                border: 1px solid var(--border-color);
                min-width: 40px;
                text-align: center;
            }

            .pagination .page-item.active .page-link {
                background-color: var(--accent-color);
                border-color: var(--accent-color);
                color: white;
            }

            .pagination .page-item .page-link:hover {
                background-color: var(--hover-color);
            }

            .badge-vip {
                background-color: #ffd700; /* Màu vàng kim cho VIP */
                color: #2c3e50; /* Màu chữ tối để tương phản */
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
            }

            .badge-normal {
                background-color: #6c757d; /* Màu xám cho Normal */
                color: white; /* Màu chữ trắng để tương phản */
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 50px;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .main-content.active {
                    margin-left: 250px;
                }
                .sidebar-toggle {
                    display: block;
                }
            }

            /* Table responsiveness */
            @media (max-width: 768px) {
                .table-responsive {
                    display: block;
                    width: 100%;
                    overflow-x: auto;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="../sidebar.jsp" />
        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container-fluid p-4">
                <c:if test="${param.success == 'add'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                        Thêm phản hồi thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 'add'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                        Không thể thêm phản hồi. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>


                <c:if test="${param.success == 'delete_reply'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                        Xóa phản hồi thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 'delete_reply'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                        Không thể xóa phản hồi. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>


                <c:if test="${param.success == 'update_reply'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                        Cập nhật phản hồi thành công!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 'update_reply'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                        Không thể cập nhật phản hồi. Vui lòng thử lại!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <h2 class="page-title">
                    <i class="fas fa-reply me-2"></i>Phản hồi phản hồi khách hàng
                </h2>

                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-info-circle me-2"></i>Thông tin phản hồi
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Sản phẩm:</strong> ${feedback.productTitle}</p>
                                <p><strong>Người dùng:</strong> ${feedback.userFullName}</p>
                                <p><strong>Đánh giá:</strong> ${feedback.rating} sao</p>
                                <p><strong>Nội dung:</strong> ${feedback.comment}</p>
                                <p><strong>Trạng thái:</strong>
                                    <c:choose>
                                        <c:when test="${feedback.status == 'approved'}">
                                            <span class="badge badge-status badge-active">Đã duyệt</span>
                                        </c:when>
                                        <c:when test="${feedback.status == 'rejected'}">
                                            <span class="badge badge-status badge-expired">Từ chối</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-status badge-discount-type">Chờ duyệt</span>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Hình ảnh:</strong></p>
                                <c:set var="images" value="${requestScope['images_'.concat(feedback.id)]}" />
                                <c:forEach items="${images}" var="image">
                                    <img src="${image.imageUrl}" alt="Feedback Image" style="width: 100px; height: 100px; object-fit: cover; margin-right: 10px;">
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mt-3">
                    <div class="card-header">
                        <i class="fas fa-history me-2"></i>Lịch sử phản hồi
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${not empty replies}">
                                <c:forEach items="${replies}" var="reply">
                                    <div class="border-bottom pb-2 mb-2" id="reply-${reply.id}">
                                        <p><strong>${reply.userFullName}:</strong> <span id="reply-comment-${reply.id}">${reply.comment}</span></p>
                                        <p class="text-muted small">
                                            <fmt:formatDate value="${reply.updatedAt}" pattern="dd/MM/yyyy HH:mm:ss"/>
                                            <!-- Nút Sửa -->
                                            <button type="button" class="btn btn-warning btn-sm ms-2" onclick="editReply(${reply.id}, '${reply.comment}')">
                                                <i class="fas fa-edit"></i> Sửa
                                            </button>
                                            <!-- Form sửa reply (ẩn mặc định) -->
                                        <form action="feedbackreply" method="POST" id="edit-form-${reply.id}" style="display: none;" onsubmit="return confirm('Bạn có chắc chắn muốn lưu thay đổi?');">
                                            <input type="hidden" name="action" value="updateReply">
                                            <input type="hidden" name="feedbackId" value="${feedback.id}">
                                            <input type="hidden" name="replyId" value="${reply.id}">
                                            <div class="input-group mt-2">
                                                <textarea name="comment" class="form-control" rows="2" required>${reply.comment}</textarea>
                                                <button type="submit" class="btn btn-success">Lưu</button>
                                                <button type="button" class="btn btn-secondary" onclick="cancelEdit(${reply.id})">Hủy</button>
                                            </div>
                                        </form>
                                        <!-- Nút Xóa -->
                                        <form action="feedbackreply" method="POST" style="display: inline;" onsubmit="return confirm('Bạn có chắc chắn muốn xóa phản hồi này?');">
                                            <input type="hidden" name="action" value="deleteReply">
                                            <input type="hidden" name="feedbackId" value="${feedback.id}">
                                            <input type="hidden" name="replyId" value="${reply.id}">
                                            <button type="submit" class="btn btn-danger btn-sm ms-2">
                                                <i class="fas fa-trash"></i> Xóa
                                            </button>
                                        </form>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="text-muted">Chưa có phản hồi nào.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="card mt-3">
                    <div class="card-header">
                        <i class="fas fa-reply me-2"></i>Thêm phản hồi mới
                    </div>
                    <div class="card-body">
                        <form action="feedbackreply" method="POST">
                            <input type="hidden" name="feedbackId" value="${feedback.id}">
                            <div class="mb-3">
                                <label for="comment" class="form-label">Nội dung phản hồi</label>
                                <textarea class="form-control" id="comment" name="comment" rows="3" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-reply me-2"></i>Gửi phản hồi
                            </button>
                            <a href="feedbackdetail?productId=${feedback.productId}" class="btn btn-secondary">
                                <i class="fas fa-arrow-left me-2"></i>Quay lại
                            </a>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $(document).ready(function () {
                if ($('#successAlert').length) {
                    setTimeout(function () {
                        $('#successAlert').alert('close');
                    }, 3000);
                }
                if ($('#errorAlert').length) {
                    setTimeout(function () {
                        $('#errorAlert').alert('close');
                    }, 3000);
                }
                $('.sidebar-toggle').on('click', function () {
                    $('.sidebar').toggleClass('active');
                    $('.main-content').toggleClass('active');
                    $(this).hide();
                });
                $(document).on('click', function (e) {
                    if ($(window).width() <= 768) {
                        if (!$(e.target).closest('.sidebar').length && !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });
            });
        </script>
        <script>
    function editReply(replyId, comment) {
        document.getElementById('reply-comment-' + replyId).style.display = 'none';
        document.getElementById('edit-form-' + replyId).style.display = 'block';
    }

    function cancelEdit(replyId) {
        document.getElementById('reply-comment-' + replyId).style.display = 'inline';
        document.getElementById('edit-form-' + replyId).style.display = 'none';
    }
        </script>
    </body>
</html>
