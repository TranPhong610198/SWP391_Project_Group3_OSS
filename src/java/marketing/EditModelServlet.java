/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.InventoryDAO;
import entity.Color;
import entity.Size;
import entity.Variant;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */
@WebServlet(name = "EditModelServlet", urlPatterns = {"/Marketing/editModel"})
public class EditModelServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            InventoryDAO dao = new InventoryDAO();
            Variant variant = dao.getVariant(variantId);

            if (variant == null) {
                response.sendRedirect("inventorylist");
                return;
            }

            request.setAttribute("variant", variant);
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        InventoryDAO dao = new InventoryDAO();

        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            String colorName = request.getParameter("color").trim();
            String sizeName = request.getParameter("size").trim();
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Validate input
            if (colorName.isEmpty() || sizeName.isEmpty() || quantity < 0) {
                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin hợp lệ");
                Variant variant = dao.getVariant(variantId);
                request.setAttribute("variant", variant);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            // Lấy variant hiện tại
            Variant currentVariant = dao.getVariant(variantId);
            if (currentVariant == null) {
                response.sendRedirect("inventorylist");
                return;
            }

            // Lưu lại id màu sắc và kích thước cũ để sau này kiểm tra cleanup
            int oldColorId = currentVariant.getColor().getId();
            int oldSizeId = currentVariant.getSize().getId();

            // Xử lý cập nhật màu sắc
            entity.Color newColor;
            if (currentVariant.getColor().getName().equalsIgnoreCase(colorName)) {
                newColor = currentVariant.getColor();
            } else {
                // Tìm xem bản ghi với tên màu mới đã tồn tại chưa
                newColor = dao.getColorByName(productId, colorName);
                if (newColor == null) {
                    // Nếu chưa tồn tại, kiểm tra số variant đang sử dụng bản ghi màu hiện tại
                    int usageCount = dao.countVariantsUsingColor(oldColorId);
                    if (usageCount == 1) {
                        // Nếu chỉ có variant hiện tại sử dụng, cập nhật trực tiếp bản ghi đó
                        dao.updateColor(oldColorId, colorName);
                        newColor = new entity.Color(oldColorId, colorName);
                    } else {
                        // Nếu có nhiều variant sử dụng, thêm mới một bản ghi màu mới
                        int newColorId = dao.addColor(productId, colorName);
                        newColor = new entity.Color(newColorId, colorName);
                    }
                }
            }

            // Xử lý cập nhật kích thước
            entity.Size newSize;
            if (currentVariant.getSize().getName().equalsIgnoreCase(sizeName)) {
                newSize = currentVariant.getSize();
            } else {
                newSize = dao.getSizeByName(productId, sizeName);
                if (newSize == null) {
                    int usageCount = dao.countVariantsUsingSize(oldSizeId);
                    if (usageCount == 1) {
                        dao.updateSize(oldSizeId, sizeName);
                        newSize = new entity.Size(oldSizeId, sizeName);
                    } else {
                        int newSizeId = dao.addSize(productId, sizeName);
                        newSize = new entity.Size(newSizeId, sizeName);
                    }
                }
            }

            // Kiểm tra xem combo model (màu sắc, kích thước) mới đã tồn tại ở variant khác hay chưa
            if (dao.isVariantExists(productId, newColor.getId(), newSize.getId(), variantId)) {
                request.setAttribute("errorMessage", "Model với màu sắc và kích thước này đã tồn tại");
                request.setAttribute("variant", currentVariant);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            // Cập nhật variant với thông tin mới
            dao.updateVariant(variantId, newColor.getId(), newSize.getId(), quantity);

            // Cleanup: Nếu màu sắc hoặc kích thước cũ không còn được sử dụng, xóa bỏ bản ghi đó
            if (oldColorId != newColor.getId()) {
                dao.cleanupOrphanColor(oldColorId);
            }
            if (oldSizeId != newSize.getId()) {
                dao.cleanupOrphanSize(oldSizeId);
            }

            response.sendRedirect("inventoryDetail?id=" + productId + "&success=updated");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ");
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
        }

    }
}
