/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JFileChooser;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author VuxD4t
 */
@WebServlet(name = "ExportToExcel", urlPatterns = {"/exporttoexcel"})
public class ExportToExcel extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ExportToExcel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportToExcel at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO d = new UserDAO();
        List<User> list = d.GetAllUsers();

        boolean isExport = exportToExcel(list);
        request.setAttribute("mess", isExport ? "Export success" : "Export failed");
        request.getRequestDispatcher("/admin/userlists.jsp").forward(request, response);

    }

    public boolean exportToExcel(List<User> list) {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Select directory to save");
        fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);

        int userSelection = fileChooser.showSaveDialog(null);
        if (userSelection != JFileChooser.APPROVE_OPTION) {
            return false;
        }

        File directionToSave = fileChooser.getSelectedFile();
        if (directionToSave == null) {
            return false;
        }

        Workbook workbook = new XSSFWorkbook();

        Sheet sheet = workbook.createSheet("User data");

        String[] headerTitle = {"id", "username", "email", "password_hash", "full_name", "gender",
            "mobile", "avatar", "role", "status", "created_at", "updated_at"};
        Row headerRow = sheet.createRow(0);

        for (int i = 0; i < headerTitle.length; i++) {
            headerRow.createCell(i).setCellValue(headerTitle[i]);
        }

        int rowNum = 1;
        for (User user : list) {
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

        String fileName = "userData.xlsx";
        File excelFile = new File(directionToSave, fileName);
        try (FileOutputStream fileOut = new FileOutputStream(excelFile)) {
            workbook.write(fileOut);
            System.out.println("success export");
            return true;
        } catch (IOException e) {
            System.out.println(e);
            return false;
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
