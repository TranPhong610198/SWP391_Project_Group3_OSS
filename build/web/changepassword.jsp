<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    User user = (User) session.getAttribute("acc");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đổi Mật Khẩu</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa; /* Light gray background */
            }
            .card {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
                border-radius: 8px; /* Rounded corners */
            }
            .card-header {
                background-color: #972424; /* Blue header */
                color: white;
                border-radius: 8px 8px 0 0; /* Rounded top corners */
                padding: 1rem 0; /* Increased padding */
            }
            .card-title {
                font-weight: 600;
            }
            .form-label {
                font-weight: 500;
            }
            .btn-primary {
                background-color: #972424; /* Blue button */
                border-color: #8b1f1f;
            }
            .btn-primary:hover {
                background-color: #d90000; /* Darker blue on hover */
                border-color: #cc0000;
            }
            .btn-secondary {
                background-color: #6c757d; /* Gray button */
                border-color: #6c757d;
            }
            .btn-secondary:hover {
                background-color: #5a6268; /* Darker gray on hover */
                border-color: #545b62;
            }
            .alert {
                border-radius: 5px; /* Rounded alert corners */
            }

        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header text-center">
                            <h2 class="card-title">Đổi Mật Khẩu</h2>
                        </div>
                        <div class="card-body p-4"> <%-- Added padding to card body --%>

                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>
                            <c:if test="${not empty success}">
                                <div class="alert alert-success">${success}</div>
                            </c:if>

                            <form action="changepassword" method="post">
                                <input type="hidden" name="action" value="change">

                                <div class="mb-3">
                                    <label for="currentPassword" class="form-label">Mật khẩu hiện tại</label>
                                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                                </div>
                                <div class="mb-3">
                                    <label for="newPassword" class="form-label">Mật khẩu mới</label>
                                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                                </div>
                                <div class="mb-3">
                                    <label for="confirmPassword" class="form-label">Xác nhận mật khẩu mới</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                </div>
                            </form>

                            <div class="mt-3">
                                <a href="profile" class="btn btn-secondary">Hủy</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>