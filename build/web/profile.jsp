<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="User Profile Management">
        <title>User Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
        <style>
            :root {
                --primary-color: #4e73df;
                --secondary-color: #858796;
                --success-color: #1cc88a;
                --hover-color: #2e59d9;
                --bg-gradient-start: #f8f9fc;
                --bg-gradient-end: #f1f3f9;
                --border-color: rgba(78, 115, 223, 0.1);
                --shadow-color: rgba(78, 115, 223, 0.1);
                --shadow-hover-color: rgba(78, 115, 223, 0.15);
                --text-primary: #333;
                --text-secondary: #555;
            }

            body {
                background: linear-gradient(135deg, var(--bg-gradient-start) 0%, var(--bg-gradient-end) 100%);
                font-family: 'Nunito', sans-serif;
                color: var(--text-primary);
                min-height: 100vh;
            }

            .profile-card {
                background: #ffffff;
                padding: 2rem;
                border-radius: 15px;
                box-shadow: 0 8px 20px var(--shadow-color);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                margin-bottom: 2rem;
            }

            .profile-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 25px var(--shadow-hover-color);
            }

            .avatar-container {
                position: relative;
                width: 180px;
                height: 180px;
                margin: 0 auto 1rem;
            }

            .profile-image {
                width: 100%;
                height: 100%;
                border-radius: 50%;
                object-fit: cover;
                border: 5px solid #fff;
                box-shadow: 0 0 20px var(--shadow-color);
                transition: transform 0.3s ease;
            }

            .avatar-overlay {
                position: absolute;
                inset: 0;
                background: rgba(0, 0, 0, 0.5);
                border-radius: 50%;
                opacity: 0;
                transition: opacity 0.3s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
            }

            .avatar-container:hover .avatar-overlay {
                opacity: 1;
            }

            .avatar-overlay i {
                color: white;
                font-size: 2rem;
            }

            .preview-container {
                display: none;
                margin-top: 1rem;
            }

            .preview-container img {
                max-width: 100%;
                border-radius: 10px;
                margin-bottom: 0.5rem;
            }

            .upload-actions {
                display: none;
                gap: 0.5rem;
                margin-top: 1rem;
            }

            .user-info {
                padding: 1.5rem 0;
            }

            .user-info h4 {
                color: var(--primary-color);
                font-weight: 700;
                margin-bottom: 0.5rem;
            }

            .contact-info {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
                color: var(--secondary-color);
            }

            .contact-info i {
                width: 20px;
                margin-right: 0.5rem;
                color: var(--primary-color);
            }

            .section-title {
                color: var(--primary-color);
                font-weight: 700;
                margin-bottom: 1.5rem;
                padding-bottom: 0.5rem;
                border-bottom: 2px solid var(--border-color);
            }

            .form-control {
                border-radius: 8px;
                padding: 0.75rem 1rem;
                border: 1px solid var(--border-color);
                transition: all 0.3s ease;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.15);
            }

            .btn {
                font-weight: 600;
                padding: 0.75rem 1.5rem;
                border-radius: 8px;
                transition: all 0.3s ease;
            }

            .btn-primary {
                background-color: var(--primary-color);
                border: none;
            }

            .btn-primary:hover {
                background-color: var(--hover-color);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(46, 89, 217, 0.2);
            }

            .address-item {
                background: #fff;
                padding: 1.5rem;
                border-radius: 12px;
                border: 1px solid var(--border-color);
                margin-bottom: 1rem;
                transition: all 0.3s ease;
            }

            .address-item:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 15px var(--shadow-color);
                border-color: var(--primary-color);
            }

            @media (max-width: 768px) {
                .container {
                    padding: 1rem;
                }
                
                .profile-card {
                    padding: 1.5rem;
                }

                .avatar-container {
                    width: 150px;
                    height: 150px;
                }
            }

            @media (max-width: 576px) {
                .avatar-container {
                    width: 120px;
                    height: 120px;
                }

                .btn {
                    width: 100%;
                    margin-bottom: 0.5rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row g-4">
                <!-- Profile Info Column -->
                <div class="col-md-4">
                    <div class="profile-card text-center">
                        <div class="avatar-container">
                            <img src="${requestScope.user.avatar == null ? 'https://via.placeholder.com/150' : requestScope.user.avatar}" 
                                 alt="Profile Picture" class="profile-image">
                            <div class="avatar-overlay" onclick="document.getElementById('avatar').click()">
                                <i class="fas fa-camera"></i>
                            </div>
                        </div>

                        <form action="profile" method="post" enctype="multipart/form-data" class="upload-form" id="avatarForm">
                            <input type="hidden" name="action" value="update_avatar">
                            <input type="file" class="form-control d-none" id="avatar" name="avatar" 
                                   accept="image/*" onchange="previewImage(this)">
                            <div class="preview-container">
                                <img id="preview" src="#" alt="Preview">
                                <div class="upload-actions d-flex justify-content-between">
                                    <button type="submit" class="btn btn-primary flex-grow-1 me-2">
                                        <i class="fas fa-check me-2"></i>Lưu ảnh
                                    </button>
                                    <button type="button" class="btn btn-secondary flex-grow-1" onclick="cancelUpload()">
                                        <i class="fas fa-times me-2"></i>Hủy
                                    </button>
                                </div>
                            </div>
                        </form>
                                 
                        <div class="user-info">
                            <h4>${requestScope.user.fullName}</h4>
                            <div class="contact-info">
                                <span><i class="fas fa-envelope"></i>${requestScope.user.email}</span>
                                <span><i class="fas fa-phone"></i>${requestScope.user.mobile}</span>
                            </div>
                        </div>
                        <a href="changepassword" class="btn btn-primary w-100 mb-2">
                            <i class="fas fa-key me-2"></i>Đổi mật khẩu
                        </a>
                    </div>
                </div>

                <!-- Main Content Column -->
                <div class="col-md-8">
                    <div class="profile-card">
                        <!-- Personal Information Section -->
                        <h2 class="section-title">
                            <i class="fas fa-user-circle me-2"></i>Thông tin cá nhân
                        </h2>
                        <form action="profile" method="post" class="needs-validation mb-4" novalidate>
                            <input type="hidden" name="action" value="update_profile">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Tài khoản</label>
                                    <input type="text" class="form-control" value="${requestScope.user.username}" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="fullName">Tên đầy đủ</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" 
                                           value="${requestScope.user.fullName}" required>
                                    <div class="invalid-feedback">
                                        Vui lòng nhập tên của bạn
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="gender">Giới tính</label>
                                    <select class="form-control" id="gender" name="gender" required>
                                        <option value="male" ${requestScope.user.gender == 'male' ? 'selected' : ''}>Male</option>
                                        <option value="female" ${requestScope.user.gender == 'female' ? 'selected' : ''}>Female</option>
                                        <option value="other" ${requestScope.user.gender == 'other' ? 'selected' : ''}>Other</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        Vui lòng chọn giới tính
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="mobile">Số điênj thoại</label>
                                    <input type="text" class="form-control" id="mobile" name="mobile" 
                                           value="${requestScope.user.mobile}" pattern="[0-9]{10}" required>
                                    <div class="invalid-feedback">
                                        Hãy nhập đúng số điện thoại
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save me-2"></i>Lưu
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Shipping Addresses Section -->
                        <h3 class="section-title">
                            <i class="fas fa-map-marker-alt me-2"></i>Địa chỉ vận chuyển 
                        </h3>
                        <div class="addresses-container mb-4">
                            <c:forEach var="address" items="${addresses}">
                                <div class="address-item">
                                    <div class="row align-items-center">
                                        <div class="col-md-10">
                                            <p><strong><i class="fas fa-user me-2"></i>Người nhận:</strong> ${address.recipientName}</p>
                                            <p><strong><i class="fas fa-phone me-2"></i>SĐT:</strong> ${address.phone}</p>
                                            <p class="mb-0"><strong><i class="fas fa-home me-2"></i>Địa chỉ:</strong> ${address.address}</p>
                                        </div>
                                        <div class="col-md-2 text-end">
                                            <form action="profile" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="address_id" value="${address.id}">
                                                <button type="submit" class="btn btn-danger btn-sm" 
                                                        onclick="return confirm('Bạn có muốn xóa địa chỉ này không ?')">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Add New Address Section -->
                        <h3 class="section-title">
                            <i class="fas fa-plus-circle me-2"></i>Thêm địa chỉ mới
                        </h3>
                        <form action="profile" method="post" class="needs-validation" novalidate>
                            <input type="hidden" name="action" value="add">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label" for="recipient_name">Tên người nhận</label>
                                    <input type="text" class="form-control" id="recipient_name" 
                                           name="recipient_name" required>
                                    <div class="invalid-feedback">
                                        Vui lòng nhập tên người nhận
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label" for="phone">Số điện thoại</label>
                                    <input type="tel" class="form-control" id="phone" 
                                           name="phone" pattern="[0-9]{10}" required>
                                    <div class="invalid-feedback">
                                        Vui lòng nhập số điện thoại
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label class="form-label" for="address">Địa chỉ nhận</label>
                                    <textarea class="form-control" id="address" 
                                              name="address" rows="3" required></textarea>
                                    <div class="invalid-feedback">
                                        Vui lòng nhập địa chỉ
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" 
                                               name="is_default" id="defaultAddress">
                                        <label class="form-check-label" for="defaultAddress">
                                            <i class="fas fa-star me-2"></i>Đặt làm mặc định
                                        </label>
                                    </div>
                                </div>
                                <div class="col-12 d-flex gap-2">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save me-2"></i>Lưu địa chỉ
                                    </button>
                                    <a href="index.jsp" class="btn btn-primary">
                                        <i class="fas fa-save me-2"></i>Quay lại trang chính
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
             function previewImage(input) {
                const preview = document.getElementById('preview');
                const previewContainer = document.querySelector('.preview-container');
                const uploadActions = document.querySelector('.upload-actions');
                
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    
                    reader.onload = function(e) {
                        preview.src = e.target.result;
                        previewContainer.style.display = 'block';
                        uploadActions.style.display = 'flex';
                    }
                    
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function cancelUpload() {
                const form = document.getElementById('avatarForm');
                const preview = document.getElementById('preview');
                const previewContainer = document.querySelector('.preview-container');
                const uploadActions = document.querySelector('.upload-actions');
                
                form.reset();
                preview.src = '#';
                previewContainer.style.display = 'none';
                uploadActions.style.display = 'none';
            }
            // Form validation
            (() => {
                'use strict'
                const forms = document.querySelectorAll('.needs-validation')
                Array.from(forms).forEach(form => {
                    form.addEventListener('submit', event => {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            })()
        </script>
    </body>
</html>