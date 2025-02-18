<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chỉnh sửa thông tin người dùng</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <style>
        .avatar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .avatar-container img {
            width: 180px;
            height: 180px;
            object-fit: cover;
            border-radius: 50%;
            border: 4px solid #ddd;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }

        .avatar-container img:hover {
            transform: scale(1.05);
        }

        .form-label {
            font-weight: bold;
        }

        .timestamp-info {
            color: #666;
            font-size: 0.9em;
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }

        .timestamp-info p {
            margin-bottom: 5px;
        }

        /* Style cho radio buttons */
        .status-radio {
            display: none;
        }

        .status-label {
            display: inline-block;
            padding: 0.5em 1em;
            margin: 0 0.5em;
            border-radius: 0.25rem;
            cursor: pointer;
            transition: all 0.3s ease;
            opacity: 0.6;
            font-size: 0.875rem;
        }

        .status-radio:checked + .status-label {
            opacity: 1;
            transform: scale(1.05);
        }

        .status-label-active {
            background-color: #198754;
            color: white;
        }

        .status-label-pending {
            background-color: #ffc107;
            color: black;
        }

        .status-label-inactive {
            background-color: #dc3545;
            color: white;
        }

        .status-container {
            display: flex;
            justify-content: start;
            align-items: center;
            gap: 10px;
        }
    </style>

    <body>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            <h2>Chỉnh sửa thông tin người dùng</h2>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/admin/userdetail/edit" method="post">
                                <input type="hidden" name="id" value="${user.id}">

                                <div class="row mb-3">
                                    <div class="col-md-4 avatar-container mb-3">
                                        <img src="${(user.avatar.contains('https')) ? user.avatar : '../'.concat(user.avatar)}" 
                                             alt="avatar" id="avatar-preview"
                                             onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">

                                    </div>

                                    <div class="col-md-8">
                                        <div class="mb-3">
                                            <label class="form-label">Username:</label>
                                            <input type="text" class="form-control" name="username" value="${user.username}" readonly>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Họ và tên:</label>
                                            <input type="text" class="form-control" name="fullName" value="${user.fullName}" readonly>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Email:</label>
                                            <input type="email" class="form-control" name="email" value="${user.email}" readonly>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Số điện thoại:</label>
                                            <input type="tel" class="form-control" name="mobile" value="${user.mobile}" readonly>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Giới tính:</label>
                                            <input  type="text" class="form-control" name="gender1" value="${!user.gender.equals('other') ? (user.gender.equals('male') ? 'Nam' : 'Nữ') : 'Khác'}" readonly>
                                            <input hidden type="text" class="form-control" name="gender" value="${user.gender}"readonly>

                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Vai trò:</label>
                                            <select class="form-select" id="role" name="role">
                                                <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                                                <option value="customer" ${user.role == 'customer' ? 'selected' : ''}>Customer</option>
                                                <option value="sale" ${user.role == 'Sale' ? 'selected' : ''}>Sale</option>
                                                <option value="marketing" ${user.role == 'Marketing' ? 'selected' : ''}>Marketing</option>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Trạng thái:</label>
                                            <div class="status-container mt-2">
                                                <input type="radio" class="status-radio" name="status" id="status-active" 
                                                       value="active" ${user.status == 'active' ? 'checked' : ''}>
                                                <label for="status-active" class="status-label status-label-active">
                                                    Active
                                                </label>

                                                <input type="radio" class="status-radio" name="status" id="status-inactive" 
                                                       value="inactive" ${user.status == 'inactive' ? 'checked' : ''}>
                                                <label for="status-inactive" class="status-label status-label-inactive">
                                                    Inactive
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="timestamp-info">
                                    <p><strong>Ngày tạo:</strong> 
                                        <c:choose>
                                            <c:when test="${not empty user.createdAt}">
                                                ${fn:substringBefore(user.createdAt, '.')}
                                            </c:when>
                                            <c:otherwise>Không có dữ liệu</c:otherwise>
                                        </c:choose>
                                    </p>
                                    <p><strong>Cập nhật lần cuối:</strong> 
                                        <c:choose>
                                            <c:when test="${not empty user.updatedAt}">
                                                ${fn:substringBefore(user.updatedAt, '.')}
                                            </c:when>
                                            <c:otherwise>Không có dữ liệu</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>

                                <div class="text-center mt-3">
                                    <!-- Change this line in userdetail.jsp -->
                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                    <a href="../userlists" class="btn btn-secondary">Hủy</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    </body>
</html>