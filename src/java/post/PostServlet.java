/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package post;

import DAO.PostDAO;
import DAO.UserDAO;
import entity.Post;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author USA
 */
@WebServlet(name = "PostServlet", urlPatterns = {"/postList"})
public class PostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostManagement</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostManagement at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        int pageSize = 9;
        String search = request.getParameter("search");
        String categoryIdStr = request.getParameter("categoryId");
        String authorIdStr = request.getParameter("authorId");
        String status = request.getParameter("status");
        String sortBy = request.getParameter("sortBy");
        String sortDirection = request.getParameter("sortDirection");

        Integer categoryId = (categoryIdStr != null && !categoryIdStr.isEmpty() && !categoryIdStr.equals("0"))
                ? Integer.parseInt(categoryIdStr)
                : null;

        Integer authorId = (authorIdStr != null && !authorIdStr.isEmpty() && !authorIdStr.equals("0"))
                ? Integer.parseInt(authorIdStr)
                : null;

        System.out.println("Search: " + search);
        System.out.println("Category ID String: " + categoryIdStr);
        System.out.println("Author ID String: " + authorIdStr);
        System.out.println("Status: " + status);
        System.out.println("Sort By: " + sortBy);
        System.out.println("Sort Direction: " + sortDirection);
        System.out.println("Parsed Category ID: " + categoryId);
        System.out.println("Parsed Author ID: " + authorId);

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        PostDAO postDAO = new PostDAO();
        List<Post> posts = postDAO.getAllPosts(page, pageSize, search, categoryId, authorId, status, sortBy, sortDirection);
        List<User> users = postDAO.getUserRoleAdmin();
        
        
        for (Post post : posts) {
            System.out.println(post.getId() + " - " + post.getTitle());
        }
        int totalPosts = postDAO.getTotalPostsCount(search, categoryId, authorId, status);
        int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

        request.setAttribute("posts", posts);
        request.setAttribute("users", users);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("/marketing/postlist.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
