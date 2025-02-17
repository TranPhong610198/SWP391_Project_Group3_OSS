<%-- 
    Document   : homepage
    Created on : Feb 18, 2025, 12:13:18 AM
    Author     : VuxD4t
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage Template</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            .product-card, .post-card {
                transition: transform 0.3s;
                height: 100%;
            }
            .product-card:hover, .post-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            .carousel-item img {
                height: 700px; /* Tăng từ 500px lên 700px */
                object-fit: cover;
                width: 100%;
            }
            #mainCarousel {
                margin-bottom: 50px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            }

            .carousel-caption {
                background: rgba(0,0,0,0.5);
                padding: 20px;
                border-radius: 5px;
            }
            .thumbnail-img {
                height: 200px;
                object-fit: cover;
            }
            .section-title {
                position: relative;
                margin-bottom: 30px;
                padding-bottom: 10px;
            }
            .section-title::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 50px;
                height: 3px;
                background-color: #007bff;
            }
        </style>
    </head>
    <body>
        <!-- Include header -->
        <jsp:include page="header.jsp" />
        <!-- Thanh trượt (Carousel) -->
        <div id="mainCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="#">
                        <img src="https://hthaostudio.com/wp-content/uploads/2019/08/anh-sexxy-1.jpg.webp" class="d-block w-100" alt="Slide 1">
                        <div class="carousel-caption">
                            <h3>Tiêu đề thanh trượt 1</h3>
                        </div>
                    </a>

                </div>
                <div class="carousel-item">
                    <a href="#slide2-link">
                        <img src="https://c.wallhere.com/photos/07/0d/500px_kneeling_mask_Maksim_Chuprin_women_lingerie_Disha_Shemetova-1342363.jpg!d" class="d-block w-100" alt="Slide 2">
                        <div class="carousel-caption">
                            <h3>Tiêu đề thanh trượt 2</h3>
                        </div>
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="#slide3-link">
                        <img src="https://c.wallhere.com/photos/84/19/women_model_brunette_long_hair_women_outdoors_wavy_hair_500px_Damian_Pi_rko-10474.jpg!d" class="d-block w-100" alt="Slide 3">
                        <div class="carousel-caption">
                            <h3>Tiêu đề thanh trượt 3</h3>
                        </div>
                    </a>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <div class="container">
            <!-- Bài đăng hot -->
            <section class="mb-5">
                <h2 class="section-title">Bài đăng nổi bật</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <a href="#post1-link" class="text-decoration-none text-dark">
                            <div class="card post-card">
                                <img src="/api/placeholder/400/300" class="card-img-top thumbnail-img" alt="Post 1">
                                <div class="card-body">
                                    <h5 class="card-title">Tiêu đề bài đăng 1</h5>
                                    <p class="card-text">Thông tin tóm tắt về bài đăng 1...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#post2-link" class="text-decoration-none text-dark">
                            <div class="card post-card">
                                <img src="/api/placeholder/400/300" class="card-img-top thumbnail-img" alt="Post 2">
                                <div class="card-body">
                                    <h5 class="card-title">Tiêu đề bài đăng 2</h5>
                                    <p class="card-text">Thông tin tóm tắt về bài đăng 2...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#post3-link" class="text-decoration-none text-dark">
                            <div class="card post-card">
                                <img src="/api/placeholder/400/300" class="card-img-top thumbnail-img" alt="Post 3">
                                <div class="card-body">
                                    <h5 class="card-title">Tiêu đề bài đăng 3</h5>
                                    <p class="card-text">Thông tin tóm tắt về bài đăng 3...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </section>

            <!-- Sản phẩm nổi bật -->
            <section class="mb-5">
                <h2 class="section-title">Sản phẩm nổi bật</h2>
                <div class="row g-4">
                    <div class="col-md-3">
                        <a href="#product1-link" class="text-decoration-none text-dark">
                            <div class="card product-card">
                                <img src="/api/placeholder/300/300" class="card-img-top thumbnail-img" alt="Product 1">
                                <div class="card-body">
                                    <h5 class="card-title">Tên sản phẩm 1</h5>
                                    <p class="card-text">Thông tin tóm tắt về sản phẩm 1...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#product2-link" class="text-decoration-none text-dark">
                            <div class="card product-card">
                                <img src="/api/placeholder/300/300" class="card-img-top thumbnail-img" alt="Product 2">
                                <div class="card-body">
                                    <h5 class="card-title">Tên sản phẩm 2</h5>
                                    <p class="card-text">Thông tin tóm tắt về sản phẩm 2...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#product3-link" class="text-decoration-none text-dark">
                            <div class="card product-card">
                                <img src="/api/placeholder/300/300" class="card-img-top thumbnail-img" alt="Product 3">
                                <div class="card-body">
                                    <h5 class="card-title">Tên sản phẩm 3</h5>
                                    <p class="card-text">Thông tin tóm tắt về sản phẩm 3...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#product4-link" class="text-decoration-none text-dark">
                            <div class="card product-card">
                                <img src="/api/placeholder/300/300" class="card-img-top thumbnail-img" alt="Product 4">
                                <div class="card-body">
                                    <h5 class="card-title">Tên sản phẩm 4</h5>
                                    <p class="card-text">Thông tin tóm tắt về sản phẩm 4...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </section>

            <!-- Bài đăng mới nhất -->
            <section class="mb-5">
                <h2 class="section-title">Bài đăng mới nhất</h2>
                <div class="row g-4">
                    <div class="col-md-6">
                        <a href="#latest1-link" class="text-decoration-none text-dark">
                            <div class="card post-card">
                                <img src="/api/placeholder/600/400" class="card-img-top thumbnail-img" alt="Latest Post 1">
                                <div class="card-body">
                                    <h5 class="card-title">Tiêu đề bài đăng mới 1</h5>
                                    <p class="card-text">Thông tin tóm tắt về bài đăng mới 1...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6">
                        <a href="#latest2-link" class="text-decoration-none text-dark">
                            <div class="card post-card">
                                <img src="/api/placeholder/600/400" class="card-img-top thumbnail-img" alt="Latest Post 2">
                                <div class="card-body">
                                    <h5 class="card-title">Tiêu đề bài đăng mới 2</h5>
                                    <p class="card-text">Thông tin tóm tắt về bài đăng mới 2...</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </section>

            <!-- Liên hệ/Liên kết -->
            <section class="mb-5">
                <h2 class="section-title">Liên hệ & Liên kết</h2>
                <div class="row">
                    <div class="col-md-6">
                        <h4>Thông tin liên hệ</h4>
                        <ul class="list-unstyled">
                            <li class="mb-2"><i class="bi bi-geo-alt"></i> Địa chỉ: 123 Đường ABC, Quận XYZ</li>
                            <li class="mb-2"><i class="bi bi-telephone"></i> Điện thoại: (084) 123-456-789</li>
                            <li class="mb-2"><i class="bi bi-envelope"></i> Email: contact@example.com</li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h4>Liên kết hữu ích</h4>
                        <ul class="list-unstyled">
                            <li class="mb-2"><a href="#about" class="text-decoration-none">Về chúng tôi</a></li>
                            <li class="mb-2"><a href="#terms" class="text-decoration-none">Điều khoản sử dụng</a></li>
                            <li class="mb-2"><a href="#privacy" class="text-decoration-none">Chính sách bảo mật</a></li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="footer.jsp" />
    </body>
</html>
