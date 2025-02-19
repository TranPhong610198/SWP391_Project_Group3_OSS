/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.CouponDAO;
import entity.Coupon;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddCouponServlet", urlPatterns = {"/marketing/addCoupon"})
public class AddCouponServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCouponServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCouponServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        Map<String, String> errors = new HashMap<>();
        CouponDAO couponDAO = new CouponDAO();
        
        // Validate code
        String code = request.getParameter("code");
        if (code == null || code.trim().isEmpty()) {
            errors.put("code", "Vui lòng nhập mã giảm giá");
        } else if (!code.matches("^[A-Za-z0-9_]+$")) {
            errors.put("code", "Mã giảm giá chỉ được chứa chữ cái, số và dấu gạch dưới");
        } else if (code.length() > 20) {
            errors.put("code", "Mã giảm giá không được quá 20 ký tự");
        } else if (couponDAO.isCouponCodeExists(code)) {
            errors.put("code", "Mã giảm giá đã tồn tại");
        }

        // Validate discount type
        String discountType = request.getParameter("discount_type");
        if (discountType == null || (!discountType.equals("percentage") && !discountType.equals("fixed"))) {
            errors.put("discount_type", "Vui lòng chọn loại giảm giá hợp lệ");
        }

        // Validate discount value
        String discountValueStr = request.getParameter("discount_value");
        double discountValue = 0;
        if (discountValueStr == null || discountValueStr.trim().isEmpty()) {
            errors.put("discount_value", "Vui lòng nhập giá trị giảm giá");
        } else {
            try {
                discountValue = Double.parseDouble(discountValueStr);
                if (discountType.equals("percentage")) {
                    if (discountValue <= 0 || discountValue > 100) {
                        errors.put("discount_value", "Phần trăm giảm giá phải từ 1 đến 100");
                    }
                } else {
                    if (discountValue <= 0) {
                        errors.put("discount_value", "Giá trị giảm phải lớn hơn 0");
                    }
                }
            } catch (NumberFormatException e) {
                errors.put("discount_value", "Giá trị giảm không hợp lệ");
            }
        }

        // Validate minimum order amount
        String minOrderStr = request.getParameter("min_order_amount");
        double minOrderAmount = 0;
        if (minOrderStr != null && !minOrderStr.trim().isEmpty()) {
            try {
                minOrderAmount = Double.parseDouble(minOrderStr);
                if (minOrderAmount < 0) {
                    errors.put("min_order_amount", "Giá trị đơn hàng tối thiểu không được âm");
                }
            } catch (NumberFormatException e) {
                errors.put("min_order_amount", "Giá trị đơn hàng tối thiểu không hợp lệ");
            }
        }

        // Validate max discount (for percentage type)
        String maxDiscountStr = request.getParameter("max_discount");
        double maxDiscount = 0;
        if (discountType.equals("percentage")) {
            if (maxDiscountStr == null || maxDiscountStr.trim().isEmpty()) {
                errors.put("max_discount", "Vui lòng nhập giá trị giảm tối đa cho mã giảm theo phần trăm");
            } else {
                try {
                    maxDiscount = Double.parseDouble(maxDiscountStr);
                    if (maxDiscount <= 0) {
                        errors.put("max_discount", "Giá trị giảm tối đa phải lớn hơn 0");
                    }
                } catch (NumberFormatException e) {
                    errors.put("max_discount", "Giá trị giảm tối đa không hợp lệ");
                }
            }
        }

        // Validate usage limit
        String usageLimitStr = request.getParameter("usage_limit");
        int usageLimit = 0;
        if (usageLimitStr != null && !usageLimitStr.trim().isEmpty()) {
            try {
                usageLimit = Integer.parseInt(usageLimitStr);
                if (usageLimit < 0) {
                    errors.put("usage_limit", "Số lần sử dụng không được âm");
                }
            } catch (NumberFormatException e) {
                errors.put("usage_limit", "Số lần sử dụng không hợp lệ");
            }
        }

        // Validate expiry date
        String expiryDateStr = request.getParameter("expiry_date");
        java.sql.Date expiryDate = null;
        if (expiryDateStr == null || expiryDateStr.trim().isEmpty()) {
            errors.put("expiry_date", "Vui lòng chọn ngày hết hạn");
        } else {
            try {
                expiryDate = java.sql.Date.valueOf(expiryDateStr);
                java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
                if (expiryDate.before(currentDate)) {
                    errors.put("expiry_date", "Ngày hết hạn phải sau ngày hiện tại");
                }
            } catch (IllegalArgumentException e) {
                errors.put("expiry_date", "Ngày hết hạn không hợp lệ");
            }
        }

        // Xử lý status
        String status = request.getParameter("status") != null ? "active" : "inactive";

        // Nếu có lỗi, trả về form với thông báo lỗi
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            // Lưu lại các giá trị đã nhập
            request.setAttribute("couponData", request.getParameterMap());
            request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
            return;
        }

        // Nếu không có lỗi, tạo và lưu coupon
        java.sql.Date createdAt = new java.sql.Date(System.currentTimeMillis());
        Coupon coupon = new Coupon(0, code, discountType, discountValue, minOrderAmount, 
            maxDiscount, usageLimit, 0, expiryDate, createdAt, status);

        if (couponDAO.addCoupon(coupon)) {
            response.sendRedirect("couponlist?success=true");
        } else {
            request.setAttribute("error", "Không thể thêm mã giảm giá. Vui lòng thử lại.");
            request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
        request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
    }
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
