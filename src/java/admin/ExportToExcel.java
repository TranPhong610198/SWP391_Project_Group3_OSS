package admin;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet(name = "ExportToExcel", urlPatterns = {"/exporttoexcel"})
public class ExportToExcel extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy parameters từ request
            String gender = request.getParameter("gender");
            String role = request.getParameter("role");
            String status = request.getParameter("status");
            String searchTerm = request.getParameter("search");
            String sortField = request.getParameter("sortField");
            String sortDir = request.getParameter("sortDir");
            
            // Xây dựng câu query SQL - không bao gồm OFFSET và FETCH
            StringBuilder sql = new StringBuilder("SELECT * FROM users WHERE 1=1");
            List<Object> params = new ArrayList<>();
            
            // Thêm điều kiện lọc
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
            
            // Thêm điều kiện tìm kiếm
            if (searchTerm != null && !searchTerm.isEmpty()) {
                sql.append(" AND (full_name LIKE ? OR email LIKE ? OR mobile LIKE ?)");
                String searchPattern = "%" + searchTerm + "%";
                params.add(searchPattern);
                params.add(searchPattern);
                params.add(searchPattern);
            }
            
            // Thêm sắp xếp
            if (sortField != null && !sortField.isEmpty()) {
                sql.append(" ORDER BY ").append(sortField);
                if ("desc".equals(sortDir)) {
                    sql.append(" DESC");
                } else {
                    sql.append(" ASC");
                }
            } else {
                sql.append(" ORDER BY id ASC");
            }

            // Lấy danh sách users đã được lọc
            List<User> userList = userDAO.getUsersByFilter(sql.toString(), params);

            // Set response headers
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=UserList.xlsx");

            // Tạo workbook và sheet
            try (Workbook workbook = new XSSFWorkbook(); OutputStream out = response.getOutputStream()) {
                Sheet sheet = workbook.createSheet("Filtered User Data");
                
                // Tạo header
                String[] headers = {"ID", "Username", "Email", "Full Name", "Gender", 
                                  "Mobile", "Role", "Status", "Created At", "Updated At"};

                Row headerRow = sheet.createRow(0);
                for (int i = 0; i < headers.length; i++) {
                    headerRow.createCell(i).setCellValue(headers[i]);
                }

                // Fill data
                int rowNum = 1;
                for (User user : userList) {
                    Row row = sheet.createRow(rowNum++);
                    row.createCell(0).setCellValue(user.getId());
                    row.createCell(1).setCellValue(user.getUsername());
                    row.createCell(2).setCellValue(user.getEmail());
                    row.createCell(3).setCellValue(user.getFullName());
                    row.createCell(4).setCellValue(user.getGender());
                    row.createCell(5).setCellValue(user.getMobile());
                    row.createCell(6).setCellValue(user.getRole());
                    row.createCell(7).setCellValue(user.getStatus());
                    row.createCell(8).setCellValue(user.getCreatedAt());
                    row.createCell(9).setCellValue(user.getUpdatedAt());
                }

                // Auto-size columns
                for (int i = 0; i < headers.length; i++) {
                    sheet.autoSizeColumn(i);
                }

                workbook.write(out);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error exporting data to Excel");
        }
    }
}