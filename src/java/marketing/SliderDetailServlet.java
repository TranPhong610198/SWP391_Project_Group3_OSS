package marketing;

import DAO.SliderDAO;
import entity.Slider;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SliderDetailServlet", urlPatterns = {"/marketing/sliderDetail"})
public class SliderDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sliderIdParam = request.getParameter("id");
        if (sliderIdParam != null) {
            try {
                int sliderId = Integer.parseInt(sliderIdParam);
                SliderDAO sliderDAO = new SliderDAO();
                Slider slider = sliderDAO.getSliderById(sliderId);
                
                if (slider != null) {
                    request.setAttribute("slider", slider);
                    request.getRequestDispatcher("/marketing/slider/sliderdetail.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("sliderList");
    }
}
