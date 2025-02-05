

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Users List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                cursor: pointer;
                background-color: #f2f2f2;
            }
            .pagination {
                margin-top: 20px;
            }
            .pagination button {
                margin: 0 5px;
            }
        </style>
    </head>
    <body>

        <h1>Users List</h1>

        <div>
            <input type="text" id="search" placeholder="Search by name, email, or mobile">
            <select id="genderFilter">
                <option value="">All Genders</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>
            <select id="roleFilter">
                <option value="">All Roles</option>
                <option value="Admin">Admin</option>
                <option value="User ">User </option>
            </select>
            <select id="statusFilter">
                <option value="">All Statuses</option>
                <option value="Active">Active</option>
                <option value="Inactive">Inactive</option>
            </select>
            <button id="exportBtn">Export to Excel</button>
            <button id="addUserBtn">Add New User</button>
        </div>

        <table id="usersTable">
            <thead>
                <tr>
                    <th onclick="sortTable(0)">ID</th>
                    <th onclick="sortTable(1)">Full Name</th>
                    <th onclick="sortTable(2)">Gender</th>
                    <th onclick="sortTable(3)">Email</th>
                    <th onclick="sortTable(4)">Mobile</th>
                    <th onclick="sortTable(5)">Role</th>
                    <th onclick="sortTable(6)">Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="usersBody">
                <!-- User rows will be populated here -->
            </tbody>
        </table>

        <div class="pagination">
            <button id="prevPageBtn">Previous</button>
            <span id="pageInfo"></span>
            <button id="nextPageBtn">Next</button>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                        let users = []; // This will hold the user data
                        let currentPage = 1;
                        const rowsPerPage = 5;

                        // Sample user data
                        const sampleUsers = [
                            {id: 1, fullName: 'John Doe', gender: 'Male', email: 'john@example.com', mobile: '1234567890', role: 'Admin', status: 'Active'},
                            {id: 2, fullName: 'Jane Smith', gender: 'Female', email: 'jane@example.com', mobile: '0987654321', role: 'User ', status: 'Inactive'},
                                    // Add more sample users as needed
                        ];

                        function loadUsers() {
                            users = sampleUsers; // Replace with API call to fetch users
                            renderTable();
                        }

                        function renderTable() {
                            const tbody = $('#usersBody');
                            tbody.empty();
                            const filteredUsers = filterUsers(users);
                            const paginatedUsers = paginateUsers(filteredUsers);
                            paginatedUsers.forEach(user => {
                                tbody.append(`
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.fullName}</td>
                            <td>${user.gender}</td>
                            <td>${user.email}</td>
                            <td>${user.mobile}</td>
                            <td>${user.role}</td>
                            <td>${user.status}</td>
                            <td>
                                <button onclick="viewUser (${user.id})">View</button>
                                <button onclick="editUser (${ user.id})">Edit</button>
                            </td>
                        </tr>
                    `);
                            });
                            updatePagination(filteredUsers.length);
                        }

                        function filterUsers(users) {
                            const searchTerm = $('#search').val().toLowerCase();
                            const gender = $('#genderFilter').val();
                            const role = $('#roleFilter').val();
                            const status = $('#statusFilter').val();

                            return users.filter(user => {
                                return (
                                        (gender ? user.gender === gender : true) &&
                                        (role ? user.role === role : true) &&
                                        (status ? user.status === status : true) &&
                                        (user.fullName.toLowerCase().includes(searchTerm) ||
                                                user.email.toLowerCase().includes(searchTerm) ||
                                                user.mobile.includes(searchTerm))
                                        );
                            });
                        }

                        function paginateUsers(filteredUsers) {
                            const startIndex = (currentPage - 1) * rowsPerPage;
                            return filteredUsers.slice(startIndex, startIndex + rowsPerPage);
                        }

                        function updatePagination(totalUsers) {
                            const totalPages = Math.ceil(totalUsers / rowsPerPage);
                            $('#pageInfo').text(`Page ${currentPage} of ${totalPages}`);
                            $('#prevPageBtn').prop('disabled', currentPage === 1);
                            $('#nextPageBtn').prop('disabled', currentPage === totalPages);
                        }

                        $('#prevPageBtn').click(() => {
                            if (currentPage > 1) {
                                currentPage--;
                                renderTable();
                            }
                        });

                        $('#nextPageBtn').click(() => {
                            const totalPages = Math.ceil(filterUsers(users).length / rowsPerPage);
                            if (currentPage < totalPages) {
                                currentPage++;
                                renderTable();
                            }
                        });

                        $('#exportBtn').click(() => {
                            // Implement export functionality here
                            alert('Export to Excel functionality not implemented yet.');
                        });

                        $('#addUser Btn').click(() => {
                            // Implement add user functionality here
                            alert('Add new user functionality not implemented yet.');
                        });

                        function sortTable(columnIndex) {
                            // Implement sorting functionality here
                            alert('Sorting functionality not implemented yet.');
                        }

                        function viewUser(id) {
                            // Implement view user functionality here
                            alert(`View user with ID: ${id}`);
                        }

                        function editUser(id) {
                            // Implement edit user functionality here
                            alert(`Edit user with ID: ${id}`);
                        }

                        $(document).ready(() => {
                            loadUsers();
                        });
        </script>

    </body>
</html>
