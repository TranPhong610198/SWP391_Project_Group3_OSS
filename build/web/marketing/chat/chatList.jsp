<%-- 
    Document   : chatList
    Created on : Mar 25, 2025, 3:26:58 AM
    Author     : nguye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách trò chuyện</title>
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
        .chat-user {
            padding: 10px;
            border-bottom: 1px solid #dee2e6;
            transition: all 0.3s;
        }
        .chat-user:hover {
            background-color: #f8f9fa;
        }
        .unread {
            font-weight: bold;
            background-color: #e9ecef;
        }
        .unread::after {
            content: "●";
            color: #dc3545;
            margin-left: 5px;
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
                <h2 class="page-title"><i class="fas fa-comments me-2"></i>Danh sách trò chuyện</h2>

                <div class="card filter-card">
                    <div class="card-header"><i class="fas fa-filter me-2"></i>Tìm kiếm</div>
                    <div class="card-body">
                        <form action="chatlist" method="GET" class="row g-3">
                            <div class="col-md-4">
                                <input type="text" name="searchUsername" value="${searchUsername}" class="form-control search-box" placeholder="Tìm kiếm theo username">
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-primary"><i class="fas fa-search me-2"></i>Tìm</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body p-0">
                        <div class="list-group">
                            <c:forEach items="${chatList}" var="chat">
                                <a href="chatbox?userId=${chat.senderId}" class="chat-user list-group-item list-group-item-action ${chat.isRead() ? '' : 'unread'}">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h5 class="mb-1">${chat.senderUsername}</h5>
                                        <small><fmt:formatDate value="${chat.createdAt}" pattern="dd/MM/yyyy HH:mm"/></small>
                                    </div>
                                    <p class="mb-1">${chat.content}</p>
                                </a>
                            </c:forEach>
                            <c:if test="${empty chatList}">
                                <div class="empty-state text-center p-4">
                                    <i class="fas fa-comments fa-3x mb-3" style="opacity: 0.5;"></i>
                                    <p>Không có cuộc trò chuyện nào.</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-3">
                    <div class="text-muted small">Hiển thị ${chatList.size()} / ${totalUsers} người dùng</div>
                    <nav>
                        <ul class="pagination">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item"><a class="page-link" href="chatlist?page=${currentPage-1}&searchUsername=${searchUsername}"><i class="fas fa-chevron-left"></i></a></li>
                            </c:if>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="chatlist?page=${i}&searchUsername=${searchUsername}">${i}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item"><a class="page-link" href="chatlist?page=${currentPage+1}&searchUsername=${searchUsername}"><i class="fas fa-chevron-right"></i></a></li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>