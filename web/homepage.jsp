<%-- 
    Document   : homepage
    Created on : Feb 18, 2025, 12:13:18 AM
    Author     : VuxD4t
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fashion Shop</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Thêm vào phần head, sau Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/9.3.2/swiper-bundle.min.css">
        <!-- Custom CSS -->
        <style>
    /* Global Typography and Color Palette (đồng bộ với productList.jsp và productDetail.jsp) */
    :root {
        --primary-color: #2c3e50;
        --secondary-color: #34495e;
        --accent-color: #3498db;
        --text-color: #333;
        --light-background: #f4f6f7;
        --card-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }

    body {
        font-family: 'Noto Sans', 'Roboto', 'Open Sans', sans-serif; /* Font hỗ trợ tiếng Việt */
        background-color: var(--light-background);
        color: var(--text-color);
        line-height: 1.6;
    }

    .container {
        max-width: 1400px;
        padding: 2rem;
    }

    /* Carousel */
    #mainCarousel {
        margin-bottom: 50px;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: var(--card-shadow);
    }

    .carousel-item img {
        width: 100%;
        height: 616px;
        object-fit: cover;
        border-radius: 15px;
    }

    .carousel-caption {
        background: rgba(0, 0, 0, 0.6);
        padding: 20px;
        border-radius: 8px;
        bottom: 20%;
    }

    .carousel-control-prev, .carousel-control-next {
        width: 40px;
        height: 40px;
        top: 50%;
        transform: translateY(-50%);
        background: rgba(255, 255, 255, 0.9);
        border-radius: 50%;
        color: var(--primary-color);
    }

    /* Section Title */
    .section-title {
        font-size: 2rem;
        font-weight: 700;
        color: var(--primary-color);
        margin-bottom: 2rem;
        padding-bottom: 10px;
        position: relative;
    }

    .section-title::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 80px;
        height: 4px;
        background-color: var(--accent-color);
        border-radius: 2px;
    }

    /* Product Card (đồng bộ với productList.jsp) */
    .product-card {
        border: none;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: var(--card-shadow);
        transition: all 0.4s ease;
        display: flex;
        flex-direction: column;
        background: white;
    }

    .product-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    }

    .thumbnail-img {
        height: 350px; /* Đồng bộ với productList.jsp */
        object-fit: cover;
        width: 100%;
        transition: transform 0.4s ease;
    }

    .product-card:hover .thumbnail-img {
        transform: scale(1.1);
    }

    .card-body {
        padding: 20px;
        flex-grow: 1;
    }

    .product-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--primary-color);
        margin-bottom: 10px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }

    .product-price {
        color: var(--accent-color);
        font-size: 1.3rem;
        font-weight: 700;
        margin-bottom: 15px;
    }

    .product-badge {
        position: absolute;
        top: 1rem;
        right: 1rem;
        background: red;
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 500;
    }

    .product-buttons .btn-primary {
        background: var(--accent-color);
        border: none;
        padding: 12px 20px;
        transition: all 0.3s ease;
        font-weight: 600;
    }

    .product-buttons .btn-primary:hover {
        background: #2980b9;
        transform: translateY(-3px);
    }

    /* Swiper */
    .productSwiper {
        padding: 2rem 1rem;
        position: relative;
    }

    .swiper-button-next,
    .swiper-button-prev {
        color: var(--accent-color);
        background: white;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        box-shadow: var(--card-shadow);
    }

    .swiper-button-next:after,
    .swiper-button-prev:after {
        font-size: 1.2rem;
    }

    .swiper-pagination-bullet {
        width: 10px;
        height: 10px;
    }

    .swiper-pagination-bullet-active {
        background: var(--accent-color);
    }

    /* Post Card */
    .post-card {
        border: none;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: var(--card-shadow);
        transition: all 0.4s ease;
        display: flex;
        flex-direction: column;
    }

    .post-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    }

    .post-card .thumbnail-img {
        height: 400px; /* Tăng chiều cao cho bài đăng */
        object-fit: cover;
    }

    .post-card .card-body {
        padding: 20px;
    }

    .card-title {
        font-size: 1.2rem;
        font-weight: 600;
        color: var(--primary-color);
    }

    .post-summary {
        color: #666;
        font-size: 0.9rem;
    }

    .post-meta {
        font-size: 0.85rem;
        color: #777;
    }

    /* Back to Top */
    .back-to-top {
        position: fixed;
        bottom: 20px;
        right: 90px;
        background-color: var(--accent-color);
        color: white;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
        border: none;
        box-shadow: var(--card-shadow);
        z-index: 999;
    }

    .back-to-top.show {
        opacity: 1;
        visibility: visible;
    }

    .back-to-top:hover {
        background-color: #2980b9;
        transform: scale(1.1);
    }

    .back-to-top .arrow {
        border: solid white;
        border-width: 0 3px 3px 0;
        display: inline-block;
        padding: 6px;
        transform: rotate(-135deg);
    }

    /* AI Chat Widget */
    .ai-chat-button {
        position: fixed;
        bottom: 20px;
        right: 20px;
        z-index: 1000;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background-color: var(--accent-color);
        border: none;
        box-shadow: var(--card-shadow);
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .ai-chat-button:hover {
        transform: scale(1.1);
    }

    .ai-chat-widget {
        position: fixed;
        bottom: 80px;
        right: 20px;
        width: 350px;
        height: 450px;
        background: white;
        border-radius: 15px;
        box-shadow: var(--card-shadow);
        display: none;
        flex-direction: column;
        overflow: hidden;
        z-index: 999;
    }

    .ai-chat-header {
        background: var(--primary-color);
        color: white;
        padding: 15px;
        font-weight: 600;
        display: flex;
        justify-content: space-between;
    }

    .ai-chat-close {
        cursor: pointer;
    }

    .ai-chat-messages {
        flex-grow: 1;
        overflow-y: auto;
        padding: 15px;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .ai-message {
        padding: 10px;
        border-radius: 10px;
        max-width: 80%;
        word-break: break-word;
    }

    .ai-message.user {
        background: #e9ecef;
        align-self: flex-end;
    }

    .ai-message.bot {
        background: #f8f9fa;
        align-self: flex-start;
    }

    .ai-message img {
        max-width: 100%;
        max-height: 150px;
        width: auto;
        height: auto;
        border-radius: 5px;
        display: block;
        margin-top: 5px;
    }

    .ai-chat-input {
        display: flex;
        height: 62px;
        padding: 10px;
        border-top: 1px solid #eee;
    }

    .ai-chat-input input {
        flex-grow: 1;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 20px;
        margin-right: 10px;
    }

    .ai-chat-input button {
        background: var(--accent-color);
        color: white;
        border: none;
        border-radius: 20px;
        padding: 10px 15px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .ai-chat-input button:hover {
        background: #2980b9;
    }

    /* Responsive Adjustments */
    @media (max-width: 1521px) {
        .carousel-item img {
            height: 616px;
        }
    }

    @media (max-width: 768px) {
        .carousel-item img {
            height: 400px;
        }
        .product-card .thumbnail-img {
            height: 300px;
        }
        .post-card .thumbnail-img {
            height: 250px;
        }
        .section-title {
            font-size: 1.5rem;
        }
    }

    @media (max-width: 576px) {
        .carousel-item img {
            height: 300px;
        }
        .product-card .thumbnail-img {
            height: 250px;
        }
        .ai-chat-widget {
            width: 100%;
            height: 100%;
            bottom: 0;
            right: 0;
            border-radius: 0;
        }
    }
        </style>
    </head>
    <body>
        <!-- Include header -->
        <jsp:include page="header.jsp" />
        <!-- Thanh trượt (Carousel) -->
        <div id="mainCarousel" class="carousel slide mb-5" data-bs-ride="carousel" data-bs-interval="3000">
            <div class="carousel-indicators">
                <c:forEach items="${sliders}" var="slider" varStatus="loop">
                    <button type="button" data-bs-target="#mainCarousel" 
                            data-bs-slide-to="${loop.index}" 
                            class="${loop.index == 0 ? 'active' : ''}">
                    </button>
                </c:forEach>
            </div>
            <div class="carousel-inner">
                <c:forEach items="${sliders}" var="slider" varStatus="loop">
                    <div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
                        <a href="${slider.link}">
                            <img src="${slider.image_url}" 
                                 class="d-block w-100" 
                                 alt="${slider.title}">
                        </a>
                        <div class="carousel-caption d-none d-md-block">
                            <h5>${slider.title}</h5>
                            <p>${slider.notes}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Khởi tạo carousel với tùy chọn tương tự như Swiper
                const carousel = document.getElementById('mainCarousel');
                const carouselInstance = new bootstrap.Carousel(carousel, {
                    interval: 3000, // Thời gian chuyển slide - 3 giây
                    pause: 'hover', // Tạm dừng khi di chuột qua
                    wrap: true, // Quay vòng khi đến slide cuối cùng
                    keyboard: true, // Cho phép điều khiển bằng bàn phím
                    touch: true        // Cho phép điều khiển bằng cảm ứng
                });

                // Lấy chỉ số slide đã lưu (nếu có)
                const savedSlideIndex = localStorage.getItem('mainCarouselIndex');
                if (savedSlideIndex !== null) {
                    carouselInstance.to(parseInt(savedSlideIndex));
                }

                // Lưu chỉ số slide khi người dùng chuyển slide
                carousel.addEventListener('slide.bs.carousel', function (event) {
                    localStorage.setItem('mainCarouselIndex', event.to);
                });
            });
        </script>

        <div class="container">           

            <!-- Sản phẩm mới nhất -->
            <section class="featured-products mb-5">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="section-title mb-0">Sản phẩm mới nhất</h2>
                        <a href="listproduct?sortBy=newest" class="btn btn-outline-primary">
                            Xem tất cả
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                            </svg>
                        </a>
                    </div>
                    <div class="swiper productSwiper">
                        <div class="swiper-wrapper">
                            <c:forEach items="${featuredProducts}" var="product">
                                <div class="swiper-slide">
                                    <a href="productdetail?id=${product.id}" class="text-decoration-none product-link">
                                        <div class="card product-card">
                                            <div class="position-relative">
                                                <img src="${product.thumbnail}" class="thumbnail-img" alt="${product.title}">
                                                <span class="product-badge">Mới</span>
                                            </div>
                                            <div class="card-body">
                                                <h5 class="product-title">${product.title}</h5>
                                                <div class="product-price mb-3">
                                                    <span><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                                </div>
                                                <div class="product-buttons d-flex gap-2">
                                                    <button onclick="buyNow(${product.id}, event)" class="btn btn-primary btn-sm flex-grow-1"><i class="fas fa-bolt"></i> Mua Ngay</button>

                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </section>

            <!-- Sản phẩm theo thể loại -->
            <c:forEach items="${level1Categories}" var="category">
                <section class="mb-5">
                    <div class="container">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h2 class="section-title mb-0">${category.name}</h2>
                            <a href="listproduct?category=${category.id}" class="btn btn-outline-primary">
                                Xem tất cả
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                                </svg>
                            </a>
                        </div>
                        <div class="row g-4">
                            <c:forEach items="${productsByCategory[category.id]}" var="product">
                                <div class="col-md-3 col-6">
                                    <a href="productdetail?id=${product.id}" class="text-decoration-none product-link">
                                        <div class="card product-card h-100">
                                            <img src="${product.thumbnail}" class="thumbnail-img" alt="${product.title}">
                                            <div class="card-body">
                                                <h5 class="product-title">${product.title}</h5>
                                                <div class="product-price mb-3">
                                                    <span><fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ" maxFractionDigits="0"/></span>
                                                </div>
                                                <div class="product-buttons d-flex gap-2">
                                                    <button onclick="buyNow(${product.id}, event)" class="btn btn-primary btn-sm flex-grow-1">
                                                        <i class="fas fa-bolt"></i> Mua Ngay
                                                    </button>

                                                </div>
                                            </div>
                                        </div>             
                                    </a>

                                </div>                       
                            </c:forEach>
                        </div>
                    </div>
                </section>
            </c:forEach>

            <!-- Bài đăng mới nhất -->
            <section class="mb-5">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="section-title mb-0">Bài đăng mới nhất</h2>
                    <a href="posts" class="btn btn-outline-primary">
                        Xem tất cả
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-2" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                        </svg>
                    </a>
                </div>
                <div class="row g-4">
                    <c:forEach var="post" items="${latestPosts}">
                        <div class="col-md-6">
                            <div class="card post-card h-100">
                                <a href="${pageContext.request.contextPath}/post?id=${post.getId()}" 
                                   class="text-decoration-none text-dark">
                                    <img src="${post.getThumbnail()}" 
                                         class="card-img-top post-image" alt="${post.getTitle()}">
                                    <div class="card-body">
                                        <h5 class="card-title text-dark">
                                            ${post.getTitle()}
                                            <c:if test="${post.isIsFeatured()}">
                                                <span class="badge bg-warning ms-2"><i class="fas fa-star me-1"></i>Nổi bật</span>
                                            </c:if>
                                        </h5>
                                        <p class="post-summary text-dark">${post.getSummary()}</p>
                                        <div class="post-meta mt-3 text-secondary">
                                            <i class="fas fa-user-edit me-2"></i>${post.getUser().getFullName()}
                                            <br>
                                            <i class="far fa-clock me-2"></i>
                                            <c:choose>
                                                <c:when test="${post.getUpdatedAt() != null}">
                                                    Cập nhật: ${post.getUpdatedAt()}
                                                </c:when>
                                                <c:otherwise>
                                                    Ngày đăng: ${post.getCreatedAt()}
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </div>

        <c:if test="${sessionScope.acc.role == 'customer' || sessionScope.acc.role == null}">
    <!-- Chat Button -->
    <div class="ai-chat-button" onclick="toggleChatWidget()">
        <img src="https://cdn-icons-png.flaticon.com/512/5962/5962463.png" alt="Chat AI" width="35" height="35">
    </div>

    <!-- Chat Widget -->
    <div class="ai-chat-widget" id="aiChatWidget">
        <div class="ai-chat-header" onclick="toggleChatWidget()">
            <span><i class="fas fa-comment"></i> Hỗ trợ trực tuyến</span>
            <i class="fas fa-times" id="aiChatClose"></i>
        </div>
        <div class="ai-chat-messages d-flex flex-column" id="aiChatMessages">
            <c:choose>
                <c:when test="${not empty chatError}">
                    <div class="ai-message bot">${chatError} <c:if test="${empty userID}"><a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-primary btn-sm">Đăng nhập</a></c:if></div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${chatMessages}" var="msg">
                        <div class="ai-message ${msg.senderId == userID ? 'user' : 'bot'}">
                            <small><fmt:formatDate value="${msg.createdAt}" pattern="dd/MM/yyyy HH:mm"/></small>
                            <p>${msg.content}</p>
                            <c:if test="${not empty msg.imageUrl}">
                                <img src="${msg.imageUrl}" alt="Attached image">
                            </c:if>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="ai-chat-input" <c:if test="${empty userID}">style="display:none;"</c:if>>
            <input type="file" id="imageInput" accept="image/*" style="display:none;" onchange="handleImageSelection()">
            <button type="button" class="btn btn-secondary me-2" onclick="document.getElementById('imageInput').click()">
                <i class="fas fa-image"></i>
            </button>
            <button type="button" class="btn btn-secondary me-2" onclick="toggleEmojiPicker()">
                <i class="fas fa-smile"></i>
            </button>
            <input type="text" id="messageInput" class="form-control me-2" placeholder="Nhập tin nhắn" maxlength="500">
            <button type="button" class="btn btn-primary" onclick="sendMessage()">
                <i class="fas fa-paper-plane"></i>
            </button>
        </div>
        <div id="imagePreview" class="mt-2" style="display: none; padding: 0 10px;">
            <img id="previewImage" src="" alt="Ảnh đã chọn" style="max-width: 100px; max-height: 100px; border-radius: 5px;">
            <button type="button" class="btn btn-danger btn-sm ms-2" onclick="clearImage()">Xóa</button>
        </div>
        <div id="emojiPicker" class="mt-2" style="display: none; max-height: 200px; overflow-y: auto; border: 1px solid #ccc; padding: 10px; background: #fff; position: absolute; z-index: 1000;">
            <!-- Danh sách emoji sẽ được thêm bằng JavaScript -->
        </div>
    </div>
</c:if>

        <!-- Back to Top -->
        <button id="backToTopButton" class="back-to-top">
            <div class="arrow"></div>
        </button>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var userId = "${userID}";
    var marketingId = "${marketingId}";
    var ws = null;
    var selectedImageUrl = null;

    document.addEventListener('DOMContentLoaded', function () {
        var chatMessages = document.getElementById("aiChatMessages");
        if (chatMessages) {
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }
        if (userId && marketingId !== "-1") {
            initWebSocket();
        }
    });

    function toggleChatWidget() {
        var widget = document.getElementById("aiChatWidget");
        if (widget.style.display === "none" || widget.style.display === "") {
            widget.style.display = "flex";
            var chatMessages = document.getElementById("aiChatMessages");
            chatMessages.scrollTop = chatMessages.scrollHeight;
        } else {
            widget.style.display = "none";
        }
    }

    function initWebSocket() {
        if (!userId || marketingId === "-1") return;
        var wsUrl = (window.location.protocol === 'https:' ? 'wss://' : 'ws://') + "localhost:9999/fashionshop/chat/" + userId + "/" + marketingId;
        console.log("Attempting to connect to: " + wsUrl);
        ws = new WebSocket(wsUrl);

        ws.onopen = function() {
            console.log("WebSocket connected to " + wsUrl);
        };

        ws.onmessage = function(event) {
            console.log("Received: " + event.data);
            var data = JSON.parse(event.data);
            var chatMessages = document.getElementById("aiChatMessages");
            var messageClass = (data.senderId == userId) ? "user" : "bot";
            var messageHtml = '<div class="ai-message ' + messageClass + '"><small>' + data.createdAt + '</small><p>' + data.content + '</p>';
            if (data.imageUrl) {
                messageHtml += '<img src="' + data.imageUrl + '" alt="Attached image">';
            }
            messageHtml += '</div>';
            chatMessages.innerHTML += messageHtml;
            chatMessages.scrollTop = chatMessages.scrollHeight;
        };

        ws.onerror = function(event) {
            console.log("WebSocket error: ", event);
        };

        ws.onclose = function() {
            console.log("WebSocket closed, retrying in 2 seconds...");
            setTimeout(initWebSocket, 2000);
        };
    }

    function handleImageSelection() {
        var fileInput = document.getElementById("imageInput");
        var file = fileInput.files[0];
        if (file) {
            var formData = new FormData();
            formData.append("file", file);
            formData.append("marketingId", marketingId);

            fetch('/fashionshop/uploadImage', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log("Image uploaded: " + data.imageUrl);
                selectedImageUrl = data.imageUrl;
                document.getElementById("imagePreview").style.display = "block";
                document.getElementById("previewImage").src = selectedImageUrl;
            })
            .catch(error => console.error("Error uploading image: ", error));
        }
    }

    function clearImage() {
        selectedImageUrl = null;
        document.getElementById("imageInput").value = "";
        document.getElementById("imagePreview").style.display = "none";
        document.getElementById("previewImage").src = "";
    }

    function toggleEmojiPicker() {
        var emojiPicker = document.getElementById("emojiPicker");
        if (emojiPicker.style.display === "none" || emojiPicker.style.display === "") {
            loadEmojis();
            emojiPicker.style.display = "block";
        } else {
            emojiPicker.style.display = "none";
        }
    }

    function loadEmojis() {
        fetch('/fashionshop/proxy/emoji')
            .then(response => {
                console.log("API Response Status:", response.status);
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                console.log("API Data:", data);
                if (!Array.isArray(data)) {
                    throw new Error("Unexpected data format: Data is not an array");
                }
                var emojiPicker = document.getElementById("emojiPicker");
                emojiPicker.innerHTML = "";
                data.slice(0, 50).forEach(emoji => {
                    var span = document.createElement("span");
                    span.textContent = emoji.character;
                    span.style.cursor = "pointer";
                    span.style.fontSize = "24px";
                    span.style.margin = "5px";
                    span.onclick = function() {
                        var input = document.getElementById("messageInput");
                        input.value += emoji.character;
                    };
                    emojiPicker.appendChild(span);
                });
            })
            .catch(error => {
                console.error("Error loading emojis: ", error);
                var emojiPicker = document.getElementById("emojiPicker");
                emojiPicker.innerHTML = "<span>Lỗi tải emoji: " + error.message + "</span>";
            });
    }

    function sendMessage() {
        var input = document.getElementById("messageInput");
        var message = input.value.trim();
        var hasContent = message.length > 0;
        var hasImage = selectedImageUrl !== null;

        if ((hasContent || hasImage) && ws && ws.readyState === WebSocket.OPEN) {
            var jsonMessage = JSON.stringify({
                senderId: parseInt(userId),
                content: hasContent ? message : "",
                imageUrl: hasImage ? selectedImageUrl : null
            });
            console.log("Sending: " + jsonMessage);
            ws.send(jsonMessage);
            input.value = "";
            clearImage();
            document.getElementById("emojiPicker").style.display = "none";
        } else {
            console.log("WebSocket not open or no content/image to send");
        }
    }

    // Đóng emoji picker khi nhấn ra ngoài
    document.addEventListener('click', function(event) {
        var emojiPicker = document.getElementById("emojiPicker");
        var emojiButton = document.querySelector('.ai-chat-input .btn-secondary i.fas.fa-smile').parentElement;
        if (!emojiPicker.contains(event.target) && !emojiButton.contains(event.target)) {
            emojiPicker.style.display = "none";
        }
    });

    document.getElementById("messageInput").addEventListener("keypress", function(event) {
        if (event.key === "Enter") {
            sendMessage();
        }
    });
</script>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="footer.jsp" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/9.3.2/swiper-bundle.min.js"></script>
        <script>
                    var swiper = new Swiper(".productSwiper", {
                        slidesPerView: 1,
                        spaceBetween: 20,
                        loop: true,
                        pagination: {
                            el: ".swiper-pagination",
                            clickable: true,
                        },
                        navigation: {
                            nextEl: ".swiper-button-next",
                            prevEl: ".swiper-button-prev",
                        },
                        autoplay: {
                            delay: 3000,
                            disableOnInteraction: false,
                        },
                        breakpoints: {
                            640: {
                                slidesPerView: 2,
                            },
                            768: {
                                slidesPerView: 3,
                            },
                            1024: {
                                slidesPerView: 4,
                            },
                        },
                    });
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const backToTopButton = document.getElementById('backToTopButton');

                // Hiển thị nút khi cuộn xuống 300px từ đầu trang
                window.addEventListener('scroll', function () {
                    if (window.pageYOffset > 300) {
                        backToTopButton.classList.add('show');
                    } else {
                        backToTopButton.classList.remove('show');
                    }
                });

                // Khi nhấp vào nút, cuộn lên đầu trang
                backToTopButton.addEventListener('click', function () {
                    window.scrollTo({
                        top: 0,
                        behavior: 'smooth'
                    });
                });
            });
        </script>
    </body>
</html>