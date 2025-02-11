<%-- 
    Document   : edituser
    Created on : Feb 8, 2025, 4:43:04 PM
    Author     : VuxD4t
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit User</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            <h2>Chỉnh sửa thông tin người dùng</h2>
                        </div>
                        <div class="card-body">


                            <form action="${pageContext.request.contextPath}/userdetail/edit" method="post">
                                <input type="hidden" name="id" value="${user.id}">

                                <div class="mb-3">
                                    <label for="username" class="form-label">Username:</label>
                                    <input type="text" class="form-control" id="username" value="${user.username}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Họ và tên:</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="form-label">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${user.email}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="mobile" class="form-label">Số điện thoại:</label>
                                    <input type="tel" class="form-control" id="mobile" name="mobile" value="${user.mobile}" readonly>
                                </div>

                                <div class="mb-3">
                                    <label for="gender" class="form-label">Giới tính:</label>
                                    <select class="form-select" id="gender" name="gender" disabled>
                                        <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Nam</option>
                                        <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Nữ</option>
                                        <option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Khác</option>
                                    </select>
                                    <input type="hidden" name="gender" value="${user.gender}">
                                </div>

                                <div class="mb-3">
                                    <label for="role" class="form-label">Vai trò:</label>
                                    <select class="form-select" id="role" name="role">
                                        <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                                        <option value="customer" ${user.role == 'customer' ? 'selected' : ''}>Customer</option>
                                        <option value="sale" ${user.role == 'Sale' ? 'selected' : ''}>Sale</option>
                                        <option value="marketing" ${user.role == 'Marketing' ? 'selected' : ''}>Marketing</option>
                                    </select>
                                    
                                </div>


                                <div class="mb-3">
                                    <label for="status" class="form-label">Trạng thái:</label>
                                    <select class="form-select" id="status" name="status">
                                        <option value="active" ${user.status == 'active' ? 'selected' : ''}>Active</option>
                                        <option value="inactive" ${user.status == 'inactive' ? 'selected' : ''}>Inactive</option>
                                        <option value="pending" ${user.status == 'pending' ? 'selected' : ''}>Pending</option>
                                    </select>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                    <a href="${pageContext.request.contextPath}/userdetail/view?id=${user.id}" class="btn btn-secondary">Hủy</a>
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
