/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import model.Account;
import model.GooglePojo;
import model.RestFB;

/**
 *
 * @author ADMIN
 */
public class LoginFacebookServlet extends HttpServlet {
   
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
            out.println("<title>Servlet LoginFacebookServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginFacebookServlet at " + request.getContextPath () + "</h1>");
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
                 String code = request.getParameter("code");
    
    if (code == null || code.isEmpty()) {
      RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
      dis.forward(request, response);
    } else {
      String accessToken = RestFB.getToken(code);
        GooglePojo user = RestFB.getUserInfo(accessToken);
                AccountDAO myAccountDAO =new AccountDAO();
        Account myAccount =myAccountDAO.getAccountByEmail(user.getEmail());
        //if email has not been registered, add it to the database 
        if(myAccount==null){
            myAccountDAO.addAccount(user.getEmail(), getMD5("pass"));
        }
       HttpSession session = request.getSession();
         myAccount = myAccountDAO.getAccount(user.getEmail(), getMD5("pass"));
        if (myAccount.getRole_id() == myAccountDAO.getRole_Id("none")) {
            String ms = "Incorrect username or passwword";
            request.setAttribute("login_error", ms);
            request.getRequestDispatcher("common/homepage.jsp").forward(request, response);
        } else if (myAccount.getRole_id() == myAccountDAO.getRole_Id("customer")) {
            session.setAttribute("user", myAccount);
            request.getRequestDispatcher("homepage_1").forward(request, response);
        } else if (myAccount.getRole_id() == myAccountDAO.getRole_Id("saler")) {
            session.setAttribute("user", myAccount);
            request.getRequestDispatcher("salerdashboard").forward(request, response);
        } else if (myAccount.getRole_id() == myAccountDAO.getRole_Id("expert")) {
            session.setAttribute("user", myAccount);
            request.getRequestDispatcher("exsubjectlist").forward(request, response);
        } else if (myAccount.getRole_id() == myAccountDAO.getRole_Id("admin")) {
            session.setAttribute("user", myAccount);
            request.getRequestDispatcher("admindashboard").forward(request, response);
        }

    }
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
        doGet(request, response);
    }

    public static String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : messageDigest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
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
