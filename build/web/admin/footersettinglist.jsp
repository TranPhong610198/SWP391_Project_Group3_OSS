<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý cài đặt Footer</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .filters {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .search-box {
            flex: 1;
            max-width: 300px;
        }
        
        input, select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
        }
        
        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #007bff;
            color: white;
        }
        
        .btn:hover {
            background-color: #0056b3;
        }
        
        .btn-icon {
            padding: 4px 8px;
            font-size: 14px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f8f9fa;
            cursor: pointer;
        }
        
        th:hover {
            background-color: #e9ecef;
        }
        
        .status-badge {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 14px;
        }
        
        .status-active {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-inactive {
            background-color: #f8f9fa;
            color: #6c757d;
        }
        
        .action-buttons {
            display: flex;
            gap: 8px;
        }
        
        .btn-view {
            background-color: #17a2b8;
        }
        
        .btn-edit {
            background-color: #ffc107;
        }
        
        .btn-toggle {
            background-color: #6c757d;
        }

        .truncate {
            max-width: 300px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Quản lý cài đặt Footer</h1>
            <button class="btn">
                <i class="fas fa-plus"></i> Thêm cài đặt mới
            </button>
        </div>
        
        <div class="filters">
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="Tìm kiếm theo giá trị..." 
                       onkeyup="filterTable()">
            </div>
            <select id="statusFilter" onchange="filterTable()">
                <option value="all">Tất cả trạng thái</option>
                <option value="active">Đang kích hoạt</option>
                <option value="inactive">Đã vô hiệu</option>
            </select>
        </div>

        <table id="settingsTable">
            <thead>
                <tr>
                    <th onclick="sortTable(0)">ID <i class="fas fa-sort"></i></th>
                    <th onclick="sortTable(1)">Tên định danh <i class="fas fa-sort"></i></th>
                    <th onclick="sortTable(2)">Giá trị <i class="fas fa-sort"></i></th>
                    <th onclick="sortTable(3)">Trạng thái <i class="fas fa-sort"></i></th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dữ liệu mẫu -->
                <tr>
                    <td>1</td>
                    <td>copyright_text</td>
                    <td class="truncate">© 2024 Công ty TNHH ABC. Đã đăng ký bản quyền.</td>
                    <td>
                        <span class="status-badge status-active">Đang kích hoạt</span>
                    </td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn btn-icon btn-view" onclick="viewSetting(1)">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="btn btn-icon btn-edit" onclick="editSetting(1)">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn btn-icon btn-toggle" onclick="toggleStatus(1)">
                                <i class="fas fa-power-off"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>contact_email</td>
                    <td class="truncate">support@company.com</td>
                    <td>
                        <span class="status-badge status-active">Đang kích hoạt</span>
                    </td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn btn-icon btn-view" onclick="viewSetting(2)">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="btn btn-icon btn-edit" onclick="editSetting(2)">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn btn-icon btn-toggle" onclick="toggleStatus(2)">
                                <i class="fas fa-power-off"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>social_links</td>
                    <td class="truncate">{"facebook":"https://fb.com/company","twitter":"https://twitter.com/company","linkedin":"https://linkedin.com/company"}</td>
                    <td>
                        <span class="status-badge status-inactive">Đã vô hiệu</span>
                    </td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn btn-icon btn-view" onclick="viewSetting(3)">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="btn btn-icon btn-edit" onclick="editSetting(3)">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn btn-icon btn-toggle" onclick="toggleStatus(3)">
                                <i class="fas fa-power-off"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>business_hours</td>
                    <td class="truncate">{"weekdays":"8:00 AM - 5:00 PM","saturday":"8:00 AM - 12:00 PM","sunday":"Closed"}</td>
                    <td>
                        <span class="status-badge status-active">Đang kích hoạt</span>
                    </td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn btn-icon btn-view" onclick="viewSetting(4)">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="btn btn-icon btn-edit" onclick="editSetting(4)">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn btn-icon btn-toggle" onclick="toggleStatus(4)">
                                <i class="fas fa-power-off"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>address</td>
                    <td class="truncate">123 Đường ABC, Quận 1, TP.HCM</td>
                    <td>
                        <span class="status-badge status-active">Đang kích hoạt</span>
                    </td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn btn-icon btn-view" onclick="viewSetting(5)">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="btn btn-icon btn-edit" onclick="editSetting(5)">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="btn btn-icon btn-toggle" onclick="toggleStatus(5)">
                                <i class="fas fa-power-off"></i>
                            </button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>
        function filterTable() {
            const searchQuery = document.getElementById('searchInput').value.toLowerCase();
            const statusFilter = document.getElementById('statusFilter').value;
            const table = document.getElementById('settingsTable');
            const rows = table.getElementsByTagName('tr');

            for (let i = 1; i < rows.length; i++) {
                const row = rows[i];
                const cells = row.getElementsByTagName('td');
                const identifier = cells[1].textContent.toLowerCase();
                const value = cells[2].textContent.toLowerCase();
                const status = cells[3].textContent.toLowerCase();

                const matchesSearch = identifier.includes(searchQuery) || 
                                    value.includes(searchQuery);
                const matchesStatus = statusFilter === 'all' || 
                                    status.includes(statusFilter);

                row.style.display = matchesSearch && matchesStatus ? '' : 'none';
            }
        }

        function sortTable(columnIndex) {
            const table = document.getElementById('settingsTable');
            let switching = true;
            let direction = 'asc';
            let switchcount = 0;

            while (switching) {
                switching = false;
                const rows = table.rows;

                for (let i = 1; i < rows.length - 1; i++) {
                    let shouldSwitch = false;
                    const x = rows[i].getElementsByTagName('td')[columnIndex];
                    const y = rows[i + 1].getElementsByTagName('td')[columnIndex];

                    if (direction === 'asc') {
                        if (x.textContent.toLowerCase() > y.textContent.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    } else {
                        if (x.textContent.toLowerCase() < y.textContent.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }

                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                        switchcount++;
                    }
                }

                if (switchcount === 0 && direction === 'asc') {
                    direction = 'desc';
                    switching = true;
                }
            }
        }

        function viewSetting(id) {
            // Implement view functionality
            alert('Xem chi tiết cài đặt ID: ' + id);
        }

        function editSetting(id) {
            // Implement edit functionality
            alert('Chỉnh sửa cài đặt ID: ' + id);
        }

        function toggleStatus(id) {
            // Implement toggle status functionality
            if (confirm('Bạn có chắc muốn thay đổi trạng thái của cài đặt này?')) {
                // Send AJAX request to update status
                alert('Đã thay đổi trạng thái cài đặt ID: ' + id);
            }
        }
    </script>
</body>
</html>