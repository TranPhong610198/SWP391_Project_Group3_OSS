<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
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
        </style>
    </head>
    <body>
        <div class="container">
            <h1>User Details</h1>

            <div class="user-profile">
                <div class="avatar">
                    <img src="${user.avatar}" alt="User Avatar">
                </div>

                <form action="${pageContext.request.contextPath}/user" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${user.id}">

                    <div class="form-group">
                        <label>Full Name:</label>
                        <input type="text" name="fullName" value="${user.fullName}" 
                               ${sessionScope.currentUser.admin ? 'readonly' : ''}>
                    </div>

                    <div class="form-group">
                        <label>Gender:</label>
                        <select name="gender" ${sessionScope.currentUser.admin ? 'disabled' : ''}>
                            <option value="M" ${user.gender == 'M' ? 'selected' : ''}>Male</option>
                            <option value="F" ${user.gender == 'F' ? 'selected' : ''}>Female</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" name="email" value="${user.email}" 
                               ${sessionScope.currentUser.admin ? 'readonly' : ''}>
                    </div>

                    <div class="form-group">
                        <label>Mobile:</label>
                        <input type="tel" name="mobile" value="${user.mobile}"
                               ${sessionScope.currentUser.admin ? 'readonly' : ''}>
                    </div>

                    <%--
                    <div class="form-group">
             <label>Address:</label>
             <textarea name="address" ${sessionScope.currentUser.admin ? 'readonly' : ''}>
                 ${user.address}
             </textarea>
         </div>
                    --%>


                    <c:if test="${sessionScope.currentUser.admin}">
                        <div class="form-group">
                            <label>Role:</label>
                            <select name="role">
                                <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>User</option>
                                <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Status:</label>
                            <select name="status">
                                <option value="ACTIVE" ${user.status == 'ACTIVE' ? 'selected' : ''}>Active</option>
                                <option value="INACTIVE" ${user.status == 'INACTIVE' ? 'selected' : ''}>Inactive</option>
                            </select>
                        </div>
                    </c:if>
                    
                    <div class="form-actions">
                        <button type="submit">Save Changes</button>
                        <a href="${pageContext.request.contextPath}/userlists" class="btn-cancel">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>