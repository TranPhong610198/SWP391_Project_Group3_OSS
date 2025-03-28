<%-- 
    Document   : chatBox
    Created on : Mar 25, 2025, 3:27:55 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Giữ nguyên phần head từ phiên bản trước -->
    <meta charset="UTF-8">
    <title>Chat với khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        /* Giữ nguyên CSS từ phiên bản trước */
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
        }
        .main-container {
            display: flex;
            height: 100%;
        }
        .main-content {
            flex-grow: 1;
            overflow: hidden;
            margin-left: 250px;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }
        .chat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .chat-box {
            flex-grow: 1;
            overflow-y: auto;
            border-radius: 8px;
            background-color: #ffffff;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
        }
        .message {
            max-width: 80%;
            margin-bottom: 10px;
            clear: both;
            display: flex;
            flex-direction: column;
        }
        .message-sent {
            align-self: flex-end;
            text-align: right;
        }
        .message-received {
            align-self: flex-start;
            text-align: left;
        }
        .message-sent .message-content {
            background-color: #007bff;
            color: white;
            border-radius: 15px;
            padding: 10px;
            align-self: flex-end;
        }
        .message-received .message-content {
            background-color: #e9ecef;
            color: #212529;
            border-radius: 15px;
            padding: 10px;
            align-self: flex-start;
        }
        .message-meta {
            font-size: 0.7em;
            color: #6c757d;
            margin-top: 5px;
        }
        .chat-input {
            background-color: #ffffff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 -2px 5px rgba(0,0,0,0.05);
        }
        .chat-input .input-group {
            border-radius: 20px;
            overflow: hidden;
        }
        .back-btn {
            margin-right: 10px;
            background-color: #6c757d;
            color: white;
        }
        .chat-box img {
            max-width: 200px;
            max-height: 300px;
            border-radius: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <!-- Giữ nguyên phần body từ phiên bản trước -->
    <div class="main-container">
        <%@ include file="../sidebar.jsp" %>
        <div class="main-content">
            <div class="chat-header">
                <h2><i class="fas fa-user me-2"></i>Chat với khách hàng</h2>
                <a href="/fashionshop/marketing/chatlist" class="btn back-btn">
                    <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách chat
                </a>
            </div>
            <div class="chat-box" id="chatBox">
                <c:forEach items="${messages}" var="msg">
                    <div class="message ${msg.senderId == marketingId ? 'message-sent' : 'message-received'}">
                        <div class="message-content">
                            ${msg.content}
                            <c:if test="${not empty msg.imageUrl}">
                                <br>
                                <img src="${msg.imageUrl}" alt="Attached image">
                            </c:if>
                        </div>
                        <div class="message-meta">
                            <fmt:formatDate value="${msg.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="chat-input">
                <div class="input-group">
                    <input type="file" id="imageInput" accept="image/*" style="display:none;" onchange="uploadImage()">
                    <button type="button" class="btn btn-secondary" onclick="document.getElementById('imageInput').click()">
                        <i class="fas fa-image"></i>
                    </button>
                    <input type="text" id="messageInput" class="form-control" placeholder="Nhập tin nhắn...">
                    <button class="btn btn-primary" onclick="sendMessage()">Gửi</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var marketingId = "${marketingId}";
        var userId = "${userId}";
        var wsUrl = (window.location.protocol === 'https:' ? 'wss://' : 'ws://') + "localhost:9999/fashionshop/chat/" + marketingId + "/" + userId;
        var ws = null;

        function initWebSocket() {
            ws = new WebSocket(wsUrl);

            ws.onopen = function() {
                console.log("WebSocket connected to " + wsUrl);
                scrollToBottom();
            };

            ws.onmessage = function(event) {
                console.log("Received: " + event.data);
                var data = JSON.parse(event.data);
                var chatBox = document.getElementById("chatBox");
                
                // Tạo phần tử tin nhắn mới với đúng class và cấu trúc
                var messageDiv = document.createElement('div');
                messageDiv.className = 'message ' + (data.senderId === marketingId ? 'message-sent' : 'message-received');
                
                // Tạo nội dung tin nhắn
                var contentDiv = document.createElement('div');
                contentDiv.className = 'message-content';
                contentDiv.textContent = data.content;
                
                // Thêm hình ảnh nếu có
                if (data.imageUrl) {
                    var lineBreak = document.createElement('br');
                    contentDiv.appendChild(lineBreak);
                    
                    var imageElem = document.createElement('img');
                    imageElem.src = data.imageUrl;
                    imageElem.alt = 'Attached image';
                    contentDiv.appendChild(imageElem);
                }
                
                // Tạo phần meta (thời gian)
                var metaDiv = document.createElement('div');
                metaDiv.className = 'message-meta';
                metaDiv.textContent = new Date().toLocaleString('vi-VN', {
                    day: '2-digit',
                    month: '2-digit',
                    year: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit'
                });
                
                // Ghép các phần tử lại
                messageDiv.appendChild(contentDiv);
                messageDiv.appendChild(metaDiv);
                
                // Thêm vào chat box
                chatBox.appendChild(messageDiv);
                scrollToBottom();
            };

            ws.onerror = function(event) {
                console.log("WebSocket error: ", event);
            };

            ws.onclose = function() {
                console.log("WebSocket closed, retrying in 2 seconds...");
                setTimeout(initWebSocket, 2000);
            };
        }

        initWebSocket();

        function sendMessage() {
            var input = document.getElementById("messageInput");
            var message = input.value.trim();
            if (message && ws.readyState === WebSocket.OPEN) {
                var jsonMessage = JSON.stringify({
                    senderId: parseInt(marketingId),
                    content: message
                });
                console.log("Sending: " + jsonMessage);
                ws.send(jsonMessage);
                input.value = "";
            } else {
                console.log("WebSocket not open or message empty");
            }
        }

        function uploadImage() {
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
                    var jsonMessage = JSON.stringify({
                        senderId: parseInt(marketingId),
                        content: "",
                        imageUrl: data.imageUrl
                    });
                    if (ws.readyState === WebSocket.OPEN) {
                        ws.send(jsonMessage);
                        console.log("Sent image message: " + jsonMessage);
                    }
                    fileInput.value = "";
                })
                .catch(error => console.error("Error uploading image: ", error));
            }
        }

        function scrollToBottom() {
            var chatBox = document.getElementById("chatBox");
            chatBox.scrollTop = chatBox.scrollHeight;
        }

        document.getElementById("messageInput").addEventListener("keypress", function (event) {
            if (event.key === "Enter") {
                sendMessage();
            }
        });

        document.addEventListener('DOMContentLoaded', scrollToBottom);
    </script>
</body>
</html>