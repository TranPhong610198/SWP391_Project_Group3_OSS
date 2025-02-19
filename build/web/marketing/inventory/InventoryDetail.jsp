<%-- 
    Document   : InventoryDetail
    Created on : Feb 17, 2025, 12:14:33 AM
    Author     : nguye
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inventory Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
            .model-table-container {
                max-height: 600px; /* scroll */
                overflow-y: auto;
                border: 1px solid #dee2e6;
                border-radius: 0.25rem;
                margin-bottom: 1.5rem;
            }

            .model-table-container table {
                margin-bottom: 0;
            }

            .model-table-container .table-bordered th,
            .model-table-container .table-bordered td {
                border-color: #dee2e6;
            }
            .read-only-field {
                background-color: #e9ecef;
                cursor: not-allowed;
            }
            .action-buttons .btn {
                margin-right: 5px;
            }
            .main-content {
                margin-left: 250px;
                transition: all 0.3s;
                padding: 10px;  
            }

            .main-content .container {
                padding: 1rem;  
                background-color: #fff;
                border: 1px solid #dee2e6;
                border-radius: 0.25rem;
                box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            }
            /* Card styling for sections */
            .info-section {
                border: 1px solid #dee2e6;
                border-radius: 0.25rem;
                padding: 1rem;
                margin-bottom: 1.5rem;
                background-color: #f8f9fa;
            }

            .info-section h5 {
                margin-top: 0;
                border-bottom: 1px solid #dee2e6;
                padding-bottom: 0.5rem;
                margin-bottom: 1rem;
            }

            /* Better table styling */
            .table-hover tbody tr:hover {
                background-color: rgba(0, 123, 255, 0.075);
            }

            .sticky-top {
                background-color: #f8f9fa;
            }


            /* Responsive */
            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                }
                .main-content.active {
                    margin-left: 250px;
                }
                .sidebar-toggle {
                    display: block;
                }
            }

            /* Toggle button */
            .sidebar-toggle {
                position: fixed;
                left: 10px;
                top: 10px;
                z-index: 1001;
                display: none;
            }

            @media (max-width: 768px) {
                .sidebar-toggle {
                    display: block;
                }
            }
        </style>
    </head>
    <body>
        <!-- Include the sidebar -->
        <jsp:include page="../sidebar.jsp" />

        <button class="btn btn-primary sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>

        <div class="main-content">
            <div class="container py-4">
                <!-- Error/Success Messages -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Product Info Section - Read Only -->
                <div class="info-section">
                    <h5 class="mb-3">Thông tin sản phẩm</h5>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control read-only-field" id="productName" 
                                       value="${inventory.productName}" readonly>
                                <label for="productName">Tên sản phẩm</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control read-only-field" id="category" 
                                       value="${inventory.category}" readonly>
                                <label for="category">Danh mục</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control read-only-field" id="totalStock" 
                                       value="${inventory.totalQuantity}" readonly>
                                <label for="totalStock">Tổng số lượng tồn kho</label>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Model Table -->
                <div class="info-section">
                    <h5 class="mb-3">Chi tiết Model sản phẩm</h5>
                    <div class="d-flex justify-content-end mb-3">
                        <a href="addModel?productId=${inventory.productId}" class="btn btn-success">
                            <i class="bi bi-plus-circle"></i> Thêm Model Mới
                        </a>
                    </div>
                    <div class="model-table-container">
                        <table class="table table-bordered table-hover">
                            <thead class="table-light sticky-top">
                                <tr>
                                    <th>Màu sắc</th>
                                    <th>Kích thước</th>
                                    <th>Số lượng</th>
                                    <th>Ngày cập nhật</th>
                                    <th>Sửa/Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${variants}" var="variant">
                                    <tr>
                                        <td>${variant.color.name}</td>
                                        <td>${variant.size.name}</td>
                                        <td>${variant.quantity}</td>
                                        <td><fmt:formatDate value="${variant.lastRestockDate}" pattern="dd/MM/yyyy"/></td>
                                        <td>
                                            <div class="action-buttons">
                                                <a href="editModel?variantId=${variant.id}&productId=${inventory.productId}" 
                                                   class="btn btn-outline-primary btn-sm">Sửa</a>
                                                <form action="inventoryDetail" method="POST" style="display: inline;">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="productId" value="${inventory.productId}">
                                                    <input type="hidden" name="variantId" value="${variant.id}">
                                                    <button type="submit" class="btn btn-outline-danger btn-sm" 
                                                            onclick="return confirm('Bạn có chắc chắn muốn xóa mẫu này?')">Xóa</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="d-flex justify-content-start mt-3">
                    <!--<a href="inventorylist" class="btn btn-secondary">Quay lại</a>-->
                    <a href="#" onclick="window.history.back()" class="btn btn-secondary">Quay lại</a>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Add JavaScript for sidebar functionality -->
        <script>
            $(document).ready(function () {
                // Toggle sidebar
                $('.sidebar-toggle').on('click', function () {
                    $('.sidebar').toggleClass('active');
                    $('.main-content').toggleClass('active');
                    $(this).hide();
                });

                // Close sidebar when clicking outside on mobile
                $(document).on('click', function (e) {
                    if ($(window).width() <= 768) {
                        if (!$(e.target).closest('.sidebar').length && !$(e.target).closest('.sidebar-toggle').length) {
                            $('.sidebar').removeClass('active');
                            $('.main-content').removeClass('active');
                            $('.sidebar-toggle').show();
                        }
                    }
                });
                
                // Since inventory management is part of product management, highlight that menu item
                $('.menu-item').removeClass('active');
                $('.menu-item a[href="inventorylist"]').closest('.menu-item').addClass('active');
                
                // Open product submenu by default
                $('#productSubmenu').addClass('show');
            });
        </script>
    </body>
</html>
