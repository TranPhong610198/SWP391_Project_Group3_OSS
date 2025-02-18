<%-- 
    Document   : footerdetail
    Created on : Feb 13, 2025, 2:05:38 AM
    Author     : VuxD4t
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer Details</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        
        body {
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        
        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        
        .card-title {
            font-size: 20px;
            font-weight: bold;
            margin: 0;
        }
        
        .btn {
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            border: none;
            font-size: 14px;
        }
        
        .btn-primary {
            background-color: #2563eb;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #1d4ed8;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        th {
            background-color: #f8f9fa;
            font-weight: 600;
        }
        
        .status-active {
            color: #22c55e;
        }
        
        .status-inactive {
            color: #ef4444;
        }
        
        .action-buttons {
            display: flex;
            gap: 8px;
            justify-content: flex-end;
        }
        
        .btn-icon {
            padding: 6px;
            border-radius: 4px;
            background: none;
            border: none;
            cursor: pointer;
            color: #6b7280;
        }
        
        .btn-icon:hover {
            background-color: #f3f4f6;
        }
        
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        
        .modal-content {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            border-radius: 8px;
            width: 90%;
            max-width: 500px;
        }
        
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .close {
            cursor: pointer;
            font-size: 24px;
        }
        
        .form-group {
            margin-bottom: 16px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }
        
        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .form-control:disabled {
            background-color: #f3f4f6;
        }
        
        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }
        
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 24px;
        }
        
        .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        
        input:checked + .slider {
            background-color: #2563eb;
        }
        
        input:checked + .slider:before {
            transform: translateX(26px);
        }
        
        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 8px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="card-header">
            <h2 class="card-title">Cài đặt chi tiết</h2>
            <button class="btn btn-primary" onclick="openModal('add')">
                + Thêm mới
            </button>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>Tên định danh</th>
                    <th>Giá trị</th>
                    <th>Mô tả</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>max_connections</td>
                    <td>100</td>
                    <td>Số lượng kết nối tối đa cho phép</td>
                    <td>
                        <span class="status-active">✓</span>
                    </td>
                    <td class="action-buttons">
                        <button class="btn-icon" onclick="openModal('view', 0)">👁️</button>
                        <button class="btn-icon" onclick="openModal('edit', 0)">✏️</button>
                    </td>
                </tr>
                <tr>
                    <td>timeout</td>
                    <td>30</td>
                    <td>Thời gian chờ tối đa (giây)</td>
                    <td>
                        <span class="status-inactive">✕</span>
                    </td>
                    <td class="action-buttons">
                        <button class="btn-icon" onclick="openModal('view', 1)">👁️</button>
                        <button class="btn-icon" onclick="openModal('edit', 1)">✏️</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Modal -->
    <div id="settingModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="modalTitle">Thêm cài đặt mới</h3>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>
            
            <form id="settingForm">
                <div class="form-group">
                    <label class="form-label">Tên định danh</label>
                    <input type="text" class="form-control" id="identifier" placeholder="Nhập tên định danh">
                </div>
                
                <div class="form-group">
                    <label class="form-label">Giá trị</label>
                    <input type="text" class="form-control" id="value" placeholder="Nhập giá trị">
                </div>
                
                <div class="form-group">
                    <label class="form-label">Mô tả</label>
                    <textarea class="form-control" id="description" rows="3" placeholder="Nhập mô tả"></textarea>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Trạng thái</label>
                    <label class="switch">
                        <input type="checkbox" id="status">
                        <span class="slider"></span>
                    </label>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn" onclick="closeModal()">Hủy</button>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        const modal = document.getElementById('settingModal');
        const modalTitle = document.getElementById('modalTitle');
        const form = document.getElementById('settingForm');
        
        function openModal(mode, index) {
            modal.style.display = 'block';
            
            const isViewMode = mode === 'view';
            const isEditMode = mode === 'edit';
            
            if (mode === 'add') {
                modalTitle.textContent = 'Thêm cài đặt mới';
                form.reset();
                enableForm(true);
            } else {
                const data = getData(index);
                fillForm(data);
                modalTitle.textContent = isViewMode ? 'Xem chi tiết' : 'Chỉnh sửa cài đặt';
                enableForm(!isViewMode);
            }
        }
        
        function closeModal() {
            modal.style.display = 'none';
        }
        
        function enableForm(enabled) {
            const inputs = form.querySelectorAll('input, textarea');
            inputs.forEach(input => input.disabled = !enabled);
            
            const submitBtn = form.querySelector('button[type="submit"]');
            submitBtn.style.display = enabled ? 'block' : 'none';
        }
        
        function getData(index) {
            const settings = [
                {
                    identifier: 'max_connections',
                    value: '100',
                    description: 'Số lượng kết nối tối đa cho phép',
                    status: true
                },
                {
                    identifier: 'timeout',
                    value: '30',
                    description: 'Thời gian chờ tối đa (giây)',
                    status: false
                }
            ];
            return settings[index];
        }
        
        function fillForm(data) {
            document.getElementById('identifier').value = data.identifier;
            document.getElementById('value').value = data.value;
            document.getElementById('description').value = data.description;
            document.getElementById('status').checked = data.status;
        }
        
        form.onsubmit = function(e) {
            e.preventDefault();
            // Xử lý lưu dữ liệu ở đây
            closeModal();
        };
        
        // Đóng modal khi click bên ngoài
        window.onclick = function(e) {
            if (e.target == modal) {
                closeModal();
            }
        };
    </script>
</body>
</html>
