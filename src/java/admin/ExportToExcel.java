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
import java.util.List;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet(name = "ExportToExcel", urlPatterns = {"/exporttoexcel"})
public class ExportToExcel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        List<User> userList = userDAO.GetAllUsers();

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=MeoMeo.xlsx");

        try (Workbook workbook = new XSSFWorkbook(); OutputStream out = response.getOutputStream()) {
            Sheet sheet = workbook.createSheet("User Data");

            String[] headers = {"ID", "Username", "Email", "Password Hash", "Full Name", "Gender", 
                                "Mobile", "Avatar", "Role", "Status", "Created At", "Updated At"};
            
            Row headerRow = sheet.createRow(0);
            for (int i = 0; i < headers.length; i++) {
                headerRow.createCell(i).setCellValue(headers[i]);
            }

            int rowNum = 1;
            for (User user : userList) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(user.getId());
                row.createCell(1).setCellValue(user.getUsername());
                row.createCell(2).setCellValue(user.getEmail());
                row.createCell(3).setCellValue(user.getPasswordHash());
                row.createCell(4).setCellValue(user.getFullName());
                row.createCell(5).setCellValue(user.getGender());
                row.createCell(6).setCellValue(user.getMobile());
                row.createCell(7).setCellValue(user.getAvatar());
                row.createCell(8).setCellValue(user.getRole());
                row.createCell(9).setCellValue(user.getStatus());
                row.createCell(10).setCellValue(user.getCreatedAt());
                row.createCell(11).setCellValue(user.getUpdatedAt());
            }
            
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
