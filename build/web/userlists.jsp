<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Lists</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>User Lists</h2>
        
        <!-- Filter and Search Form -->
        <form action="userlists" method="get" class="mb-4">
            <div class="row g-3">
                <div class="col-md-2">
                    <select name="gender" class="form-select">
                        <option value="">All Genders</option>
                        <option value="Male" ${gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${gender == 'Female' ? 'selected' : ''}>Female</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="role" class="form-select">
                        <option value="">All Roles</option>
                        <option value="Admin" ${role == 'Admin' ? 'selected' : ''}>Admin</option>
                        <option value="Customer" ${role == 'Customer' ? 'selected' : ''}>Customer</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="status" class="form-select">
                        <option value="">All Status</option>
                        <option value="Active" ${status == 'Active' ? 'selected' : ''}>Active</option>
                        <option value="Inactive" ${status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <input type="text" name="search" value="${search}" class="form-control" 
                           placeholder="Search by name, email, or mobile">
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary">Filter</button>
                </div>
            </div>
        </form>

        <!-- Export Buttons -->
        <div class="mb-3">
            <a href="userlists?action=export&format=excel" class="btn btn-success">Export to Excel</a>
            <a href="userlists?action=export&format=pdf" class="btn btn-danger">Export to PDF</a>
            <a href="userlists/new" class="btn btn-primary float-end">Add New User</a>
        </div>

        <!-- Users Table -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>
                        <a href="userlists?sortField=id&sortDir=${sortField == 'id' && sortDir == 'asc' ? 'desc' : 'asc'}">
                            ID ${sortField == 'id' ? (sortDir == 'asc' ? '▲' : '▼') : ''}
                        </a>
                    </th>
                    <th>
                        <a href="userlists?sortField=full_name&sortDir=${sortField == 'full_name' && sortDir == 'asc' ? 'desc' : 'asc'}">
                            Full Name ${sortField == 'full_name' ? (sortDir == 'asc' ? '▲' : '▼') : ''}
                        </a>
                    </th>
                    <th>
                        <a href="userlists?sortField=gender&sortDir=${sortField == 'gender' && sortDir == 'asc' ? 'desc' : 'asc'}">
                            Gender ${sortField == 'gender' ? (sortDir == 'asc' ? '▲' : '▼') : ''}
                        </a>
                    </th>
                    <th>
                        <a href="userlists?sortField=email&sortDir=${sortField == 'email' && sortDir == 'asc' ? 'desc' : 'asc'}">
                            Email ${sortField == 'email' ? (sortDir == 'asc' ? '▲' : '▼') : ''}
                        </a>
                    </th>
                    <th>
                        <a href="userlists?sortField=mobile&sortDir=${sortField == 'mobile' && sortDir == 'asc' ? 'desc' : 'asc'}">
                            Mobile ${sortField == 'mobile' ? (sortDir == 'asc' ? '▲' : '▼') : ''}
                        </a>
                    </th>
                    <th>
                        <a href="userlists?sortField=role&sortDir=${sortField == 'role' && sortDir == 'asc' ? 'desc' : 'asc'}">
                            Role ${sortField == 'role' ? (sortDir == 'asc' ? '▲' : '▼') : ''}
                        </a>
                    </th>
                    <th>
                        <a href="userlists?sortField=status&sortDir=${sortField == 'status' && sortDir == 'asc' ? 'desc' : 'asc'}">
                            Status ${sortField == 'status' ? (sortDir == 'asc' ? '▲' : '▼') : ''}
                        </a>
                    </th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.fullName}</td>
                        <td>${user.gender}</td>
                        <td>${user.email}</td>
                        <td>${user.mobile}</td>
                        <td>${user.role}</td>
                        <td>${user.status}</td>
                        <td>
                            <a href="userlists/view?id=${user.id}" class="btn btn-info btn-sm">View</a>
                            <a href="userlists/edit?id=${user.id}" class="btn btn-warning btn-sm">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Pagination -->
        <nav>
            <ul class="pagination">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="userlists?page=${currentPage-1}">Previous</a>
                    </li>
                </c:if>
                
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="userlists?page=${i}">${i}</a>
                    </li>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="userlists?page=${currentPage+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>