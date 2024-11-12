/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import model.Answer;
import model.Question;

/**
 *
 * @author FPT SHOP
 */
@MultipartConfig
public class AddQuestionController extends HttpServlet {
   
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
            out.println("<title>Servlet AddQuestionController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddQuestionController at " + request.getContextPath () + "</h1>");
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
        //Get form submmited data
        QuestionDAO dao = new QuestionDAO();
        PrintWriter out = response.getWriter();
        String subject_id_raw = request.getParameter("subject_id");
        String dimension_id_raw = request.getParameter("dimension_id");
        String lesson_topic_id_raw = request.getParameter("lesson_topic_id");
        String level_id_raw = request.getParameter("level_id");
        String status_raw = request.getParameter("status");
        String content = request.getParameter("content");
        String explanation = request.getParameter("explanation");
        String media = request.getParameter("media");
        String[] answers = request.getParameterValues("answer");
        String[] isCorrect = request.getParameterValues("is_correct");
        
        try {
            int subject_id = Integer.parseInt(subject_id_raw);
            int dimension_id = Integer.parseInt(dimension_id_raw);
            int lesson_topic_id = Integer.parseInt(lesson_topic_id_raw);
            int level_id = Integer.parseInt(level_id_raw);
            boolean status = Integer.parseInt(status_raw) == 1 ? true : false;
            
            //Get an image
            Part mediaPart = request.getPart("media");
            String realPath = request.getServletContext().getRealPath("/img/question_media");
            //realPath = realPath.replace("/build", "");
            String filename = Paths.get(mediaPart.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            if (mediaPart.getSize() != 0) {
                mediaPart.write(realPath + "/" + filename);
            }
            Question question = new Question(subject_id, dimension_id, lesson_topic_id, level_id, status, content, explanation, filename);
            
            //Add Question
            dao.addQuestion(question);
            
            //Get Question that have just added
            Question newlyAddedQuestion = dao.getLastQuestion();
            
            //Create Answer array
            Answer[] listAnswer = new Answer[answers.length];
            for (int i = 0; i < isCorrect.length; i++) {
                boolean iscorrect = Boolean.parseBoolean(isCorrect[i]);
                Answer answer = new Answer(answers[i], iscorrect, newlyAddedQuestion.getQuestion_id());
                listAnswer[i] = answer;
            }
            
            //Add Answer that map to newly added question
            dao.addMutipleAnswers(listAnswer);
            
            //redirect to question_detail_validation servlet
            response.sendRedirect("question_detail_validation?message=" + URLEncoder.encode("true", "UTF-8"));
        } catch(Exception ex) {
            out.println(ex);
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
