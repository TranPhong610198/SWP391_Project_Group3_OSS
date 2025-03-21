<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marketing Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- Include header/navigation -->
    
    <!-- Include sidebar -->
<jsp:include page="sidebar.jsp" />

<!-- Main content area with margin for sidebar -->
<div class="main-content" style="margin-left: 250px; padding: 20px;">
    <div class="container-fluid py-4">
        <div class="row mb-4">
            <div class="col-md-6">
                <h2><i class="bi bi-bar-chart-line"></i> Marketing Dashboard</h2>
            </div>
            <div class="col-md-6">
                <!-- Date range selector -->
                <form class="row g-3 justify-content-end" method="get" action="${pageContext.request.contextPath}/marketing/mktdashboard">
                    <div class="col-auto">
                        <label for="startDate" class="col-form-label">From:</label>
                    </div>
                    <div class="col-auto">
                        <input type="date" class="form-control" id="startDate" name="startDate" value="${startDateStr}">
                    </div>
                    <div class="col-auto">
                        <label for="endDate" class="col-form-label">To:</label>
                    </div>
                    <div class="col-auto">
                        <input type="date" class="form-control" id="endDate" name="endDate" value="${endDateStr}">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary">Apply</button>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Summary stats cards -->
        <div class="row mb-4">
            <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                        Total Products</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">${stats.totalProducts}</div>
                    <div class="mt-2 small">
                        <div class="text-xs text-gray-600">Active: ${stats.activeProducts}</div>
                        <div class="text-xs text-gray-600">Out of Stock: ${stats.outOfStockProducts}</div>
                        <div class="text-xs text-gray-600">Inactive: ${stats.totalProducts - stats.activeProducts - stats.outOfStockProducts}</div>
                    </div>
                </div>
                <div class="col-auto">
                    <i class="bi bi-box-seam fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>
            
            <div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                        Total Customers</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">${stats.totalCustomers}</div>
                    <div class="mt-2 small">
                        <div class="text-xs text-gray-600">Active: ${stats.activeCustomers}</div>
                        <div class="text-xs text-gray-600">Inactive: ${stats.inactiveCustomers}</div>
                        <div class="text-xs text-gray-600">Pending: ${stats.pendingCustomers}</div>
                    </div>
                </div>
                <div class="col-auto">
                    <i class="bi bi-people fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>

            
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                    Published Posts</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">${stats.publishedPosts}</div>
                            </div>
                            <div class="col-auto">
                                <i class="bi bi-file-earmark-text fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    Average Rating</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <fmt:formatNumber value="${stats.averageRating}" pattern="0.0" /> / 5.0
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="bi bi-star-fill fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Customer trends chart -->
        <div class="row mb-4">
            <div class="col-xl-8 col-lg-7">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">New Customer Trends</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-area">
                            <canvas id="newCustomersChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Customer feedback pie chart -->
            <div class="col-xl-4 col-lg-5"> 
    <div class="card shadow mb-4"> 
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between"> 
            <h6 class="m-0 font-weight-bold text-primary">Feedback Distribution</h6> 
        </div> 
        <div class="card-body"> 
            <div class="chart-pie pt-4 pb-2"> 
                <canvas id="feedbackChart"></canvas> 
            </div> 
            <div class="mt-4 text-center small"> 
                <span class="mr-2"> <i class="fas fa-circle text-danger"></i> 1 Star </span> 
                <span class="mr-2"> <i class="fas fa-circle text-warning"></i> 2 Stars </span> 
                <span class="mr-2"> <i class="fas fa-circle text-info"></i> 3 Stars </span> 
                <span class="mr-2"> <i class="fas fa-circle text-primary"></i> 4 Stars </span> 
                <span class="mr-2"> <i class="fas fa-circle text-success"></i> 5 Stars </span> 
            </div> 
        </div> 
    </div> 
</div>
        </div>
        
        <!-- Products & Inventory stats -->
        <div class="row mb-4">
            <div class="col-xl-6 col-lg-6">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Products by Category</h6>
        </div>
        <div class="card-body">
            <div style="position: relative; height: 350px; width: 100%;">
                <canvas id="productsByCategoryChart"></canvas>
            </div>
            <div class="mt-4 small text-center">
                <c:choose>
                    <c:when test="${empty stats.productsByCategory}">
                        <span class="text-muted">No data available</span>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${stats.productsByCategory}" var="category" varStatus="status">
                            <span class="mr-2 mb-1 d-inline-block">
                                <c:set var="colorIndex" value="${status.index % 7}" />
                                <i class="fas fa-circle" style="color: ${colorIndex == 0 ? '#36b9cc' : colorIndex == 1 ? '#4e73df' : colorIndex == 2 ? '#f6c23e' : colorIndex == 3 ? '#1cc88a' : colorIndex == 4 ? '#d65b4f' : colorIndex == 5 ? '#6f42c1' : '#20c997'}"></i>
                                ${category.key}: ${category.value}
                            </span>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
            
            <div class="col-xl-6 col-lg-6">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Inventory Status</h6>
                    </div>
                    <div class="card-body">
                        <h4 class="small font-weight-bold">Active Products <span class="float-right">
                            <fmt:formatNumber value="${stats.activeProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}" pattern="0.0" />%
                        </span></h4>
                        <div class="progress mb-4">
                            <div class="progress-bar bg-success" role="progressbar" style="width: ${stats.activeProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}%"></div>
                        </div>
                        
                        <h4 class="small font-weight-bold">Out of Stock <span class="float-right">
                            <fmt:formatNumber value="${stats.outOfStockProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}" pattern="0.0" />%
                        </span></h4>
                        <div class="progress mb-4">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: ${stats.outOfStockProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}%"></div>
                        </div>
                        
                        <h4 class="small font-weight-bold">Total Inventory: ${stats.totalStock} items</h4>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Low stock alerts and coupon stats -->
        <div class="row">
            <div class="col-xl-6 col-lg-6">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Low Stock Alerts</h6>
                    </div>
                    <div class="card-body">
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
                                    <c:forEach items="${stats.lowStockProducts}" var="product">
                                        <tr>
                                            <td>${product.productId}</td>
                                            <td>${product.productName}</td>
                                            <td>${product.size}</td>
                                            <td>${product.color}</td>
                                            <td>
                                                <span class="badge bg-danger">${product.stockQuantity}</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty stats.lowStockProducts}">
                                        <tr>
                                            <td colspan="5" class="text-center">No low stock products</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-xl-6 col-lg-6">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Coupon Usage</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Coupon Code</th>
                                        <th>Usage Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${stats.couponUsage}" var="coupon">
                                        <tr>
                                            <td>${coupon.key}</td>
                                            <td>${coupon.value}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty stats.couponUsage}">
                                        <tr>
                                            <td colspan="2" class="text-center">No coupon usage data</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="row mt-4">
                            <div class="col-md-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Total Coupons</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${stats.totalCoupons}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    Active Coupons</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${stats.activeCoupons}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Expired Coupons</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${stats.expiredCoupons}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Content Management Stats -->
        <div class="row">
            <div class="col-xl-6 col-lg-6">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Content Management</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h5>Posts</h5>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: ${stats.publishedPosts / (stats.totalPosts == 0 ? 1 : stats.totalPosts) * 100}%">
                                        <span>Published (${stats.publishedPosts})</span>
                                    </div>
                                </div>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: ${stats.draftPosts / (stats.totalPosts == 0 ? 1 : stats.totalPosts) * 100}%">
                                        <span>Draft (${stats.draftPosts})</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h5>Sliders</h5>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: ${stats.activeSliders / (stats.totalSliders == 0 ? 1 : stats.totalSliders) * 100}%">
                                        <span>Active (${stats.activeSliders})</span>
                                    </div>
                                </div>
                                <div class="progress mb-4">
                                    <div class="progress-bar bg-secondary" role="progressbar" style="width: ${(stats.totalSliders - stats.activeSliders) / (stats.totalSliders == 0 ? 1 : stats.totalSliders) * 100}%">
                                        <span>Inactive (${stats.totalSliders - stats.activeSliders})</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>
</div> <!-- End of main-content -->
    <!-- Include footer -->
    <jsp:include page="../common/footer.jsp" />

    <!-- JavaScript for charts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // New Customers Chart
        var newCustomersChartContext = document.getElementById('newCustomersChart').getContext('2d');
        var newCustomersChart = new Chart(newCustomersChartContext, {
            type: 'line',
            data: {
                labels: [
                    <c:forEach items="${stats.newCustomersByDay}" var="entry" varStatus="status">
                        '<fmt:formatDate value="${entry.key}" pattern="dd MMM" />',
                    </c:forEach>
                ],
                datasets: [{
                    label: 'New Customers',
                    data: [
                        <c:forEach items="${stats.newCustomersByDay}" var="entry" varStatus="status">
                            ${entry.value},
                        </c:forEach>
                    ],
                    lineTension: 0.3,
                    backgroundColor: 'rgba(78, 115, 223, 0.05)',
                    borderColor: 'rgba(78, 115, 223, 1)',
                    pointRadius: 3,
                    pointBackgroundColor: 'rgba(78, 115, 223, 1)',
                    pointBorderColor: 'rgba(78, 115, 223, 1)',
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: 'rgba(78, 115, 223, 1)',
                    pointHoverBorderColor: 'rgba(78, 115, 223, 1)',
                    pointHitRadius: 10,
                    pointBorderWidth: 2
                }]
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    y: {
                        ticks: {
                            stepSize: 1
                        },
                        beginAtZero: true
                    }
                },
                plugins: {
                    title: {
                        display: true,
                        text: 'New Customer Registrations'
                    },
                    tooltip: {
                        callbacks: {
                            title: function(tooltipItems) {
                                return tooltipItems[0].label;
                            },
                            label: function(context) {
                                return 'New customers: ' + context.raw;
                            }
                        }
                    }
                }
            }
        });
        
        // Feedback Distribution Chart
        document.addEventListener('DOMContentLoaded', function() {
    var feedbackChartContext = document.getElementById('feedbackChart').getContext('2d'); 
    var feedbackChart = new Chart(feedbackChartContext, { 
        type: 'pie', 
        data: { 
            labels: ['1 Star', '2 Stars', '3 Stars', '4 Stars', '5 Stars'], 
            datasets: [{ 
                data: [ 
                    ${stats.feedbackByRating[1] != null ? stats.feedbackByRating[1] : 0}, 
                    ${stats.feedbackByRating[2] != null ? stats.feedbackByRating[2] : 0}, 
                    ${stats.feedbackByRating[3] != null ? stats.feedbackByRating[3] : 0}, 
                    ${stats.feedbackByRating[4] != null ? stats.feedbackByRating[4] : 0}, 
                    ${stats.feedbackByRating[5] != null ? stats.feedbackByRating[5] : 0} 
                ], 
                backgroundColor: [ 
                    '#e74a3b', // Red - 1 Star 
                    '#f6c23e', // Yellow - 2 Stars 
                    '#36b9cc', // Info - 3 Stars 
                    '#4e73df', // Primary - 4 Stars 
                    '#1cc88a'  // Success - 5 Stars 
                ], 
                hoverBackgroundColor: [ 
                    '#be3d30', 
                    '#dda20a', 
                    '#2c9faf', 
                    '#2e59d9', 
                    '#17a673' 
                ], 
                hoverBorderColor: 'rgba(234, 236, 244, 1)' 
            }] 
        }, 
        options: { 
            maintainAspectRatio: false, 
            plugins: { 
                legend: { 
                    position: 'bottom' 
                } 
            } 
        } 
    });
});
        
        // Products by Category Chart
        // Products by Category Chart - Fix rendering issues
document.addEventListener("DOMContentLoaded", function() {
    // Get the canvas element
    var ctx = document.getElementById("productsByCategoryChart");
    
    if (!ctx) {
        console.error("Cannot find canvas element 'productsByCategoryChart'");
        return;
    }
    
    // Make sure we get the 2D context
    var context = ctx.getContext("2d");
    
    // Data that matches what's shown in the legend
    var labels = ["Quần áo nam", "Phụ kiện", "Quần áo nữ", "Quần áo trẻ em", "Giày dép"];
    var data = [8, 7, 6, 5, 4];
    var backgroundColors = ["#36b9cc", "#4e73df", "#f6c23e", "#1cc88a", "#d65b4f"];
    
    // Create the chart with explicit height and width settings
    var productChart = new Chart(context, {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                data: data,
                backgroundColor: backgroundColors,
                borderColor: "#ffffff",
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false // Hide default legend since we have custom legend below
                },
                tooltip: {
                    enabled: true
                }
            },
            animation: {
                duration: 1000 // Add animation for better rendering visibility
            }
        }
    });
    
    // Debug information to verify chart creation
    console.log("Chart created:", productChart);
});

// Add this to the end of your script section to ensure the container has proper height
document.addEventListener("DOMContentLoaded", function() {
    // Set explicit height for chart container
    var chartContainer = document.querySelector(".card-body div[style='position: relative; height: 350px; width: 100%;']");
    if (chartContainer) {
        chartContainer.style.height = "350px";
        chartContainer.style.width = "100%";
        console.log("Chart container size set");
    }
});

    </script>
</body>
</html>