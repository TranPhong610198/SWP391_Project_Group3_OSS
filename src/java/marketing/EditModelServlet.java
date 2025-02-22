/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.InventoryDAO;
import DAO.ProductDAO;
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
@WebServlet(name = "EditModelServlet", urlPatterns = {"/marketing/editModel"})
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
        InventoryDAO inventoryDao = new InventoryDAO();
        ProductDAO productDao = new ProductDAO();

        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            String colorName = request.getParameter("color").trim();
            String sizeName = request.getParameter("size").trim();
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (colorName.isEmpty() || sizeName.isEmpty() || quantity < 0) {
                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin hợp lệ");
                Variant variant = inventoryDao.getVariant(variantId);
                request.setAttribute("variant", variant);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            Variant currentVariant = inventoryDao.getVariant(variantId);
            if (currentVariant == null) {
                response.sendRedirect("inventorylist");
                return;
            }

            int oldColorId = currentVariant.getColor().getId();
            int oldSizeId = currentVariant.getSize().getId();

            entity.Color newColor;
            if (currentVariant.getColor().getName().equalsIgnoreCase(colorName)) {
                newColor = currentVariant.getColor();
            } else {
                newColor = inventoryDao.getColorByName(productId, colorName);
                if (newColor == null) {
                    int usageCount = inventoryDao.countVariantsUsingColor(oldColorId);
                    if (usageCount == 1) {
                        inventoryDao.updateColor(oldColorId, colorName);
                        newColor = new entity.Color(oldColorId, colorName);
                    } else {
                        int newColorId = inventoryDao.addColor(productId, colorName);
                        newColor = new entity.Color(newColorId, colorName);
                    }
                }
            }

            entity.Size newSize;
            if (currentVariant.getSize().getName().equalsIgnoreCase(sizeName)) {
                newSize = currentVariant.getSize();
            } else {
                newSize = inventoryDao.getSizeByName(productId, sizeName);
                if (newSize == null) {
                    int usageCount = inventoryDao.countVariantsUsingSize(oldSizeId);
                    if (usageCount == 1) {
                        inventoryDao.updateSize(oldSizeId, sizeName);
                        newSize = new entity.Size(oldSizeId, sizeName);
                    } else {
                        int newSizeId = inventoryDao.addSize(productId, sizeName);
                        newSize = new entity.Size(newSizeId, sizeName);
                    }
                }
            }

            if (inventoryDao.isVariantExists(productId, newColor.getId(), newSize.getId(), variantId)) {
                request.setAttribute("errorMessage", "Mẫu với màu sắc và kích thước này đã tồn tại");
                request.setAttribute("variant", currentVariant);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            // Cập nhật variant
            inventoryDao.updateVariant(variantId, newColor.getId(), newSize.getId(), quantity);

            // Cập nhật trạng thái sản phẩm nếu cần
            productDao.updateProductStatusIfNeeded(productId);

            // Cleanup
            if (oldColorId != newColor.getId()) {
                inventoryDao.cleanupOrphanColor(oldColorId);
            }
            if (oldSizeId != newSize.getId()) {
                inventoryDao.cleanupOrphanSize(oldSizeId);
            }

            response.sendRedirect("inventoryDetail?id=" + productId + "&success=edit");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ");
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
        }
    }
}
