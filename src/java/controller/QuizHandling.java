/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DimensionDAO;
import dal.QuestionDAO;
import dal.QuizDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author DELL-PC
 */
public class QuizHandling extends HttpServlet {

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
            out.println("<title>Servlet QuizHandling</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuizHandling at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        QuizDAO qd = new QuizDAO();
        String isPrac = request.getParameter("is_practice");
        if(isPrac != null && !isPrac.isEmpty()) {
            request.setAttribute("prac", true);
        }
        else {
            request.setAttribute("prac", false);
        }
        //List<Quiz> quiz = qd.getAllQuiz();
        Quiz handleQuiz;
        try {
            String quizId = request.getParameter("id");
            handleQuiz = qd.getQuiz_OldVersion(Integer.parseInt(quizId));

        } catch (Exception e) {
            handleQuiz = qd.getQuiz_OldVersion(5);
        }
        if (handleQuiz == null) {
            handleQuiz = qd.getQuiz_OldVersion(5);
        }
        Account a = (Account) session.getAttribute("user");
        //PrintWriter out = response.getWriter();
        //out.print(handleQuiz);
        QuestionDAO qed = new QuestionDAO();
        List<Question_Handle> listQuestion = qed.getAllQuestionByQuizId(handleQuiz.getQuiz_id(), handleQuiz.getNumber_of_questions());
        DimensionDAO dd = new DimensionDAO();
        SubjectDAO sd = new SubjectDAO();
        session.setAttribute("dimension_dao", dd);
        session.setAttribute("subject_dao", sd);

        float passrate = qd.getPassRate(handleQuiz.getQuiz_id());
        session.setAttribute("passrate", passrate);
        session.setAttribute("handling_quiz", handleQuiz);
        int numberOfQuest = qd.getNumberOfQuestion(handleQuiz.getQuiz_id());
        if (session.getAttribute("duration") == null) {
            int duration = qd.getDuration(handleQuiz.getQuiz_id());
            session.setAttribute("duration", duration);
        }
        session.setAttribute("num_quest", numberOfQuest);
        if (session.getAttribute("questions") == null) {
            session.setAttribute("questions", listQuestion);
        }

        if (session.getAttribute("prac_record") == null) {
            LocalDateTime lc = LocalDateTime.now();
            Practice_Record pr = new Practice_Record(handleQuiz.getQuiz_name(), Timestamp.valueOf(lc), 0, 0, 0, a.getAccount_id(), handleQuiz.getQuiz_id());
            //out.print(listQuestion.size());
            qd.addPracticeRecord(pr);
            int newlyPractice = qd.searchNewlyPractice(a.getAccount_id());
            for (Question_Handle question_Handle : listQuestion) {
                question_Handle.setPractice_id(newlyPractice);
            }
            qed.addPracticeQuestions(listQuestion);
            pr.setPractice_id(newlyPractice);
            session.setAttribute("prac_record", pr);
            session.setAttribute("new_practice_id", newlyPractice);
        }
        if (session.getAttribute("curr_quest") == null) {
            session.setAttribute("curr_quest", 0);
        }

        request.getRequestDispatcher("customer/quiz_handling.jsp").forward(request, response);
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
        HttpSession session = request.getSession(true);
        // Lấy số lượng câu hỏi từ session hoặc các thông tin cần thiết khác
        int numQuestions = (Integer) session.getAttribute("num_quest");

        int countCorrect = 0;
        // Mảng lưu trữ câu trả lời của người dùng
        String[] userAnswers = new String[numQuestions];
        String[] userMarks = new String[numQuestions];
        int dur = Integer.parseInt(request.getParameter("dur"));
        int una = Integer.parseInt(request.getParameter("una"));

        request.setAttribute("una", una);
        request.setAttribute("dur", dur);
        // Duyệt qua từng câu hỏi để lấy câu trả lời
        for (int i = 1; i <= numQuestions; i++) {
            String answer = request.getParameter("question" + i);
            userAnswers[i - 1] = answer;
            userMarks[i - 1] = request.getParameter("mark" + i);
        }
        PrintWriter out = response.getWriter();
        List<Question_Handle> lq = (ArrayList<Question_Handle>) session.getAttribute("questions");
        if(lq == null) {
            response.sendRedirect("view_practice");
        }
        for (int i = 0; i < numQuestions; i++) {
            lq.get(i).setAnswered(userAnswers[i]);
            lq.get(i).setIs_mark("marked".equals(userMarks[i]));
        }
        QuestionDAO qed = new QuestionDAO();
        qed.updatePracticeQuestions(lq);
        for (int i = 0; i < numQuestions; i++) {
            boolean isCorr = isCorrect(lq.get(i).getList_answer(), userAnswers[i]);
            if (isCorr) {
                countCorrect++;
            }
            //out.println(isCorrect(lq.get(i).getList_answer(), userAnswers[i]));
        }
        request.setAttribute("incorrect", numQuestions - countCorrect);
        String formattedNumber = String.format("%.2f", ((countCorrect * 1.0) / (numQuestions * 1.0)));
        float correct_rate = Float.parseFloat(formattedNumber) * 100;
        request.setAttribute("correct_rate", (int) correct_rate);

        Practice_Record pr = (Practice_Record) session.getAttribute("prac_record");
        QuizDAO qd = new QuizDAO();
        pr.setCorrect_questions(countCorrect);
        pr.setCorrect_rate((int) correct_rate);
        pr.setPractice_duration(dur);
        qd.updatePracticeRecord(pr);
        //out.println(countCorrect);
        //processRequest(request, response);
        request.setAttribute("correct_quest", countCorrect);
        session.setAttribute("questions", null);
        session.setAttribute("duration", null);
        session.setAttribute("prac_record", null);
        request.getRequestDispatcher("customer/result.jsp").forward(request, response);
    }

    public boolean isCorrect(List<Answer> lq, String ans) {
        for (Answer answer : lq) {
            if (answer.getAnswer_detail().equalsIgnoreCase(ans)) {
                if (answer.isIsCorrect()) {
                    return true;
                }
            }
        }
        return false;
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
