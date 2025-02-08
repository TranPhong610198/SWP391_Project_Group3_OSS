<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Details</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            <h2>Thông tin chi tiết người dùng</h2>
                        </div>
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-md-4 text-center mb-3">
                                    <img src="${sessionScope.acc.avatar}" alt="avatar"
                                         onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'"
                                         class="img-fluid rounded-circle"
                                         style="max-width: 150px;">
                                </div>
                                <div class="col-md-8">
                                    <table class="table">
                                        <tr>
                                            <th>ID:</th>
                                            <td>${user.id}</td>
                                        </tr>
                                        <tr>
                                            <th>Username:</th>
                                            <td>${user.username}</td>
                                        </tr>
                                        <tr>
                                            <th>Họ và tên:</th>
                                            <td>${user.fullName}</td>
                                        </tr>
                                        <tr>
                                            <th>Email:</th>
                                            <td>${user.email}</td>
                                        </tr>
                                        <tr>
                                            <th>Số điện thoại:</th>
                                            <td>${user.mobile}</td>
                                        </tr>
                                        <tr>
                                            <th>Giới tính:</th>
                                            <td>${user.gender}</td>
                                        </tr>
                                        <tr>
                                            <th>Vai trò:</th>
                                            <td>${user.role}</td>
                                        </tr>
                                        <tr>
                                            <th>Trạng thái:</th>
                                            <td>
                                                <span class="badge ${user.status == 'active' ? 'bg-success' : 'bg-danger'}">
                                                    ${user.status}
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Ngày tạo:</th>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty user.createdAt}">
                                                        ${fn:substringBefore(user.createdAt, '.')}
                                                    </c:when>
                                                    <c:otherwise>Không có dữ liệu</c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>Cập nhật lần cuối:</th>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty user.updatedAt}">
                                                        ${fn:substringBefore(user.updatedAt, '.')}
                                                    </c:when>
                                                    <c:otherwise>Không có dữ liệu</c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                            <div class="text-center mt-3">
                                <a href="../userlists" class="btn btn-secondary">Quay lại danh sách</a>
                                <a href="edit?id=${user.id}" class="btn btn-primary">Chỉnh sửa</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
