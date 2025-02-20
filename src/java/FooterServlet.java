import DAO.FooterDAO;
import entity.Footer;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FooterServlet", urlPatterns = {"/footer-loader"})
public class FooterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FooterDAO footerDAO = new FooterDAO();
        
        // Lấy danh sách footer theo từng loại
        List<Footer> infoFooters = footerDAO.getAllFooters("info", "active", null, null);
        List<Footer> contactFooters = footerDAO.getAllFooters("contact", "active", null, null);
        List<Footer> socialFooters = footerDAO.getAllFooters("social", "active", null, null);
        
        // Lưu dữ liệu vào request attribute
        request.setAttribute("infoFooters", infoFooters);
        request.setAttribute("contactFooters", contactFooters);
        request.setAttribute("socialFooters", socialFooters);
        
        // Forward đến trang JSP
        request.getRequestDispatcher("/footer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
