package marketing;

import DAO.SliderDAO;
import entity.Slider;
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

@WebServlet(name = "AddSliderServlet", urlPatterns = {"/marketing/addSlider"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 15
)
public class AddSliderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String backlink = request.getParameter("backlink");
        String status = request.getParameter("status");
        String note = request.getParameter("note");
        Date createdAt = new Date(System.currentTimeMillis());
        
        Part filePart = request.getPart("image");
        String imagePath = "";
        if (filePart != null && filePart.getSize() > 0) {
            String uploadPath = request.getServletContext().getRealPath("") + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            filePart.write(uploadPath + File.separator + fileName);
            imagePath = "uploads/" + fileName;
        }
        
        Slider slider = new Slider(0, title, imagePath, backlink, status, note, createdAt, createdAt);
        SliderDAO sliderDAO = new SliderDAO();
        boolean isAdded = sliderDAO.addSlider(slider);
        
        if (isAdded) {
            response.sendRedirect("sliderList");
        } else {
            request.setAttribute("error", "Thêm slider thất bại!");
            request.getRequestDispatcher("/marketing/slider/sliderform.jsp").forward(request, response);
        }
    }
}
