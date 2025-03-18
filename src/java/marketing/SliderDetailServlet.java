/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
package marketing;

import DAO.SliderDAO;
import entity.Slider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;

/**
 *
 * @author DELL
 */
@WebServlet(name = "SliderDetailServlet", urlPatterns = {"/marketing/detailSlider"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,    // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 15,   // 15 MB
    location = ""
)
public class SliderDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet SliderDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderDetailServlet at " + request.getContextPath() + "</h1>");
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
        String sId = request.getParameter("id");
        int sliderId;
        try {
            sliderId = Integer.parseInt(sId);
            SliderDAO sliderDAO = new SliderDAO();
            Slider slider = sliderDAO.getSliderById(sliderId);
            List<Integer> existingOrders = sliderDAO.getAllDisplayOrdersExcept(sliderId);
            request.setAttribute("existingOrders", existingOrders);

            request.setAttribute("slider", slider);
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
            response.sendRedirect("sliderList");
        }
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
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String oldImage = request.getParameter("old_image");
        String link = request.getParameter("link");
        int display_order = Integer.parseInt(request.getParameter("display_order"));
        String status = request.getParameter("status");
        String notes = request.getParameter("notes");

        SliderDAO sliderDAO = new SliderDAO();

        // Kiểm tra dữ liệu đầu vào
        if (title.isEmpty() || link.isEmpty() || notes == null || notes.isEmpty()) {
            request.setAttribute("error", "Tất cả các trường không được để trống.");
            Slider currentSlider = sliderDAO.getSliderById(id);
            request.setAttribute("slider", currentSlider);
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
            return;
        }

        // Lấy slider gốc để kiểm tra có thay đổi không
        Slider originalSlider = sliderDAO.getSliderById(id);

        // Kiểm tra thứ tự hiển thị trùng lặp - chỉ khi thứ tự hiển thị được thay đổi
        if (originalSlider.getDisplay_order() != display_order && sliderDAO.isDisplayOrderExists(display_order, id)) {
            request.setAttribute("error", "Thứ tự hiển thị đã tồn tại. Vui lòng chọn một thứ tự khác.");
            Slider currentSlider = sliderDAO.getSliderById(id);
            request.setAttribute("slider", currentSlider);
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
            return;
        }

        String image_url = oldImage; // Mặc định giữ lại ảnh cũ
        boolean imageChanged = false;

        try {
            Part imagePart = request.getPart("image");
            if (imagePart != null && imagePart.getSize() > 0) {
                imageChanged = true;
                String uploadPath = request.getServletContext().getRealPath("") + File.separator + "uploads/sliders/";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                if (oldImage != null && !oldImage.startsWith("http") && !oldImage.isEmpty()) {
                    String oldImagePath = request.getServletContext().getRealPath("") + File.separator + oldImage;
                    File oldFile = new File(oldImagePath);
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }
                String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
                String filePath = uploadPath + File.separator + fileName;

                imagePart.write(filePath);
                image_url = "uploads/sliders/" + fileName;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi tải hình ảnh lên: " + e.getMessage());
            Slider currentSlider = sliderDAO.getSliderById(id);
            request.setAttribute("slider", currentSlider);
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
            return;
        }

        // Kiểm tra có thay đổi nào không
        boolean hasChanges = !originalSlider.getTitle().equals(title)
                || imageChanged
                || !originalSlider.getLink().equals(link)
                || originalSlider.getDisplay_order() != display_order
                || !originalSlider.getStatus().equals(status)
                || !originalSlider.getNotes().equals(notes);

        // Nếu không có thay đổi, chuyển hướng về danh sách slider không hiển thị thông báo
        if (!hasChanges) {
            response.sendRedirect("sliderList");
            return;
        }

        // Tạo slider mới với thông tin đã cập nhật
        Slider slider = new Slider(id, title, image_url, link, status, display_order, notes);

        boolean isUpdated = sliderDAO.updateSlider(slider);

        if (isUpdated) {
            // Đặt thông báo thành công vào session và chuyển hướng về trang danh sách
            request.getSession().setAttribute("success", "Cập nhật thanh trượt thành công.");
            response.sendRedirect("sliderList");
        } else {
            // Nếu cập nhật thất bại, vẫn ở lại trang chi tiết và hiển thị thông báo lỗi
            Slider s = sliderDAO.getSliderById(id);
            request.setAttribute("slider", s);
            request.setAttribute("error", "Cập nhật thanh trượt thất bại.");
            request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
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