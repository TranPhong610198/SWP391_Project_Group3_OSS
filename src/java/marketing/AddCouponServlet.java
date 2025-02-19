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
import java.util.Date;

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
            CouponDAO couponDAO = new CouponDAO();
            
            String code = request.getParameter("code");
            String discountType = request.getParameter("discount_type");
            String discountValueStr = request.getParameter("discount_value");
            String minOrderAmountStr = request.getParameter("min_order_amount");
            String expiryDateStr = request.getParameter("expiry_date");
            String usageLimitStr = request.getParameter("usage_limit");
            String maxDiscountStr = request.getParameter("max_discount");
            
            StringBuilder errorMessages = new StringBuilder();

            // Validate coupon code
            if (code == null || code.trim().isEmpty() || !code.matches("^[A-Za-z0-9_]+$") || code.length() > 20) {
                errorMessages.append("Mã giảm giá không hợp lệ. Phải chứa chữ cái, số và dấu gạch dưới, không quá 20 ký tự.<br>");
            } else if (couponDAO.isCouponCodeExists(code)) {
                errorMessages.append("Mã giảm giá đã tồn tại.<br>");
            }

            // Validate discount value
            try {
                double discountValue = Double.parseDouble(discountValueStr);
                if ("percentage".equals(discountType) && (discountValue <= 0 || discountValue > 100)) {
                    errorMessages.append("Giá trị giảm giá theo phần trăm phải nằm trong khoảng 1-100%.<br>");
                } else if ("fixed".equals(discountType) && discountValue <= 0) {
                    errorMessages.append("Giá trị giảm giá cố định ít nhất là 1.000đ.<br>");
                }
            } catch (NumberFormatException e) {
                errorMessages.append("Giá trị giảm giá không hợp lệ.<br>");
            }
            
            if (errorMessages.length() == 0) {
                double discountValue = Double.parseDouble(discountValueStr);
                double minOrderAmount = Double.parseDouble(minOrderAmountStr);
                int usageLimit = Integer.parseInt(usageLimitStr);
                double maxDiscount = "percentage".equals(discountType) ? Double.parseDouble(maxDiscountStr) : 0;
                Date expiryDate = java.sql.Date.valueOf(expiryDateStr);
                String status = request.getParameter("status") != null ? "active" : "inactive";
                
                Coupon coupon = new Coupon(0, code, discountType, discountValue, minOrderAmount,
                        maxDiscount, usageLimit, 0, (java.sql.Date) expiryDate, new java.sql.Date(new Date().getTime()),
                        status);
                
                if (couponDAO.addCoupon(coupon)) {
                    response.sendRedirect("couponlist?success=true");
                    return;
                } else {
                    errorMessages.append("Không thể thêm mã giảm giá. Vui lòng thử lại.");
                }
            }
            
            request.setAttribute("error", errorMessages.toString());
            request.getRequestDispatcher("/marketing/coupon/addCoupon.jsp").forward(request, response);
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
