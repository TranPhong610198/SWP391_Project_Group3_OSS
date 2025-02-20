<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer Settings</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-4">
            <h2>Footer Settings Management</h2>
            
            <!-- Search and Filter Form -->
            <form action="${pageContext.request.contextPath}/admin/footersettinglist" method="GET" class="mb-4">
                <div class="row">
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="text" name="search" value="${searchValue}" class="form-control" placeholder="Search by value...">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <select name="status" class="form-select">
                            <option value="">All Status</option>
                            <option value="active" ${status == 'active' ? 'selected' : ''}>Active</option>
                            <option value="inactive" ${status == 'inactive' ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary">Apply Filters</button>
                    </div>
                    <div class="col-md-3 text-end">
                        <a href="${pageContext.request.contextPath}/admin/footersettinglist/new" class="btn btn-success">Add New Setting</a>
                    </div>
                </div>
            </form>

            <!-- Footer Settings Table -->
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>
                            <a href="?sortBy=id&sortOrder=${sortBy == 'id' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&search=${searchValue}&status=${status}">
                                STT ${sortBy == 'id' ? (sortOrder == 'ASC' ? '↑' : '↓') : ''}
                            </a>
                        </th>
                        <th>
                            <a href="?sortBy=fieldName&sortOrder=${sortBy == 'fieldName' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&search=${searchValue}&status=${status}">
                                Name ${sortBy == 'fieldName' ? (sortOrder == 'ASC' ? '↑' : '↓') : ''}
                            </a>
                        </th>
                        <th>
                            <a href="?sortBy=value&sortOrder=${sortBy == 'value' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&search=${searchValue}&status=${status}">
                                Value ${sortBy == 'value' ? (sortOrder == 'ASC' ? '↑' : '↓') : ''}
                            </a>
                        </th>
                        <th>
                            <a href="?sortBy=type&sortOrder=${sortBy == 'type' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&search=${searchValue}&status=${status}">
                                Type ${sortBy == 'type' ? (sortOrder == 'ASC' ? '↑' : '↓') : ''}
                            </a>
                        </th>
                        
                        <th>
                            <a href="?sortBy=status&sortOrder=${sortBy == 'status' && sortOrder == 'ASC' ? 'DESC' : 'ASC'}&search=${searchValue}&status=${status}">
                                Status ${sortBy == 'status' ? (sortOrder == 'ASC' ? '↑' : '↓') : ''}
                            </a>
                        </th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${footerList}" var="footer" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
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
                                    <a href="${pageContext.request.contextPath}/admin/footersettinglist/view?id=${footer.id}" class="btn btn-info btn-sm">View</a>
                                    <a href="${pageContext.request.contextPath}/admin/footersettinglist/edit?id=${footer.id}" class="btn btn-warning btn-sm">Edit</a>
                                    <form action="${pageContext.request.contextPath}/admin/footersettinglist" method="POST" style="display: inline;">
                                        <input type="hidden" name="action" value="toggleStatus">
                                        <input type="hidden" name="id" value="${footer.id}">
                                        <input type="hidden" name="status" value="${footer.status == 'active' ? 'inactive' : 'active'}">
                                        <button type="submit" class="btn btn-${footer.status == 'active' ? 'danger' : 'success'} btn-sm">
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