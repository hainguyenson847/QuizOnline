/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.QuizDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Quiz;
import model.Subject;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import model.Account;
import model.Question;
import model.Quiz_Question;

/**
 *
 * @author FPT SHOP
 */
public class AddQuizServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet AddQuizServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddQuizServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user");
        QuizDAO dao = new QuizDAO();
        SubjectDAO sdao = new SubjectDAO();
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String subject_id = request.getParameter("subject_id");
        String level_id = request.getParameter("level_id");
        String duration = request.getParameter("duration");
        String passrate = request.getParameter("passrate");
        String quiztype_id = request.getParameter("quiztype_id");
        String description = request.getParameter("description");
        String totalquestion = request.getParameter("totalquestion");
        String question_type = request.getParameter("question_type");
        request.setAttribute("name", name);
        request.setAttribute("subject_id", Integer.parseInt(subject_id));
        request.setAttribute("level_id", level_id);
        request.setAttribute("duration", duration);
        request.setAttribute("passrate", passrate);
        request.setAttribute("quiztype_id", quiztype_id);
        request.setAttribute("description", description);
        request.setAttribute("totalquestion", totalquestion);
        request.setAttribute("question_type", question_type);
        
        request.setAttribute("listSubject", sdao.getListSubjectByAccount(a.getAccount_id()));
        request.setAttribute("listLevel", dao.getAllLevel());
        request.setAttribute("listQuiz_Type", dao.getAllQuizType());
        //Get activeTab
        String activeTab = request.getParameter("activeTab");
        request.setAttribute("activeTab", activeTab);
        
        if (question_type.equals("topic")) {
            request.setAttribute("questionTopic", dao.getAllLessonTopicBySubjectId(Integer.parseInt(subject_id)));
        }
        else if (question_type.equals("group")) {
            request.setAttribute("questionGroup", dao.getAllDimensionByType(1, Integer.parseInt(subject_id)));
        }
        else {
            request.setAttribute("questionDomain", dao.getAllDimensionByType(2, Integer.parseInt(subject_id)));
        }
        request.getRequestDispatcher("expert/add_quiz.jsp").forward(request, response);
        
        
        //Add New Comment here
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        QuizDAO dao = new QuizDAO();
        SubjectDAO sdao = new SubjectDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String subject_id = request.getParameter("subject_id");
        String level_id = request.getParameter("level_id");
        String duration = request.getParameter("duration");
        String passrate = request.getParameter("passrate");
        String quiztype_id = request.getParameter("quiztype_id");
        String description = request.getParameter("description");
        String totalquestion = request.getParameter("totalquestion");
        String question_type = request.getParameter("question_type");
        
        
        request.setAttribute("name", name);
        request.setAttribute("subject_id", Integer.parseInt(subject_id));
        request.setAttribute("level_id", level_id);
        request.setAttribute("duration", duration);
        request.setAttribute("passrate", passrate);
        request.setAttribute("quiztype_id", quiztype_id);
        request.setAttribute("description", description);
        request.setAttribute("totalquestion", totalquestion);
        request.setAttribute("question_type", question_type);
        
        request.setAttribute("listSubject", sdao.getListSubjectByAccount(a.getAccount_id()));
        request.setAttribute("listLevel", dao.getAllLevel());
        request.setAttribute("listQuiz_Type", dao.getAllQuizType());
        
        if (question_type.equals("topic")) {
            request.setAttribute("questionTopic", dao.getAllLessonTopicBySubjectId(Integer.parseInt(subject_id)));
        }
        else if (question_type.equals("group")) {
            request.setAttribute("questionGroup", dao.getAllDimensionByType(1, Integer.parseInt(subject_id)));
        }
        else {
            request.setAttribute("questionDomain", dao.getAllDimensionByType(2, Integer.parseInt(subject_id)));
        }
        
        String number_of_questions[] = request.getParameterValues("number_of_questions");
        boolean no_question = true;
        for (String number_of_question : number_of_questions) {
            if(!number_of_question.equals("0")) {
                no_question = false;
            }
        }
        if (no_question) {
            request.setAttribute("message", "No Questions chose for the quiz!");
            request.getRequestDispatcher("expert/add_quiz.jsp").forward(request, response);
            return;
        }
        String group_selection[] = request.getParameterValues("group_selection");
        
        //This line is temporary, the account_id should be selected from session
        Account user = (Account)session.getAttribute("user");
        int account_id = user.getAccount_id();
      
        //Build logic for retrive questions 
        HashMap<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < group_selection.length; i++) {
            int selection_id = Integer.parseInt(group_selection[i]);
            int number_of_question = Integer.parseInt(number_of_questions[i]);
            this.addGroup(selection_id, number_of_question, map);
        }
        if (question_type.equals("topic")) {
            for (Integer key : map.keySet()) {
                int available = dao.getNumberOfQuestionBySubjectAndLessonTopic(Integer.parseInt(subject_id), key, Integer.parseInt(level_id));
                if (map.get(key) > available) {
                    request.setAttribute("message", "Not enough question for " + dao.getLessonTopicById(key).getLesson_topic_name() + ", available: " + available);
                    request.getRequestDispatcher("expert/add_quiz.jsp").forward(request, response);
                    return;
                }
            }
        } else {
            for (Integer key : map.keySet()) {
                int available = dao.getNumberOfQuestionBySubjectAndDimensionId(Integer.parseInt(subject_id), key, Integer.parseInt(level_id));
                if (map.get(key) > available) {
                    request.setAttribute("message", "Not enough question for " + dao.getDimensionById(key).getDimension_name() + ", available: " + available);
                    request.getRequestDispatcher("expert/add_quiz.jsp").forward(request, response);
                    return;
                }
            }
        }
        
        //Add to database after logic
        try {
            int subject_id_new = Integer.parseInt(subject_id);
            int level_id_new = Integer.parseInt(level_id);
            double duration_new = Double.parseDouble(duration) * 60;
            double passrate_new = Double.parseDouble(passrate);
            if (duration_new > 3600) {
                request.setAttribute("message", "Quiz duration cannot exceed 60 minutes!");
                request.getRequestDispatcher("expert/add_quiz.jsp").forward(request, response);
                return;
            }
            else if (passrate_new > 100) {
                request.setAttribute("message", "Passrate cannot exceed 100%!");
                request.getRequestDispatcher("expert/add_quiz.jsp").forward(request, response);
                return;
            }
            int quiz_type_id_new = Integer.parseInt(quiztype_id);
            int total_question_new = Integer.parseInt(totalquestion);

            //Add Quiz
            if (question_type.equals("topic")) {
                dao.addQuiz(new Quiz(name, subject_id_new, level_id_new, total_question_new, Duration.ofMillis((long) (duration_new * 60 * 1000)), passrate_new, quiz_type_id_new, description, Timestamp.valueOf(LocalDateTime.now()), Timestamp.valueOf(LocalDateTime.now()), account_id, 1));
            }
            else if (question_type.equals("group")) {
                dao.addQuiz(new Quiz(name, subject_id_new, level_id_new, total_question_new, Duration.ofMillis((long) (duration_new * 60 * 1000)), passrate_new, quiz_type_id_new, description, Timestamp.valueOf(LocalDateTime.now()), Timestamp.valueOf(LocalDateTime.now()), account_id, 2));
            }
            else {
                dao.addQuiz(new Quiz(name, subject_id_new, level_id_new, total_question_new, Duration.ofMillis((long) (duration_new * 60 * 1000)), passrate_new, quiz_type_id_new, description, Timestamp.valueOf(LocalDateTime.now()), Timestamp.valueOf(LocalDateTime.now()), account_id, 3));
            }
            //Add Quiz Question
            for (Integer key : map.keySet()) {
                List<Question> listQuestion;
                if (question_type.equals("topic")) {
                    listQuestion = dao.getAllSelectQuestionByTopic(subject_id_new, key, map.get(key), level_id_new);
                }
                else {
                    listQuestion = dao.getAllSelectQuestionByDimension(subject_id_new, key, map.get(key), level_id_new);
                }
                for (Question question : listQuestion) {
                    dao.addQuizQuestion(new Quiz_Question(dao.getNewlyAddedQuiz().getQuiz_id(), question.getQuestion_id()));
                }
            }

        } catch (Exception ex) {
            out.print(ex);
        }
        response.sendRedirect("addnewquizvalidation?message=" + URLEncoder.encode("true", "UTF-8"));
    }
    
    
    private void addGroup(int key, int value, HashMap<Integer, Integer> groupMap) {
        // Check if the key exists
        if (groupMap.containsKey(key)) {
            // Accumulate the value
            groupMap.put(key, groupMap.get(key) + value);
        } else {
            // Add the new key-value pair
            groupMap.put(key, value);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
