<%-- 
    Document   : userform
    Created on : Feb 6, 2025, 5:16:51 PM
    Author     : VuxD4t
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New User</title>
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            background: #f5f5f5;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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

        .form-group input[type="file"] {
            padding: 5px;
            border: none;
            background: #fff;
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

        .required::after {
            content: " *";
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Create New User</h1>
        
        <form action="${pageContext.request.contextPath}/user" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="create">
            
            <div class="form-group">
                <label>Avatar:</label>
                <input type="file" name="avatar" accept="image/*">
            </div>
            
            <div class="form-group">
                <label class="required">Full Name:</label>
                <input type="text" name="fullName" required>
            </div>
            
            <div class="form-group">
                <label class="required">Gender:</label>
                <select name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="M">Male</option>
                    <option value="F">Female</option>
                </select>
            </div>
            
            <div class="form-group">
                <label class="required">Email:</label>
                <input type="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label class="required">Mobile:</label>
                <input type="tel" name="mobile" required>
            </div>
            
            <div class="form-group">
                <label>Address:</label>
                <textarea name="address"></textarea>
            </div>
            
            <div class="form-group">
                <label class="required">Role:</label>
                <select name="role" required>
                    <option value="">Select Role</option>
                    <option value="USER">User</option>
                    <option value="ADMIN">Admin</option>
                </select>
            </div>
            
            <div class="form-actions">
                <button type="submit">Create User</button>
                <a href="${pageContext.request.contextPath}/users" class="btn-cancel">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>
