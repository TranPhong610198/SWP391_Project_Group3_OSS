package marketing.chat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import DAO.MessageDAO;
import com.google.gson.JsonObject;
import jakarta.websocket.Session;
import java.util.Map;
import java.util.Collections;

@WebServlet("/uploadImage")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {

    private static final Map<String, Session> sessions = Collections.synchronizedMap(ChatWebSocket.getSessions()); // Lấy sessions từ ChatWebSocket
    private MessageDAO messageDAO = new MessageDAO();
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        Integer userId = (Integer) request.getSession().getAttribute("userID");
        String marketingIdStr = request.getParameter("marketingId");

        if (userId == null || marketingIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing userId or marketingId");
            return;
        }

        int marketingId = Integer.parseInt(marketingIdStr);

        // Upload ảnh
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        String imageUrl = request.getContextPath() + "/uploads/" + fileName;

        // Lưu tin nhắn vào database
        boolean saved = messageDAO.sendMessage(userId, marketingId, "", imageUrl);
        if (saved) {
            // Gửi qua WebSocket
            String formattedTime = LocalDateTime.now().format(formatter);
            String responseMessage = "{\"senderId\": \"" + userId + "\", \"content\": \"\", \"createdAt\": \"" + formattedTime + "\", \"imageUrl\": \"" + imageUrl + "\"}";

            String senderToReceiverKey = userId + "-" + marketingId; // Từ customer đến marketing
            String receiverToSenderKey = marketingId + "-" + userId; // Từ marketing đến customer

            Session senderSession = sessions.get(senderToReceiverKey);
            Session receiverSession = sessions.get(receiverToSenderKey);

            if (senderSession != null && senderSession.isOpen()) {
                senderSession.getAsyncRemote().sendText(responseMessage);
            }
            if (receiverSession != null && receiverSession.isOpen()) {
                receiverSession.getAsyncRemote().sendText(responseMessage);
            }
        }

         // Trả về JSON cho client
        response.setContentType("application/json");
        response.getWriter().write("{\"imageUrl\": \"" + imageUrl + "\"}");
    }

    // Phương thức để lấy sessions từ ChatWebSocket
    public static Map<String, Session> getSessions() {
        return ChatWebSocket.getSessions();
    }
}

