package marketing.chat;

import DAO.MessageDAO;
import entity.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

/**
 *
 * @author nguye
 */
@WebServlet(name = "ChatBoxServlet", urlPatterns = {"/marketing/chatbox"})
public class ChatBoxServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer userId = (Integer) request.getSession().getAttribute("userID");
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int customerId = Integer.parseInt(request.getParameter("userId"));
        MessageDAO messageDAO = new MessageDAO();
        int marketingId = messageDAO.getMarketingId();
        if (marketingId == -1) {
            request.setAttribute("error", "Không tìm thấy nhân viên marketing.");
            request.getRequestDispatcher("/marketing/chat/chatBox.jsp").forward(request, response);
            return;
        }

        List<Message> messages = messageDAO.getMessagesBetweenUsers(marketingId, customerId);
        messageDAO.markAsRead(marketingId, customerId);

        request.setAttribute("messages", messages);
        request.setAttribute("userId", customerId);
        request.getRequestDispatcher("/marketing/chat/chatBox.jsp").forward(request, response);
    }
}