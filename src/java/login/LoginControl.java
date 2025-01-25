package login;

import DAO.UserDAO;
import DAO.TokenDAO;
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
import utils.Email;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển tiếp tới login.jsp
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
                response.sendRedirect("index.html");
            }
        }
    }
}
