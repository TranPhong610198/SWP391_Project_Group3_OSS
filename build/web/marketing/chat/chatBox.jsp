<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat với khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body, html { height: 100%; margin: 0; padding: 0; overflow: hidden; }
        .main-container { display: flex; height: 100%; }
        .main-content { flex-grow: 1; overflow: hidden; margin-left: 250px; padding: 20px; }
        .chat-box { height: 70vh; overflow-y: auto; border: 1px solid #dee2e6; padding: 10px; background-color: #f8f9fa; }
        .message-sent { text-align: right; margin: 5px 0; }
        .message-received { text-align: left; margin: 5px 0; }
        .message-sent p, .message-received p { display: inline-block; padding: 5px 10px; border-radius: 10px; margin: 0; }
        .message-sent p { background-color: #007bff; color: white; }
        .message-received p { background-color: #e9ecef; }
        .message-sent small, .message-received small { display: block; font-size: 0.8em; color: #6c757d; }
        .chat-box img {
            max-width: 100%;
            max-height: 200px;
            width: auto;
            height: auto;
            border-radius: 5px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <%@ include file="../sidebar.jsp" %>
        <div class="main-content">
            <h2><i class="fas fa-user me-2"></i>Chat với khách hàng</h2>
            <div class="chat-box" id="chatBox">
                <c:forEach items="${messages}" var="msg">
                    <div class="${msg.senderId == marketingId ? 'message-sent' : 'message-received'}">
                        <small><fmt:formatDate value="${msg.createdAt}" pattern="dd/MM/yyyy HH:mm"/></small>
                        <p>${msg.content}</p>
                        <c:if test="${not empty msg.imageUrl}">
                            <img src="${msg.imageUrl}" alt="Attached image">
                        </c:if>
                    </div>
                </c:forEach>
            </div>
            <div class="input-group mt-3">
                <input type="file" id="imageInput" accept="image/*" style="display:none;" onchange="uploadImage()">
                <button type="button" class="btn btn-secondary me-2" onclick="document.getElementById('imageInput').click()"><i class="fas fa-image"></i></button>
                <input type="text" id="messageInput" class="form-control" placeholder="Nhập tin nhắn...">
                <button class="btn btn-primary" onclick="sendMessage()">Gửi</button>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var marketingId = "${marketingId}";
        var userId = "${userId}";
        var wsUrl = (window.location.protocol === 'https:' ? 'wss://' : 'ws://') + "localhost:9999/fashionshop/chat/" + marketingId + "/" + userId;
        var ws = new WebSocket(wsUrl);

        ws.onopen = function() {
            console.log("WebSocket connected to " + wsUrl);
            scrollToBottom();
        };

        ws.onmessage = function(event) {
            console.log("Received: " + event.data);
            var data = JSON.parse(event.data);
            var chatBox = document.getElementById("chatBox");
            var messageClass = (data.senderId === marketingId) ? "message-sent" : "message-received";
            var messageHtml = '<div class="' + messageClass + '"><small>' + data.createdAt + '</small><p>' + data.content + '</p>';
            if (data.imageUrl) {
                console.log("Image URL received: " + data.imageUrl); // Debug imageUrl
                messageHtml += '<img src="' + data.imageUrl + '" alt="Attached image">';
            }
            messageHtml += '</div>';
            chatBox.innerHTML += messageHtml;
            scrollToBottom();
        };

        ws.onerror = function(event) {
            console.log("WebSocket error: ", event);
        };

        ws.onclose = function() {
            console.log("WebSocket closed");
        };

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
                        ws.send(jsonMessage); // Gửi tin nhắn qua WebSocket ngay lập tức
                        console.log("Sent image message: " + jsonMessage);
                    }
                    fileInput.value = ""; // Reset input file
                })
                .catch(error => console.error("Error uploading image: ", error));
            }
        }

        function scrollToBottom() {
            var chatBox = document.getElementById("chatBox");
            chatBox.scrollTop = chatBox.scrollHeight;
        }

        document.getElementById("messageInput").addEventListener("keypress", function(event) {
            if (event.key === "Enter") {
                sendMessage();
            }
        });

        document.addEventListener('DOMContentLoaded', scrollToBottom);
    </script>
</body>
</html>