package marketing.chat;

import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import DAO.MessageDAO;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@ServerEndpoint("/chat/{marketingId}/{userId}")
public class ChatWebSocket {
    private static final Map<String, Session> sessions = Collections.synchronizedMap(new HashMap<>());
    private MessageDAO messageDAO = new MessageDAO();
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    @OnOpen
    public void onOpen(Session session, @PathParam("marketingId") String marketingId, @PathParam("userId") String userId) {
        String sessionKey = marketingId + "-" + userId;
        sessions.put(sessionKey, session);
        System.out.println("WebSocket opened for marketing " + marketingId + " with user " + userId);
    }

    @OnClose
    public void onClose(Session session, @PathParam("marketingId") String marketingId, @PathParam("userId") String userId) {
        String sessionKey = marketingId + "-" + userId;
        sessions.remove(sessionKey);
        System.out.println("WebSocket closed for marketing " + marketingId + " with user " + userId);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("marketingId") String marketingId, @PathParam("userId") String userId) throws IOException {
        try {
            System.out.println("Received message: " + message);
            JsonObject jsonMessage = JsonParser.parseString(message).getAsJsonObject();
            int senderId = jsonMessage.get("senderId").getAsInt();
            String content = jsonMessage.has("content") ? jsonMessage.get("content").getAsString() : "";
            String imageUrl = jsonMessage.has("imageUrl") ? jsonMessage.get("imageUrl").getAsString() : null;

            int receiverId = (senderId == Integer.parseInt(marketingId)) ? Integer.parseInt(userId) : Integer.parseInt(marketingId);

            boolean saved = messageDAO.sendMessage(senderId, receiverId, content, imageUrl);
            if (saved) {
                String formattedTime = LocalDateTime.now().format(formatter);
                String responseMessage = "{\"senderId\": \"" + senderId + "\", \"content\": \"" + content + "\", \"createdAt\": \"" + formattedTime + "\"";
                if (imageUrl != null) {
                    responseMessage += ", \"imageUrl\": \"" + imageUrl + "\"";
                }
                responseMessage += "}";
                System.out.println("Sending response: " + responseMessage);

                String marketingSessionKey = marketingId + "-" + userId;
                String customerSessionKey = userId + "-" + marketingId;

                Session marketingSession = sessions.get(marketingSessionKey);
                if (marketingSession != null && marketingSession.isOpen()) {
                    marketingSession.getAsyncRemote().sendText(responseMessage);
                }

                Session customerSession = sessions.get(customerSessionKey);
                if (customerSession != null && customerSession.isOpen()) {
                    customerSession.getAsyncRemote().sendText(responseMessage);
                }
            }
        } catch (Exception e) {
            System.out.println("Error parsing message: " + message + " - " + e.getMessage());
            e.printStackTrace();
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.out.println("WebSocket error: " + throwable.getMessage());
    }

    // Phương thức để chia sẻ sessions
    public static Map<String, Session> getSessions() {
        return sessions;
    }
}