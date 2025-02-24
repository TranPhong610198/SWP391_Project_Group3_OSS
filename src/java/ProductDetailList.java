/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DAO.CategoryDAO;
import DAO.ProductDAO;
import entity.Category;
import entity.Color;
import entity.Product;
import entity.Size;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tphon
 */
@WebServlet(urlPatterns = {"/productdetail"})
public class ProductDetailList extends HttpServlet {

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
            out.println("<title>Servlet ProductDetailList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailList at " + request.getContextPath() + "</h1>");
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
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            ProductDAO productDAO = new ProductDAO();
            CategoryDAO categoryDAO = new CategoryDAO();

            Product product = productDAO.getProductById(productId);
            if (product == null) {
                response.sendRedirect("listproduct?ErrNullID");
                return;
            }

            //Xử lý lấy ảnh
            List<String> subImages = productDAO.getProductImages(productId);

            List<String> allImages = new ArrayList<>();
            allImages.add(product.getThumbnail());
            allImages.addAll(subImages);
            product.setSubImages(allImages);

            //Lấy tên danh mục
            Category category = categoryDAO.getCategoryById(product.getCategoryId());
            String categoryName = (category != null) ? category.getName() : "";

            //Lấy sản phẩm tương tự theo danh mục
            List<Product> relatedProducts = productDAO.getRelatedProducts(productId, product.getCategoryId());

            //Lấy size
            List<Size> sizes = productDAO.getSizesByProductId(productId);

            //Lấy màu
            List<Color> colors = productDAO.getColorsByProductId(productId);

            //Lấy số lượng
            int stock = 0;
            String sizeId = request.getParameter("sizeId");
            String colorId = request.getParameter("colorId");

            if (sizeId!=null&&!sizeId.isEmpty() && colorId!=null&&!colorId.isEmpty()) {
                stock = productDAO.getTotalStockByProductId(productId, Integer.parseInt(sizeId), Integer.parseInt(colorId));
                request.setAttribute("sizeId", Integer.valueOf(sizeId));
                request.setAttribute("colorId", Integer.valueOf(colorId));
            } else if (sizeId != null && !sizeId.isEmpty()) {
                stock = productDAO.getTotalStockByProductSize(productId, Integer.parseInt(sizeId));
                request.setAttribute("sizeId", Integer.parseInt(sizeId));
            } else if (colorId != null && !colorId.isEmpty()) {
                stock = productDAO.getTotalStockByProductSize(productId, Integer.parseInt(colorId));
                request.setAttribute("colorId", Integer.parseInt(colorId));
            } else {
                stock = productDAO.getTotalStockByProductId(productId);
            }
            product.setStock(stock);
            request.setAttribute("product", product);
            request.setAttribute("categoryName", categoryName);
            request.setAttribute("images", allImages);
            request.setAttribute("colors", colors);
            request.setAttribute("sizes", sizes);
            request.setAttribute("relatedProducts", relatedProducts);
//            request.setAttribute("comboProducts", comboProducts);

            // Forward to the JSP
            request.getRequestDispatcher("productDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("listproduct?ErrNumberF");
        } catch (Exception e) {
            getServletContext().log("Error in ProductDetailServlet", e);

            request.setAttribute("errorMessage", "There was an error processing your request. Please try again later.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
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
