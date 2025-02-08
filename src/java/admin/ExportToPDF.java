package admin;

import DAO.UserDAO;
import entity.User;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet(name = "ExportToPDF", urlPatterns = {"/exporttopdf"})
public class ExportToPDF extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=UserList.pdf");

        UserDAO d = new UserDAO();
        List<User> list = d.GetAllUsers();

        try (OutputStream out = response.getOutputStream()) {
            Document document = new Document(PageSize.A4.rotate()); // Đặt ngang cho bảng rộng hơn
            PdfWriter.getInstance(document, out);
            document.open();

            // Tiêu đề
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Paragraph title = new Paragraph("User Data Export\n\n", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            // Tạo bảng với số cột giống file Excel
            String[] headers = {"ID", "Username", "Email", "Password", "Full Name", "Gender", "Mobile",
                    "Avatar", "Role", "Status", "Created At", "Updated At"};

            PdfPTable table = new PdfPTable(headers.length); // Số cột bằng header
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            // Header của bảng
            Font headerFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
            for (String header : headers) {
                PdfPCell cell = new PdfPCell(new Phrase(header, headerFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
                table.addCell(cell);
            }

            // Thêm dữ liệu từ danh sách User
            for (User user : list) {
                table.addCell(String.valueOf(user.getId()));
                table.addCell(user.getUsername());
                table.addCell(user.getEmail());
                table.addCell(user.getPasswordHash());
                table.addCell(user.getFullName());
                table.addCell(user.getGender());
                table.addCell(user.getMobile());
                table.addCell(user.getAvatar());
                table.addCell(user.getRole());
                table.addCell(user.getStatus());
                table.addCell(user.getCreatedAt());
                table.addCell(user.getUpdatedAt());
            }

            document.add(table);
            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
