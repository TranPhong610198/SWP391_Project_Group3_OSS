//package post;
//
//import DAO.PostDAO;
//import entity.Post;
//import entity.Post;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet(name = "PostServlet", urlPatterns = {"/post"})
//public class PostServlet extends HttpServlet {
//    private PostDAO postDAO;
//    
//    @Override
//    public void init() throws ServletException {
//        postDAO = new PostDAO();
//    }
//    
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        if (action == null) {
//            action = "list";
//        }
//        
//        switch (action) {
//            case "list":
//                listPosts(request, response);
//                break;
//            case "view":
//                viewPost(request, response);
//                break;
//            case "edit":
//                showEditForm(request, response);
//                break;
//            case "new":
//                showNewForm(request, response);
//                break;default:
//                listPosts(request, response);
//                break;
//        }
//    }
//    
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        if (action == null) {
//            action = "list";
//        }
//        
//        switch (action) {
//            case "create":
//                createPost(request, response);
//                break;
//            case "update":
//                updatePost(request, response);
//                break;
//            case "delete":
//                deletePost(request, response);
//                break;
//            default:
//                listPosts(request, response);
//                break;
//        }
//    }
//    
//    private void listPosts(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        // Get filter parameters
//        String search = request.getParameter("search");
//        String category = request.getParameter("category");
//        String author = request.getParameter("author");
//        String status = request.getParameter("status");
//        
//        // Get sort parameters
//        String sortBy = request.getParameter("sortBy");
//        String sortOrder = request.getParameter("sortOrder");
//        
//        // Get pagination parameters
//        int page = 1;
//        int pageSize = 9; // Posts per page
//        String pageStr = request.getParameter("page");
//        if (pageStr != null && !pageStr.isEmpty()) {
//            page = Integer.parseInt(pageStr);
//        }
//        
//        // Get posts with filters and pagination
//        List<Post> posts = postDAO.getAllPosts(search, category, author, status, sortBy, sortOrder, page, pageSize);
//        int totalPosts = postDAO.getTotalPosts(search, category, author, status);
//        int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
//        
//        // Set attributes
//        request.setAttribute("posts", posts);
//        request.setAttribute("currentPage", page);
//        request.setAttribute("totalPages", totalPages);
//        request.setAttribute("search", search);
//        request.setAttribute("category", category);
//        request.setAttribute("author", author);
//        request.setAttribute("status", status);
//        request.setAttribute("sortBy", sortBy);
//        request.setAttribute("sortOrder", sortOrder);
//        
//        // Forward to list page
//        request.getRequestDispatcher("/postlist.jsp").forward(request, response);
//    }
//    
//    private void viewPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Post post = postDAO.getPostById(id);
//        
//        if (post != null) {
//            // Get related posts
//            List<Post> relatedPosts = postDAO.getRelatedPosts(id, post.getCategoryId(), 5);
//            request.setAttribute("post", post);
//            request.setAttribute("relatedPosts", relatedPosts);
//            request.getRequestDispatcher("/postdetail.jsp").forward(request, response);
//        } else {
//            response.sendRedirect(request.getContextPath() + "/post");
//        }
//    }
//    
//    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Post post = postDAO.getPostById(id);
//        if (post != null) {
//            request.setAttribute("post", post);
//            request.getRequestDispatcher("/postform.jsp").forward(request, response);
//        } else {
//            response.sendRedirect(request.getContextPath() + "/post");
//        }
//    }
//    
//    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.getRequestDispatcher("/postform.jsp").forward(request, response);
//    }
//    
//    private void createPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        Post post = new Post();
//        populatePost(request, post);
//        
//        if (postDAO.insertPost(post)) {
//            response.sendRedirect(request.getContextPath() + "/post");
//        } else {
//            request.setAttribute("error", "Failed to create post");
//            request.setAttribute("post", post);
//            request.getRequestDispatcher("/postform.jsp").forward(request, response);
//        }
//    }
//    
//    private void updatePost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Post post = postDAO.getPostById(id);
//        
//        if (post != null) {
//            populatePost(request, post);
//            if (postDAO.updatePost(post)) {
//                response.sendRedirect(request.getContextPath() + "/post?action=view&id=" + id);
//            } else {
//                request.setAttribute("error", "Failed to update post");
//                request.setAttribute("post", post);
//                request.getRequestDispatcher("/postform.jsp").forward(request, response);
//            }
//        } else {
//            response.sendRedirect(request.getContextPath() + "/post");
//        }
//    }
//    
//    private void populatePost(HttpServletRequest request, Post post) {
//        post.setTitle(request.getParameter("title"));
//        post.setThumbnail(request.getParameter("thumbnail"));
//        post.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
//        post.setSummary(request.getParameter("summary"));
//        post.setContent(request.getParameter("content"));
//        post.setIsFeatured(Boolean.parseBoolean(request.getParameter("isFeatured")));
//        post.setStatus(request.getParameter("status"));
//        
//        // Set author ID from session if creating new post
//        if (post.getId() == 0) {
//            // Assuming you have user info in session
//            // UserSession user = (UserSession) request.getSession().getAttribute("user");
//            // post.setAuthorId(user.getId());
//            post.setAuthorId(1); // Temporary hardcoded value
//        }
//    }
//
//    private void deletePost(HttpServletRequest request, HttpServletResponse response) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//}