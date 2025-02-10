/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package post;

import DAO.PostDAO;
import entity.Post;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author USA
 */
@WebServlet(name = "AddPostServlet", urlPatterns = {"/addPost"})
public class AddPostServlet extends HttpServlet {

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
            out.println("<title>Servlet AddPostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPostServlet at " + request.getContextPath() + "</h1>");
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
        PostDAO postDAO = new PostDAO();
        List<User> users = postDAO.getUserRoleAdmin();
        request.setAttribute("users", users);

        request.getRequestDispatcher("/marketing/postform.jsp").forward(request, response);
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
        try {
            String title = request.getParameter("title");
            String thumbnail = request.getParameter("thumbnail");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String summary = request.getParameter("summary");
            String content = request.getParameter("content");
            int authorId = Integer.parseInt(request.getParameter("authorId"));
            String isFeaturedParam = request.getParameter("isFeatured");
            boolean isFeatured = (isFeaturedParam != null);
            String status = request.getParameter("status");
            Date createdAt = new Date(System.currentTimeMillis());

      
            PostDAO postDAO = new PostDAO();
            List<User> users = postDAO.getUserRoleAdmin();

           Post post = new Post(authorId, title, thumbnail, categoryId, summary, content, status, createdAt);
            boolean isAdded = postDAO.addPost(post);

            if (isAdded) {
                System.out.println("Thêm bài viết thành công!");
                response.sendRedirect("postList");
            } else {
                System.out.println("Thêm bài viết thất bại!");
                request.setAttribute("users", users);
                request.setAttribute("error", "Thêm bài viết thất bại!");
                request.getRequestDispatcher("/marketing/postform.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Lỗi: " + e.getMessage());
        }
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
