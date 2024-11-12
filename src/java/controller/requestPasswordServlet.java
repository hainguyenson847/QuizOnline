/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.TokenForgetDAO;
import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.TokenForgetPassword;
import model.Account;
import model.resetService;

/**
 *
 * @author ADMIN
 */
public class requestPasswordServlet extends HttpServlet {
   
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
            out.println("<title>Servlet requestPasswordServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet requestPasswordServlet at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
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
          AccountDAO myAccountDAO = new AccountDAO();
        String email = request.getParameter("email");
        //email co ton tai trong db
        Account user = myAccountDAO.getAccountByEmail(email);
        if(user == null) {
            request.setAttribute("request_error", "Email not existed");
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
            return;
        }
        resetService service = new resetService();
        String token = service.generateToken();
        
        String linkReset = "http://localhost:8080/quizonline/resetPassword?token="+token;
        
        TokenForgetPassword newTokenForget = new TokenForgetPassword(
                user.getAccount_id(), false, token, service.expireDateTime());
        
        //send link to this email
        TokenForgetDAO daoToken = new TokenForgetDAO();
        boolean isInsert = daoToken.insertTokenForget(newTokenForget);
        if(!isInsert) {
            request.setAttribute("request_error", "Error in server");
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
            return;
        }
        boolean isSend = service.sendEmail(email, linkReset, user.getFirst_name()+user.getLast_name());
        if(!isSend) {
            request.setAttribute("request_error", "Can not send request");
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
            return;
        }
        request.setAttribute("request_error", "Send request success");
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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
