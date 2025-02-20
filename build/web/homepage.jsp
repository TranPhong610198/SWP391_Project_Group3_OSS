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
        <title>Fashion Shop</title>
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
        <div id="mainCarousel" class="carousel slide mb-5" data-bs-ride="carousel" data-bs-interval="2000">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="#">
                        <img src="https://m.yodycdn.com/fit-in/filters:format(webp)/products/media/collections/hero%2018-2xua%20xuan%2050%201800x600n.jpg" class="d-block w-100" alt="Slide 1">

                    </a>

                </div>
                <div class="carousel-item">
                    <a href="#slide2-link">
                        <img src="https://static.nike.com/a/images/w_2880,h_1410,c_fill,f_auto/d3bd2064-8035-4c95-87e5-9b7e71d1d27f/image.jpg" class="d-block w-100" alt="Slide 2">

                    </a>
                </div>
                <div class="carousel-item">
                    <a href="#slide3-link">
                        <img src="https://file.hstatic.net/1000284478/file/25_1920x700_9c1af1a2283c4b0fa53a1d720c9ac1cf.jpg" class="d-block w-100" alt="Slide 3">

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



        </div>

        <style>
            .ai-chat-widget {
                position: fixed;
                bottom: 80px;
                right: 20px;
                width: 350px;
                height: 450px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.2);
                display: none;
                flex-direction: column;
                overflow: hidden;
                z-index: 999;
            }

            .ai-chat-header {
                background: #4285F4;
                color: white;
                padding: 15px;
                font-weight: bold;
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
                background: #E9EAEC;
                align-self: flex-end;
            }

            .ai-message.bot {
                background: #F1F3F4;
                align-self: flex-start;
            }

            .ai-chat-input {
                display: flex;
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
                background: #4285F4;
                color: white;
                border: none;
                border-radius: 20px;
                padding: 10px 15px;
                cursor: pointer;
            }

            .ai-chat-button {
                position: fixed;
                bottom: 20px;
                right: 20px;
                z-index: 1000;
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background-color: #4285F4;
                border: none;
                box-shadow: 0 2px 10px rgba(0,0,0,0.2);
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .ai-chat-button:hover {
                transform: scale(1.1);
            }
        </style>

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
