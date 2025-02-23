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
        <!-- Custom CSS -->
        <link href="assests/css/Home.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <!-- Include header -->
        <jsp:include page="header.jsp" />
        <!-- Thanh trượt (Carousel) -->
        <div id="mainCarousel" class="carousel slide mb-5" data-bs-ride="carousel" data-bs-interval="2000">
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

        <div class="container">
            <!-- Bài đăng hot -->
            <!-- Bài đăng nổi bật -->
            <section class="mb-5">
                <h2 class="section-title">Bài đăng nổi bật</h2>
                <div class="row g-4">
                    <c:forEach items="${featuredPosts}" var="post">
                        <div class="col-md-4">
                            <a href="post-detail?id=${post.id}" class="text-decoration-none text-dark">
                                <div class="card post-card">
                                    <img src="${post.thumbnail}" class="card-img-top thumbnail-img" alt="${post.title}">
                                    <div class="card-body">
                                        <h5 class="card-title">${post.title}</h5>
                                        <p class="card-text">
                                            <c:choose>
                                                <c:when test="${fn:length(post.summary) > 150}">
                                                    ${fn:substring(post.summary, 0, 150)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${post.summary}
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </section>

            <!-- Sản phẩm nổi bật -->
            <section class="mb-5">
                <h2 class="section-title">Sản phẩm nổi bật</h2>
                <div class="row g-4">
                    <c:forEach items="${featuredProducts}" var="product">
                        <div class="col-md-3">
                            <a href="product-detail?id=${product.id}" class="text-decoration-none text-dark">
                                <div class="card product-card">
                                    <img src="${product.thumbnail}" class="card-img-top thumbnail-img" alt="${product.title}">
                                    <div class="card-body">
                                        <h5 class="card-title">${product.title}</h5>
                                        <p class="card-text">
                                            <c:choose>
                                                <c:when test="${fn:length(product.description) > 100}">
                                                    ${fn:substring(product.description, 0, 100)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${product.description}
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                        <p class="fw-bold text-primary">
                                        <fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="đ"/>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </section>

            <!-- Bài đăng mới nhất -->
            <section class="mb-5">
                <h2 class="section-title">Bài đăng mới nhất</h2>
                <div class="row g-4">
                    <c:forEach items="${latestPosts}" var="post">
                        <div class="col-md-6">
                            <a href="post-detail?id=${post.id}" class="text-decoration-none text-dark">
                                <div class="card post-card">
                                    <img src="${post.thumbnail}" class="card-img-top thumbnail-img" alt="${post.title}">
                                    <div class="card-body">
                                        <h5 class="card-title">${post.title}</h5>
                                        <p class="card-text">
                                            <c:choose>
                                                <c:when test="${fn:length(post.summary) > 200}">
                                                    ${fn:substring(post.summary, 0, 200)}...
                                                </c:when>
                                                <c:otherwise>
                                                    ${post.summary}
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </section>



        </div>



        <!-- Chat Button -->
        <div class="ai-chat-button" onclick="toggleChatWidget()">
            <img src="https://cdn-icons-png.flaticon.com/512/5962/5962463.png" alt="Chat AI" width="35" height="35">
        </div>

        <!-- Chat Widget -->
        <div class="ai-chat-widget" id="aiChatWidget">
            <div class="ai-chat-header">
                <div>Góc hỏi đáp</div>
                <div class="ai-chat-close" onclick="toggleChatWidget()">✕</div>
            </div>
            <div class="ai-chat-messages" id="aiChatMessages">
                <div class="ai-message bot">Chào bạn! Tôi là trợ lý của Fashion Shop. Tôi có thể giúp gì cho bạn?</div>
            </div>
            <div class="ai-chat-input">
                <input type="text" id="userInput" placeholder="Nhập câu hỏi của bạn..." onkeypress="if (event.key === 'Enter')
                            sendMessage()">
                <button onclick="sendMessage()">Gửi</button>
            </div>
        </div>
        <script>
            // Hiển thị/ẩn chat widget
            function toggleChatWidget() {
                const widget = document.getElementById('aiChatWidget');
                if (widget.style.display === 'flex') {
                    widget.style.display = 'none';
                } else {
                    widget.style.display = 'flex';
                }
            }

            // Gửi tin nhắn đến API và hiển thị phản hồi
            async function sendMessage() {
                const input = document.getElementById('userInput');
                const message = input.value.trim();

                if (!message)
                    return;

                // Hiển thị tin nhắn của người dùng
                addMessage('user', message);
                input.value = '';

                // Hiển thị đang nhập
                const tempId = addMessage('bot', 'Đang nhập...');

                try {
                    // Gọi API Gemini
                    const response = await callGeminiAPI(message);

                    // Cập nhật tin nhắn bot
                    updateMessage(tempId, response);
                } catch (error) {
                    updateMessage(tempId, "Xin lỗi, câu hỏi của bạn khó quá. Tôi không thể xử lý được. Hãy hỏi Trần Phong :>");
                    console.error("Error calling Gemini API:", error);
                }
            }

            // Thêm tin nhắn vào khung chat
            function addMessage(type, content) {
                const messagesContainer = document.getElementById('aiChatMessages');
                const messageElement = document.createElement('div');
                messageElement.classList.add('ai-message', type);
                messageElement.textContent = content;

                const id = 'msg-' + Date.now();
                messageElement.id = id;

                messagesContainer.appendChild(messageElement);
                messagesContainer.scrollTop = messagesContainer.scrollHeight;

                return id;
            }

            // Cập nhật nội dung tin nhắn
            function updateMessage(id, content) {
                const messageElement = document.getElementById(id);
                if (messageElement) {
                    messageElement.textContent = content;
                }
            }

            // Gọi Gemini API (cần thay API_KEY thực tế của bạn)
            async function callGeminiAPI(prompt) {
                const API_KEY = 'AIzaSyA12flOEGLDWppjXlvurjzZVwC2ug9rA-o'; // Thay bằng API key thực của bạn
                const API_URL = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

                const requestBody = {
                    contents: [{
                            parts: [{
                                    text: `Bạn là trợ lý AI của Fashion Shop, một cửa hàng thời trang. Hãy trả lời câu hỏi sau một cách ngắn gọn, hữu ích: ${prompt}`
                                }]
                        }],
                    generationConfig: {
                        temperature: 0.7,
                        maxOutputTokens: 800
                    }
                };

                const response = await fetch(`${API_URL}?key=${API_KEY}`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(requestBody)
                        });

                        const data = await response.json();

                        if (data.candidates && data.candidates[0].content.parts[0].text) {
                            return data.candidates[0].content.parts[0].text;
                        } else {
                            throw new Error('Không nhận được phản hồi hợp lệ');
                        }
                    }
        </script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="footer.jsp" />
    </body>
</html>
