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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nguye
 */
@WebServlet(name = "EditModelServlet", urlPatterns = {"/editModel"})
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
            
        } catch (NumberFormatException | SQLException e) {
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
            String colorName = request.getParameter("color");
            String sizeName = request.getParameter("size");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Validate input
            if (colorName == null || colorName.trim().isEmpty() || 
                sizeName == null || sizeName.trim().isEmpty() || 
                quantity < 0) {
                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin hợp lệ");
                Variant variant = dao.getVariant(variantId);
                request.setAttribute("variant", variant);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            // Lấy biến thể hiện tại
            Variant currentVariant = dao.getVariant(variantId);
            
            //Nếu màu sắc hoặc kích thước thay đổi, check xem có sự kết hợp mới nào không
            if (!currentVariant.getColor().getName().equals(colorName) || 
                !currentVariant.getSize().getName().equals(sizeName)) {
                
                Color newColor = dao.getColorByName(productId, colorName);
                Size newSize = dao.getSizeByName(productId, sizeName);
                
                if (newColor != null && newSize != null && 
                    dao.isVariantExists(productId, newColor.getId(), newSize.getId())) {
                    request.setAttribute("errorMessage", "Model với màu sắc và kích thước này đã tồn tại");
                    request.setAttribute("variant", currentVariant);
                    request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                    return;
                }
            }

            // Update variant
            dao.updateVariantQuantity(variantId, quantity);
            
            response.sendRedirect("inventoryDetail?id=" + productId + "&success=updated");
            
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ");
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditModelServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}