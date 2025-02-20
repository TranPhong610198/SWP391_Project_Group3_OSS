<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer bg-dark text-light py-4">
    <div class="container">
        <div class="row">
            <!-- Company Info Column -->
            <div class="col-md-3 mb-4 mb-md-0">
                <h5 class="mb-3 footer-heading">Thông tin công ty</h5>
                <div class="footer-content">
                    <c:forEach items="${companyInfo}" var="item">
                        <c:if test="${item.status == 'active'}">
                            <c:choose>
                                <c:when test="${item.type == 'logo' && item.image != null}">
                                    <div class="footer-logo mb-3">
                                        <img src="${pageContext.request.contextPath}${item.image}" 
                                             alt="${item.fieldName}" class="img-fluid" style="max-height: 60px;">
                                    </div>
                                </c:when>
                                <c:when test="${item.type == 'text'}">
                                    <p class="mb-2"><strong>${item.fieldName}:</strong> ${item.value}</p>
                                </c:when>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <!-- Quick Links Column -->
            <div class="col-md-3 mb-4 mb-md-0">
                <h5 class="mb-3 footer-heading">Liên kết nhanh</h5>
                <div class="footer-content">
                    <ul class="list-unstyled">
                        <c:forEach items="${quickLinks}" var="link">
                            <c:if test="${link.status == 'active'}">
                                <li class="mb-2">
                                    <a href="${link.value}" class="text-light text-decoration-none hover-link">
                                        <i class="fas fa-angle-right me-2"></i>${link.fieldName}
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <!-- Contact Info Column -->
            <div class="col-md-3">
                <h5 class="mb-3 footer-heading">Liên hệ</h5>
                <div class="footer-content">
                    <c:forEach items="${contactInfo}" var="contact">
                        <c:if test="${contact.status == 'active'}">
                            <c:choose>
                                <c:when test="${contact.type == 'email'}">
                                    <p class="mb-2">
                                        <i class="fas fa-envelope me-2"></i>
                                        <a href="mailto:${contact.value}" class="text-light text-decoration-none hover-link">
                                            ${contact.value}
                                        </a>
                                    </p>
                                </c:when>
                                <c:when test="${contact.type == 'phone'}">
                                    <p class="mb-2">
                                        <i class="fas fa-phone-alt me-2"></i>
                                        <a href="tel:${contact.value}" class="text-light text-decoration-none hover-link">
                                            ${contact.value}
                                        </a>
                                    </p>
                                </c:when>
                                <c:when test="${contact.type == 'address'}">
                                    <p class="mb-2">
                                        <i class="fas fa-map-marker-alt me-2"></i>${contact.value}
                                    </p>
                                </c:when>
                            </c:choose>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <!-- Google Map Column -->
            <div class="col-md-3">
                <h5 class="mb-3 footer-heading">Địa chỉ shop</h5>
                <div class="footer-map">
                    <iframe 
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3131.5658496875026!2d105.53028539866351!3d21.02946918218991!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134598cba855fa3%3A0xa996e7fddd39b07f!2zTmjDoCB0cuG7jSBNaW5oIFF1w6Ju!5e0!3m2!1sen!2s!4v1740045314800!5m2!1sen!2s" 
                        width="100%" 
                        height="200" 
                        style="border:0; border-radius:8px;"
                        allowfullscreen 
                        loading="lazy" 
                        referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>

        </div>
    </div>
</footer>


<style>
    .footer {
        background-color: #212529;
    }

    .footer-heading {
        color: #fff;
        font-weight: 600;
        position: relative;
        padding-bottom: 10px;
    }

    .footer-heading:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 50px;
        height: 2px;
        background-color: #3498db;
    }

    .hover-link:hover {
        color: #3498db !important;
        text-decoration: underline !important;
    }

    .payment-icon {
        filter: brightness(0) invert(1);
        transition: all 0.3s;
    }

    .payment-icon:hover {
        filter: brightness(1) invert(0);
    }
    .footer-map {
        width: 100%;
        height: 200px;
        border-radius: 8px;
    }

</style>

