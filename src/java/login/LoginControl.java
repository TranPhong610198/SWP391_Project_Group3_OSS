package login;

import DAO.UserDAO;
import DAO.TokenDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import entity.User;
import entity.Token;
import java.time.LocalDateTime;
import org.apache.http.client.fluent.Request;
import utils.Email;

/**
 *
 * @author nguye
 */
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        if (code != null && !code.isEmpty()) {
            try {
                // Lấy Google info
                String accessToken = GoogleLogin.getToken(code);
                String userInfoJson = Request.Get(ClientSecret.GOOGLE_LINK_GET_USER_INFO + accessToken)
                        .execute().returnContent().asString();

                JsonObject userInfo = new Gson().fromJson(userInfoJson, JsonObject.class);

                // Trích xuất info user từ response
                String googleId = userInfo.get("id").getAsString();
                String email = userInfo.get("email").getAsString();
                String fullName = userInfo.get("name").getAsString();
                String picture = userInfo.get("picture").getAsString();

                UserDAO userDao = new UserDAO();
                TokenDAO tokenDao = new TokenDAO();
                User existingUser = userDao.checkExistEmail(email);

                if (existingUser != null) {
                    if ("pending".equals(existingUser.getStatus())) {
                        userDao.activateUser(existingUser.getId());
                        tokenDao.deleteUserTokens(existingUser.getId()); 
                    }

                    HttpSession session = request.getSession();
                    session.setAttribute("acc", existingUser);
                    session.setAttribute("userID", existingUser.getId());
                    response.sendRedirect("index.jsp");
                    return;
                } else {
                    userDao.insertGoogleUser(googleId, email, fullName, picture);
                    existingUser = userDao.checkExistEmail(email);
                }

                // lưu session
                HttpSession session = request.getSession();
                session.setAttribute("acc", existingUser);
                session.setAttribute("userID", existingUser.getId());

                response.sendRedirect("index.jsp");
                return;

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("mess", "Đăng nhập Google thất bại. Vui lòng thử lại.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        request.getRequestDispatcher("login.jsp").forward(request, response);
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDao = new UserDAO();
        TokenDAO tokenDao = new TokenDAO();

        User account = userDao.checkAccount(username, password);

        if (account == null) {
            // Sai tên đăng nhập hoặc mật khẩu
            request.setAttribute("mess", "Tên đăng nhập hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if ("pending".equals(account.getStatus())) {
                // Gửi token xác minh qua email
                Email emailUtil = new Email();
                String token = emailUtil.generateToken();
                LocalDateTime expiryTime = emailUtil.expireDateTime();

                // Lưu token mới vào database
                Token verificationToken = new Token(account.getId(), false, token, expiryTime);
                tokenDao.insertTokenForget(verificationToken);

                boolean emailSent = emailUtil.sendEmail(account, token);

                if (!emailSent) {
                    request.setAttribute("mess", "Không thể gửi email xác minh. Vui lòng thử lại sau.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }

                request.setAttribute("mess", "Email của bạn chưa được xác thực. Một email xác thực đã được gửi đến bạn.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                // Đăng nhập thành công
                HttpSession session = request.getSession();
                session.setAttribute("acc", account);
                session.setAttribute("userID", account.getId());
                response.sendRedirect("index.jsp");
            }
        }
    }
}
