import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import DAO.FooterDAO;

@WebFilter(urlPatterns = {"/*"})
public class FooterFilter implements Filter {
    
    private FooterDAO dao;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        dao = new FooterDAO();
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        ServletContext context = request.getServletContext();
        
        // Check if footer data is already in application scope
        if (context.getAttribute("companyInfo") == null) {
            // Load and store footer data
            context.setAttribute("companyInfo", dao.getCompanyInfo());
            context.setAttribute("contactInfo", dao.getContactInfo());
            context.setAttribute("socialLinks", dao.getSocialLinks());
        }
        
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        // Cleanup if needed
    }
}