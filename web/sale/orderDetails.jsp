<%-- 
    Document   : orderDetails
    Created on : Mar 23, 2025, 2:19:33 AM
    Author     : tphon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết đơn hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <style>
            /* Sử dụng cùng style với listProducts.jsp */
            /* Copy toàn bộ phần <style> từ listProducts.jsp vào đây nếu cần */
        </style>
    </head>
    <body>
        <jsp:include page="sidebar.jsp" />
        <div class="main-content" style="margin-left: 250px; padding: 20px;">
            <div class="container-fluid p-4">
                <h2 class="page-title"><i class="fas fa-file-invoice me-2"></i>Chi tiết đơn hàng #${order.orderCode}</h2>

                <!-- Thông báo -->
                <c:if test="${param.alert == 'SSU'}">
                    <div class="alert alert-success">Cập nhật trạng thái thành công!</div>
                </c:if>
                <c:if test="${param.alert == 'ERR'}">
                    <div class="alert alert-danger">Có lỗi xảy ra khi cập nhật trạng thái!</div>
                </c:if>

                <!-- Thông tin đơn hàng -->
                <div class="card">
                    <div class="card-header">Thông tin đơn hàng</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>ID đơn hàng:</strong> ${order.id}</p>
                                <p><strong>Ngày đặt hàng:</strong> <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></p>
                                <p><strong>Tổng chi phí:</strong> <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></p>
                                <p><strong>Trạng thái:</strong> 
                                    <span class="status-badge bg-${order.status == 'completed' ? 'success' : order.status == 'cancelled' ? 'danger' : 'warning'}">
                                        <c:choose>
                                            <c:when test="${order.status == 'pending_pay'}">Chờ thanh toán</c:when>
                                            <c:when test="${order.status == 'pending'}">Chờ xử lý</c:when>
                                            <c:when test="${order.status == 'processing'}">Đang xử lý</c:when>
                                            <c:when test="${order.status == 'shipping'}">Đang giao</c:when>
                                            <c:when test="${order.status == 'completed'}">Hoàn thành</c:when>
                                            <c:when test="${order.status == 'returned'}">Hoàn trả</c:when>
                                            <c:when test="${order.status == 'cancelled'}">Đã hủy</c:when>
                                            <c:otherwise>${order.status}</c:otherwise>
                                        </c:choose>
                                    </span>
                                </p>
                            </div>
                            <div class="col-md-6">
                                <c:if test="${order.status == 'shipping' || order.status == 'completed' || order.status == 'returned' || order.status == 'cancelled'}">
                                    <div class="card">
                                        <div class="card-header">Thông tin vận chuyển</div>
                                        <div class="card-body">
                                            <p><strong>Đơn vị vận chuyển:</strong> ${order.shippingProvider}</p>
                                            <p><strong>Mã vận đơn:</strong> ${order.trackingNumber}</p>
                                        </div>
                                    </div>
                                </c:if>
                                <!-- Xử lý trạng thái -->
                                <c:choose>
                                    <c:when test="${order.status == 'pending_pay'}">
                                        <!-- Chờ thanh toán: Không hiển thị gì để chỉnh sửa -->
                                        <p><strong>Không thể chỉnh sửa trạng thái khi đang chờ thanh toán.</strong></p>
                                    </c:when>
                                    <c:when test="${order.status == 'pending'}">
                                        <!-- Chờ xử lý: Nút xác nhận và hủy -->
                                        <form method="POST" action="orderdetails" class="mb-2">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="processing">
                                            <button type="submit" class="btn btn-success"><i class="fas fa-check me-2"></i>Xác nhận đơn hàng</button>
                                        </form>
                                        <form method="POST" action="orderdetails">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="cancelled">
                                            <button type="submit" class="btn btn-danger"><i class="fas fa-times me-2"></i>Hủy đơn hàng</button>
                                        </form>
                                    </c:when>
                                    <c:when test="${order.status == 'processing'}">
                                        <!-- Đang xử lý: Nhập đơn vị vận chuyển và mã vận đơn -->
                                        <form method="POST" action="orderdetails">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="shipping">
                                            <div class="mb-2">
                                                <label><strong>Đơn vị vận chuyển:</strong></label>
                                                <input type="text" name="shippingProvider" class="form-control" required>
                                            </div>
                                            <div class="mb-2">
                                                <label><strong>Mã vận đơn:</strong></label>
                                                <input type="text" name="trackingNumber" class="form-control" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary"><i class="fas fa-save me-2"></i>Cập nhật</button>
                                        </form>
                                    </c:when>
                                    <c:when test="${order.status == 'shipping'}">
                                        <!-- Đang giao: Nút hoàn thành và hoàn trả -->
                                        <form method="POST" action="orderdetails" class="mb-2">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="completed">
                                            <button type="submit" class="btn btn-success"><i class="fas fa-check me-2"></i>Hoàn thành</button>
                                        </form>
                                        <form method="POST" action="orderdetails">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <input type="hidden" name="status" value="returned">
                                            <button type="submit" class="btn btn-warning"><i class="fas fa-undo me-2"></i>Hoàn trả</button>
                                        </form>
                                    </c:when>
                                    <c:when test="${order.status == 'completed' || order.status == 'returned' || order.status == 'cancelled'}">
                                        <!-- Hoàn thành, hoàn trả, đã hủy: Không hiển thị gì để chỉnh sửa -->
                                        <p><strong>Không thể chỉnh sửa trạng thái khi đơn hàng đã hoàn tất hoặc bị hủy.</strong></p>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Thông tin người nhận -->
                <div class="card">
                    <div class="card-header">Thông tin người nhận</div>
                    <div class="card-body">
                        <p><strong>Họ tên:</strong> ${order.recipientName}</p>
                        <p><strong>Giới tính:</strong> ${user != null ? user.gender : 'Không xác định'}</p>
                        <p><strong>Email:</strong> ${order.recipientEmail}</p>
                        <p><strong>Điện thoại:</strong> ${order.phone}</p>
                        <p><strong>Địa chỉ:</strong> ${order.address}</p>
                    </div>
                </div>

                <!-- Danh sách sản phẩm -->
                <div class="card">
                    <div class="card-header">Sản phẩm trong đơn hàng</div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Tên sản phẩm</th>
                                    <th>Kích thước</th>
                                    <th>Màu sắc</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${order.items}" var="item">
                                    <tr>
                                        <td>${item.productTitle}</td>
                                        <td>${item.size}</td>
                                        <td>${item.color}</td>
                                        <td>${item.quantity}</td>
                                        <td><fmt:formatNumber value="${item.productPrice}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Lịch sử cập nhật -->
                <div class="card">
                    <div class="card-header">Lịch sử cập nhật</div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Thời gian</th>
                                    <th>Người cập nhật</th>
                                    <th>Trạng thái</th>
                                    <th>Ghi chú</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${history}" var="entry">
                                    <tr>
                                        <td><fmt:formatDate value="${entry.updatedAt}" pattern="dd/MM/yyyy HH:mm"/></td>
                                        <td>${entry.updaterName}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${entry.status == 'pending_pay'}">Chờ thanh toán</c:when>
                                                <c:when test="${entry.status == 'pending'}">Chờ xử lý</c:when>
                                                <c:when test="${entry.status == 'processing'}">Đang xử lý</c:when>
                                                <c:when test="${entry.status == 'shipping'}">Đang giao</c:when>
                                                <c:when test="${entry.status == 'completed'}">Hoàn thành</c:when>
                                                <c:when test="${entry.status == 'returned'}">Hoàn trả</c:when>
                                                <c:when test="${entry.status == 'cancelled'}">Đã hủy</c:when>
                                                <c:otherwise>${entry.status}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${entry.notes}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>