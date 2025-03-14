/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package marketing.Inventory;

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
import java.util.List;
import java.util.regex.Pattern;

/**
 *
 * @author nguye
 */
@WebServlet(name = "EditModelServlet", urlPatterns = {"/marketing/editModel"})
public class EditModelServlet extends HttpServlet {

    private static final Pattern COLOR_PATTERN = Pattern.compile("^([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+([ ]([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+)*$");
    private static final int MAX_QUANTITY = 1000000;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            String source = request.getParameter("source"); 
            InventoryDAO dao = new InventoryDAO();
            Variant variant = dao.getVariant(variantId);

            if (variant == null) {
                response.sendRedirect("inventorylist");
                return;
            }

            List<Color> colorList = dao.getColorsByProductId(variant.getProductId());
            List<Size> sizeList = dao.getSizesByProductId(variant.getProductId());

            request.setAttribute("variant", variant);
            request.setAttribute("colorList", colorList);
            request.setAttribute("sizeList", sizeList);
            request.setAttribute("source", source); 
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
            String source = request.getParameter("source");
            String colorName = request.getParameter("color").trim();
            String sizeName = request.getParameter("size").trim();
            String quantityStr = request.getParameter("quantity");

            System.out.println("Source in doPost: " + source);

            // Lấy danh sách màu và kích thước để gửi lại nếu có lỗi
            List<Color> colorList = inventoryDao.getColorsByProductId(productId);
            List<Size> sizeList = inventoryDao.getSizesByProductId(productId);

            // Kiểm tra cơ bản: không để trống
            if (colorName.isEmpty() || sizeName.isEmpty()) {
                request.setAttribute("errorMessage", "Màu sắc và kích thước không được để trống");
                Variant variant = inventoryDao.getVariant(variantId);
                request.setAttribute("variant", variant);
                request.setAttribute("colorList", colorList);
                request.setAttribute("sizeList", sizeList);
                request.setAttribute("source", source);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            // Kiểm tra định dạng màu sắc
            if (!COLOR_PATTERN.matcher(colorName).matches()) {
                request.setAttribute("errorMessage", "Màu sắc chỉ được chứa chữ cái và khoảng trắng");
                Variant variant = inventoryDao.getVariant(variantId);
                request.setAttribute("variant", variant);
                request.setAttribute("colorList", colorList);
                request.setAttribute("sizeList", sizeList);
                request.setAttribute("source", source);
                request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
                return;
            }

            // Kiểm tra số lượng
            int quantity;
            try {
                quantity = Integer.parseInt(quantityStr);
                if (quantity < 0 || quantity > MAX_QUANTITY) {
                    throw new NumberFormatException();
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Số lượng phải là số nguyên từ 0 đến " + MAX_QUANTITY);
                request.setAttribute("productId", productId);
                request.setAttribute("source", source);
                request.setAttribute("colorList", colorList);
                request.setAttribute("sizeList", sizeList);
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
                request.setAttribute("colorList", colorList);
                request.setAttribute("sizeList", sizeList);
                request.setAttribute("source", source);
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

            // Tạo URL chuyển hướng với source
            String redirectUrl = "inventoryDetail?id=" + productId + "&success=edit";
            if (source != null && !source.trim().isEmpty()) {
                redirectUrl += "&source=" + source;
            }
            response.sendRedirect(redirectUrl);

        } catch (NumberFormatException e) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            List<Color> colorList = inventoryDao.getColorsByProductId(productId);
            List<Size> sizeList = inventoryDao.getSizesByProductId(productId);

            request.setAttribute("errorMessage", "Dữ liệu không hợp lệ");
            request.setAttribute("variant", inventoryDao.getVariant(Integer.parseInt(request.getParameter("variantId"))));
            request.setAttribute("colorList", colorList);
            request.setAttribute("sizeList", sizeList);
            request.setAttribute("source", request.getParameter("source"));
            request.getRequestDispatcher("/marketing/inventory/EditModel.jsp").forward(request, response);
        }
    }
}