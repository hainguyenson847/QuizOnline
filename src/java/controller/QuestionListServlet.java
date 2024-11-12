/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Question;
import model.Subject;

/**
 *
 * @author FPT SHOP
 */
public class QuestionListServlet extends HttpServlet {
   
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
            out.println("<title>Servlet QuestionListServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuestionListServlet at " + request.getContextPath () + "</h1>");
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
        QuestionDAO dao = new QuestionDAO();
        List<Question> listQuestion = dao.getAllQuestion();
        request.setAttribute("listQuestion", listQuestion);
        request.setAttribute("dao", dao);
        boolean showSuccessMessage = Boolean.parseBoolean(request.getParameter("showSuccessMessage"));
        boolean showFailMessage = Boolean.parseBoolean(request.getParameter("showFailMessage"));
        boolean importfail = Boolean.parseBoolean(request.getParameter("importfail"));
        boolean importsuccess = Boolean.parseBoolean(request.getParameter("importsuccess"));
        if (showSuccessMessage == true) {
            request.setAttribute("showSuccessMessage", true);
        }
        else if (showFailMessage == true) {
            request.setAttribute("showFailMessage", true);
        }
        else if (importfail == true) {
            request.setAttribute("importfail", true);
        }
        else if (importsuccess == true){
            request.setAttribute("importsuccess", true);
        }
        request.getRequestDispatcher("expert/question_list.jsp").forward(request, response);
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
        QuestionDAO dao = new QuestionDAO();
        List<Question> listQuestion = dao.getAllQuestion();
        request.setAttribute("listQuestion", listQuestion);
        request.setAttribute("dao", dao);
        request.getRequestDispatcher("expert/question_list.jsp").forward(request, response);
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
