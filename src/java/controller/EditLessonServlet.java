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
public class EditLessonServlet extends HttpServlet {

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
            out.println("<title>Servlet EditLessonServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditLessonServlet at " + request.getContextPath() + "</h1>");
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
        LessonDAO dao = new LessonDAO();
        int lesson_id = Integer.parseInt(request.getParameter("lesson_id"));
        Lesson lesson = dao.getLessonById(lesson_id);
        request.setAttribute("lesson", lesson);
        request.setAttribute("listLesson_Topic", dao.getAllLessonTopicBySubjectId(lesson.getSubject_id()));
        request.setAttribute("listQuiz", dao.getAllQuizBySubjectId(lesson.getSubject_id()));
        request.getRequestDispatcher("expert/edit_lesson.jsp").forward(request, response);
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
        int lesson_id = Integer.parseInt(request.getParameter("lesson_id"));
        Lesson lesson = dao.getLessonById(lesson_id);
        String type = request.getParameter("type");
        if (type.equals("lesson")) {
            String name = request.getParameter("name");
            String summary = request.getParameter("summary");
            String topic_raw = request.getParameter("topic");
            String order_raw = request.getParameter("order");
            String status_raw = request.getParameter("status");
            try {
                int topic = Integer.parseInt(topic_raw);
                int order = Integer.parseInt(order_raw);
                boolean status = "1".equals(status_raw);
                dao.updateLesson(new Lesson(lesson.getLesson_id(),name, order, summary, status, 1, lesson.getSubject_id(), topic, "", "", null));
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
                int topic = Integer.parseInt(topic_raw);
                int order = Integer.parseInt(order_raw);
                boolean status = "1".equals(status_raw);
                dao.updateLesson(new Lesson(lesson.getLesson_id(),name, order, summary, status, 2, lesson.getSubject_id(), topic, url, quill, null));
                
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
                int topic = Integer.parseInt(topic_raw);
                int order = Integer.parseInt(order_raw);
                int quiz = Integer.parseInt(quiz_raw);
                boolean status = "1".equals(status_raw);
                dao.updateLesson(new Lesson(lesson.getLesson_id(),name, order, summary, status, 3, lesson.getSubject_id(), topic, "", "", quiz));
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }
        
        List<Lesson_Topic> listLesson_Topic = dao.getAllLessonTopicBySubjectId(lesson.getSubject_id());
        List<Quiz_Type> listQuiz_Type = dao.getAllQuizType();
        List<Quiz> listQuiz = dao.getAllQuizBySubjectId(lesson.getSubject_id());
        
        request.setAttribute("lesson", dao.getLessonById(lesson_id));
        request.setAttribute("listLesson_Topic", listLesson_Topic);
        request.setAttribute("listQuiz_Type", listQuiz_Type);
        request.setAttribute("listQuiz", listQuiz);
        request.setAttribute("showSuccessMessage", true);
        request.getRequestDispatcher("expert/edit_lesson.jsp").forward(request, response);
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
