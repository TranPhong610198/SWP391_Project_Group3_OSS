package utils;

import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.UUID;
import entity.User;

public class Email {

    private static final String HOST = "smtp.gmail.com";
    private static final String PORT = "587";
    private static final String USERNAME = "adswp391@gmail.com";
    private static final String PASSWORD = "njaf vowl xdlz rwsk";

    private final int LIMIT_MINUS = 2; //2 minutes

    public String generateToken() {
        return UUID.randomUUID().toString();
    }

    public LocalDateTime expireDateTime() {
        return LocalDateTime.now().plusMinutes(LIMIT_MINUS);
    }

    public boolean isExpireTime(LocalDateTime time) {
        return LocalDateTime.now().isAfter(time);
    }

    public boolean sendEmail(User user, String verificationToken) {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", HOST);

        try {
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
            message.setSubject("Xác Minh Tài Khoản Của Bạn");

            String verificationLink = "http://localhost:9999/fashionshop/verify?token=" + verificationToken;
            String htmlContent = String.format(
                    "<html>"
                    + "<head>"
                    + "<style>"
                    + "body {font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f2f2f2;}"
                    + ".container {padding: 20px; max-width: 600px; margin: 0 auto; background-color: #ffffff; border: 1px solid #dddddd; border-radius: 5px;}"
                    + ".header {background-color: #4CAF50; padding: 10px; text-align: center; color: #ffffff;}"
                    + ".content {padding: 20px;}"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'><h2>Xác Minh Tài Khoản</h2></div>"
                    + "<div class='content'><p>Xin chào %s,</p>"
                    + "<p>Fashion Shop xin thông bảo tài khoản của bạn đã được đăng ký thành công, vui lòng nhấp vào liên kết bên dưới để xác thực email của bạn.</p>"
                    + "<a href='%s' style='display:block;width:max-content;margin:0 auto;padding:10px;text-align:center;color:#ffffff;background-color:#4CAF50;border-radius:5px;text-decoration:none;'>Verify Account</a>"
                    + "<p>Liên kết này sẽ hết hạn sau 2 phút.</p>"
                    + "<p>Trân trọng,<br>Từ Fashion Shop</p></div>"
                    + "</div>"
                    + "</body>"
                    + "</html>",
                    user.getFullName(),
                    verificationLink
            );

            message.setContent(htmlContent, "text/html; charset=UTF-8");
            Transport.send(message);
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        Email email = new Email();
        boolean sent = email.sendEmail(
                new User("testUser", "huyndhe186775@fpt.edu.vn", "password", "Test User", "Male", "1234567890"),
                "Token123"
        );
        System.out.println("Email sent: " + sent);
    }
}