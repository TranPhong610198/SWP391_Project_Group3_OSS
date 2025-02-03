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
        String search = request.getParameter("search");
        String category = request.getParameter("category");
        if (search == null) search = "";
        if (category == null) category = "";

        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1;
        }

        PostDAO postDAO = new PostDAO();
        List<Post> posts = postDAO.getPosts(search, category, page);
        int totalPosts = postDAO.getTotalPosts(search, category);
        int totalPages = (int) Math.ceil((double) totalPosts / 5);

        List<Post> latestPosts = postDAO.getLatestPosts();

        request.setAttribute("posts", posts);
        request.setAttribute("search", search);
        request.setAttribute("category", category);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("latestPosts", latestPosts);

        request.getRequestDispatcher("/postlist.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String category = request.getParameter("category");

        if (search == null) search = "";
        if (category == null) category = "";
        response.sendRedirect(request.getContextPath() + "/posts?search=" + search + "&category=" + category);
    }
}