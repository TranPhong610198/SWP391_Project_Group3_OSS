package marketing;

import DAO.CustomerDAO;
import entity.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.regex.Pattern;

@WebServlet(name = "CustomerAddServlet", urlPatterns = "/marketing/addCustomer")
public class AddCustomer extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/marketing/customerform.jsp").forward(request, response);
    }

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String gender = request.getParameter("gender");
            String customerType = request.getParameter("customerType");
            String address = request.getParameter("address");
            String userIdStr = request.getParameter("userId");
            String totalPurchasesStr = request.getParameter("totalPurchases");
            String totalSpendStr = request.getParameter("totalSpend");

            // Log inputs for debugging
            System.out.println("fullName: " + fullName);
            System.out.println("email: " + email);
            System.out.println("mobile: " + mobile);
            System.out.println("gender: " + gender);
            System.out.println("customerType: " + customerType);
            System.out.println("address: " + address);
            System.out.println("userId: " + userIdStr);
            System.out.println("totalPurchases: " + totalPurchasesStr);
            System.out.println("totalSpend: " + totalSpendStr);

            // Set attributes for form repopulation if validation fails
            Customer customer = new Customer();
            customer.setFullName(fullName);
            customer.setEmail(email);
            customer.setMobile(mobile);
            customer.setGender(gender);
            customer.setCustomerType(customerType);
            customer.setAddress(address);
            
            if (userIdStr != null && !userIdStr.trim().isEmpty()) {
                try {
                    customer.setUserId(Integer.parseInt(userIdStr));
                } catch (NumberFormatException e) {
                    // User ID is optional, so we can ignore this error
                }
            }
            
            if (totalPurchasesStr != null && !totalPurchasesStr.trim().isEmpty()) {
                try {
                    customer.setTotalPurchases(Integer.parseInt(totalPurchasesStr));
                } catch (NumberFormatException e) {
                    customer.setTotalPurchases(0);
                }
            } else {
                customer.setTotalPurchases(0);
            }
            
            if (totalSpendStr != null && !totalSpendStr.trim().isEmpty()) {
                try {
                    customer.setTotalSpend(new BigDecimal(totalSpendStr));
                } catch (NumberFormatException e) {
                    customer.setTotalSpend(BigDecimal.ZERO);
                }
            } else {
                customer.setTotalSpend(BigDecimal.ZERO);
            }
            
            request.setAttribute("customer", customer);

            // Validate input
            if (isNullOrEmpty(fullName) || isNullOrEmpty(email)
                    || isNullOrEmpty(mobile) || isNullOrEmpty(gender)
                    || isNullOrEmpty(customerType) || isNullOrEmpty(address)) {
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin!");
                request.getRequestDispatcher("/marketing/customerform.jsp").forward(request, response);
                return;
            }

            // Validate fullname
            if (!Pattern.matches("^([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+([ ]([A-ZĐẮẰẲẴẶÀẢÃÁẠÂẦẨẪẬẤĂẲẮẰẴẲẸẺẼÈÉẸÊỀỂỄỆẾÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴỴ]|[a-zđắằẳẵặàảãáạâầẩẫậấăằẳẵẳẹẻẽèéẹêềểễệếìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ])+)*$", fullName)) {
                request.setAttribute("error", "Vui lòng nhập họ và tên hợp lệ.");
                request.getRequestDispatcher("/marketing/customerform.jsp").forward(request, response);
                return;
            }

            // Validate email format
            if (!Pattern.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", email)) {
                request.setAttribute("error", "Vui lòng nhập email hợp lệ.");
                request.getRequestDispatcher("/marketing/customerform.jsp").forward(request, response);
                return;
            }

            // Validate phone
            if (!Pattern.matches("^(\\+84|0)[1-9][0-9]{8,9}$", mobile)) {
                request.setAttribute("error", "Vui lòng nhập số điện thoại Việt Nam hợp lệ.");
                request.getRequestDispatcher("/marketing/customerform.jsp").forward(request, response);
                return;
            }

            // Check if customer already exists with the same email or phone
            CustomerDAO customerDAO = new CustomerDAO();

            Customer checkExistEmail = customerDAO.checkExistEmail(email);
            if (checkExistEmail != null) {
                request.setAttribute("error", "Email đã được đăng ký!");
                request.getRequestDispatcher("/marketing/customerform.jsp").forward(request, response);
                return;
            }
            
            Customer checkExistPhone = customerDAO.checkExistPhone(mobile);
            if (checkExistPhone != null) {
                request.setAttribute("error", "Số điện thoại đã được đăng ký!");
                request.getRequestDispatcher("/marketing/customerform.jsp").forward(request, response);
                return;
            }

            // Add customer to database
            boolean success = customerDAO.addCustomer(customer);

            if (success) {
                // Redirect to customer list with success message
                response.sendRedirect(request.getContextPath() + "/marketing/customerlist");
            } else {
                request.setAttribute("error", "Không thể tạo khách hàng mới");
                request.getRequestDispatcher("/marketing/customerform.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi khi tạo khách hàng");
            request.getRequestDispatcher("/marketing/customerform.jsp").forward(request, response);
        }
    }
}