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

            // Lấy biến thể hiện tại
            Variant currentVariant = dao.getVariant(variantId);

            // Xử lý cập nhật màu sắc 
            Color newColor;
            if (!currentVariant.getColor().getName().equalsIgnoreCase(colorName)) { 
                dao.updateColor(currentVariant.getColor().getId(), colorName);
                newColor = new Color(currentVariant.getColor().getId(), colorName);
            } else {
                newColor = currentVariant.getColor();
            }

            // Xử lý cập nhật kích thước 
            Size newSize;
            if (!currentVariant.getSize().getName().equalsIgnoreCase(sizeName)) { 
                dao.updateSize(currentVariant.getSize().getId(), sizeName);
                newSize = new Size(currentVariant.getSize().getId(), sizeName);
            } else {
                newSize = currentVariant.getSize();
            }

            // Kiểm tra trùng lặp với model khác (loại trừ model hiện tại) 
            if ((currentVariant.getColor().getId() != newColor.getId() || currentVariant.getSize().getId() != newSize.getId()) && dao.isVariantExists(productId, newColor.getId(), newSize.getId())) {
                request.setAttribute("errorMessage", "Model với màu sắc và kích thước này đã tồn tại");
                request.setAttribute("variant", currentVariant);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            // Cập nhật biến thể với màu sắc, kích thước, số lượng mới
            dao.updateVariant(variantId, newColor.getId(), newSize.getId(), quantity);

            response.sendRedirect("inventoryDetail?id=" + productId + "&success=updated");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ");
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
        }
    }
}
