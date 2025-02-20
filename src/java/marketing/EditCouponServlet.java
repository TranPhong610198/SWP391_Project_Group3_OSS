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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author nguye
 */
@WebServlet(name = "EditCouponServlet", urlPatterns = {"/marketing/editCoupon"})
public class EditCouponServlet extends HttpServlet {

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
            out.println("<title>Servlet EditCouponServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCouponServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CouponDAO couponDAO = new CouponDAO();
        Coupon coupon = couponDAO.getCouponById(id);

        if (coupon != null) {
            request.setAttribute("coupon", coupon);
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Coupon not found");
            request.setAttribute("messageType", "danger");
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String code = request.getParameter("code");
            String discountType = request.getParameter("discount_type");
            String discountValueStr = request.getParameter("discount_value");
            String minOrderAmountStr = request.getParameter("min_order_amount");
            String maxDiscountStr = request.getParameter("max_discount");
            String usageLimitStr = request.getParameter("usage_limit");
            String expiryDateStr = request.getParameter("expiry_date");
            String status = request.getParameter("status") != null ? "active" : "inactive";

            StringBuilder errorMessages = new StringBuilder();

            Coupon coupon = new Coupon();
            coupon.setId(id);
            coupon.setCode(code);
            coupon.setDiscount_type(discountType);
            coupon.setDiscount_value(Double.parseDouble(discountValueStr));
            coupon.setMin_order_amount(Double.parseDouble(minOrderAmountStr));
            coupon.setUsage_limit(Integer.parseInt(usageLimitStr));
            if ("percentage".equals(discountType)) {
                coupon.setMax_discount(Double.parseDouble(maxDiscountStr));
            }
            coupon.setExpiry_date(java.sql.Date.valueOf(expiryDateStr));
            coupon.setStatus(status);

            CouponDAO couponDAO = new CouponDAO();
            // Validate coupon code
            if (code == null || code.trim().isEmpty() || !code.matches("^[A-Za-z0-9_]+$") || code.length() > 20) {
                errorMessages.append("Mã giảm giá không hợp lệ. Phải chứa chữ cái, số và dấu gạch dưới, không quá 20 ký tự.<br>");
            } else {
                Coupon existingCoupon = couponDAO.getCouponById(id);
                if (couponDAO.isCouponCodeExists(code) && !existingCoupon.getCode().equals(code)) {
                    errorMessages.append("Mã giảm giá đã tồn tại.<br>");
                }
            }

            // Validate discount value
            double discountValue = Double.parseDouble(discountValueStr);
            if ("percentage".equals(discountType) && (discountValue <= 0 || discountValue > 100)) {
                errorMessages.append("Giá trị giảm giá theo phần trăm phải nằm trong khoảng 1-100%.<br>");
            } else if ("fixed".equals(discountType) && discountValue <= 0) {
                errorMessages.append("Giá trị giảm giá cố định ít nhất là 1.000đ.<br>");
            }

            // Nếu có lỗi, set attribute và forward về trang edit
            if (errorMessages.length() > 0) {
                request.setAttribute("error", errorMessages.toString());
                request.setAttribute("coupon", coupon); // Lưu lại giá trị đã nhập
                request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
                return;
            }

            // Nếu không có lỗi, thực hiện cập nhật
            boolean updated = couponDAO.updateCoupon(coupon);

            if (updated) {
                response.sendRedirect("couponlist?success=edit");
            } else {
                request.setAttribute("error", "Không thể cập nhật mã giảm giá. Vui lòng thử lại.");
                request.setAttribute("coupon", coupon);
                request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            // Lấy lại coupon gốc để hiển thị form
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                CouponDAO couponDAO = new CouponDAO();
                Coupon originalCoupon = couponDAO.getCouponById(id);
                request.setAttribute("coupon", originalCoupon);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
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
