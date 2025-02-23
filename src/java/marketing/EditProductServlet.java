/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.CartDAO;
import DAO.CategoryDAO;
import java.io.IOException;
import DAO.ProductDAO;
import entity.Product;
import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.PrintWriter;
import java.nio.file.Paths;

/**
 *
 * @author tphon
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/marketing/editproduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class EditProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();
    private CategoryDAO categoryDAO = new CategoryDAO();
    private CartDAO cartDAO = new CartDAO();
    private static final String UPLOAD_DIR = "uploads/productImages";

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
            out.println("<title>Servlet EditProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductServlet at " + request.getContextPath() + "</h1>");
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
        int productId = Integer.parseInt(request.getParameter("id"));
//        System.out.println(productId);
        Product product = productDAO.getProductById(productId);
        product.setSubImages(productDAO.getProductImages(productId));

        request.setAttribute("product", product);
        request.setAttribute("categories", categoryDAO.getThirdLevelCategories()); // Giả sử có CategoryDAO
//        System.out.println(categoryDAO.getThirdLevelCategories().toString());
        request.setAttribute("comboProducts", productDAO.getComboProducts());
        request.getRequestDispatcher("/marketing/product/editProduct.jsp").forward(request, response);
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
            int productId = Integer.parseInt(request.getParameter("productId"));
            Product product = productDAO.getProductById(productId);

            if (productDAO.hasProcessOrders(productId)) {
                response.sendRedirect("productlist?alert=ER1_OP");
                return;
            }

            String action = request.getParameter("action");
            String uploadPath = request.getServletContext().getRealPath("/" + UPLOAD_DIR);
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // Tạo thư mục nếu chưa tồn tại
            }

            // Kiểm tra định dạng file trước khi xử lý
            for (Part part : request.getParts()) {
                if ((part.getName().equals("thumbnail") || part.getName().equals("subImage") || part.getName().equals("newSubImage")) && part.getSize() > 0) {
                    if (!isValidImage(part)) {
                        response.sendRedirect("productlist?alert=ER1_IVImg");
                        return;
                    }
                }
            }

            if ("updateProduct".equals(action)) {
                // Xử lý cập nhật sản phẩm
                String title = request.getParameter("title");
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String description = request.getParameter("description");
                BigDecimal originalPrice = new BigDecimal(request.getParameter("originalPrice"));
                BigDecimal salePrice = new BigDecimal(request.getParameter("salePrice"));

                // xử lý phần combo
                boolean isCombo = request.getParameter("isCombo") != null;
                int comboGroupId = 0;

                if (product.isIsCombo() == isCombo && isCombo) {                //ban đầu hay lúc sau update nó vẫn là sản phẩm chính của combo
                    comboGroupId = product.getComboGroupId();                   // thì giữ nguyên group, không được chuyển
                } else if (product.isIsCombo() != isCombo && isCombo) {         // ban đầu ko phải sản phầm chính, lúc sau là sản phẩm chính
                    comboGroupId = productDAO.getMaxComboGroupId() + 1;         // thì tạo ra 1 group mới cho nó
                } else if (product.isIsCombo() == isCombo && !isCombo) {        // ban đầu không là chính nhưng lúc sau cũng không là chính
                    String groupRaw = request.getParameter("comboGroupId"); // thì kiểm tra xem nó có đổi sang combo khác không
                    if (groupRaw != null && !groupRaw.isEmpty()) {
                        comboGroupId = Integer.parseInt(groupRaw);
                    }
                } else {                                                        // ban đầu là chính nhưng lúc sau là phụ
                    String groupRaw = request.getParameter("comboGroupId");
                    if (groupRaw != null && !groupRaw.isEmpty()) {              // kiểm tra xem nó thuộc combo mói hay combo cũ
                        if (product.getComboGroupId() == Integer.parseInt(groupRaw)) { // nếu vần là combo cũ 
                            List<Product> comboList = productDAO.getComboProduct(product.getComboGroupId());
                            if (comboList.size() >= 2) {                        //và trong combo có 2 sản phẩm 
                                int upProductId = comboList.get(comboList.size() - 2).getId();
                                productDAO.setIsComboByProductId(upProductId, true); //thì chuyển chính vè thằng gần nhất
                            } else {
                                comboGroupId = 0;                               // còn dưới 2 sản phẩm thì xóa combo
                            }
                        } else {                                                // nếu là combo mới
                            comboGroupId = Integer.parseInt(groupRaw);        // thì chuyển sang combo mới
                        }
                    }
                }
                System.out.println(comboGroupId);
                System.out.println(isCombo + "Dòng 168 EDIT");
                // Xử lý ảnh chính (thumbnail)
                Part thumbnailPart = request.getPart("thumbnail");
                String thumbnail = product.getThumbnail(); // Giữ nguyên nếu không upload ảnh mới
                if (thumbnailPart != null && thumbnailPart.getSize() > 0) {
                    thumbnail = saveImage(thumbnailPart, request);
                }

                product.setTitle(title);
                product.setCategoryId(categoryId);
                product.setDescription(description);
                product.setOriginalPrice(originalPrice);
                product.setSalePrice(salePrice);
                product.setThumbnail(thumbnail);
                product.setIsCombo(isCombo);
                product.setComboGroupId(comboGroupId);

                boolean updated = productDAO.updateProduct(product, uploadPath);
                if (productDAO.hasProductInCart(productId)) {
                    if (!cartDAO.deleteProductFromCart(productId)) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi khi xóa sản phẩm trong giỏ hàng");
                        return;
                    }
                }
                if (updated) response.sendRedirect("productlist?alert=SSU");
                
            } else if ("replaceSubImage".equals(action)) {
                // Xử lý thay thế ảnh phụ
                int imageId = Integer.parseInt(request.getParameter("imageId"));
                Part subImagePart = request.getPart("subImage");
                if (subImagePart != null && subImagePart.getSize() > 0) {
                    String newImageUrl = saveImage(subImagePart, request);
                    if (newImageUrl != null) {
                        productDAO.replaceProductImage(imageId, newImageUrl, uploadPath);
                    } else {
                        request.setAttribute("error", "Lỗi khi lưu ảnh phụ mới.");
                        request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
                        return;
                    }
                }
            } else if ("deleteSubImage".equals(action)) {
                // Xử lý xóa ảnh phụ
                int imageId = Integer.parseInt(request.getParameter("imageId"));
                productDAO.deleteProductImage(imageId, uploadPath);
            } else if ("addNewSubImage".equals(action)) {
                // Xử lý thêm ảnh phụ mới
                Part newSubImagePart = request.getPart("newSubImage");
                if (newSubImagePart != null && newSubImagePart.getSize() > 0) {
                    List<String> currentImages = productDAO.getProductImages(productId);
                    if (currentImages == null) {
                        currentImages = new ArrayList<>(); // Khởi tạo danh sách rỗng nếu null
                    }
                    if (currentImages.size() >= 5) {
                        request.setAttribute("error", "Không thể thêm ảnh mới vì đã đạt tối đa 5 ảnh phụ.");
                        request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
                        return;
                    }

                    String newImageUrl = saveImage(newSubImagePart, request);
                    if (newImageUrl != null) {
                        productDAO.addSingleProductImage(productId, newImageUrl);
                    } else {
                        request.setAttribute("error", "Lỗi khi lưu ảnh phụ mới.");
                        request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
                        return;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi khi chỉnh sửa sản phẩm: " + e.getMessage());
            request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
        }
    }
    // Hàm lưu ảnh vào thư mục uploads/productImages (giống AddProductServlet)

    private String saveImage(Part part, HttpServletRequest request) {
        try {
            String oldFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String fileExtension = oldFileName.substring(oldFileName.lastIndexOf("."));
            String fileName = "img_" + System.currentTimeMillis() + fileExtension; // Tạo tên file duy nhất
            String uploadPath = request.getServletContext().getRealPath("/" + UPLOAD_DIR);

            File uploadFolder = new File(uploadPath);
            if (!uploadFolder.exists()) {
                uploadFolder.mkdirs(); // Tạo thư mục nếu chưa tồn tại
            }

            String filePath = uploadPath + File.separator + fileName;
            part.write(filePath); // Lưu ảnh vào thư mục trên server
            return UPLOAD_DIR + "/" + fileName; // Trả về đường dẫn tương đối
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Hàm kiểm tra định dạng file ảnh (giống AddProductServlet)
    private boolean isValidImage(Part part) {
        String contentType = part.getContentType();
        return contentType != null && (contentType.equals("image/jpeg")
                || contentType.equals("image/png")
                || contentType.equals("image/gif")
                || contentType.equals("image/webp"));
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
