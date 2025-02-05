<%-- 
    Document   : postlist
    Created on : Feb 3, 2025, 9:24:32 PM
    Author     : DELL
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJfL6l7a72td1T0z5K52Pz3pXrR0E4uIN15qxgQ5wzhTxzZpoWzq32K/l3DZ" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
        }

        .post-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            background-color: #ffffff;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .post-card img {
            border-radius: 8px;
        }

        .post-card h3 {
            font-size: 1.5rem;
            color: #333;
        }

        .post-card p {
            color: #555;
            font-size: 1rem;
        }

        .pagination {
            justify-content: center;
            margin-top: 20px;
        }

        .form-control {
            width: 250px;
            margin-right: 10px;
        }

        .search-section {
            margin-bottom: 30px;
        }

        .post-list {
            margin-top: 30px;
        }

        .latest-posts {
            margin-bottom: 30px;
        }

    </style>
</head>
<body>
    <div class="container mt-5">
        <!-- Title and Search Form -->
        <div class="search-section text-center mb-5">
            <h1>Post List</h1>
            <form method="get" action="${pageContext.request.contextPath}/post" class="d-flex justify-content-center">
                <input type="text" name="search" value="${search}" class="form-control" placeholder="Search posts">
                <input type="text" name="category" value="${category}" class="form-control ms-2" placeholder="Search by category">
                <button type="submit" class="btn btn-primary ms-2">Search</button>
            </form>
        </div>

        <!-- Latest Posts -->
        <div class="latest-posts mb-5">
            <h2>Latest Posts</h2>
            <div class="row">
                <c:forEach var="post" items="${latestPosts}">
                    <div class="col-md-4 mb-4">
                        <div class="post-card">
                            <a href="${pageContext.request.contextPath}/postDetails?id=${post.id}">
                                <img src="${post.thumbnail}" alt="Thumbnail" class="img-fluid" />
                                <h3>${post.title}</h3>
                                <p>${post.content.substring(0, 100)}...</p>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- All Posts -->
        <div class="post-list">
            <h2>All Posts</h2>
            <div class="row">
                <c:forEach var="post" items="${posts}">
                    <div class="col-md-4 mb-4">
                        <div class="post-card">
                            <a href="${pageContext.request.contextPath}/postDetails?id=${post.id}">
                                <img src="${post.thumbnail}" alt="Thumbnail" class="img-fluid" />
                                <h3>${post.title}</h3>
                                <p>${post.content.substring(0, 100)}...</p>
                                <span class="badge bg-secondary">${post.category}</span>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Pagination -->
        <div class="pagination mt-4">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="${pageContext.request.contextPath}/post?page=${i}" class="btn btn-outline-primary mx-1">${i}</a>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybPjMzZ1vDxKjD13L8yhdnJFuB2rjhuTgCeR14aKhJlMZy2Xozz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqbhzdeA6nF01hm8WrZl2p77fXef0vPff5Wl4g98f7T4vc" crossorigin="anonymous"></script>
</body>
</html>
