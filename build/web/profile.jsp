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
        <style>
            :root {
                --primary:rgb(129, 33, 33);
                --primary-dark: #b52626;
                --secondary: #64748b;
                --success: #10b981;
                --surface: #ffffff;
                --background: #f1f5f9;
                --text: #1e293b;
                --text-light: #64748b;
                --border: #e2e8f0;
                --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.1);
                --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
                --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
            }

            body {
                background: var(--background);
                font-family: system-ui, -apple-system, sans-serif;
                color: var(--text);
                line-height: 1.6;
            }

            .container {
                max-width: 1200px;
                padding: 2rem 1rem;
            }

            .profile-card {
                background: var(--surface);
                border-radius: 1rem;
                box-shadow: var(--shadow-md);
                transition: all 0.3s ease;
                overflow: hidden;
            }

            .avatar-container {
                position: relative;
                width: 160px;
                height: 160px;
                margin: 2rem auto;
            }

            .profile-picture {
                width: 100%;
                height: 100%;
                border-radius: 50%;
                object-fit: cover;
                border: 4px solid var(--surface);
                box-shadow: var(--shadow-md);
            }

            .avatar-overlay {
                position: absolute;
                inset: 0;
                background: rgba(0, 0, 0, 0.6);
                backdrop-filter: blur(2px);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                opacity: 0;
                transition: opacity 0.3s;
                cursor: pointer;
            }

            .avatar-overlay:hover {
                opacity: 1;
            }

            .avatar-overlay i {
                color: white;
                font-size: 2rem;
            }

            .user-info {
                padding: 1.5rem;
                text-align: center;
            }

            .user-info h4 {
                color: var(--text);
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 1rem;
            }

            .contact-info {
                color: var(--text-light);
                margin-bottom: 1.5rem;
            }

            .contact-info i {
                color: var(--primary);
                width: 1.5rem;
                margin-right: 0.5rem;
            }

            .form-control {
                border: 1px solid var(--border);
                padding: 0.75rem 1rem;
                border-radius: 0.75rem;
                transition: all 0.2s;
            }

            .form-control:focus {
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
            }

            .btn {
                padding: 0.75rem 1.5rem;
                border-radius: 0.75rem;
                font-weight: 500;
                transition: all 0.2s;
            }

            .btn-primary {
                background: var(--primary);
                border: none;
            }

            .btn-primary:hover {
                background: var(--primary-dark);
                transform: translateY(-1px);
            }

            .section-title {
                color: var(--text);
                font-size: 1.25rem;
                font-weight: 600;
                margin-bottom: 1.5rem;
                padding-bottom: 0.75rem;
                border-bottom: 2px solid var(--border);
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .section-title i {
                color: var(--primary);
            }

            .address-item {
                background: var(--surface);
                border-radius: 1rem;
                border: 1px solid var(--border);
                padding: 1.5rem;
                margin-bottom: 1rem;
                transition: all 0.2s;
            }

            .address-item:hover {
                border-color: var(--primary);
                box-shadow: var(--shadow-md);
            }

            .address-item p {
                margin-bottom: 0.5rem;
            }

            .address-item i {
                color: var(--primary);
                width: 1.5rem;
            }

            .preview-container {
                margin-top: 1rem;
                display: none;
            }

            .preview-container img {
                max-width: 100%;
                border-radius: 0.75rem;
                margin-bottom: 1rem;
            }

            .upload-actions {
                display: none;
                gap: 0.5rem;
            }

            @media (max-width: 768px) {
                .avatar-container {
                    width: 120px;
                    height: 120px;
                }

                .section-title {
                    font-size: 1.125rem;
                }

                .btn {
                    width: 100%;
                    margin-bottom: 0.5rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row g-4">
                <!-- Profile Info Column -->
                <div class="col-md-4">
                    <div class="profile-card">
                        <div class="avatar-container">
                            <img src="${sessionScope.acc.avatar}" alt="avatar" class="profile-picture" 
                                 onerror="this.src='https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg'">
                            <div class="avatar-overlay" onclick="document.getElementById('avatar').click()">
                                <i class="fas fa-camera"></i>
                            </div>
                        </div>

                        <form action="profile" method="post" enctype="multipart/form-data" id="avatarForm">
                            <input type="hidden" name="action" value="update_avatar">
                            <input type="file" class="form-control d-none" id="avatar" name="avatar" 
                                   accept="image/*" onchange="previewImage(this)">
                            <div class="preview-container">
                                <img id="preview" src="#" alt="Preview">
                                <div class="upload-actions d-flex">
                                    <button type="submit" class="btn btn-primary flex-grow-1">
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
                                <div><i class="fas fa-envelope"></i>${requestScope.user.email}</div>
                                <div><i class="fas fa-phone"></i>${requestScope.user.mobile}</div>
                            </div>
                            <div class="d-flex justify-content-center gap-3">
                                <a href="changepassword" class="btn btn-primary btn-sm">
                                    <i class="fas fa-key me-2"></i> Đổi mật khẩu
                                </a>
                                <a href="resetpassword" class="btn btn-primary btn-sm">
                                    <i class="fas fa-key me-2"></i> Khôi phục mật khẩu
                                </a>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Main Content Column -->
                <div class="col-md-8">
                    <div class="profile-card p-4">
                        <h2 class="section-title">
                            <i class="fas fa-user-circle"></i>Thông tin cá nhân
                        </h2>
                        <form action="profile" method="post" class="needs-validation mb-4" novalidate>
                            <input type="hidden" name="action" value="update_profile">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Tài khoản</label>
                                    <input type="text" class="form-control" value="${requestScope.user.username}" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Tên đầy đủ</label>
                                    <input type="text" class="form-control" name="fullName" 
                                           value="${requestScope.user.fullName}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Giới tính</label>
                                    <select class="form-control" name="gender" required>
                                        <option value="male" ${requestScope.user.gender == 'male' ? 'selected' : ''}>Nam</option>
                                        <option value="female" ${requestScope.user.gender == 'female' ? 'selected' : ''}>Nữ</option>
                                        <option value="other" ${requestScope.user.gender == 'other' ? 'selected' : ''}>Khác</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" name="mobile" 
                                           value="${requestScope.user.mobile}" pattern="[0-9]{10}" required>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save me-2"></i>Lưu thông tin
                                    </button>
                                </div>
                            </div>
                        </form>

                        <h3 class="section-title">
                            <i class="fas fa-map-marker-alt"></i>Địa chỉ vận chuyển
                        </h3>
                        <div class="addresses-container mb-4">
                            <c:forEach var="address" items="${addresses}">
                                <div class="address-item">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <p><i class="fas fa-user"></i>${address.recipientName}</p>
                                            <p><i class="fas fa-phone"></i>${address.phone}</p>
                                            <p class="mb-0"><i class="fas fa-home"></i>${address.address}</p>
                                        </div>
                                        <div class="col-auto">
                                            <form action="profile" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="address_id" value="${address.id}">
                                                <button type="submit" class="btn btn-danger btn-sm" 
                                                        onclick="return confirm('Bạn có muốn xóa địa chỉ này không?')">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <h3 class="section-title">
                            <i class="fas fa-plus-circle"></i>Thêm địa chỉ mới
                        </h3>
                        <form action="profile" method="post" class="needs-validation" novalidate>
                            <input type="hidden" name="action" value="add">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Tên người nhận</label>
                                    <input type="text" class="form-control" name="recipient_name" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số điện thoại</label>
                                    <input type="tel" class="form-control" name="phone" pattern="[0-9]{10}" required>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Địa chỉ nhận</label>
                                    <textarea class="form-control" name="address" rows="3" required></textarea>
                                </div>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" name="is_default" id="defaultAddress">
                                        <label class="form-check-label" for="defaultAddress">
                                            <i class="fas fa-star me-2"></i>Đặt làm mặc định
                                        </label>
                                    </div>
                                </div>
                                <div class="col-12 d-flex gap-2">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save me-2"></i>Lưu địa chỉ
                                    </button>
                                    <a href="index.jsp" class="btn btn-secondary">
                                        <i class="fas fa-arrow-left me-2"></i>Quay lại
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

                                                                    reader.onload = function (e) {
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