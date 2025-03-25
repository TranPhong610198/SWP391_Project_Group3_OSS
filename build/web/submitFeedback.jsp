<%-- 
    Document   : submitFeedback
    Created on : Mar 25, 2025, 11:29:23 AM
    Author     : tphon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Đánh Giá Đơn Hàng</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .star-rating {
                font-size: 2rem;
                color: #ddd;
                cursor: pointer;
            }
            .star-rating .active {
                color: #ffc107;
            }
            .product-image {
                max-width: 150px;
                max-height: 150px;
                object-fit: cover;
            }
            .feedback-card {
                margin-bottom: 1.5rem;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }
            .image-preview img {
                width: 100px;
                height: 100px;
                object-fit: cover;
                margin: 0.25rem;
            }
        </style>
    </head>
    <body>
        <div class="container py-5">
            <h1 class="mb-4 text-center">Đánh Giá Đơn Hàng #${order.id}</h1>

            <form action="submitfeedback" method="post" enctype="multipart/form-data" id="feedbackForm">
                <input type="hidden" name="orderId" value="${order.id}">

                <div class="row">
                    <c:forEach var="item" items="${order.items}" varStatus="status">
                        <div class="col-md-6 mb-4">
                            <div class="card feedback-card">
                                <div class="card-header bg-light">
                                    <div class="d-flex align-items-center">
                                        <img src="${item.productThumbnail}" 
                                             alt="${item.productTitle}" 
                                             class="product-image me-3">
                                        <h5 class="card-title mb-0">${item.productTitle}</h5>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <input type="text" name="orderItemId" value="${item.id}">

                                    <div class="mb-3">
                                        <label class="form-label">Đánh Giá Sao</label>
                                        <div class="star-rating" data-item-id="${item.id}">
                                            <span data-rating="1">★</span>
                                            <span data-rating="2">★</span>
                                            <span data-rating="3">★</span>
                                            <span data-rating="4">★</span>
                                            <span data-rating="5">★</span>
                                        </div>
                                        <input type="text" name="rating" 
                                               id="rating-${item.id}" 
                                               required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="comment-${item.id}" class="form-label">Nhận Xét</label>
                                        <textarea 
                                            name="comment" 
                                            id="comment-${item.id}" 
                                            class="form-control" 
                                            rows="3" 
                                            placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm"
                                            ></textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Hình Ảnh (Tối Đa 5)</label>
                                        <input 
                                            type="file" 
                                            name="feedbackImages" 
                                            class="form-control image-upload" 
                                            id="images-${item.id}" 
                                            multiple 
                                            accept="image/*" 
                                            data-max-files="5"
                                            >
                                        <div class="image-preview mt-2" id="preview-${item.id}"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary btn-lg">Gửi Đánh Giá</button>
                </div>
            </form>
        </div>

        <!-- Bootstrap JS and Dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Star Rating Logic
                document.querySelectorAll('.star-rating').forEach(starContainer => {
                    const itemId = starContainer.getAttribute('data-item-id');
                    const stars = starContainer.querySelectorAll('span');
                    const hiddenInput = document.getElementById(`rating-${itemId}`);

                    stars.forEach(star => {
                        star.addEventListener('click', function () {
                            const rating = this.getAttribute('data-rating');
                            
                            // Reset all stars
                            stars.forEach(s => s.classList.remove('active'));

                            // Activate stars up to clicked star
                            for (let i = 0; i < rating; i++) {
                                stars[i].classList.add('active');
                            }

                            // Set hidden input value
                            hiddenInput.value = rating;
                        });
                    });
                });

                // Image Preview and Limit
                document.querySelectorAll('.image-upload').forEach(input => {
                    input.addEventListener('change', function (event) {
                        const itemId = this.id.split('-')[1];
                        const preview = document.getElementById(`preview-${itemId}`);
                        const maxFiles = parseInt(this.getAttribute('data-max-files'), 10);

                        // Clear previous previews
                        preview.innerHTML = '';

                        // Limit number of files
                        const files = Array.from(event.target.files).slice(0, maxFiles);

                        files.forEach(file => {
                            const reader = new FileReader();
                            reader.onload = function (e) {
                                const img = document.createElement('img');
                                img.src = e.target.result;
                                img.classList.add('img-thumbnail');
                                preview.appendChild(img);
                            }
                            reader.readAsDataURL(file);
                        });
                    });
                });
            });
        </script>
    </body>
</html>
