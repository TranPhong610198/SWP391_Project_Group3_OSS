<%-- 
    Document   : dashboard
    Created on : Mar 11, 2025, 2:49:26 PM
    Author     : VuxD4t
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }
    .dashboard-container {
      display: flex;
      min-height: 100vh;
    }
    .sidebar {
      width: 250px;
      background-color: #333;
      color: white;
      padding: 20px 0;
    }
    .sidebar-header {
      padding: 0 20px;
      margin-bottom: 20px;
    }
    .sidebar-menu {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .sidebar-menu li {
      padding: 10px 20px;
      cursor: pointer;
    }
    .sidebar-menu li:hover {
      background-color: #444;
    }
    .sidebar-menu li.active {
      background-color: #555;
      border-left: 4px solid #4CAF50;
    }
    .main-content {
      flex: 1;
      padding: 20px;
    }
    .dashboard-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
    }
    .stats-container {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
      margin-bottom: 30px;
    }
    .stat-card {
      background-color: white;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    .stat-card h3 {
      margin-top: 0;
      color: #666;
      font-size: 14px;
    }
    .stat-card .value {
      font-size: 24px;
      font-weight: bold;
      margin: 10px 0;
    }
    .stat-card .change {
      font-size: 12px;
      color: #4CAF50;
    }
    .chart-container {
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 20px;
      margin-bottom: 30px;
    }
    .chart-card {
      background-color: white;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    .table-container {
      background-color: white;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }
    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f9f9f9;
    }
    .status {
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: bold;
    }
    .status-pending {
      background-color: #FFF3CD;
      color: #856404;
    }
    .status-processing {
      background-color: #D1ECF1;
      color: #0C5460;
    }
    .status-shipped {
      background-color: #D4EDDA;
      color: #155724;
    }
    .status-completed {
      background-color: #C3E6CB;
      color: #155724;
    }
    .status-cancelled {
      background-color: #F8D7DA;
      color: #721C24;
    }
    .action-buttons {
      display: flex;
      gap: 5px;
    }
    .btn {
      padding: 5px 10px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 12px;
    }
    .btn-view {
      background-color: #007BFF;
      color: white;
    }
    .btn-edit {
      background-color: #FFC107;
      color: #212529;
    }
    .low-stock {
      color: #dc3545;
      font-weight: bold;
    }
    .pagination {
      display: flex;
      justify-content: flex-end;
      margin-top: 20px;
    }
    .pagination button {
      margin: 0 5px;
      padding: 5px 10px;
      background-color: #fff;
      border: 1px solid #ddd;
      cursor: pointer;
    }
    .pagination button.active {
      background-color: #007BFF;
      color: white;
      border-color: #007BFF;
    }
  </style>
</head>
<body>
  <div class="dashboard-container">
    <div class="sidebar">
      <div class="sidebar-header">
        <h2>My Shop Admin</h2>
      </div>
      <ul class="sidebar-menu">
        <li class="active">Tổng quan</li>
        <li>Quản lý đơn hàng</li>
        <li>Quản lý sản phẩm</li>
        <li>Quản lý người dùng</li>
        <li>Quản lý khuyến mãi</li>
        <li>Quản lý đánh giá</li>
        <li>Quản lý nội dung</li>
        <li>Cài đặt</li>
      </ul>
    </div>
    
    <div class="main-content">
      <div class="dashboard-header">
        <h1>Tổng quan</h1>
        <div>
          <select>
            <option>Hôm nay</option>
            <option>7 ngày qua</option>
            <option>30 ngày qua</option>
            <option>Năm nay</option>
          </select>
        </div>
      </div>
      
      <div class="stats-container">
        <div class="stat-card">
          <h3>TỔNG DOANH THU</h3>
          <div class="value">15,689,000đ</div>
          <div class="change">+12% so với kỳ trước</div>
        </div>
        <div class="stat-card">
          <h3>SỐ ĐƠN HÀNG</h3>
          <div class="value">123</div>
          <div class="change">+5% so với kỳ trước</div>
        </div>
        <div class="stat-card">
          <h3>KHÁCH HÀNG MỚI</h3>
          <div class="value">48</div>
          <div class="change">+15% so với kỳ trước</div>
        </div>
        <div class="stat-card">
          <h3>TỶ LỆ HOÀN THÀNH</h3>
          <div class="value">95%</div>
          <div class="change">+2% so với kỳ trước</div>
        </div>
      </div>
      
      <div class="chart-container">
        <div class="chart-card">
          <h2>Doanh thu theo thời gian</h2>
          <div style="height: 300px; background-color: #f5f5f5; display: flex; align-items: center; justify-content: center;">
            [Biểu đồ doanh thu]
          </div>
        </div>
        <div class="chart-card">
          <h2>Top sản phẩm bán chạy</h2>
          <div style="height: 300px; background-color: #f5f5f5; display: flex; align-items: center; justify-content: center;">
            [Biểu đồ sản phẩm]
          </div>
        </div>
      </div>
      
      <div class="table-container">
        <h2>Đơn hàng gần đây</h2>
        <table>
          <thead>
            <tr>
              <th>Mã đơn</th>
              <th>Khách hàng</th>
              <th>Ngày đặt</th>
              <th>Tổng tiền</th>
              <th>Trạng thái</th>
              <th>Thao tác</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>#ORD001</td>
              <td>Nguyễn Văn A</td>
              <td>18/03/2025</td>
              <td>1,250,000đ</td>
              <td><span class="status status-processing">Đang xử lý</span></td>
              <td>
                <div class="action-buttons">
                  <button class="btn btn-view">Xem</button>
                  <button class="btn btn-edit">Sửa</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>#ORD002</td>
              <td>Trần Thị B</td>
              <td>17/03/2025</td>
              <td>850,000đ</td>
              <td><span class="status status-shipped">Đã giao hàng</span></td>
              <td>
                <div class="action-buttons">
                  <button class="btn btn-view">Xem</button>
                  <button class="btn btn-edit">Sửa</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>#ORD003</td>
              <td>Phạm Văn C</td>
              <td>16/03/2025</td>
              <td>2,450,000đ</td>
              <td><span class="status status-pending">Chờ xác nhận</span></td>
              <td>
                <div class="action-buttons">
                  <button class="btn btn-view">Xem</button>
                  <button class="btn btn-edit">Sửa</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>#ORD004</td>
              <td>Lê Thị D</td>
              <td>15/03/2025</td>
              <td>1,750,000đ</td>
              <td><span class="status status-completed">Hoàn thành</span></td>
              <td>
                <div class="action-buttons">
                  <button class="btn btn-view">Xem</button>
                  <button class="btn btn-edit">Sửa</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>#ORD005</td>
              <td>Hoàng Văn E</td>
              <td>14/03/2025</td>
              <td>950,000đ</td>
              <td><span class="status status-cancelled">Đã hủy</span></td>
              <td>
                <div class="action-buttons">
                  <button class="btn btn-view">Xem</button>
                  <button class="btn btn-edit">Sửa</button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
        <div class="pagination">
          <button>Trước</button>
          <button class="active">1</button>
          <button>2</button>
          <button>3</button>
          <button>Sau</button>
        </div>
      </div>
      
      <div class="table-container">
        <h2>Sản phẩm sắp hết hàng</h2>
        <table>
          <thead>
            <tr>
              <th>Mã SP</th>
              <th>Tên sản phẩm</th>
              <th>Màu sắc</th>
              <th>Kích thước</th>
              <th>Tồn kho</th>
              <th>Thao tác</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>#PRD001</td>
              <td>Áo phông nam cổ tròn</td>
              <td>Đen</td>
              <td>L</td>
              <td><span class="low-stock">5</span></td>
              <td>
                <div class="action-buttons">
                  <button class="btn btn-view">Xem</button>
                  <button class="btn btn-edit">Nhập hàng</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>#PRD002</td>
              <td>Quần jean nữ ống rộng</td>
              <td>Xanh nhạt</td>
              <td>M</td>
              <td><span class="low-stock">3</span></td>
              <td>
                <div class="action-buttons">
                  <button class="btn btn-view">Xem</button>
                  <button class="btn btn-edit">Nhập hàng</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>#PRD003</td>
              <td>Áo khoác denim unisex</td>
              <td>Xanh đậm</td>
              <td>XL</td>
              <td><span class="low-stock">8</span></td>
              <td>
                <div class="action-buttons">
                  <button class="btn btn-view">Xem</button>
                  <button class="btn btn-edit">Nhập hàng</button>
                </div>
              </td>
            </tr>
            <tr>
              <td>#PRD004</td>
              <td>Váy liền thân hoa nhí</td>
              <td>Vàng</td>
              <td>S</td>
              <td><span class="low-stock">2</span></td>
              <td>
                <div class="action-buttons">
                  <button class="btn btn-view">Xem</button>
                  <button class="btn btn-edit">Nhập hàng</button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</body>
</html>