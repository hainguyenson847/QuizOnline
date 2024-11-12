/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
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
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;
import model.Account;
import model.Dimension;
import model.Lesson_Topic;
import model.Question;
import model.Quiz;
import model.Quiz_Question;
import model.RegisteredSubject;
import model.Subject;

/**
 *
 * @author DELL-PC
 */
public class NewPractice extends HttpServlet {

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
            out.println("<title>Servlet NewPractice</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewPractice at " + request.getContextPath() + "</h1>");
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
        AccountDAO ad = new AccountDAO();
        QuizDAO qd = new QuizDAO();
        Account ac = (Account) session.getAttribute("user");
        ac = ad.getAccountById(ac.getAccount_id());
        session.setAttribute("user", ac);
        SubjectDAO sd = new SubjectDAO();
        List<RegisteredSubject> listSuject = sd.getEnrolledSubject(ac);
        session.setAttribute("list_sub", listSuject);
        session.setAttribute("qd", qd);
        //List<Lesson_Topic> listTop = qd.getAllLessonTopicBySubjectId(0);
        request.getRequestDispatcher("customer/new_practice.jsp").forward(request, response);
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
        Account a = (Account) session.getAttribute("user");
        AccountDAO ad = new AccountDAO();
        a = ad.getAccountById(a.getAccount_id());
        QuizDAO qd = new QuizDAO();
        String subject = request.getParameter("sub");
        String td = request.getParameter("td");
        String name = request.getParameter("ex_name");
        String ex_num = request.getParameter("ex_num");
        String level = request.getParameter("level");
        String group = request.getParameter("group");
        PrintWriter out = response.getWriter();
        String sbm = request.getParameter("sbm");
        request.setAttribute("td", td);
        request.setAttribute("subject", subject);
        request.setAttribute("name", name);
        request.setAttribute("ex_num", ex_num);
        request.setAttribute("level", level);
        request.setAttribute("group", group);
        if (!subject.equalsIgnoreCase("all") && sbm == null) {
            int subject_id = Integer.parseInt(subject);
            Subject s = qd.getSubjectById(subject_id);
            if (td != null && !td.isEmpty() && td.equalsIgnoreCase("by_topic")) {
                List<Lesson_Topic> listTopic = qd.getAllLessonTopicBySubjectId(subject_id);
                request.setAttribute("topics", listTopic);
            } else if (td != null && !td.isEmpty() && td.equalsIgnoreCase("by_dimension")) {
                List<Dimension> listD = qd.getAllDimensionBySubjectId(subject_id);
                request.setAttribute("dims", listD);
            }
            request.getRequestDispatcher("customer/new_practice.jsp").forward(request, response);
        } else if (subject.equalsIgnoreCase("all")) {
            request.setAttribute("group", null);
            request.setAttribute("no_subject", "Choose subject first");
            request.getRequestDispatcher("customer/new_practice.jsp").forward(request, response);
        } else if (td.isEmpty() || group.isEmpty()) {
            request.setAttribute("group", null);
            request.setAttribute("no_subject", "Please choose all the field");
            request.getRequestDispatcher("customer/new_practice.jsp").forward(request, response);
        } else if (!subject.isEmpty() && !td.isEmpty() && !name.isBlank() && !ex_num.isEmpty() && !group.isEmpty() && sbm != null) {
            int subject_id = Integer.parseInt(subject);
            int group_id = Integer.parseInt(group);
            int lv = Integer.parseInt(level);
            
            if (td.equalsIgnoreCase("by_topic")) {
                
                int count = qd.getNumberOfQuestionBySubjectAndLessonTopic(subject_id, group_id, lv);
                int num = Integer.parseInt(ex_num);
                if (count < num) {
                    List<Lesson_Topic> listTopic = qd.getAllLessonTopicBySubjectId(subject_id);
                    request.setAttribute("topics", listTopic);
                    request.setAttribute("no_subject", "Failed to create practice. Not enough questions available. Available questions: " + count);
                    request.getRequestDispatcher("customer/new_practice.jsp").forward(request, response);
                    //out.print(subject + " - " + group_id + " - " + lv + " - " + count);
                } else {
                    int num_quest = Integer.parseInt(ex_num);
                    Timestamp date = Timestamp.valueOf(LocalDateTime.now());
                    String new_name = name;
                    int selectedGroup;
                    if (!td.isEmpty() && td.equalsIgnoreCase("by_topic")) {
                        selectedGroup = 1;
                    } else {
                        selectedGroup = 2;
                    }
                    List<Question> listQuestion = qd.getAllSelectQuestionByTopic(subject_id, group_id, num_quest, lv);
                    Quiz q = new Quiz(new_name, subject_id, lv, num_quest, Duration.ofMillis((long) (100 * 60 * 1000)), 50, 1, "Practice quiz", date, date, a.getAccount_id(), selectedGroup);
                    qd.addQuiz(q);
                    int id = qd.getNewlyAddedQuizByAccountId(a.getAccount_id()).getQuiz_id();
                    for (Question question : listQuestion) {
                        qd.addQuizQuestion(new Quiz_Question(id, question.getQuestion_id()));
                    }
                    //out.print(q);
                    response.sendRedirect("quiz_handling?id=" + id + "&is_practice=true");
                    
                }
            } else {
                int count = qd.getNumberOfQuestionBySubjectAndDimensionId(subject_id, group_id, lv);
                int num = Integer.parseInt(ex_num);
                if (count < num) {
                    List<Dimension> listD = qd.getAllDimensionBySubjectId(subject_id);
                    request.setAttribute("dims", listD);
                    request.setAttribute("no_subject", "Failed to create practice. Not enough questions available. Available questions: " + count);
                    request.getRequestDispatcher("customer/new_practice.jsp").forward(request, response);
                    //out.print(group_id + " - " + subject + " - " + lv + " - " + count);
                } else {
                    int num_quest = Integer.parseInt(ex_num);
                    Timestamp date = Timestamp.valueOf(LocalDateTime.now());
                    String new_name = name;
                    int selectedGroup;
                    if (!td.isEmpty() && td.equalsIgnoreCase("by_topic")) {
                        selectedGroup = 1;
                    } else {
                        selectedGroup = 2;
                    }
                    
                    List<Question> listQuestion = qd.getAllSelectQuestionByDimension(subject_id, group_id, num_quest, lv);
                    Quiz q = new Quiz(new_name, subject_id, lv, num_quest, Duration.ofMillis((long) (100 * 60 * 1000)), 50, 1, "Practice quiz", date, date, a.getAccount_id(), selectedGroup);
                    qd.addQuiz(q);
                    int id = qd.getNewlyAddedQuizByAccountId(a.getAccount_id()).getQuiz_id();
                    for (Question question : listQuestion) {
                        qd.addQuizQuestion(new Quiz_Question(id, question.getQuestion_id()));
                    }
                    //out.print(q);
                    response.sendRedirect("quiz_handling?id=" + id + "&is_practice=true");
                }
                
            }
        } else if (name.isBlank() && ex_num.isEmpty()) {
            request.setAttribute("no_subject", "Please fill all field.");
            request.getRequestDispatcher("customer/new_practice.jsp").forward(request, response);
        } else {

            //ao.addQuiz(new Quiz(name, subject_id_new, level_id_new, total_question_new, Duration.ofMillis((long) (duration_new * 60 * 1000)), passrate_new, quiz_type_id_new, description, Timestamp.valueOf(LocalDateTime.now()), Timestamp.valueOf(LocalDateTime.now()), account_id, 1));
            //qd.addQuiz(q);
        }
        
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
