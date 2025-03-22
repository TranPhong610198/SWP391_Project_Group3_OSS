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
                <form class="row g-3 justify-content-end" method="get" action="${pageContext.request.contextPath}/marketing/dashboard">
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
        <!-- Thay thế phần Summary stats cards hiện tại bằng code này -->
<div class="row mb-4">
    <!-- Total Products -->
    <div class="col-xl-4 col-md-4 mb-4">
        <div class="card shadow h-100 py-3" style="border-left: 4px solid #4e73df;">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-sm font-weight-bold text-primary text-uppercase mb-2">
                            Total Products
                        </div>
                        <div class="h4 mb-0 font-weight-bold text-gray-800">${stats.totalProducts}</div>
                        <div class="mt-3 small">
                            <div class="text-xs text-success">
                                <i class="fas fa-check-circle mr-1"></i>Active: ${stats.activeProducts}
                            </div>
                            <div class="text-xs text-danger">
                                <i class="fas fa-exclamation-circle mr-1"></i>Out of Stock: ${stats.outOfStockProducts}
                            </div>
                            <div class="text-xs text-secondary">
                                <i class="fas fa-minus-circle mr-1"></i>Inactive: ${stats.totalProducts - stats.activeProducts - stats.outOfStockProducts}
                            </div>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="bi bi-box-seam fa-3x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Total Customers -->
    <div class="col-xl-4 col-md-4 mb-4">
        <div class="card shadow h-100 py-3" style="border-left: 4px solid #1cc88a;">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-sm font-weight-bold text-success text-uppercase mb-2">
                            Total Customers
                        </div>
                        <div class="h4 mb-0 font-weight-bold text-gray-800">${stats.totalCustomers}</div>
                        <div class="mt-3 small">
                            <div class="text-xs text-success">
                                <i class="fas fa-user-check mr-1"></i>Active: ${stats.activeCustomers}
                            </div>
                            <div class="text-xs text-secondary">
                                <i class="fas fa-user-slash mr-1"></i>Inactive: ${stats.inactiveCustomers}
                            </div>
                            <div class="text-xs text-warning">
                                <i class="fas fa-user-clock mr-1"></i>Pending: ${stats.pendingCustomers}
                            </div>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="bi bi-people fa-3x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Average Rating -->
    <div class="col-xl-4 col-md-4 mb-4">
        <div class="card shadow h-100 py-3" style="border-left: 4px solid #f6c23e;">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-sm font-weight-bold text-warning text-uppercase mb-2">
                            Average Rating
                        </div>
                        <div class="h4 mb-0 font-weight-bold text-gray-800">
                            <fmt:formatNumber value="${stats.averageRating}" pattern="0.0" /> / 5.0
                        </div>
                        <div class="mt-3">
                            <div class="progress" style="height: 10px;">
                                <div class="progress-bar bg-warning" role="progressbar" 
                                     style="width: ${(stats.averageRating / 5) * 100}%;" 
                                     aria-valuenow="${stats.averageRating}" 
                                     aria-valuemin="0" 
                                     aria-valuemax="5">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="bi bi-star-fill fa-3x text-gray-300"></i>
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
            <div style="position: relative; height: 300px; width: 100%;">
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
            
                <h4 class="small font-weight-bold">Inactive Products <span class="float-right">
                        <fmt:formatNumber value="${stats.inactiveProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}" pattern="0.0" />%
                    </span></h4>
                <div class="progress mb-4">
                    <div class="progress-bar bg-secondary" role="progressbar" style="width: ${stats.inactiveProducts / (stats.totalProducts == 0 ? 1 : stats.totalProducts) * 100}%"></div>
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
                            <th>Usage (Used/Limit)</th>
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
    <div class="col-md-3">
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
    <div class="col-md-3">
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
    <div class="col-md-3">
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
    <div class="col-md-3">
        <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                            Inactive Coupons</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">${stats.inactiveCoupons}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
            
            <!-- Coupon Expiration Chart -->
            <div class="mt-4">
                <h6 class="m-0 font-weight-bold text-primary mb-3">Coupon Expiration Timeline</h6>
                <div class="chart-bar">
                    <canvas id="couponExpirationChart"></canvas>
                </div>
                <script>
                    // Create coupon expiration chart
                    document.addEventListener("DOMContentLoaded", function() {
                        var ctx = document.getElementById("couponExpirationChart");
                        var expirationLabels = [];
                        var expirationData = [];
                        
                        <c:forEach items="${stats.couponExpirations}" var="expiration">
                            expirationLabels.push("${expiration.key}");
                            expirationData.push(${expiration.value});
                        </c:forEach>
                        
                        var myBarChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: expirationLabels,
                                datasets: [{
                                    label: "Coupons",
                                    backgroundColor: "#4e73df",
                                    hoverBackgroundColor: "#2e59d9",
                                    borderColor: "#4e73df",
                                    data: expirationData,
                                }],
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        ticks: {
                                            precision: 0
                                        }
                                    }
                                }
                            }
                        });
                    });
                </script>
            </div>
        </div>
    </div>
</div>
        </div>
        
        <!-- Content Management Stats -->
        <div class="col-xl-6 col-lg-6">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Content Management</h6>
        </div>
        <div class="card-body">
            <div class="row">
                <!-- Posts Chart -->
                <div class="col-md-6">
                    <div class="text-center mb-3">
                        <h5 class="font-weight-bold">Posts</h5>
                    </div>
                    <div style="position: relative; height: 200px; width: 100%;">
                        <canvas id="postsChart"></canvas>
                    </div>
                    <div class="mt-3 text-center small">
                        <span class="mr-2">
                            <i class="fas fa-circle text-success"></i> Published: ${stats.publishedPosts}
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-warning"></i> Draft: ${stats.draftPosts}
                        </span>
                    </div>
                </div>

                <!-- Sliders Chart -->
                <div class="col-md-6">
                    <div class="text-center mb-3">
                        <h5 class="font-weight-bold">Sliders</h5>
                    </div>
                    <div style="position: relative; height: 200px; width: 100%;">
                        <canvas id="slidersChart"></canvas>
                    </div>
                    <div class="mt-3 text-center small">
                        <span class="mr-2">
                            <i class="fas fa-circle text-info"></i> Active: ${stats.activeSliders}
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-secondary"></i> Inactive: ${stats.totalSliders - stats.activeSliders}
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    </div>
</div> <!-- End of main-content -->

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
        
        document.addEventListener('DOMContentLoaded', function() {
    var feedbackChartContext = document.getElementById('feedbackChart').getContext('2d');
    
    // Create an array of ratings from the server data
    var feedbackData = [];
    <c:forEach begin="1" end="5" var="rating">
        feedbackData.push(${feedbackByRating[rating] != null ? feedbackByRating[rating] : 0});
    </c:forEach>
    
    // Debug data
    console.log("Feedback Ratings for Chart:", feedbackData);
    
    // Check if we have any data
    var hasData = feedbackData.some(value => value > 0);
    
    if (!hasData) {
        // Show message if no data available
        var chartContainer = document.getElementById('feedbackChart').parentElement;
        chartContainer.innerHTML = '<p class="text-center text-muted">No feedback data available</p>';
    } else {
        // Initialize bar chart
        var feedbackChart = new Chart(feedbackChartContext, {
            type: 'bar',
            data: {
                labels: ['1 Star', '2 Stars', '3 Stars', '4 Stars', '5 Stars'],
                datasets: [{
                    label: 'Number of Feedback',
                    data: feedbackData,
                    backgroundColor: [
                        '#e74a3b', // 1 Star
                        '#f6c23e', // 2 Stars
                        '#36b9cc', // 3 Stars
                        '#4e73df', // 4 Stars
                        '#1cc88a'  // 5 Stars
                    ],
                    hoverBackgroundColor: [
                        '#be3d30',
                        '#dda20a',
                        '#2c9faf',
                        '#2e59d9',
                        '#17a673'
                    ],
                    borderWidth: 1,
                    borderColor: '#ffffff'
                }]
            },
            options: {
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1,
                            precision: 0
                        },
                        title: {
                            display: true,
                            text: 'Number of Feedback'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Rating'
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: false // Hide default legend since we have custom one
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                var value = context.raw || 0;
                                return 'Feedback: ' + value;
                            }
                        }
                    }
                },
                animation: {
                    duration: 1000,
                    easing: 'easeOutQuart'
                }
            }
        });
    }
});

        
        // Products by Category Chart
document.addEventListener("DOMContentLoaded", function() {
    // Get the canvas element
    var ctx = document.getElementById("productsByCategoryChart");
    
    if (!ctx) {
        console.error("Cannot find canvas element 'productsByCategoryChart'");
        return;
    }
    
    // Create arrays for labels and data from server data
    var labels = [];
    var data = [];
    
    <c:forEach items="${productsByCategory}" var="category" varStatus="status">
        labels.push("${category.key}");
        data.push(${category.value});
    </c:forEach>
    
    console.log("Category labels:", labels);
    console.log("Category data:", data);
    
    // Color array for categories
    var backgroundColors = ["#36b9cc", "#4e73df", "#f6c23e", "#1cc88a", "#d65b4f", "#6f42c1", "#20c997"];
    
    // Create the chart with dynamic data
    var productChart = new Chart(ctx.getContext('2d'), {
        type: 'pie',
        data: {
            labels: labels,
            datasets: [{
                data: data,
                backgroundColor: backgroundColors.slice(0, labels.length),
                borderColor: "#ffffff",
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false // Hide default legend since we have custom one
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            var label = context.label || '';
                            var value = context.raw || 0;
                            return label + ': ' + value + ' products';
                        }
                    }
                }
            },
            animation: {
                duration: 1000
            }
        }
    });
    
    console.log("Products by Category Chart created:", productChart);
});

// Make sure container has proper height
document.addEventListener("DOMContentLoaded", function() {
    var chartContainer = document.querySelector(".card-body div[style='position: relative; height: 350px; width: 100%;']");
    if (chartContainer) {
        chartContainer.style.height = "350px";
        chartContainer.style.width = "100%";
    }
});

document.addEventListener('DOMContentLoaded', function() {
    var postsChartContext = document.getElementById('postsChart').getContext('2d');
    var postsChart = new Chart(postsChartContext, {
        type: 'doughnut',
        data: {
            labels: ['Published', 'Draft'],
            datasets: [{
                data: [${stats.publishedPosts}, ${stats.draftPosts}],
                backgroundColor: ['#1cc88a', '#f6c23e'],
                hoverBackgroundColor: ['#17a673', '#dda20a'],
                borderWidth: 2,
                borderColor: '#ffffff'
            }]
        },
        options: {
            maintainAspectRatio: false,
            cutout: '60%',
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            var label = context.label || '';
                            var value = context.raw || 0;
                            return label + ': ' + value;
                        }
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            }
        }
    });

    // Sliders Chart
    var slidersChartContext = document.getElementById('slidersChart').getContext('2d');
    var slidersChart = new Chart(slidersChartContext, {
        type: 'doughnut',
        data: {
            labels: ['Active', 'Inactive'],
            datasets: [{
                data: [${stats.activeSliders}, ${stats.totalSliders - stats.activeSliders}],
                backgroundColor: ['#36b9cc', '#858796'],
                hoverBackgroundColor: ['#2c9faf', '#6e707e'],
                borderWidth: 2,
                borderColor: '#ffffff'
            }]
        },
        options: {
            maintainAspectRatio: false,
            cutout: '60%',
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            var label = context.label || '';
                            var value = context.raw || 0;
                            return label + ': ' + value;
                        }
                    }
                }
            },
            animation: {
                animateScale: true,
                animateRotate: true
            }
        }
    });
});
    </script>
</body>
</html>