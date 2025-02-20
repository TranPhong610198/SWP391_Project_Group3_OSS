/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing;

import DAO.InventoryDAO;
import entity.Color;
import entity.Size;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddModelServlet", urlPatterns = {"/marketing/addModel"})
public class AddModelServlet extends HttpServlet {

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
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Validate input
            if (colorName.isEmpty() || sizeName.isEmpty() || quantity < 0) {
                request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin hợp lệ");
                request.setAttribute("productId", productId);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            // lấy màu vs size của các đối tượng
            Color color = dao.getColorByName(productId, colorName);
            Size size = dao.getSizeByName(productId, sizeName);
            System.out.println(color);
            System.out.println(size);
            // Nhận hoặc tạo ID màu sắc và kích thước
            int colorId, sizeId;

            if (color != null) {
                colorId = color.getId();
            } else {
                colorId = dao.addColor(productId, colorName);
                if (colorId == -1) {
                    throw new SQLException("Không thể tạo màu mới");
                }
            }

            if (size != null) {
                sizeId = size.getId();
            } else {
                sizeId = dao.addSize(productId, sizeName);
                if (sizeId == -1) {
                    throw new SQLException("Không thể tạo kích thước mới");
                }
            }

            // kiểm tra model đã tồn tại
            if (dao.isVariantExists(productId, colorId, sizeId)) {
                request.setAttribute("errorMessage", "Mẫu này đã tồn tại");
                request.setAttribute("productId", productId);
                request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
                return;
            }

            // Tạo new variant
            dao.addNewVariant(productId, colorId, sizeId, quantity);

            response.sendRedirect("inventoryDetail?id=" + productId + "&success=added");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ");
            request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("/marketing/inventory/AddModel.jsp").forward(request, response);
        }
    }
}
