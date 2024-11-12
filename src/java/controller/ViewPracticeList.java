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
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Practice_Record;
import model.RegisteredSubject;

/**
 *
 * @author DELL-PC
 */
public class ViewPracticeList extends HttpServlet {
   
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
            out.println("<title>Servlet ViewPracticeList</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewPracticeList at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession(true);
        Account a = (Account)session.getAttribute("user");
        QuizDAO qd = new QuizDAO();
        List<Practice_Record> listPrac = qd.getPracticeRecordListByAccountId(a.getAccount_id());
        session.setAttribute("list_prac", listPrac);
        SubjectDAO sd = new SubjectDAO();
        List<RegisteredSubject> listSuject = sd.getEnrolledSubject(a);
        session.setAttribute("list_sbj", listSuject);
        
        request.getRequestDispatcher("customer/practice_list.jsp").forward(request, response);
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
        HttpSession session = request.getSession(true);
        Account a = (Account)session.getAttribute("user");
        QuizDAO qd = new QuizDAO();
        List<Practice_Record> listPrac = qd.getPracticeRecordListByAccountId(a.getAccount_id());;
        String sort = request.getParameter("sort");
        String filter = request.getParameter("filter");
        String search_prac = request.getParameter("search_prac");
        
        request.setAttribute("sort", sort);
        request.setAttribute("filter", filter);
        if(sort != null && !sort.equals("all")) {
            listPrac = qd.getPracticeRecordListByAccountIdOrder(a.getAccount_id(), sort);
        }
        
        if(filter != null && !filter.equalsIgnoreCase("all")) {
            int sub_id = Integer.parseInt(filter);
            listPrac = qd.getPracticeRecordListByAccountIdAndSubject(a.getAccount_id(), sub_id);
        }
        
        if(search_prac != null) {
            listPrac = qd.getPracticeRecordListByAccountIdAndKey(a.getAccount_id(), search_prac);
        }
        //List<Practice_Record> listPrac = qd.getPracticeRecordListByAccountId(a.getAccount_id());
        session.setAttribute("list_prac", listPrac);
        
        request.getRequestDispatcher("customer/practice_list.jsp").forward(request, response);
        
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
