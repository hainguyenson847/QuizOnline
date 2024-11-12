/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

/**
 *
 * @author ADMIN
 */
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

import dal.AccountDAO;
import model.Account;

@WebFilter("/*") // Áp dụng cho tất cả các URL
public class FilterByRole implements Filter {

    private Map<String, List<String>> protectedRoutes;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo ánh xạ giữa các servlet và các vai trò được phép truy cập
        protectedRoutes = new HashMap<>();
        //protectedRoutes.put("/admindashboard", Arrays.asList("admin"));
        //protectedRoutes.put("/salerdashboard", Arrays.asList("saler"));
//        protectedRoutes.put("/salerdeleteregistration", Arrays.asList("saler"));
//        protectedRoutes.put("/salerupdateregistration", Arrays.asList("saler"));
//        protectedRoutes.put("/salerregistrationlist", Arrays.asList("saler"));
//        protectedRoutes.put("/salerimportregistration", Arrays.asList("saler"));
//        protectedRoutes.put("/registrationdetail", Arrays.asList("saler"));
//        protectedRoutes.put("/searchregistration", Arrays.asList("saler"));
        protectedRoutes.put("/profile", Arrays.asList("customer"));
        protectedRoutes.put("/profile", Arrays.asList("customer"));
        protectedRoutes.put("/changavt", Arrays.asList("customer"));
        protectedRoutes.put("/quiz_handling", Arrays.asList("customer"));
        protectedRoutes.put("/quiz_review", Arrays.asList("customer"));
        protectedRoutes.put("/view_practice", Arrays.asList("customer"));
        protectedRoutes.put("/new_practice", Arrays.asList("customer"));
        protectedRoutes.put("/update_email", Arrays.asList("customer"));

        protectedRoutes.put("/customer/lesson_detail", Arrays.asList("customer"));
        protectedRoutes.put("/homepage_1", Arrays.asList("customer"));
        protectedRoutes.put("/customer/subject_list", Arrays.asList("customer"));
        protectedRoutes.put("/customer/blog_list", Arrays.asList("customer"));
        protectedRoutes.put("/customer/blog_details", Arrays.asList("customer"));

        protectedRoutes.put("/subject-details", Arrays.asList("admin"));
        protectedRoutes.put("/dimension", Arrays.asList("admin"));
        protectedRoutes.put("/subject-details", Arrays.asList("admin"));
        protectedRoutes.put("/price-package", Arrays.asList("admin"));
        protectedRoutes.put("/managerAccount", Arrays.asList("admin"));
        protectedRoutes.put("/listBlogAdmin", Arrays.asList("admin"));

        protectedRoutes.put("/question_detail_validation", Arrays.asList("expert"));
        protectedRoutes.put("/addquestion", Arrays.asList("expert"));
        protectedRoutes.put("/questionlist", Arrays.asList("expert"));
        protectedRoutes.put("/addquiz", Arrays.asList("expert"));
        protectedRoutes.put("/addnewquizvalidation", Arrays.asList("expert"));
        protectedRoutes.put("/quizlist", Arrays.asList("expert"));
        protectedRoutes.put("/exsubjectlist", Arrays.asList("expert"));
        protectedRoutes.put("/import", Arrays.asList("expert"));
        protectedRoutes.put("/listlesson", Arrays.asList("expert"));
        protectedRoutes.put("/editquestion", Arrays.asList("expert"));
        protectedRoutes.put("/editquestionvalidation", Arrays.asList("expert"));
        protectedRoutes.put("/editquizvalidation", Arrays.asList("expert"));
        protectedRoutes.put("/editlesson", Arrays.asList("expert"));
        protectedRoutes.put("/editquiz", Arrays.asList("expert"));
        protectedRoutes.put("/deletequestion", Arrays.asList("expert"));
        protectedRoutes.put("/deletequiz", Arrays.asList("expert"));
        protectedRoutes.put("/deletelesson", Arrays.asList("expert"));

        // Thêm các ánh xạ khác nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Lấy URI của yêu cầu và loại bỏ context path
        String uri = req.getRequestURI().substring(req.getContextPath().length());

        // Kiểm tra xem URI có nằm trong các đường dẫn được bảo vệ không
        if (protectedRoutes.containsKey(uri)) {
            HttpSession session = req.getSession(false);
            String userRole = null;

            if (session != null) {
                Account user = (Account) session.getAttribute("user");
                AccountDAO dao = new AccountDAO();
                if (user != null) {
                    userRole = dao.getRoleNameByRoleId(user.getRole_id()); // Giả sử getRole_id() trả về String như "admin", "customer", v.v.
                }
            }

            List<String> allowedRoles = protectedRoutes.get(uri);

            if (userRole == null || !allowedRoles.contains(userRole)) {
                // Người dùng chưa đăng nhập hoặc không có quyền truy cập
                res.sendRedirect(req.getContextPath() + "/common/404error.html");
                return;
            }
        }

        // Nếu đường dẫn không được bảo vệ hoặc người dùng có quyền, tiếp tục xử lý yêu cầu
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Dọn dẹp tài nguyên nếu cần
    }
}
