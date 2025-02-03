<%-- 
    Document   : postdetail
    Created on : Feb 3, 2025, 10:09:59 PM
    Author     : DELL
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1 class="display-4">${post.title}</h1>
        <hr>
        <div class="row">
            <div class="col-md-8">
                <div class="post-content">
                    <p>${post.content}</p>
                </div>
                <p><strong>Category:</strong> ${post.category}</p>
            </div>
            <div class="col-md-4">
                <h5>Related Posts</h5>
                <ul class="list-group">
                    <c:forEach var="relatedPost" items="${relatedPosts}">
                        <li class="list-group-item">
                            <a href="${pageContext.request.contextPath}/postDetails?id=${relatedPost.id}">
                                ${relatedPost.title}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <hr>
        <a href="${pageContext.request.contextPath}/posts" class="btn btn-primary">Back to Post List</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>