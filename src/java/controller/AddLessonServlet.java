/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Lesson;
import model.Lesson_Topic;
import model.Quiz;
import model.Quiz_Type;

/**
 *
 * @author FPT SHOP
 */
public class AddLessonServlet extends HttpServlet {

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
            out.println("<title>Servlet AddLessonServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddLessonServlet at " + request.getContextPath() + "</h1>");
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
        String subjectId = request.getParameter("subjectId");
        LessonDAO dao = new LessonDAO();
        List<Lesson_Topic> listLesson_Topic = dao.getAllLessonTopicBySubjectId(Integer.parseInt(subjectId));
        List<Quiz_Type> listQuiz_Type = dao.getAllQuizType();
        List<Quiz> listQuiz = dao.getAllQuizBySubjectId(Integer.parseInt(subjectId));

        request.setAttribute("subjectId", subjectId);
        request.setAttribute("listLesson_Topic", listLesson_Topic);
        request.setAttribute("listQuiz", listQuiz);
        request.getRequestDispatcher("expert/add_lesson.jsp").forward(request, response);

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
        PrintWriter out = response.getWriter();
        LessonDAO dao = new LessonDAO();
        String subjectId = request.getParameter("subjectId");
        String type = request.getParameter("type");
        if (type.equals("lesson")) {
            String name = request.getParameter("name");
            String summary = request.getParameter("summary");
            String topic_raw = request.getParameter("topic");
            String order_raw = request.getParameter("order");
            String status_raw = request.getParameter("status");
            try {
                int subject_id = Integer.parseInt(subjectId);
                int topic = Integer.parseInt(topic_raw);
                int order = Integer.parseInt(order_raw);
                boolean status = "1".equals(status_raw);
                dao.addLesson(new Lesson(name, order, summary, status, 1, subject_id, topic, "", "", null));
            } catch (Exception ex) {
                out.println(ex);
            }
        } else if (type.equals("video")) {
            String name = request.getParameter("name");
            String topic_raw = request.getParameter("topic");
            String summary = request.getParameter("summary");
            String order_raw = request.getParameter("order");
            String status_raw = request.getParameter("status");
            String url = request.getParameter("url");
            String quill = request.getParameter("quillContent");
            try {
                int subject_id = Integer.parseInt(subjectId);
                int topic = Integer.parseInt(topic_raw);
                int order = Integer.parseInt(order_raw);
                boolean status = "1".equals(status_raw);
                dao.addLesson(new Lesson(name, order, summary, status, 2, subject_id, topic, url, quill, null));
                
            } catch (Exception ex) {
                out.println(ex);
            }
        } else {
            String name = request.getParameter("name");
            String topic_raw = request.getParameter("topic");
            String summary = request.getParameter("summary");
            String order_raw = request.getParameter("order");
            String status_raw = request.getParameter("status");
            String quiz_raw = request.getParameter("quiz");
            
            try {
                int subject_id = Integer.parseInt(subjectId);
                int topic = Integer.parseInt(topic_raw);
                int order = Integer.parseInt(order_raw);
                int quiz = Integer.parseInt(quiz_raw);
                boolean status = "1".equals(status_raw);
                dao.addLesson(new Lesson(name, order, summary, status, 3, subject_id, topic, "", "", quiz));
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }
        List<Lesson_Topic> listLesson_Topic = dao.getAllLessonTopicBySubjectId(Integer.parseInt(subjectId));
        List<Quiz_Type> listQuiz_Type = dao.getAllQuizType();
        List<Quiz> listQuiz = dao.getAllQuizBySubjectId(Integer.parseInt(subjectId));

        request.setAttribute("subjectId", subjectId);
        request.setAttribute("listLesson_Topic", listLesson_Topic);
        request.setAttribute("listQuiz_Type", listQuiz_Type);
        request.setAttribute("listQuiz", listQuiz);
        request.setAttribute("showSuccessMessage", true);
        
        request.getRequestDispatcher("expert/add_lesson.jsp").forward(request, response);

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
