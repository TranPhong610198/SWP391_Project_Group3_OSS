<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Posts</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #34495e;
            --accent-color: #3498db;
        }
        
        body {
            background-color: #f8f9fa;
            color: var(--primary-color);
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        .search-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            padding: 3rem 0;
            margin-bottom: 2rem;
        }

        .search-section h1 {
            color: white;
            font-weight: 300;
            margin-bottom: 1.5rem;
        }

        .search-form {
            background: rgba(255, 255, 255, 0.1);
            padding: 1.5rem;
            border-radius: 10px;
        }

        .post-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            height: 100%;
            border: none;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }

        .post-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }

        .post-card img {
            height: 200px;
            object-fit: cover;
        }

        .post-card .card-body {
            padding: 1.5rem;
        }

        .post-card .card-title {
            color: var(--primary-color);
            font-weight: 600;
        }

        .post-card .card-text {
            color: #666;
            font-size: 0.9rem;
            line-height: 1.6;
        }

        .category-badge {
            background-color: var(--accent-color);
            color: white;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            margin-top: 1rem;
            display: inline-block;
        }

        .section-title {
            position: relative;
            margin-bottom: 2rem;
            padding-bottom: 0.5rem;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: var(--accent-color);
        }

        .pagination .page-link {
            color: var(--primary-color);
            border: none;
            margin: 0 3px;
            border-radius: 5px;
        }

        .pagination .page-link:hover,
        .pagination .page-link.active {
            background-color: var(--accent-color);
            color: white;
        }

        .meta-info {
            font-size: 0.85rem;
            color: #666;
            margin-top: 0.5rem;
        }

        .meta-info i {
            margin-right: 0.3rem;
            color: var(--accent-color);
        }
    </style>
</head>
<body>
    <div class="search-section">
        <div class="container">
            <h1 class="text-center">Discover Our Latest Posts</h1>
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <form method="get" action="${pageContext.request.contextPath}/post" class="search-form">
                        <div class="row g-3">
                            <div class="col-md-5">
                                <input type="text" name="search" value="${search}" class="form-control" placeholder="Search posts...">
                            </div>
                            <div class="col-md-5">
                                <input type="text" name="category" value="${category}" class="form-control" placeholder="Category...">
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-light w-100">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Latest Posts Section -->
        <h2 class="section-title">Latest Posts</h2>
        <div class="row g-4 mb-5">
            <c:forEach var="post" items="${latestPosts}">
                <div class="col-md-4">
                    <div class="post-card card">
                        <img src="${post.thumbnail}" class="card-img-top" alt="${post.title}">
                        <div class="card-body">
                            <h5 class="card-title">${post.title}</h5>
                            <div class="meta-info">
                                <i class="fas fa-user"></i> ${post.author}
                                <i class="fas fa-clock ms-2"></i> ${post.updatedAt}
                            </div>
                            <p class="card-text">${post.summary}</p>
                            <span class="category-badge">${post.category}</span>
                            <a href="${pageContext.request.contextPath}/postdetail.jsp?id=${post.id}" class="btn btn-outline-primary mt-3">Read More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- All Posts Section -->
        <h2 class="section-title">All Posts</h2>
        <div class="row g-4 mb-5">
            <c:forEach var="post" items="${posts}">
                <div class="col-md-4">
                    <div class="post-card card">
                        <img src="${post.thumbnail}" class="card-img-top" alt="${post.title}">
                        <div class="card-body">
                            <h5 class="card-title">${post.title}</h5>
                            <div class="meta-info">
                                <i class="fas fa-user"></i> ${post.author}
                                <i class="fas fa-clock ms-2"></i> ${post.updatedAt}
                            </div>
                            <p class="card-text">${post.summary}</p>
                            <span class="category-badge">${post.category}</span>
                            <a href="${pageContext.request.contextPath}/postdetail.jsp?id=${post.id}" class="btn btn-outline-primary mt-3">Read More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Pagination -->
        <nav aria-label="Page navigation" class="my-5">
            <ul class="pagination justify-content-center">
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/post?page=${i}&search=${search}&category=${category}">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>