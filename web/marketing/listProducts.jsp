<%-- 
    Document   : listProducts
    Created on : Feb 9, 2025, 8:11:07 PM
    Author     : tphon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản Lý Sản Phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .card {
                border: none;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
                border-radius: 10px;
            }
            .product-img {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 8px;
            }
            .table th {
                background-color: #f8f9fa;
                font-weight: 600;
            }
            .status-badge {
                padding: 5px 12px;
                border-radius: 20px;
                font-size: 12px;
                font-weight: 500;
            }
            .status-active {
                background-color: #d4edda;
                color: #155724;
            }
            .status-inactive {
                background-color: #f8d7da;
                color: #721c24;
            }
            .combo-product {
                border-left: 3px solid #007bff;
                margin-left: 20px;
            }
            .action-btn {
                padding: 5px 10px;
                margin: 0 2px;
                border-radius: 5px;
            }
            .filter-section {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
                margin-bottom: 20px;
            }
            .stock-link:hover {
                text-decoration: underline;
                cursor: pointer;
                color: #0056b3;
            }
        </style>

    </head>
    <body class="bg-light">



        <!-- Sidebar -->
        <div class="sidebar">
            <%@include file="sidebar.jsp" %>
        </div>

        <div class="main-content">
            <div class="container-fluid py-4">
                <!-- Header Section -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="mb-0">Quản Lý Sản Phẩm</h2>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
                        <i class="fas fa-plus me-2"></i>Thêm Sản Phẩm Mới
                    </button>
                </div>

                <!-- Filter Section -->
                <div class="card filter-section mb-4">
                    <div class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Danh mục</label>
                            <select class="form-select">
                                <option>Quần áo nam</option>
                                <option>Quần áo nữ</option>
                                <option>Phụ kiện</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Trạng thái</label>
                            <select class="form-select">
                                <option value="">Tất cả</option>
                                <option>Đang bán</option>
                                <option>Hết hàng</option>
                                <option>Ngừng kinh doanh</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Tìm kiếm</label>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Tìm theo tên, mô tả...">
                                <button class="btn btn-outline-secondary" type="button">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <button class="btn btn-secondary w-100">
                                <i class="fas fa-filter me-2"></i>Lọc
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Product List Table -->
                <div class="card">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" class="form-check-input">
                                        </th>
                                        <th>Hình ảnh</th>
                                        <th>
                                            ID
                                            <i class="fas fa-sort ms-1"></i>
                                        </th>
                                        <th>
                                            Tên sản phẩm
                                            <i class="fas fa-sort ms-1"></i>
                                        </th>
                                        <th>
                                            Danh mục
                                            <i class="fas fa-sort ms-1"></i>
                                        </th>
                                        <th>
                                            Giá niêm yết
                                            <i class="fas fa-sort ms-1"></i>
                                        </th>
                                        <th>
                                            Giá bán
                                            <i class="fas fa-sort ms-1"></i>
                                        </th>
                                        <th>Kho</th>
                                        <th>
                                            Trạng thái
                                            <i class="fas fa-sort ms-1"></i>
                                        </th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Normal Product -->
                                    <tr>
                                        <td><input type="checkbox" class="form-check-input"></td>
                                        <td><img src="/api/placeholder/80/80" class="product-img" alt="Product"></td>
                                        <td>#12345</td>
                                        <td>Áo polo nam</td>
                                        <td>Quần áo nam</td>
                                        <td>599,000đ</td>
                                        <td>499,000đ</td>
                                        <td><a class="stock-link text-primary">125</a></td>
                                        <td><span class="status-badge status-active">Đang bán</span></td>
                                        <td>
                                            <button class="action-btn btn btn-info btn-sm" title="Xem">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="action-btn btn btn-warning btn-sm" title="Sửa">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="action-btn btn btn-danger btn-sm" title="Xóa">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <div class="d-flex justify-content-between align-items-center mt-4">
                    <div class="text-muted">
                        Hiển thị 1-10 của 100 sản phẩm
                    </div>
                    <nav>
                        <ul class="pagination mb-0">
                            <li class="page-item disabled">
                                <a class="page-link" href="#"><i class="fas fa-chevron-left"></i></a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

            <!-- Add Product Modal -->
            <div class="modal fade" id="addProductModal" tabindex="-1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Thêm Sản Phẩm Mới</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Tên sản phẩm</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Danh mục</label>
                                        <select class="form-select">
                                            <option>Quần áo nam</option>
                                            <option>Quần áo nữ</option>
                                            <option>Phụ kiện</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Giá niêm yết</label>
                                        <input type="number" class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Giá bán</label>
                                        <input type="number" class="form-control">
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">Mô tả</label>
                                        <textarea class="form-control" rows="3"></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Số lượng trong kho</label>
                                        <input type="number" class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Trạng thái</label>
                                        <select class="form-select">
                                            <option>Đang bán</option>
                                            <option>Hết hàng</option>
                                            <option>Ngừng kinh doanh</option>
                                        </select>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">Hình ảnh sản phẩm</label>
                                        <input type="file" class="form-control" multiple>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-primary">Thêm sản phẩm</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
