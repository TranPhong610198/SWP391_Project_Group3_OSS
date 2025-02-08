<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Details</title>
        <style>
            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }

            .user-profile {
                background: #f5f5f5;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .avatar {
                text-align: center;
                margin-bottom: 20px;
            }

            .avatar img {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #333;
            }

            .form-group input,
            .form-group select,
            .form-group textarea {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .form-group input:focus,
            .form-group select:focus,
            .form-group textarea:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0,123,255,0.3);
            }

            .form-group textarea {
                height: 100px;
                resize: vertical;
            }

            .form-actions {
                margin-top: 20px;
                text-align: right;
            }

            button {
                background: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            button:hover {
                background: #0056b3;
            }

            .btn-cancel {
                display: inline-block;
                padding: 10px 20px;
                margin-left: 10px;
                text-decoration: none;
                color: #666;
                background: #eee;
                border-radius: 4px;
                transition: background 0.3s ease;
            }

            .btn-cancel:hover {
                background: #ddd;
            }

            h1 {
                color: #333;
                text-align: center;
                margin-bottom: 30px;
            }

            .alert {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
            }

            .alert-success {
                color: #155724;
                background-color: #d4edda;
                border-color: #c3e6cb;
            }

            .alert-danger {
                color: #721c24;
                background-color: #f8d7da;
                border-color: #f5c6cb;
            }

            .field-error {
                color: #dc3545;
                font-size: 0.875em;
                margin-top: 5px;
            }

            .form-group.has-error input,
            .form-group.has-error select {
                border-color: #dc3545;
            }

            .readonly {
                background-color: #e9ecef;
                cursor: not-allowed;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>User Details</h1>

            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success">
                    ${sessionScope.successMessage}
                    <c:remove var="successMessage" scope="session" />
                </div>
            </c:if>

            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-danger">
                    ${sessionScope.errorMessage}
                    <c:remove var="errorMessage" scope="session" />
                </div>
            </c:if>

            <div class="user-profile">
                <div class="avatar">
                    <img src="${empty user.avatar ? '/assets/images/default-avatar.png' : user.avatar}" 
                         alt="User Avatar" onerror="this.src='/assets/images/default-avatar.png'">
                </div>

                <form action="userdetail" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${user.id}">

                    <div class="form-group ${not empty errors.fullName ? 'has-error' : ''}">
                        <label>Full Name:</label>
                        <input type="text" name="fullName" value="${user.fullName}" 
                               class="${sessionScope.currentUser.admin ? 'readonly' : ''}"
                               ${sessionScope.currentUser.admin ? 'readonly' : ''}>
                        <c:if test="${not empty errors.fullName}">
                            <div class="field-error">${errors.fullName}</div>
                        </c:if>
                    </div>

                    <div class="form-group ${not empty errors.gender ? 'has-error' : ''}">
                        <label>Gender:</label>
                        <select name="gender" ${sessionScope.currentUser.admin ? 'disabled' : ''}>
                            <option value="M" ${user.gender == 'M' ? 'selected' : ''}>Male</option>
                            <option value="F" ${user.gender == 'F' ? 'selected' : ''}>Female</option>
                            <option value="O" ${user.gender == 'O' ? 'selected' : ''}>Other</option>
                        </select>
                        <c:if test="${not empty errors.gender}">
                            <div class="field-error">${errors.gender}</div>
                        </c:if>
                    </div>

                    <div class="form-group ${not empty errors.email ? 'has-error' : ''}">
                        <label>Email:</label>
                        <input type="email" name="email" value="${user.email}" 
                               class="${sessionScope.currentUser.admin ? 'readonly' : ''}"
                               ${sessionScope.currentUser.admin ? 'readonly' : ''}>
                        <c:if test="${not empty errors.email}">
                            <div class="field-error">${errors.email}</div>
                        </c:if>
                    </div>

                    <div class="form-group ${not empty errors.mobile ? 'has-error' : ''}">
                        <label>Mobile:</label>
                        <input type="tel" name="mobile" value="${user.mobile}"
                               pattern="[0-9]{10}"
                               title="Please enter a valid 10-digit phone number"
                               class="${sessionScope.currentUser.admin ? 'readonly' : ''}"
                               ${sessionScope.currentUser.admin ? 'readonly' : ''}>
                        <c:if test="${not empty errors.mobile}">
                            <div class="field-error">${errors.mobile}</div>
                        </c:if>
                    </div>

                    <c:if test="${sessionScope.currentUser.admin}">
                        <div class="form-group ${not empty errors.role ? 'has-error' : ''}">
                            <label>Role:</label>
                            <select name="role">
                                <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>User</option>
                                <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
                            </select>
                            <c:if test="${not empty errors.role}">
                                <div class="field-error">${errors.role}</div>
                            </c:if>
                        </div>

                        <div class="form-group ${not empty errors.status ? 'has-error' : ''}">
                            <label>Status:</label>
                            <select name="status">
                                <option value="ACTIVE" ${user.status == 'ACTIVE' ? 'selected' : ''}>Active</option>
                                <option value="INACTIVE" ${user.status == 'INACTIVE' ? 'selected' : ''}>Inactive</option>
                                <option value="PENDING" ${user.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                            </select>
                            <c:if test="${not empty errors.status}">
                                <div class="field-error">${errors.status}</div>
                            </c:if>
                        </div>
                    </c:if>
                    
                    <div class="form-actions">
                        <button type="submit">Save Changes</button>
                        <a href="/fashionshop/userlists" class="btn-cancel">Cancel</a>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Remove success and error messages after 5 seconds
            setTimeout(function() {
                var alerts = document.getElementsByClassName('alert');
                for(var i = 0; i < alerts.length; i++) {
                    alerts[i].style.display = 'none';
                }
            }, 5000);
        </script>
    </body>
</html>