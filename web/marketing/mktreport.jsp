<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marketing Report Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .report-section {
            margin-bottom: 30px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .table-responsive {
            margin-top: 15px;
        }
        .report-header {
            border-bottom: 2px solid #f8f9fa;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar Navigation -->
            <div class="col-md-2 bg-dark vh-100 position-fixed">
                <div class="d-flex flex-column flex-shrink-0 p-3 text-white">
                    <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                        <span class="fs-4">Marketing Dashboard</span>
                    </a>
                    <hr>
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item"><a href="?type=overview" class="nav-link text-white ${reportType == 'overview' ? 'active' : ''}">Overview</a></li>
                        <li><a href="?type=coupon" class="nav-link text-white ${reportType == 'coupon' ? 'active' : ''}">Coupon Report</a></li>
                        <li><a href="?type=feedback" class="nav-link text-white ${reportType == 'feedback' ? 'active' : ''}">Feedback Report</a></li>
                        <li><a href="?type=product" class="nav-link text-white ${reportType == 'product' ? 'active' : ''}">Product Report</a></li>
                        <li><a href="?type=inventory" class="nav-link text-white ${reportType == 'inventory' ? 'active' : ''}">Inventory Report</a></li>
                        <li><a href="?type=slider" class="nav-link text-white ${reportType == 'slider' ? 'active' : ''}">Slider Report</a></li>
                        <li><a href="?type=post" class="nav-link text-white ${reportType == 'post' ? 'active' : ''}">Post Report</a></li>
                        <li><a href="?type=comprehensive" class="nav-link text-white ${reportType == 'comprehensive' ? 'active' : ''}">Comprehensive Report</a></li>
                    </ul>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 ms-auto p-4">
                <h1 class="mb-4">Marketing Analytics Report</h1>
                <div class="alert alert-info alert-dismissible fade show" role="alert">
                    <strong>Welcome to the Marketing Report Dashboard!</strong> This provides insights for all marketing activities across the platform.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <!-- 1. COUPON REPORT -->
                <c:if test="${reportType == 'overview' || reportType == 'coupon'}">
                    <div class="report-section bg-white">
                        <div class="report-header">
                            <h2>Coupon Report</h2>
                            <p class="text-muted">Analysis of discount coupons and their performance</p>
                        </div>

                        <!-- Bảng KPI Tổng quan -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tiêu chí</th>
                                        <th>Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Tổng số Coupon</td><td><c:set var="totalCoupons" value="0" /><c:forEach items="${couponsByStatus}" var="entry"><c:set var="totalCoupons" value="${totalCoupons + entry.value}" /></c:forEach>${totalCoupons}</td></tr>
                                    <tr><td>Coupon đang hoạt động</td><td><c:out value="${couponsByStatus['active']}" default="0" /></td></tr>
                                    <tr><td>Giá trị giảm giá trung bình</td><td><fmt:formatNumber value="${averageDiscountAmount}" pattern="#,##0.00" /></td></tr>
                                    <tr><td>Coupon hết hạn chưa dùng</td><td>${unusedExpiredCouponsCount}</td></tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Bảng Coupon được sử dụng nhiều nhất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Mã Coupon</th>
                                        <th>Loại</th>
                                        <th>Giá trị giảm giá</th>
                                        <th>Số lần sử dụng</th>
                                        <th>Tỷ lệ sử dụng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${mostUsedCoupons}" var="coupon">
                                        <tr>
                                            <td>${coupon.code}</td>
                                            <td>${coupon.discount_type}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${coupon.discount_type == 'percentage'}">${coupon.discount_value}%</c:when>
                                                    <c:otherwise>$<fmt:formatNumber value="${coupon.discount_value}" pattern="#,##0.00" /></c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${coupon.usage_count}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${coupon.usage_limit > 0}">${coupon.usage_limit}</c:when>
                                                    <c:otherwise>Không giới hạn</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${coupon.usage_limit > 0}">
                                                        <fmt:formatNumber value="${coupon.usage_rate}" pattern="#,##0.00" />%
                                                    </c:when>
                                                    <c:otherwise>
                                                        Không giới hạn
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Bảng Đề xuất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Hạng mục</th>
                                        <th>Thông tin chi tiết & Đề xuất</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Coupon hiệu quả</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty mostUsedCoupons && mostUsedCoupons.size() > 0}">
                                                    Coupon <strong>${mostUsedCoupons[0].code}</strong> hiệu quả nhất với ${mostUsedCoupons[0].usage_count} lần dùng.
                                                </c:when>
                                                <c:otherwise>
                                                    Chưa có dữ liệu về hiệu quả coupon.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Coupon hết hạn chưa dùng</td>
                                        <td>
                                            Hiện có <strong>${unusedExpiredCouponsCount}</strong> coupon hết hạn chưa sử dụng.
                                            <c:if test="${unusedExpiredCouponsCount > 10}">
                                                Xem xét cải thiện chiến lược quảng bá coupon.
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tối ưu khuyến mãi</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${averageDiscountAmount < 10}">
                                                    Giảm giá trung bình thấp (<fmt:formatNumber value="${averageDiscountAmount}" pattern="#,##0.00" />). Tăng giá trị giảm giá để cải thiện tỷ lệ chuyển đổi.
                                                </c:when>
                                                <c:when test="${averageDiscountAmount > 30}">
                                                    Giảm giá trung bình cao (<fmt:formatNumber value="${averageDiscountAmount}" pattern="#,##0.00" />). Tối ưu hóa để đảm bảo lợi nhuận.
                                                </c:when>
                                                <c:otherwise>
                                                    Giảm giá trung bình (<fmt:formatNumber value="${averageDiscountAmount}" pattern="#,##0.00" />) ở mức tối ưu.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
<!-- Thêm bảng Phân bố Coupon theo Loại -->
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Loại Coupon</th>
                <th>Số lượng</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty couponsByType}">
                    <c:forEach items="${couponsByType}" var="entry">
                        <tr>
                            <td>${entry.key}</td>
                            <td>${entry.value}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="2" class="text-center">No data available</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<!-- Thêm bảng Phân bố Coupon theo Loại Giảm Giá -->
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Loại Giảm Giá</th>
                <th>Số lượng</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty couponsByDiscountType}">
                    <c:forEach items="${couponsByDiscountType}" var="entry">
                        <tr>
                            <td>${entry.key}</td>
                            <td>${entry.value}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="2" class="text-center">No data available</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<!-- Thêm bảng Phân tích Thời gian Hết hạn -->
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã Coupon</th>
                <th>Ngày Hết Hạn</th>
                <th>Số Ngày Còn Lại</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty couponExpiryAnalysis}">
                    <c:forEach items="${couponExpiryAnalysis}" var="coupon">
                        <tr>
                            <td>${coupon.code}</td>
                            <td><fmt:formatDate value="${coupon.expiry_date}" pattern="dd-MM-yyyy" /></td>
                            <td>
                                <c:choose>
                                    <c:when test="${coupon.days_remaining < 0}">
                                        <span class="badge bg-danger">Hết hạn</span>
                                    </c:when>
                                    <c:otherwise>${coupon.days_remaining} ngày</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="3" class="text-center">No data available</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>


                <!-- 2. FEEDBACK REPORT -->
                <c:if test="${reportType == 'overview' || reportType == 'feedback'}">
                    <div class="report-section bg-white">
                        <div class="report-header">
                            <h2>Feedback Report</h2>
                            <p class="text-muted">Customer feedback and product ratings analysis</p>
                        </div>

                        <!-- Bảng KPI Tổng quan -->
                        <!-- Thêm vào bảng KPI Tổng quan: Tỷ lệ sản phẩm có đánh giá -->
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Tiêu chí</th>
                <th>Giá trị</th>
            </tr>
        </thead>
        <tbody>
            <tr><td>Điểm đánh giá trung bình</td><td><fmt:formatNumber value="${averageRating}" pattern="#.0" /></td></tr>
            <tr><td>Tổng số đánh giá</td><td><c:set var="totalFeedback" value="0" /><c:forEach items="${feedbackByStatus}" var="entry"><c:set var="totalFeedback" value="${totalFeedback + entry.value}" /></c:forEach>${totalFeedback}</td></tr>
            <tr><td>Tỷ lệ phản hồi</td><td><fmt:formatNumber value="${customerFeedbackRate.feedback_rate}" pattern="#,##0.0" />%</td></tr>
            <tr><td>Đánh giá có hình ảnh</td><td>${feedbackWithImagesCount}</td></tr>
            <tr><td>Tỷ lệ sản phẩm có đánh giá</td><td><fmt:formatNumber value="${productRatingCoverage.coverage_rate}" pattern="#,##0.0" />%</td></tr>
        </tbody>
    </table>
</div>

<!-- Thêm bảng Phân bố Đánh giá theo Số Sao -->
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Số Sao</th>
                <th>Số lượng Đánh giá</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty ratingDistribution}">
                    <c:forEach items="${ratingDistribution}" var="entry">
                        <tr>
                            <td>${entry.key} sao</td>
                            <td>${entry.value}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="2" class="text-center">No data available</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<!-- Thêm bảng Người Đánh giá Tích cực Nhất -->
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Tên Người Dùng</th>
                <th>Số Đánh giá</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty mostActiveReviewers}">
                    <c:forEach items="${mostActiveReviewers}" var="reviewer">
                        <tr>
                            <td>${reviewer.full_name}</td>
                            <td>${reviewer.feedback_count}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="2" class="text-center">No data available</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

                        <!-- Bảng Sản phẩm được đánh giá cao nhất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tên sản phẩm</th>
                                        <th>Điểm trung bình</th>
                                        <th>Số đánh giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${highestRatedProducts}" var="product">
                                        <tr>
                                            <td>${product.title}</td>
                                            <td><fmt:formatNumber value="${product.avg_rating}" pattern="#.0" /></td>
                                            <td>${product.review_count}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Bảng Sản phẩm được đánh giá thấp nhất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tên sản phẩm</th>
                                        <th>Điểm trung bình</th>
                                        <th>Số đánh giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${lowestRatedProducts}" var="product">
                                        <tr>
                                            <td>${product.title}</td>
                                            <td><fmt:formatNumber value="${product.avg_rating}" pattern="#.0" /></td>
                                            <td>${product.review_count}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Bảng Đề xuất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Hạng mục</th>
                                        <th>Thông tin chi tiết & Đề xuất</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Sản phẩm tốt nhất</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty highestRatedProducts && highestRatedProducts.size() > 0}">
                                                    <strong>${highestRatedProducts[0].title}</strong> đạt ${highestRatedProducts[0].avg_rating} sao. Xem xét quảng bá sản phẩm này.
                                                </c:when>
                                                <c:otherwise>
                                                    Chưa có dữ liệu về sản phẩm được đánh giá cao.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Cải thiện sản phẩm</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty lowestRatedProducts && lowestRatedProducts.size() > 0}">
                                                    <strong>${lowestRatedProducts[0].title}</strong> chỉ đạt ${lowestRatedProducts[0].avg_rating} sao. Xem xét cải thiện chất lượng.
                                                </c:when>
                                                <c:otherwise>
                                                    Chưa có dữ liệu về sản phẩm được đánh giá thấp.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Dịch vụ khách hàng</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${feedbackWithRepliesCount / totalFeedback < 0.5}">
                                                    Chỉ <fmt:formatNumber value="${feedbackWithRepliesCount / totalFeedback * 100}" pattern="#,##0.0" />% đánh giá được phản hồi. Cải thiện tỷ lệ phản hồi.
                                                </c:when>
                                                <c:otherwise>
                                                    Dịch vụ tốt với <fmt:formatNumber value="${feedbackWithRepliesCount / totalFeedback * 100}" pattern="#,##0.0" />% đánh giá được phản hồi.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>

                <!-- 3. PRODUCT REPORT -->
                <c:if test="${reportType == 'overview' || reportType == 'product'}">
                    <div class="report-section bg-white">
                        <div class="report-header">
                            <h2>Product Report</h2>
                            <p class="text-muted">Product performance and sales analysis</p>
                        </div>

                        <!-- Bảng KPI Tổng quan -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tiêu chí</th>
                                        <th>Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Tổng số sản phẩm</td><td><c:set var="totalProducts" value="0" /><c:forEach items="${productsByStatus}" var="entry"><c:set var="totalProducts" value="${totalProducts + entry.value}" /></c:forEach>${totalProducts}</td></tr>
                                    <tr><td>Sản phẩm đang hoạt động</td><td><c:out value="${productsByStatus['active']}" default="0" /></td></tr>
                                    <tr><td>Sản phẩm combo</td><td>${comboProductsCount}</td></tr>
                                    <tr><td>Sản phẩm hết hàng</td><td><c:out value="${productsByStatus['EOStock']}" default="0" /></td></tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Bảng Sản phẩm bán chạy nhất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng bán</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${bestSellingProducts}" var="product">
                                        <tr>
                                            <td>${product.title}</td>
                                            <td>${product.total_sold}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Bảng Sản phẩm giảm giá cao nhất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá gốc</th>
                                        <th>Giá giảm</th>
                                        <th>Tỷ lệ giảm giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${productsWithHighestDiscount}" var="product">
                                        <tr>
                                            <td>${product.title}</td>
                                            <td>$<fmt:formatNumber value="${product.original_price}" pattern="#,##0.00" /></td>
                                            <td>$<fmt:formatNumber value="${product.sale_price}" pattern="#,##0.00" /></td>
                                            <td><fmt:formatNumber value="${product.discount_percentage}" pattern="#,##0.0" />%</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Bảng Đề xuất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Hạng mục</th>
                                        <th>Thông tin chi tiết & Đề xuất</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Danh mục tốt nhất</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty revenueByCategory && revenueByCategory.size() > 0}">
                                                    <c:set var="topCategory" value="" />
                                                    <c:set var="topRevenue" value="0" />
                                                    <c:forEach items="${revenueByCategory}" var="entry">
                                                        <c:if test="${entry.revenue > topRevenue}">
                                                            <c:set var="topCategory" value="${entry.name}" />
                                                            <c:set var="topRevenue" value="${entry.revenue}" />
                                                        </c:if>
                                                    </c:forEach>
                                                    Danh mục <strong>${topCategory}</strong> dẫn đầu với doanh thu $<fmt:formatNumber value="${topRevenue}" pattern="#,##0.00" />. Mở rộng dòng sản phẩm này.
                                                </c:when>
                                                <c:otherwise>
                                                    Chưa có dữ liệu doanh thu theo danh mục.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Bổ sung hàng tồn kho</td>
                                        <td>
                                            <c:out value="${productsByStatus['EOStock']}" default="0" /> sản phẩm hết hàng.
                                            <c:if test="${productsByStatus['EOStock'] > 10}">
                                                Ưu tiên bổ sung hàng cho các sản phẩm bán chạy.
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tối ưu danh mục sản phẩm</td>
                                        <td>
                                            Combo chiếm <fmt:formatNumber value="${comboProductsCount / totalProducts * 100}" pattern="#,##0.0" />% trong ${totalProducts} sản phẩm.
                                            <c:if test="${comboProductsCount / totalProducts < 0.1}">
                                                Tăng thêm sản phẩm combo để nâng giá trị đơn hàng.
                                            </c:if>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>

                <!-- 4. INVENTORY REPORT -->
<c:if test="${reportType == 'overview' || reportType == 'inventory'}">
    <div class="report-section bg-white">
        <div class="report-header">
            <h2>Inventory Report</h2>
            <p class="text-muted">Stock levels and inventory management metrics</p>
        </div>

        <!-- Bảng KPI Tổng quan -->
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Tiêu chí</th>
                        <th>Giá trị</th>
                    </tr>
                </thead>
                <tbody>
                    <tr><td>Tổng giá trị tồn kho</td><td><fmt:formatNumber value="${totalInventoryValue}" pattern="$#,##0.00" /></td></tr>
                    <tr><td>Sản phẩm tồn kho thấp (dưới 10)</td><td>${lowStockProducts.size()}</td></tr>
                    <tr><td>Tỷ lệ hết hàng</td><td><fmt:formatNumber value="${outOfStockRate.out_of_stock_rate}" pattern="#,##0.0" />%</td></tr>
                    <tr><td>Sản phẩm chưa nhập lại</td><td>${productsWithoutRecentRestocking.size()}</td></tr>
                </tbody>
            </table>
        </div>

        <!-- Bảng Sản phẩm tồn kho thấp -->
        <div class="table-responsive">
    <table class="table table-bordered" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Size</th>
                <th>Color</th>
                <th>Stock</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty lowStockProducts}">
                    <c:forEach items="${lowStockProducts}" var="product">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.title}</td>
                            <td>${product.size}</td>
                            <td>${product.color}</td>
                            <td>
                                <span class="badge bg-danger">${product.stock_quantity}</span>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5" class="text-center">No low stock products</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>
<!-- Thêm bảng Tổng Tồn kho theo Sản phẩm -->
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Tên Sản phẩm</th>
                <th>Tổng Tồn kho</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty totalInventoryByProduct}">
                    <c:forEach items="${totalInventoryByProduct}" var="product">
                        <tr>
                            <td>${product.title}</td>
                            <td>${product.total_stock}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="2" class="text-center">No data available</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

<!-- Thêm bảng Tổng Tồn kho theo Danh mục -->
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Danh mục</th>
                <th>Tổng Tồn kho</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty inventoryByCategory}">
                    <c:forEach items="${inventoryByCategory}" var="category">
                        <tr>
                            <td>${category.name}</td>
                            <td>${category.total_stock}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="2" class="text-center">No data available</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>

        <!-- Bảng Đề xuất (giữ nguyên hoặc cập nhật nếu cần) -->
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Hạng mục</th>
                        <th>Thông tin chi tiết & Đề xuất</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Ưu tiên bổ sung</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty lowStockProducts && lowStockProducts.size() > 0}">
                                    <strong>${lowStockProducts[0].title}</strong> cần bổ sung ngay với ${lowStockProducts[0].total_stock} đơn vị.
                                </c:when>
                                <c:otherwise>
                                    Không có yêu cầu bổ sung khẩn cấp.
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                                    <tr>
                                        <td>Tồn kho dư thừa</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty productsWithoutRecentRestocking && productsWithoutRecentRestocking.size() > 0}">
                                                    ${productsWithoutRecentRestocking.size()} sản phẩm chưa bán trong 30+ ngày. Xem xét khuyến mãi để giảm tồn kho.
                                                </c:when>
                                                <c:otherwise>
                                                    Tồn kho đang luân chuyển tốt, không có dư thừa đáng kể.
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Biến thể phổ biến</td>
                                        <td>
                                            <c:if test="${not empty productVariationsBySize && not empty productVariationsByColor}">
                                                <c:set var="topSize" value="" /><c:set var="topSizeCount" value="0" />
                                                <c:forEach items="${productVariationsBySize}" var="entry">
                                                    <c:if test="${entry.value > topSizeCount}">
                                                        <c:set var="topSize" value="${entry.key}" />
                                                        <c:set var="topSizeCount" value="${entry.value}" />
                                                    </c:if>
                                                </c:forEach>
                                                <c:set var="topColor" value="" /><c:set var="topColorCount" value="0" />
                                                <c:forEach items="${productVariationsByColor}" var="entry">
                                                    <c:if test="${entry.value > topColorCount}">
                                                        <c:set var="topColor" value="${entry.key}" />
                                                        <c:set var="topColorCount" value="${entry.value}" />
                                                    </c:if>
                                                </c:forEach>
                                                Size <strong>${topSize}</strong> và màu <strong>${topColor}</strong> phổ biến nhất. Đảm bảo đủ hàng cho các biến thể này.
                                            </c:if>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>

                <!-- 5. SLIDER REPORT -->
                <c:if test="${reportType == 'overview' || reportType == 'slider'}">
                    <div class="report-section bg-white">
                        <div class="report-header">
                            <h2>Slider Report</h2>
                            <p class="text-muted">Banner and slider performance metrics</p>
                        </div>

                        <!-- Bảng KPI Tổng quan -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tiêu chí</th>
                                        <th>Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Tổng số Slider</td><td><c:set var="totalSliders" value="0" /><c:forEach items="${slidersByStatus}" var="entry"><c:set var="totalSliders" value="${totalSliders + entry.value}" /></c:forEach>${totalSliders}</td></tr>
                                    <tr><td>Slider đang hoạt động</td><td><c:out value="${slidersByStatus['active']}" default="0" /></td></tr>
                                    <tr><td>Slider không hoạt động</td><td><c:out value="${slidersByStatus['inactive']}" default="0" /></td></tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Bảng Tất cả Slider -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tiêu đề</th>
                                        <th>Trạng thái</th>
                                        <th>Thứ tự hiển thị</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${allSliders}" var="slider">
                                        <tr>
                                            <td>${slider.id}</td>
                                            <td>${slider.title}</td>
                                            <td>${slider.status}</td>
                                            <td>${slider.display_order}</td>
                                            <td><fmt:formatDate value="${slider.created_at}" pattern="dd-MM-yyyy" /></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>


                        <!-- Bảng Đề xuất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Hạng mục</th>
                                        <th>Thông tin chi tiết & Đề xuất</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Banner đang hoạt động</td>
                                        <td>
                                            Hiện có ${slidersByStatus['active']} slider đang hoạt động trong ${totalSliders} slider.
                                            <c:choose>
                                                <c:when test="${slidersByStatus['active'] > 5}">
                                                    Giảm số lượng slider để tăng hiệu quả và tốc độ tải.
                                                </c:when>
                                                <c:when test="${slidersByStatus['active'] < 2}">
                                                    Tăng số lượng slider để hiển thị thêm nội dung khuyến mãi.
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
    <td>Đánh giá thứ tự hiển thị</td>
    <td>
        <c:choose>
            <c:when test="${slidersByStatus['active'] > 0}">
                <c:set var="maxDisplayOrder" value="0" />
                <c:forEach items="${allSliders}" var="slider">
                    <c:if test="${slider.display_order > maxDisplayOrder}">
                        <c:set var="maxDisplayOrder" value="${slider.display_order}" />
                    </c:if>
                </c:forEach>
                <c:choose>
                    <c:when test="${maxDisplayOrder > 10}">
                        Thứ tự hiển thị tối đa (${maxDisplayOrder}) quá lớn. Tối ưu hóa để dưới 10 nhằm tăng trải nghiệm người dùng.
                    </c:when>
                    <c:otherwise>
                        Thứ tự hiển thị tối đa (${maxDisplayOrder}) phù hợp cho giao diện.
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                Chưa có slider hoạt động để đánh giá thứ tự hiển thị.
            </c:otherwise>
        </c:choose>
    </td>
</tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>

                <!-- 6. POST REPORT -->
                <c:if test="${reportType == 'overview' || reportType == 'post'}">
                    <div class="report-section bg-white">
                        <div class="report-header">
                            <h2>Post Report</h2>
                            <p class="text-muted">Blog and content performance metrics</p>
                        </div>

                        <!-- Bảng KPI Tổng quan -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tiêu chí</th>
                                        <th>Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><td>Tổng số bài viết</td><td><c:set var="totalPosts" value="0" /><c:forEach items="${postsByStatus}" var="entry"><c:set var="totalPosts" value="${totalPosts + entry.value}" /></c:forEach>${totalPosts}</td></tr>
                                    <tr><td>Bài viết đã đăng</td><td><c:out value="${postsByStatus['published']}" default="0" /></td></tr>
                                    <tr><td>Bài viết nổi bật</td><td>${featuredPostsCount}</td></tr>
                                    <tr><td>Bài viết nháp</td><td><c:out value="${postsByStatus['draft']}" default="0" /></td></tr>
                                    <tr><td>Thời gian trung bình từ nháp đến đăng</td><td><fmt:formatNumber value="${averageTimeDraftToPublished}" pattern="#,##0.0" /> ngày</td></tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Bảng Bài viết nháp lâu dài -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tiêu đề</th>
                                        <th>Ngày tạo</th>
                                        <th>Số ngày trong nháp</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${longTimeDraftPosts}" var="post">
                                        <tr>
                                            <td>${post.title}</td>
                                            <td><fmt:formatDate value="${post.created_at}" pattern="dd-MM-yyyy" /></td>
                                            <td>${post.days_in_draft} ngày</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>


<!-- Thêm bảng Số lượng Bài viết theo Tác giả -->
<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Tác giả</th>
                <th>Số lượng Bài viết</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty postsByAuthor}">
                    <c:forEach items="${postsByAuthor}" var="author">
                        <tr>
                            <td>${author.full_name}</td>
                            <td>${author.post_count}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="2" class="text-center">No data available</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</div>
                        <!-- Bảng Đề xuất -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Hạng mục</th>
                                        <th>Thông tin chi tiết & Đề xuất</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
    <td>Tần suất đăng bài</td>
    <td>
        <c:set var="currentMonth" value="<%= new java.text.SimpleDateFormat(\"yyyy-MM\").format(new java.util.Date()) %>" />
        <c:set var="postsThisMonth" value="${postDistributionByMonth[currentMonth]}" />
        <c:choose>
            <c:when test="${postsThisMonth == null || postsThisMonth < 4}">
                Chỉ <c:out value="${postsThisMonth}" default="0" /> bài tháng này. Tăng lên ít nhất 4 bài/tháng để cải thiện SEO.
            </c:when>
            <c:otherwise>
                ${postsThisMonth} bài tháng này. Duy trì tần suất tốt cho SEO và tương tác.
            </c:otherwise>
        </c:choose>
    </td>
</tr>
                                    <tr>
                                        <td>Quản lý nháp</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty longTimeDraftPosts}">
                                                    ${longTimeDraftPosts.size()} bài nháp > 7 ngày. Hoàn thành hoặc lưu trữ để tối ưu quy trình.
                                                </c:when>
                                                <c:otherwise>
                                                    Không có bài nháp tồn đọng lâu. Quy trình nội dung hiệu quả!
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Độ tươi mới nội dung</td>
                                        <td>
                                            <c:if test="${not empty latestUpdatedPostDate}">
                                                <c:set var="currentDate" value="<%= new java.util.Date() %>" />
                                                <c:set var="daysSinceUpdate" value="${(currentDate.time - latestUpdatedPostDate.time) / (1000 * 60 * 60 * 24)}" />
                                                <fmt:formatNumber value="${daysSinceUpdate}" pattern="#,##0" /> ngày kể từ cập nhật cuối.
                                                <c:if test="${daysSinceUpdate > 30}">
                                                    Làm mới nội dung để cải thiện SEO và độ liên quan.
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
<!-- 7. COMPREHENSIVE REPORT -->
<c:if test="${reportType == 'overview' || reportType == 'comprehensive'}">
    <div class="report-section bg-white">
        <div class="report-header">
            <h2>Comprehensive Report</h2>
            <p class="text-muted">Combined metrics for products and coupon usage</p>
        </div>

        <!-- Bảng KPI Tổng quan -->
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Tiêu chí</th>
                        <th>Giá trị</th>
                    </tr>
                </thead>
                <tbody>
                    <tr><td>Tổng số Coupon đã dùng</td><td>${couponUsageMetrics.totalUsed}</td></tr>
                    <tr><td>Tổng số Coupon đã tạo</td><td>${couponUsageMetrics.totalCreated}</td></tr>
                    <tr><td>Tỷ lệ sử dụng trung bình</td><td><fmt:formatNumber value="${couponUsageMetrics.averageUsageRate}" pattern="#,##0.00" />%</td></tr>
                </tbody>
            </table>
        </div>

        <!-- Bảng Top 10 Sản phẩm Tổng hợp -->
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Điểm đánh giá trung bình</th>
                        <th>Số đánh giá</th>
                        <th>Số lượng bán</th>
                        <th>Tồn kho</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty combinedProductMetrics}">
                            <c:forEach items="${combinedProductMetrics}" var="product">
                                <tr>
                                    <td>${product.title}</td>
                                    <td><fmt:formatNumber value="${product.avg_rating}" pattern="#,##0.0" /></td>
                                    <td>${product.review_count}</td>
                                    <td>${product.total_sold}</td>
                                    <td>${product.stock_quantity}</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" class="text-center">No data available</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <!-- Bảng Đề xuất -->
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Hạng mục</th>
                        <th>Thông tin chi tiết & Đề xuất</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Hiệu quả Coupon</td>
                        <td>
                            <c:choose>
                                <c:when test="${couponUsageMetrics.averageUsageRate < 20}">
                                    Tỷ lệ sử dụng trung bình thấp (<fmt:formatNumber value="${couponUsageMetrics.averageUsageRate}" pattern="#,##0.00" />%). Tăng cường quảng bá coupon.
                                </c:when>
                                <c:otherwise>
                                    Tỷ lệ sử dụng trung bình tốt (<fmt:formatNumber value="${couponUsageMetrics.averageUsageRate}" pattern="#,##0.00" />%). Duy trì chiến lược hiện tại.
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td>Sản phẩm nổi bật</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty combinedProductMetrics && combinedProductMetrics.size() > 0}">
                                    <strong>${combinedProductMetrics[0].title}</strong> dẫn đầu với ${combinedProductMetrics[0].total_sold} đơn vị bán. Tập trung quảng bá.
                                </c:when>
                                <c:otherwise>
                                    Chưa có dữ liệu sản phẩm nổi bật.
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</c:if>
            </div> <!-- Closes col-md-10 ms-auto p-4 -->
        </div> <!-- Closes initial row -->
    </div> <!-- Closes container-fluid -->
</body>
</html>