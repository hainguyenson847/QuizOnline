/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.QuestionDAO;
import dal.QuizDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;


/**
 *
 * @author FPT SHOP
 */
@MultipartConfig
public class Question_Detail_Validation_Controller extends HttpServlet {
   
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
            out.println("<title>Servlet QuestionDetailController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionDetailController at " + request.getContextPath () + "</h1>");
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
        SubjectDAO sdao = new SubjectDAO();
        QuestionDAO dao = new QuestionDAO();
        request.setAttribute("listSubject", sdao.getListSubjectByAccount(a.getAccount_id()));
        request.setAttribute("listLevel", dao.getAllLevel());
        //Send a message to question_detail.jsp, alert that user added question successfully
        String message = request.getParameter("message");
        request.setAttribute("showSuccessMessage", message);
        request.getRequestDispatcher("expert/question_detail.jsp").forward(request, response);

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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("user");
        SubjectDAO sdao = new SubjectDAO();
        PrintWriter out = response.getWriter();
        QuestionDAO dao = new QuestionDAO();
        String subject_id = request.getParameter("subject_id");
        String level_id = request.getParameter("level_id");
        String status = request.getParameter("status");
        String content = request.getParameter("content");
        String explanation = request.getParameter("explanation");
                
        request.setAttribute("subject_id", Integer.parseInt(subject_id));
        request.setAttribute("level_id", Integer.parseInt(level_id));
        request.setAttribute("status", Integer.parseInt(status));
        request.setAttribute("content", content);
        request.setAttribute("explanation", explanation);
        request.setAttribute("listSubject", sdao.getListSubjectByAccount(a.getAccount_id()));
        request.setAttribute("listDimension", dao.getAllDimensionBySubjectId(Integer.parseInt(subject_id)));
        request.setAttribute("listLevel", dao.getAllLevel());
        request.setAttribute("listLesson_Topic", dao.getAllLessonTopicBySubjectId(Integer.parseInt(subject_id)));
        
        request.getRequestDispatcher("expert/question_detail.jsp").forward(request, response);
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
