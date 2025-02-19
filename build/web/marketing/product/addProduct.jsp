<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm sản phẩm</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #34495e;
            --accent-color: #3498db;
            --light-color: #ecf0f1;
            --border-color: #dee2e6;
            --hover-color: #f8f9fa;
        }

        body {
            background-color: #f8f9fa;
        }

        .main-content {
            margin-left: 250px;
            transition: all 0.3s;
            padding: 20px;
            min-height: 100vh;
        }

        .card {
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border: 1px solid var(--border-color);
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #fff;
            border-bottom: 1px solid var(--border-color);
            padding: 15px 20px;
            font-weight: 600;
        }

        .page-title {
            color: var(--primary-color);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--accent-color);
            display: inline-block;
        }

        .form-label {
            font-weight: 500;
            color: var(--primary-color);
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }

        .form-text {
            color: #6c757d;
        }

        .btn-primary {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
        }

        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }

        .sidebar-toggle {
            position: fixed;
            left: 10px;
            top: 10px;
            z-index: 1001;
            display: none;
            border-radius: 50%;
            width: 42px;
            height: 42px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .alert {
            border-radius: 8px;
        }

        .preview-image {
            max-width: 200px;
            max-height: 200px;
            border-radius: 4px;
            border: 1px solid var(--border-color);
            margin-top: 10px;
        }

        .sub-images-preview {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }

        .sub-image-preview {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid var(--border-color);
        }

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
    </style>
</head>
<body>
    <!-- Include the sidebar -->
    <jsp:include page="../sidebar.jsp" />

    <button class="btn btn-primary sidebar-toggle">
        <i class="fas fa-bars"></i>
    </button>

    <div class="main-content">
        <div class="container-fluid p-4">
            <h2 class="page-title">
                <i class="fas fa-plus-circle me-2"></i>Thêm sản phẩm mới
            </h2>

            <!-- Hiển thị thông báo thành công hoặc lỗi -->
            <c:if test="${param.success != null}">
                <div class="alert alert-success" role="alert">
                    <i class="fas fa-check-circle me-2"></i>Thêm sản phẩm thành công!
                </div>
            </c:if>
            <c:if test="${param.error != null}">
                <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i>Có lỗi xảy ra, vui lòng thử lại.
                </div>
            </c:if>

            <div class="card">
                <div class="card-header">
                    <i class="fas fa-info-circle me-2"></i>Thông tin sản phẩm
                </div>
                <div class="card-body">
                    <form action="addproduct" method="post" enctype="multipart/form-data" class="row g-3">
                        <!-- Tên sản phẩm -->
                        <div class="col-md-6">
                            <label for="title" class="form-label">Tên sản phẩm <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="title" name="title" required />
                            <div class="form-text">Nhập tên sản phẩm đầy đủ và chính xác</div>
                        </div>

                        <!-- Chọn danh mục -->
                        <div class="col-md-6">
                            <label for="categoryId" class="form-label">Danh mục <span class="text-danger">*</span></label>
                            <select class="form-select" id="categoryId" name="categoryId" required>
                                <option value="" selected disabled>Chọn danh mục</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Giá gốc -->
                        <div class="col-md-6">
                            <label for="originalPrice" class="form-label">Giá gốc (₫) <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" id="originalPrice" name="originalPrice" step="1000" min="0" required />
                        </div>

                        <!-- Giá khuyến mãi -->
                        <div class="col-md-6">
                            <label for="salePrice" class="form-label">Giá bán (₫) <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" id="salePrice" name="salePrice" step="1000" min="0" required />
                            <div class="form-text">Giá bán phải lớn hơn hoặc bằng giá gốc</div>
                        </div>

                         <!--Trạng thái--> 
<!--                        <div class="col-md-6">
                            <label for="status" class="form-label">Trạng thái <span class="text-danger">*</span></label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="active">Đang bán</option>
                                <option value="inactive">Ngưng bán</option>
                            </select>
                        </div>-->

                        <!-- Mô tả -->
                        <div class="col-12">
                            <label for="description" class="form-label">Mô tả sản phẩm</label>
                            <textarea class="form-control" id="description" name="description" rows="5" placeholder="Nhập mô tả chi tiết về sản phẩm..."></textarea>
                        </div>

                        <!-- Ảnh chính -->
                        <div class="col-md-6">
                            <label for="thumbnail" class="form-label">Ảnh chính <span class="text-danger">*</span></label>
                            <input type="file" class="form-control" id="thumbnail" name="thumbnail" accept="image/*" required onchange="previewThumbnail(this)" />
                            <div class="form-text">Kích thước tối ưu: 800x800px, định dạng: JPG, PNG</div>
                            <div id="thumbnailPreview"></div>
                        </div>

                        <!-- Ảnh phụ -->
                        <div class="col-md-6">
                            <label for="subImages" class="form-label">Ảnh phụ (tối đa 5 ảnh)</label>
                            <input type="file" class="form-control" id="subImages" name="subImages" accept="image/*" multiple onchange="previewSubImages(this)" />
                            <div class="form-text">Chọn tối đa 5 ảnh chi tiết sản phẩm</div>
                            <div id="subImagesPreview" class="sub-images-preview"></div>
                        </div>

                        <div class="col-12 mt-4">
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Thêm sản phẩm
                                </button>
                                <a href="productlist" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left me-2"></i>Quay lại
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.sidebar-toggle').on('click', function () {
                $('.sidebar').toggleClass('active');
                $('.main-content').toggleClass('active');
                $(this).hide();
            });

            $(document).on('click', function (e) {
                if ($(window).width() <= 768) {
                    if (!$(e.target).closest('.sidebar').length && !$(e.target).closest('.sidebar-toggle').length) {
                        $('.sidebar').removeClass('active');
                        $('.main-content').removeClass('active');
                        $('.sidebar-toggle').show();
                    }
                }
            });

            // Highlight active menu item
            $('.menu-item').removeClass('active');
            $('.menu-item a[href="addproduct"]').closest('.menu-item').addClass('active');
            $('#productSubmenu').addClass('show');
            
            // Validate sale price is less than or equal to original price
            $('#salePrice').on('change', function() {
                const originalPrice = parseFloat($('#originalPrice').val()) || 0;
                const salePrice = parseFloat($('#salePrice').val()) || 0;
                
                if (salePrice < originalPrice) {
                    alert('Giá khuyến mãi không được nhỏ hơn giá gốc!');
                    $('#salePrice').val(originalPrice);
                }
            });
        });
        
        // Preview thumbnail image
        function previewThumbnail(input) {
            const preview = document.getElementById('thumbnailPreview');
            preview.innerHTML = '';
            
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.className = 'preview-image';
                    preview.appendChild(img);
                }
                
                reader.readAsDataURL(input.files[0]);
            }
        }
        
        // Preview multiple sub-images
        function previewSubImages(input) {
            const preview = document.getElementById('subImagesPreview');
            preview.innerHTML = '';
            
            if (input.files) {
                const filesAmount = input.files.length;
                const maxFiles = 5;
                
                for (let i = 0; i < Math.min(filesAmount, maxFiles); i++) {
                    const reader = new FileReader();
                    
                    reader.onload = function(e) {
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        img.className = 'sub-image-preview';
                        preview.appendChild(img);
                    }
                    
                    reader.readAsDataURL(input.files[i]);
                }
                
                if (filesAmount > maxFiles) {
                    alert(`Bạn đã chọn ${filesAmount} ảnh. Chỉ 5 ảnh đầu tiên sẽ được hiển thị.`);
                }
            }
        }
    </script>
</body>
</html>
