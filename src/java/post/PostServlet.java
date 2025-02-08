package post;
import DAO.PostDAO;
import entity.Post;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "PostServlet", urlPatterns = {"/post"})
public class PostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get search parameters
        String search = request.getParameter("search");
        String category = request.getParameter("category");
        String author = request.getParameter("author");
        String status = request.getParameter("status");
        
        // Sorting parameters
        String sortField = request.getParameter("sortField");
        String ascendingParam = request.getParameter("ascending");
        boolean ascending = ascendingParam == null || Boolean.parseBoolean(ascendingParam);
        
        // Set default values if null
        search = (search == null) ? "" : search;
        category = (category == null) ? "" : category;
        author = (author == null) ? "" : author;
        status = (status == null) ? "" : status;
        sortField = (sortField == null) ? "updatedAt" : sortField;
        
        // Pagination
        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1;
        }
        
        // Create PostDAO instance
        PostDAO postDAO = new PostDAO();
        
        // Get posts based on search criteria
        List<Post> posts = postDAO.getPosts(search, category, author, status, page, sortField, ascending);
        
        // Get total posts and calculate total pages
        int totalPosts = postDAO.getTotalPosts(search, category, author, status);
        int totalPages = (int) Math.ceil((double) totalPosts / 5);
        
        // Get latest posts
        List<Post> latestPosts = postDAO.getLatestPosts();
        
        // Set attributes for JSP
        request.setAttribute("posts", posts);
        request.setAttribute("search", search);
        request.setAttribute("category", category);
        request.setAttribute("author", author);
        request.setAttribute("status", status);
        request.setAttribute("sortField", sortField);
        request.setAttribute("ascending", ascending);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("latestPosts", latestPosts);
        
        // Forward to JSP
        request.getRequestDispatcher("/postlist.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Reuse doGet logic for post requests
        doGet(request, response);
    }
}