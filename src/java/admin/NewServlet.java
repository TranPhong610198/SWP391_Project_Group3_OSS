package admin;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;

@WebServlet("/exporttoexcel")
public class NewServlet extends HttpServlet {
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy danh sách users từ database
            StringBuilder sql = new StringBuilder("SELECT * FROM users WHERE 1=1");
            List<Object> params = new ArrayList<>();
            
            String gender = request.getParameter("gender");
            String role = request.getParameter("role");
            String status = request.getParameter("status");
            String searchTerm = request.getParameter("search");
            
            if (gender != null && !gender.isEmpty()) {
                sql.append(" AND gender = ?");
                params.add(gender);
            }
            if (role != null && !role.isEmpty()) {
                sql.append(" AND role = ?");
                params.add(role);
            }
            if (status != null && !status.isEmpty()) {
                sql.append(" AND status = ?");
                params.add(status);
            }
            if (searchTerm != null && !searchTerm.isEmpty()) {
                sql.append(" AND (full_name LIKE ? OR email LIKE ? OR mobile LIKE ?)");
                String searchPattern = "%" + searchTerm + "%";
                params.add(searchPattern);
                params.add(searchPattern);
                params.add(searchPattern);
            }
            
            List<User> users = userDAO.getUsersByFilter(sql.toString(), params);
            exportToExcel(users, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void exportToExcel(List<User> users, HttpServletResponse response) throws IOException {
        // Định dạng response header để trình duyệt tải file
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=UsersList.xls");

        try (Workbook workbook = new HSSFWorkbook(); OutputStream out = response.getOutputStream()) {
            Sheet sheet = workbook.createSheet("Users List");

            // Tạo style cho tiêu đề
            Font headerFont = workbook.createFont();
            headerFont.setBold(true);
            headerFont.setFontHeightInPoints((short) 12);

            CellStyle headerStyle = workbook.createCellStyle();
            headerStyle.setFont(headerFont);
            headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
            headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            headerStyle.setBorderBottom(BorderStyle.THIN);
            headerStyle.setBorderTop(BorderStyle.THIN);
            headerStyle.setBorderLeft(BorderStyle.THIN);
            headerStyle.setBorderRight(BorderStyle.THIN);
            headerStyle.setAlignment(HorizontalAlignment.CENTER);

            CellStyle dataStyle = workbook.createCellStyle();
            dataStyle.setBorderBottom(BorderStyle.THIN);
            dataStyle.setBorderTop(BorderStyle.THIN);
            dataStyle.setBorderLeft(BorderStyle.THIN);
            dataStyle.setBorderRight(BorderStyle.THIN);

            // Tạo hàng tiêu đề
            Row headerRow = sheet.createRow(0);
            String[] columns = {"ID", "Họ và tên", "Username", "Email", "Giới tính", "Số điện thoại", "Vai trò", "Trạng thái"};

            for (int i = 0; i < columns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(columns[i]);
                cell.setCellStyle(headerStyle);
            }

            // Điền dữ liệu vào file Excel
            int rowNum = 1;
            for (User user : users) {
                Row row = sheet.createRow(rowNum++);

                row.createCell(0).setCellValue(user.getId());
                row.createCell(1).setCellValue(user.getFullName());
                row.createCell(2).setCellValue(user.getUsername());
                row.createCell(3).setCellValue(user.getEmail());
                row.createCell(4).setCellValue(user.getGender());
                row.createCell(5).setCellValue(user.getMobile());
                row.createCell(6).setCellValue(user.getRole());
                row.createCell(7).setCellValue(user.getStatus());
            }

            // Auto-size cột
            for (int i = 0; i < columns.length; i++) {
                sheet.autoSizeColumn(i);
            }

            // Ghi dữ liệu vào output stream
            workbook.write(out);
        }
    }
}
