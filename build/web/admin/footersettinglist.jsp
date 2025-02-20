<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Footer Settings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Footer Settings List</h2>
        
        <!-- Search and Filter Form -->
        <form action="${pageContext.request.contextPath}/admin/footer-settings" method="get" class="mb-4">
            <div class="row">
                <div class="col-md-4">
                    <input type="text" name="search" value="${searchValue}" class="form-control" placeholder="Search by value...">
                </div>
                <div class="col-md-3">
                    <select name="status" class="form-select">
                        <option value="">All Status</option>
                        <option value="active" ${statusFilter == 'active' ? 'selected' : ''}>Active</option>
                        <option value="inactive" ${statusFilter == 'inactive' ? 'selected' : ''}>Inactive</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary">Filter</button>
                </div>
                <div class="col-md-3 text-end">
                    <a href="${pageContext.request.contextPath}/admin/footer-settings/new" class="btn btn-success">Add New Setting</a>
                </div>
            </div>
        </form>

        <!-- Settings Table -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th class="text-center" style="width: 60px;">STT</th>
                    <th>
                        <a href="?sort=field_name&order=${sortColumn == 'field_name' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&status=${statusFilter}&search=${searchValue}">
                            Tên ${sortColumn == 'field_name' ? (sortOrder == 'ASC' ? '↑' : '↓') : ''}
                        </a>
                    </th>
                    <th>
                        <a href="?sort=value&order=${sortColumn == 'value' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&status=${statusFilter}&search=${searchValue}">
                            Giá trị ${sortColumn == 'value' ? (sortOrder == 'ASC' ? '↑' : '↓') : ''}
                        </a>
                    </th>
                    <th>
                        <a href="?sort=type&order=${sortColumn == 'type' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&status=${statusFilter}&search=${searchValue}">
                            Loại ${sortColumn == 'type' ? (sortOrder == 'ASC' ? '↑' : '↓') : ''}
                        </a>
                    </th>
                    <th>
                        <a href="?sort=status&order=${sortColumn == 'status' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&status=${statusFilter}&search=${searchValue}">
                            Trạng thái ${sortColumn == 'status' ? (sortOrder == 'ASC' ? '↑' : '↓') : ''}
                        </a>
                    </th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${footers}" var="footer" varStatus="status">
                    <tr>
                        <td class="text-center">${status.index + 1 + (currentPage - 1) * pageSize}</td>

                        <td>${footer.fieldName}</td>
                        <td>${footer.value}</td>
                        <td>${footer.type}</td>
                        <td>
                            <span class="badge bg-${footer.status == 'active' ? 'success' : 'danger'}">
                                ${footer.status}
                            </span>
                        </td>
                        <td>
                            <div class="btn-group" role="group">
                                
                                <a href="${pageContext.request.contextPath}/admin/footer-settings/edit?id=${footer.id}" 
                                   class="btn btn-sm btn-warning">Edit</a>
                                <form action="${pageContext.request.contextPath}/admin/footer-settings" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="toggleStatus">
                                    <input type="hidden" name="id" value="${footer.id}">
                                    <input type="hidden" name="currentStatus" value="${footer.status}">
                                    <button type="submit" class="btn btn-sm btn-${footer.status == 'active' ? 'danger' : 'success'}">
                                        ${footer.status == 'active' ? 'Deactivate' : 'Activate'}
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>