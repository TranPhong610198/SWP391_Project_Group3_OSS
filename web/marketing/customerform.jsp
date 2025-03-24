<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create New Customer</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .main-content {
                margin-left: 250px;
                padding: 20px;
            }

            .card {
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            .card-header {
                background-color: #1a2530;
                color: #ecf0f1;
                border-radius: 8px 8px 0 0;
            }

            .form-control:focus {
                border-color: #2c3e50;
                box-shadow: 0 0 0 0.2rem rgba(44, 62, 80, 0.25);
            }

            .btn-primary {
                background-color: #2c3e50;
                border-color: #2c3e50;
            }

            .btn-primary:hover {
                background-color: #34495e;
                border-color: #34495e;
            }

            .btn-secondary {
                background-color: #95a5a6;
                border-color: #95a5a6;
            }

            .btn-secondary:hover {
                background-color: #7f8c8d;
                border-color: #7f8c8d;
            }

            .required::after {
                content: " *";
                color: #e74c3c;
            }

            .alert {
                margin-bottom: 20px;
            }
            
            .error-feedback {
                width: 100%;
                margin-top: 0.25rem;
                font-size: 80%;
                color: #e74c3c;
                display: none;
            }
            
            .is-invalid {
                border-color: #e74c3c !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/marketing/sidebar.jsp" />

        <div class="main-content">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title mb-0">Tạo khách hàng mới</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </c:if>
                        <c:if test="${not empty param.message}">
                            <div class="alert alert-success" role="alert">
                                ${param.message}
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/marketing/addCustomer" method="post" id="customerForm">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Họ và tên</label>
                                    <input type="text" class="form-control" name="fullName" value="${customer.fullName}" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Email</label>
                                    <input type="email" class="form-control" name="email" value="${customer.email}" required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Số điện thoại</label>
                                    <input type="tel" class="form-control" name="mobile" 
                                           value="${customer.mobile}" required 
                                           pattern="(\+84|0)[1-9][0-9]{8,9}"
                                           title="Vui lòng nhập số điện thoại Việt Nam hợp lệ">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Giới tính</label>
                                    <select class="form-select" name="gender" required>
                                        <option value="male" ${customer.gender == 'male' ? 'selected' : ''}>Nam</option>
                                        <option value="female" ${customer.gender == 'female' ? 'selected' : ''}>Nữ</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label required">Loại khách hàng</label>
                                    <select class="form-select" name="customerType" required>
                                        <option value="normal" ${customer.customerType == 'normal' ? 'selected' : ''}>Thường</option>
                                        <option value="vip" ${customer.customerType == 'vip' ? 'selected' : ''}>VIP</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    <label class="form-label required">Địa chỉ</label>
                                    <textarea class="form-control" name="address" rows="3" required>${customer.address}</textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Tổng số lần mua</label>
                                    <input type="number" class="form-control" name="totalPurchases" 
                                           value="${customer.totalPurchases != null ? customer.totalPurchases : 0}" 
                                           min="0" id="totalPurchases" onchange="formatPurchases(this)">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Tổng chi tiêu (VNĐ)</label>
                                    <input type="text" class="form-control" name="totalSpend" 
                                           value="${customer.totalSpend != null ? customer.totalSpend : 500}" 
                                           min="500" onchange="formatCurrency(this)" onblur="validateSpend(this)" id="totalSpend">
                                    <div class="error-feedback" id="totalSpendError">Tổng chi tiêu phải từ 500 VNĐ trở lên</div>
                                    <!-- Sử dụng trường ẩn để lưu giá trị thực -->
                                    <input type="hidden" name="totalSpendRaw" id="totalSpendRaw" value="${customer.totalSpend != null ? customer.totalSpend : 500}">
                                </div>
                            </div>

                            <div class="d-flex justify-content-end mt-4">
                                <a href="${pageContext.request.contextPath}/marketing/customerlist" 
                                   class="btn btn-secondary me-2">Quay lại</a>
                                <button type="submit" class="btn btn-primary" id="submitBtn">Tạo</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Định dạng số lần mua để loại bỏ số 0 ở đầu
            function formatPurchases(input) {
                // Chuyển giá trị thành số và loại bỏ số 0 ở đầu
                let value = parseInt(input.value, 10);
                if (isNaN(value)) {
                    value = 0;
                }
                // Cập nhật giá trị vào trường nhập liệu
                input.value = value;
            }
            
            // Kiểm tra giá trị tổng chi tiêu
            function validateSpend(input) {
                // Lấy giá trị số từ trường ẩn thay vì từ trường hiển thị
                let value = parseInt(document.getElementById('totalSpendRaw').value, 10);
                if (isNaN(value)) {
                    value = 0;
                }
                
                const errorElement = document.getElementById('totalSpendError');
                
                if (value < 500) {
                    // Hiển thị lỗi
                    input.classList.add('is-invalid');
                    errorElement.style.display = 'block';
                    document.getElementById('submitBtn').disabled = true;
                    return false;
                } else {
                    // Ẩn lỗi
                    input.classList.remove('is-invalid');
                    errorElement.style.display = 'none';
                    document.getElementById('submitBtn').disabled = false;
                    return true;
                }
            }
            
            function formatCurrency(input) {
                // Loại bỏ tất cả ký tự không phải số
                let value = input.value.replace(/\D/g, "");
                
                // Chuyển đổi thành số nguyên
                value = parseInt(value, 10);
                if (isNaN(value)) {
                    value = 0;
                }
                
                // Đảm bảo giá trị là bội số của 500 nếu giá trị >= 500
                if (value >= 500) {
                    if (value % 500 !== 0) {
                        value = Math.ceil(value / 500) * 500;
                    }
                }
                
                // Cập nhật giá trị vào trường ẩn
                document.getElementById('totalSpendRaw').value = value;
                
                // Định dạng số theo tiền tệ Việt Nam để hiển thị
                input.value = new Intl.NumberFormat('vi-VN').format(value);
                
                // Kiểm tra giá trị
                validateSpend(input);
                
                // Log để kiểm tra
                console.log("Formatted value: " + input.value);
                console.log("Raw value stored: " + document.getElementById('totalSpendRaw').value);
            }
            
            // Kiểm tra form trước khi submit
            document.getElementById('customerForm').addEventListener('submit', function(event) {
                const totalSpendInput = document.getElementById('totalSpend');
                if (!validateSpend(totalSpendInput)) {
                    event.preventDefault();
                }
            });
            
            // Định dạng các trường khi trang được tải
            document.addEventListener('DOMContentLoaded', function() {
                // Định dạng trường tổng số lần mua
                const totalPurchasesInput = document.getElementById('totalPurchases');
                if (totalPurchasesInput) {
                    formatPurchases(totalPurchasesInput);
                }
                
                // Định dạng trường tổng chi tiêu
                const totalSpendInput = document.getElementById('totalSpend');
                if (totalSpendInput) {
                    // Nếu có giá trị trong trường ẩn, sử dụng nó
                    const rawValue = document.getElementById('totalSpendRaw').value;
                    if (rawValue) {
                        const numValue = parseInt(rawValue, 10);
                        if (!isNaN(numValue)) {
                            totalSpendInput.value = new Intl.NumberFormat('vi-VN').format(numValue);
                        } else {
                            totalSpendInput.value = new Intl.NumberFormat('vi-VN').format(500);
                            document.getElementById('totalSpendRaw').value = 500;
                        }
                    } else {
                        formatCurrency(totalSpendInput);
                    }
                    validateSpend(totalSpendInput);
                }
            });
        </script>
    </body>
</html>