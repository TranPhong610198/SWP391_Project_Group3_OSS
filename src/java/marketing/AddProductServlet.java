/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.CategoryDAO;
import entity.Category;
import DAO.ProductDAO;
import entity.Product;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tphon
 */
@WebServlet(name = "AddProductServlet", urlPatterns = {"/marketing/addproduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddProductServlet extends HttpServlet {

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
            out.println("<title>Servlet AddProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductServlet at " + request.getContextPath() + "</h1>");
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
        //Lấy listcategory
        CategoryDAO cateDao = new CategoryDAO();
        List<Category> listCate = cateDao.getAll();
        request.setAttribute("categories", listCate);

        request.getRequestDispatcher("/marketing/product/addProduct.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        try {
            // Lấy dữ liệu từ form
            String title = request.getParameter("title");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String description = request.getParameter("description");
            double originalPrice = Double.parseDouble(request.getParameter("originalPrice"));
            double salePrice = Double.parseDouble(request.getParameter("salePrice"));
//            String status = request.getParameter("status");

            //Xử lý ảnh chính (thumbnail)
            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnail = saveImage(thumbnailPart, request);

            //Xử lý ảnh phụ (tối đa 5 ảnh)
            List<String> subImages = new ArrayList<>();
            for (Part part : request.getParts()) {
                if (part.getName().equals("subImages")) {
                    String imageUrl = saveImage(part, request);
                    if (imageUrl != null) {
                        subImages.add(imageUrl);
                    }
                }
            }

            //Tạo đối tượng sản phẩm
            Product product = new Product();
            product.setTitle(title);
            product.setCategoryId(categoryId);
            product.setDescription(description);
            product.setOriginalPrice(originalPrice);
            product.setSalePrice(salePrice);
            product.setThumbnail(thumbnail);
//            product.setStatus(status);

            //Thêm sản phẩm vào database
            if (productDAO.addProduct(product, subImages)) {
                response.sendRedirect("productlist");
            } else {
                response.sendRedirect("addProduct");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addProduct.jsp?error=true");
        }

    }

    // Hàm lưu ảnh vào thư mục uploads/productImages
    private String saveImage(Part part, HttpServletRequest request) {
        try {
            String fileName = "img_" + System.currentTimeMillis() + ".jpg"; // Tạo tên file mới
            String uploadDir = request.getServletContext().getRealPath("/uploads/productImages"); // Đường dẫn thư mục

            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) {
                uploadFolder.mkdirs(); // Tạo thư mục nếu chưa tồn tại
            }

            String filePath = uploadDir + File.separator + fileName;
            part.write(filePath); // Lưu ảnh vào thư mục trên server
            return "uploads/productImages/" + fileName; // Trả về đường dẫn ảnh
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
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
