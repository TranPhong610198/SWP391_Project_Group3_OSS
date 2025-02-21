/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.InventoryDAO;
import entity.Color;
import entity.Size;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.regex.Pattern;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddModelServlet", urlPatterns = {"/marketing/addModel"})
public class AddModelServlet extends HttpServlet {

    private static final Pattern COLOR_PATTERN = Pattern.compile("^([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+([ ]([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+)*$");
    private static final int MAX_QUANTITY = 1000000;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        if (productId == null || productId.trim().isEmpty()) {
            response.sendRedirect("inventorylist");
            return;
        }
        request.setAttribute("productId", productId);
        request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        InventoryDAO dao = new InventoryDAO();

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String colorName = request.getParameter("color").trim();
            String sizeName = request.getParameter("size").trim();
            String quantityStr = request.getParameter("quantity");

            if (!COLOR_PATTERN.matcher(colorName).matches()) {
                request.setAttribute("errorMessage", "Màu sắc chỉ được phép chứa chữ cái và khoảng trắng");
                request.setAttribute("productId", productId);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            // kiểm tra độ dài của chuỗi số lượng trước khi parse thành int
            int quantity;
            try {
                // Kiểm tra xem số lượng có quá lớn không
                if (quantityStr.length() > 9) { // Nếu số có hơn 9 chữ số (999,999,999)
                    request.setAttribute("errorMessage", "Số lượng phải từ 0 đến 1,000,000");
                    request.setAttribute("productId", productId);
                    request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                    return;
                }

                quantity = Integer.parseInt(quantityStr);
                if (quantity < 0 || quantity > MAX_QUANTITY) {
                    request.setAttribute("errorMessage", "Số lượng phải từ 0 đến 1,000,000");
                    request.setAttribute("productId", productId);
                    request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Số lượng không hợp lệ");
                request.setAttribute("productId", productId);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            Color color = dao.getColorByName(productId, colorName);
            Size size = dao.getSizeByName(productId, sizeName);

            int colorId;
            if (color != null) {
                colorId = color.getId();
            } else {
                colorId = dao.addColor(productId, colorName);
                if (colorId == -1) {
                    throw new SQLException("Không thể tạo màu mới");
                }
            }

            int sizeId;
            if (size != null) {
                sizeId = size.getId();
            } else {
                sizeId = dao.addSize(productId, sizeName);
                if (sizeId == -1) {
                    throw new SQLException("Không thể tạo kích thước mới");
                }
            }

            // Check if variant exists
            if (dao.isVariantExists(productId, colorId, sizeId)) {
                request.setAttribute("errorMessage", "Mẫu này đã tồn tại");
                request.setAttribute("productId", productId);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            dao.addNewVariant(productId, colorId, sizeId, quantity);
            response.sendRedirect("inventoryDetail?id=" + productId + "&success=add");

        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
        }
    }
}
