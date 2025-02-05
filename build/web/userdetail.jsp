

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .container {
            max-width: 800px;
            margin: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            margin: 10px 0;
        }

        .modal {
            display: none; 
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgb(0,0,0); 
            background-color: rgba(0,0,0,0.4); 
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>User Management System</h1>
        
        <!-- Button to Add New User -->
        <button onclick="document.getElementById('addUser Modal').style.display='block'">Add New User</button>

        <!-- User List Table -->
        <table>
            <thead>
                <tr>
                    <th>Avatar</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="userTableBody">
                <!-- User rows will be dynamically added here -->
            </tbody>
        </table>
    </div>

    <!-- Add New User Modal -->
    <div id="addUser Modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('addUser Modal').style.display='none'">&times;</span>
            <h2>Add New User</h2>
            <form id="addUser Form">
                <label for="avatar">Avatar:</label>
                <input type="file" id="avatar" name="avatar"><br>

                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required><br>

                <label for="gender">Gender:</label>
                <select id="gender" name="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select><br>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br>

                <label for="mobilePhone">Mobile Phone:</label>
                <input type="tel" id="mobilePhone" name="mobilePhone" required><br>

                <label for="role">Role:</label>
                <select id="role" name="role">
                    <option value="admin">Admin</option>
                    <option value="user">User </option>
                </select><br>

                <label for="address">Address:</label>
                <textarea id="address" name="address"></textarea><br>

                <button type="submit">Create User</button>
                <button type="button" onclick="document.getElementById('addUser Modal').style.display='none'">Cancel</button>
            </form>
        </div>
    </div>

    <script>
        document.getElementById('addUser Form').addEventListener('submit', function(event) {
            event.preventDefault();
            
            const fullName = document.getElementById('fullName').value;
            const email = document.getElementById('email').value;
            const role = document.getElementById('role').value;
            const status = 'Active'; // Default status for new users

            const userTableBody = document.getElementById('userTableBody');
            const newRow = userTableBody.insertRow();

            newRow.innerHTML = `
                <td><img src="default-avatar.png" alt="Avatar" width="50"></td>
                <td>${fullName}</td>
                <td>${email}</td>
                <td>${role}</td>
                <td>${status}</td>
                <td>
                    <button onclick="editUser (this)">Edit</button>
                    <button onclick="deleteUser (this)">Delete</button>
                </td>
            `;

            document.getElementById('addUser  Modal').style.display = 'none';
            this.reset(); // Reset the form fields
        });

        function editUser (button) {
            // Logic to edit user information
        }

        function deleteUser (button) {
            const row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }
    </script>
</body>
</html>
