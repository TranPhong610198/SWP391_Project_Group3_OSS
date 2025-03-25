/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package websocket;

/**
 *
 * @author nguye
 */
import DAO.MessageDAO;
import entity.Message;
import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import com.google.gson.Gson;

@ServerEndpoint("/chat/{userId}")
public class ChatWebSocket {

    private static final Map<Integer, Session> sessions = Collections.synchronizedMap(new HashMap<>());
    private static final Gson gson = new Gson();

    @OnOpen
    public void onOpen(Session session, @PathParam("userId") String userIdStr) {
        int userId = Integer.parseInt(userIdStr);
        sessions.put(userId, session);
        System.out.println("User " + userId + " connected.");
    }

    @OnMessage
    public void onMessage(String messageJson, @PathParam("userId") String userIdStr) {
        int senderId = Integer.parseInt(userIdStr);
        MessageDAO messageDAO = new MessageDAO();
        int marketingId = messageDAO.getMarketingId();
        if (marketingId == -1) {
            sendError(senderId, "Không tìm thấy nhân viên marketing.");
            return;
        }

        // Parse JSON từ client
        Message message = gson.fromJson(messageJson, Message.class);
        message.setSenderId(senderId);

        // Xử lý tin nhắn từ khách hàng
        if (senderId != marketingId) {
            message.setReceiverId(marketingId);
        } else {
            // Tin nhắn từ marketing hoặc admin gửi cho khách hàng
            message.setReceiverId(message.getReceiverId());
        }

        // Lưu vào database
        boolean sent = messageDAO.sendMessage(senderId, message.getReceiverId(), message.getContent(), message.getImageUrl());
        if (sent) {
            // Gửi tin nhắn đến người nhận
            sendMessageToUser(message.getReceiverId(), message);
            // Gửi lại cho người gửi (để hiển thị trên giao diện của họ)
            sendMessageToUser(senderId, message);
        } else {
            sendError(senderId, "Không thể gửi tin nhắn.");
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("userId") String userIdStr) {
        int userId = Integer.parseInt(userIdStr);
        sessions.remove(userId);
        System.out.println("User " + userId + " disconnected.");
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.out.println("WebSocket error: " + throwable.getMessage());
    }

    private void sendMessageToUser(int userId, Message message) {
        Session session = sessions.get(userId);
        if (session != null && session.isOpen()) {
            try {
                session.getBasicRemote().sendText(gson.toJson(message));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void sendError(int userId, String errorMessage) {
        Session session = sessions.get(userId);
        if (session != null && session.isOpen()) {
            try {
                session.getBasicRemote().sendText(gson.toJson(new MessageError(errorMessage)));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Class phụ để gửi lỗi
    private static class MessageError {
        private String error;

        public MessageError(String error) {
            this.error = error;
        }

        public String getError() {
            return error;
        }
    }
}
