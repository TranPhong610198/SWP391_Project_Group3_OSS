package marketing;

import DAO.SliderDAO;
import entity.Slider;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SliderListServlet", urlPatterns = {"/marketing/sliderList"})
public class SliderListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = 1;
        int pageSize = 10;
        String search = request.getParameter("search");
        String status = request.getParameter("status");

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        SliderDAO sliderDAO = new SliderDAO();
        List<Slider> sliders = sliderDAO.getAllSliders(page, pageSize, search, status);

        int totalSliders = sliders.size();
        int totalPages = (int) Math.ceil((double) totalSliders / pageSize);

        request.setAttribute("sliders", sliders);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/marketing/slider/sliderlist.jsp").forward(request, response);
    }
}
