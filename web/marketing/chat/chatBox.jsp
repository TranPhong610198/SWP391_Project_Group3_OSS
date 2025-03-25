<%-- 
    Document   : chatBox
    Created on : Mar 25, 2025, 3:27:20 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trò chuyện với ${messages[0].senderId == sessionScope.userID ? messages[0].receiverUsername : messages[0].senderUsername}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }
        .main-container {
            display: flex;
            height: 100%;
        }
        .main-content {
            flex-grow: 1;
            overflow: hidden;
            margin-left: 250px; /* Match sidebar width */
            padding-top: 20px;
        }
        .chat-container { 
            height: calc(100vh - 100px); 
            display: flex; 
            flex-direction: column; 
        }
        .chat-messages { 
            flex-grow: 1; 
            overflow-y: auto; 
            padding: 15px; 
            background: #f8f9fa; 
        }
        .message { 
            padding: 10px; 
            border-radius: 10px; 
            max-width: 70%; 
            margin-bottom: 10px; 
            word-wrap: break-word;
        }
        .message.sent { 
            background: #007bff; 
            color: white; 
            align-self: flex-end; 
        }
        .message.received { 
            background: #e9ecef; 
            align-self: flex-start; 
        }
        .message img { 
            max-width: 100%;
            max-height: 200px;
            width: auto;
            height: auto;
            border-radius: 5px;
            display: block;
            margin-top: 5px;
        }
        .back-btn {
            margin-top: 10px;
            width: 100%;
        }
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Include Sidebar -->
        <%@ include file="../sidebar.jsp" %>
        
        <div class="main-content">
            <div class="container-fluid p-4">
                <h2 class="page-title"><i class="fas fa-comment-dots me-2"></i>Trò chuyện với ${messages[0].senderId == sessionScope.userID ? messages[0].receiverUsername : messages[0].senderUsername}</h2>

                <div class="card chat-container">
                    <div class="card-body chat-messages d-flex flex-column" id="chatMessages">
                        <c:forEach items="${messages}" var="msg">
                            <div class="message ${msg.senderId == sessionScope.userID ? 'sent' : 'received'}">
                                <small><fmt:formatDate value="${msg.createdAt}" pattern="dd/MM/yyyy HH:mm"/></small>
                                <p>${msg.content}</p>
                                <c:if test="${not empty msg.imageUrl}">
                                    <img src="${msg.imageUrl}" alt="Attached image">
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="card-footer">
                        <form id="chatForm" enctype="multipart/form-data" class="d-flex">
                            <input type="hidden" name="userId" value="${userId}">
                            <input type="text" id="messageInput" class="form-control me-2" placeholder="Nhập tin nhắn" onkeypress="if(event.key === 'Enter') sendMessage();">
                            <input type="file" id="imageInput" class="form-control me-2" accept="image/*">
                            <button type="button" class="btn btn-primary" onclick="sendMessage()"><i class="fas fa-paper-plane"></i> Gửi</button>
                        </form>
                        <button type="button" class="btn btn-secondary back-btn" onclick="goBack()">
                            <i class="fas fa-arrow-left me-2"></i>Quay lại
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let socket;

        $(document).ready(function() {
            $('.chat-messages').scrollTop($('.chat-messages')[0].scrollHeight);
            connectWebSocket();
        });

        function connectWebSocket() {
            const userId = '<%= session.getAttribute("userID") %>';
            if (!userId || userId === "null") return;

            socket = new WebSocket("ws://" + window.location.host + "${pageContext.request.contextPath}/chat/" + userId);

            socket.onopen = function() {
                console.log("WebSocket connected for user: " + userId);
            };

            socket.onmessage = function(event) {
                const message = JSON.parse(event.data);
                if (message.error) {
                    alert(message.error);
                    return;
                }
                displayMessage(message);
            };

            socket.onclose = function(event) {
                console.log("WebSocket disconnected. Code: " + event.code + ", Reason: " + event.reason);
            };

            socket.onerror = function(error) {
                console.error("WebSocket error:", error);
            };
        }

        function sendMessage() {
            const content = $("#messageInput").val().trim();
            const userId = '<%= session.getAttribute("userID") %>';
            const receiverId = '${userId}'; // ID của khách hàng
            const fileInput = $("#imageInput")[0];

            if (!content && !fileInput.files.length) {
                alert("Vui lòng nhập tin nhắn hoặc chọn hình ảnh!");
                return;
            }

            // Xử lý tải hình ảnh nếu có
            let imageUrl = null;
            if (fileInput.files.length > 0) {
                const formData = new FormData();
                formData.append("file", fileInput.files[0]);

                $.ajax({
                    url: "${pageContext.request.contextPath}/uploadImage",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    async: false,
                    success: function(response) {
                        imageUrl = response.imageUrl;
                    },
                    error: function() {
                        alert("Không thể tải lên hình ảnh!");
                    }
                });
            }

            const message = {
                content: content,
                receiverId: parseInt(receiverId),
                createdAt: new Date().toISOString(),
                imageUrl: imageUrl
            };

            if (socket && socket.readyState === WebSocket.OPEN) {
                socket.send(JSON.stringify(message));
                $("#messageInput").val("");
                $("#imageInput").val("");
            } else {
                console.error("WebSocket is not open");
                connectWebSocket();
                setTimeout(sendMessage, 1000);
            }
        }

        function displayMessage(message) {
            const isSent = message.senderId == '<%= session.getAttribute("userID") %>';
            const className = isSent ? 'sent' : 'received';
            const html = `
                <div class="message ${className}">
                    <p>${message.content}</p>
                    ${message.imageUrl ? '<img src="' + message.imageUrl + '" alt="Attached image">' : ''}
                </div>`;
            $("#chatMessages").append(html);
            $('.chat-messages').scrollTop($('.chat-messages')[0].scrollHeight);
        }
        
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>