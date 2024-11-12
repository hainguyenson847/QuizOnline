/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.LessonDAO;
import dal.PackageDAO;
import dal.QuizDAO;
import dal.RegistrationDAO;
import dal.SliderDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Post;
import model.RegisteredSubject;
import model.Slider;
import model.Subject;

/**
 *
 * @author Phuong Anh
 */
public class HomepageCustomer extends HttpServlet {

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
            out.println("<title>Servlet HomepageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomepageServlet at " + request.getContextPath() + "</h1>");
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
    int numberOfSubject = 6;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//post_list
        dal.PostDAO myPostDAO = new dal.PostDAO();
        ArrayList<Post> post_list = myPostDAO.getPost();
        request.setAttribute("post_list", post_list);

        //hottest_post_list
        ArrayList<Post> hottest_post_list = myPostDAO.getHottestPost();
        request.setAttribute("hottest_post_list", hottest_post_list);

        //subject_list
        SubjectDAO testDAO = new SubjectDAO();
        List<Subject> subject_list = testDAO.getSubject();
        request.setAttribute("subject_list", subject_list);

        PackageDAO packageDAO = new PackageDAO();
        List<model.Package> packageList = packageDAO.getAllPackage1();
        String selectedDuration = request.getParameter("courseDuration");
        model.Package selectedPackageModel = packageList.get(0);
        if (selectedDuration != null) {
            try {
                int duration = Integer.parseInt(selectedDuration);
                for (model.Package pkg : packageList) {
                    if (pkg.getDuration() == duration) {
                        selectedPackageModel = pkg;
                        break;
                    }
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course duration.");
                return;
            }
        }

        LessonDAO lessonDAO = new LessonDAO();
        int totalLessons = lessonDAO.countTotalLessons();
        request.setAttribute("totalLessons", totalLessons);

        QuizDAO quizDAO = new QuizDAO();
        int totalQuizzes = quizDAO.getQuizCount();
        request.setAttribute("totalQuizzes", totalQuizzes);

        int totalSubjects = testDAO.countSubjects();
        request.setAttribute("totalSubjects", totalSubjects);

        AccountDAO accountDAO = new AccountDAO();
        List<Account> account_list = new ArrayList<>();
        for (Subject subject : subject_list) {
            Account account = accountDAO.getAccountById(subject.getAccountId());
            account_list.add(account);
        }

        SliderDAO sliderDAO = new SliderDAO();
        List<Slider> sliders_list = sliderDAO.getAllSlider();
        request.setAttribute("sliders_list", sliders_list);

// Kiểm tra phiên đăng nhập
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            // Nếu không có người dùng đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login");
            return;
        }

        // Lấy đối tượng người dùng từ session
        Account user = (Account) session.getAttribute("user");
        int account_id = user.getAccount_id();

        // Gọi DAO để lấy danh sách môn học đã đăng ký
        RegistrationDAO registerDAO = new RegistrationDAO();
        ArrayList<Subject> registeredSubject_list = registerDAO.getRegisteredSubjectsByUserId(account_id);

        // Đặt danh sách vào request attribute và chuyển hướng đến JSP để hiển thị
        request.setAttribute("registeredSubject_list", registeredSubject_list);
        request.setAttribute("pkgDAO", packageDAO);
        request.setAttribute("account_list", account_list);
        request.setAttribute("selectedDuration", selectedDuration);
        request.setAttribute("selectedPackageModel", selectedPackageModel);
        request.getRequestDispatcher("customer/homepage_1.jsp").forward(request, response);
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
        doGet(request, response);
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