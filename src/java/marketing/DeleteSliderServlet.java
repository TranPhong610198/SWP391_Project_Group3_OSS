package marketing;

import DAO.SliderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteSliderServlet", urlPatterns = {"/marketing/deleteSlider"})
public class DeleteSliderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int sliderId = Integer.parseInt(idParam);
                SliderDAO sliderDAO = new SliderDAO();
                boolean isDeleted = sliderDAO.deleteSlider(sliderId);
                if (isDeleted) {
                    request.setAttribute("message", "Xóa slider thành công!");
                } else {
                    request.setAttribute("error", "Không tìm thấy slider để xóa!");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "ID không hợp lệ!");
            }
        } else {
            request.setAttribute("error", "Thiếu ID slider!");
        }
        response.sendRedirect("sliderList");
    }
}
