//package post;
//
//import DAO.PostDAO;
//import entity.User;
//import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/deletePost")
//public class DeletePostServlet extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
//            throws ServletException, IOException {
//        
//        HttpSession session = request.getSession();
//        
//        // Check if user is logged in and is admin
////        if (session.getAttribute("user") == null || !((User)session.getAttribute("user")).isAdmin()) {
////            response.sendRedirect(request.getContextPath() + "/login.jsp");
////            return;
////        }
//        
//        String postId = request.getParameter("id");
//        String message = "";
//        String messageType = "";
//        
//        try {
//            if (postId != null && !postId.trim().isEmpty()) {
//                PostDAO postDAO = new PostDAO();
//                boolean deleted = postDAO.deletePost(Integer.parseInt(postId));
//                
//                if (deleted) {
//                    message = "Post deleted successfully!";
//                    messageType = "success";
//                } else {
//                    message = "Failed to delete post. Post not found.";
//                    messageType = "error";
//                }
//            } else {
//                message = "Invalid post ID provided.";
//                messageType = "error";
//            }
//        } catch (NumberFormatException e) {
//            message = "Invalid post ID format.";
//            messageType = "error";
//        } catch (Exception e) {
//            message = "An error occurred while deleting the post: " + e.getMessage();
//            messageType = "error";
//        }
//        
//        // Store the message in session for display
//        session.setAttribute("message", message);
//        session.setAttribute("messageType", messageType);
//        
//        // Redirect back to the posts list
//        response.sendRedirect(request.getContextPath() + "/post");
//    }
//    
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
//            throws ServletException, IOException {
//        // Redirect GET requests to POST
//        response.sendRedirect(request.getContextPath() + "/post");
//    }
//}