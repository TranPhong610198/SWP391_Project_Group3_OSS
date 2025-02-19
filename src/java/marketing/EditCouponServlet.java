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
@WebServlet(name="EditCouponServlet", urlPatterns={"/marketing/editCoupon"})
public class EditCouponServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<h1>Servlet EditCouponServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String discountType = request.getParameter("discount_type");
        double discountValue = Double.parseDouble(request.getParameter("discount_value"));
        Double minOrderAmount = null;
        if (request.getParameter("min_order_amount") != null && !request.getParameter("min_order_amount").isEmpty()) {
            minOrderAmount = Double.valueOf(request.getParameter("min_order_amount"));
        }
        Double maxDiscount = null;
        if (request.getParameter("max_discount") != null && !request.getParameter("max_discount").isEmpty()) {
            maxDiscount = Double.valueOf(request.getParameter("max_discount"));
        }
        Integer usageLimit = null;
        if (request.getParameter("usage_limit") != null && !request.getParameter("usage_limit").isEmpty()) {
            usageLimit = Integer.valueOf(request.getParameter("usage_limit"));
        }

        String expiryDateStr = request.getParameter("expiry_date");
        Date expiryDate = null;
        if (expiryDateStr != null && !expiryDateStr.isEmpty()) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = sdf.parse(expiryDateStr);
                expiryDate = new Date(date.getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        String status = request.getParameter("status");

        Coupon coupon = new Coupon();
        coupon.setId(id);
        coupon.setCode(code);
        coupon.setDiscount_type(discountType);
        coupon.setDiscount_value(discountValue);
        if (minOrderAmount != null) {
            coupon.setMin_order_amount(minOrderAmount);
        }
        if (maxDiscount != null) {
            coupon.setMax_discount(maxDiscount);
        }
        if (usageLimit != null) {
            coupon.setUsage_limit(usageLimit);
        }
        coupon.setExpiry_date((java.sql.Date) expiryDate);
        coupon.setStatus(status);


        CouponDAO couponDAO = new CouponDAO();
        boolean updated = couponDAO.updateCoupon(coupon);

        if (updated) {
            request.setAttribute("message", "Coupon updated successfully");
            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Failed to update coupon");
            request.setAttribute("messageType", "danger");
        }
        request.getRequestDispatcher("/marketing/coupon/editCoupon.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
