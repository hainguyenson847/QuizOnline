/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.CategoryDAO;
import dal.LessonDAO;
import dal.PackageDAO;
import dal.QuizDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.*;

/**
 *
 * @author Phuong Anh
 */
public class SubjectDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet SubjectDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectDetailServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String raw_subject_id = request.getParameter("subject_id");
        int subject_id = Integer.parseInt(raw_subject_id);

        PackageDAO packageDAO = new PackageDAO();

        List<model.Package> packageList = packageDAO.getListPackageBySubjectID(subject_id);


        SubjectDAO mySubjectDAO = new SubjectDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        AccountDAO accountDAO = new AccountDAO();
        LessonDAO lessonDAO = new LessonDAO();

        Subject mySubject = mySubjectDAO.getSubjectByID(subject_id);
        if (mySubject == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Subject not found.");
            return;
        }

        String categoryName = categoryDAO.getCategoryNameById(mySubject.getCategoryId());
        Account account = accountDAO.getAccountById(mySubject.getAccountId());
        List<Lesson> lessonList = lessonDAO.getAllLessonBySubjectId(subject_id);
        int totalLessons = lessonDAO.countLessonsBySubjectId(subject_id);

        // Lấy loại và chủ đề bài học
        List<Lesson_Type> lessonTypes = lessonDAO.getLessonTypesBySubjectId(subject_id);
        List<Lesson_Topic> lessonTopics = lessonDAO.getLessonTopicsBySubjectId(subject_id);

        // Gán tên loại và chủ đề cho các bài học
        for (Lesson lesson : lessonList) {
            for (Lesson_Type type : lessonTypes) {
                if (lesson.getLesson_type_id() == type.getLesson_type_id()) {
                    lesson.setLessonTypeName(type.getLesson_type_name());
                }
            }
            for (Lesson_Topic topic : lessonTopics) {
                if (lesson.getLesson_topic_id() == topic.getLesson_topic_id()) {
                    lesson.setLessonTopicName(topic.getLesson_topic_name());
                }
            }
        }

        // Lấy thông tin gói khóa học
        String selectedDuration = request.getParameter("courseDuration");
        model.Package selectedPackageModel = packageList.get(0);
        out.print(selectedPackageModel);
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

        QuizDAO quizDAO = new QuizDAO();
        int totelQuiz = quizDAO.getTotalQuizzesBySubjectId(subject_id);
        request.setAttribute("totelQuiz", totelQuiz);

        request.setAttribute("selectedDuration", selectedDuration);
        request.setAttribute("packageList", packageList);
        request.setAttribute("selectedPackageModel", selectedPackageModel);
        request.setAttribute("mySubject", mySubject);
        request.setAttribute("categoryName", categoryName);
        request.setAttribute("account", account);
        request.setAttribute("lessonList", lessonList);
        request.setAttribute("lessonTopics", lessonTopics);
        request.setAttribute("totalLessons", totalLessons);

        HttpSession session = request.getSession(false);
        boolean isRegistered = false;

        if (session != null) {
            Account user = (Account) session.getAttribute("user");
            if (user != null) {
                SubjectDAO registrationDAO = new SubjectDAO();
                isRegistered = registrationDAO.isSubjectRegistered(user.getAccount_id(), subject_id);
                request.setAttribute("isRegistered", isRegistered);
                request.getRequestDispatcher("customer/subject_details.jsp").forward(request, response);
                return;
            }
        }

        request.getRequestDispatcher("common/subject_details.jsp").forward(request, response);
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
        processRequest(request, response);

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
