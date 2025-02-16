<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f4f6f9; padding: 20px; }
        .container {
            max-width: 1200px; margin: 0 auto; background: white; border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1); padding-bottom: 20px;
        }
        .header {
            background: #ff6b00; color: white; padding: 20px;
            border-radius: 8px 8px 0 0; display: flex; justify-content: space-between;
            align-items: center;
        }
        .controls {
            padding: 20px; background: #f8f9fa; border-bottom: 1px solid #dee2e6;
        }
        .search-form { display: flex; gap: 15px; align-items: center; }
        .form-group { display: flex; align-items: center; gap: 8px; }
        input, select {
            padding: 8px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;
        }
        .btn {
            padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer;
            font-weight: 500; display: flex; align-items: center; gap: 5px;
        }
        .btn-primary { background: #ff6b00; color: white; }
        .btn-add { background: white; color: #ff6b00; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #dee2e6; }
        th { background-color: #f8f9fa; font-weight: 600; }
        .status-badge {
            padding: 5px 10px; border-radius: 20px; font-size: 12px; font-weight: 500;
        }
        .status-active { background-color: #e8f5e9; color: #2e7d32; }
        .status-inactive { background-color: #ffebee; color: #c62828; }
        .action-buttons { display: flex; gap: 8px; }
        .btn-edit { color: #2196f3; }
        .btn-delete { color: #f44336; }
        .message { padding: 10px; text-align: center; font-weight: bold; }
        .message.success { color: green; }
        .message.error { color: red; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Danh sách danh mục</h2>
            <a href="categoryadd" class="btn btn-add">
                <i class="fas fa-plus"></i> Thêm danh mục
            </a>
        </div>

        <div class="controls">
            <form action="categorylists" method="GET" class="search-form">
                <div class="form-group">
                    <input type="text" name="search" value="${searchQuery}" 
                           placeholder="Tìm kiếm theo tên..." style="width: 250px;">
                </div>
                
                <div class="form-group">
                    <select name="status">
                        <option value="">Tất cả trạng thái</option>
                        <option value="active" ${statusFilter == 'active' ? 'selected' : ''}>Hoạt động</option>
                        <option value="inactive" ${statusFilter == 'inactive' ? 'selected' : ''}>Không hoạt động</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <select name="sort">
                        <option value="">Sắp xếp theo</option>
                        <option value="name" ${sortBy == 'name' ? 'selected' : ''}>Tên</option>
                        <option value="status" ${sortBy == 'status' ? 'selected' : ''}>Trạng thái</option>
                    </select>
                </div>
                
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-search"></i> Tìm kiếm
                </button>
            </form>
        </div>

        <!-- Hiển thị thông báo nếu có 
        <c:if test="${not empty param.message}">
            <div class="message success">${param.message}</div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="message error">${param.error}</div>
        </c:if>-->

        <table>
            <thead>
                <tr>
                    <th>Tên danh mục</th>
                    <th>Mô tả</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${categories}" var="category">
                    <tr>
                        <td>${category.name}</td>
                        <td>${category.description}</td>
                        <td>
                            <span class="status-badge ${category.status == 'active' ? 'status-active' : 'status-inactive'}">
                                ${category.status == 'active' ? 'Hoạt động' : 'Không hoạt động'}
                            </span>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <a href="categoryedit.jsp?id=${category.id}" class="btn-edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="categorydelete?id=${category.id}" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?')"
                                   class="btn-delete">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
