/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import Utils.Validation;
import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.regex.Pattern;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class LoginServlet extends HttpServlet {
   
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
            out.println("<title>Servlet LoginServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        //Whenever a user login sucessfully create a sesion to caontain his/her account information
        HttpSession session=request.getSession();
        Validation valid = new Validation();
        String email=request.getParameter("email");
        String userPass=request.getParameter("userPass");
        String encrypted_pass= valid.getMD5(userPass);
        String remember_me=request.getParameter("rem");
        if (!valid.isValidEmail(email)) {
            String ms = "Email must end with @fpt.edu.vn";
            request.setAttribute("login_error", ms);
            request.getRequestDispatcher("homepage").forward(request, response);
            return;
        }
        if(!isValidPassword(userPass)){
            String ms = "Password must contain at least 8 characters, 1 uppercase letter, 1 number and 1 special character";
            request.setAttribute("login_error", ms);
            request.getRequestDispatcher("homepage").forward(request, response);
            return;
        }

        //create 2 cookie for email and remember me
        Cookie user_email= new Cookie("c_user", email);
        Cookie user_remember_me=new Cookie("c_check_button", remember_me);
        //if user choose remember me
        if(remember_me!=null){
            user_email.setMaxAge(60*60*24*7);//7 days
            user_remember_me.setMaxAge(60*60*24*7);
        }else{
            user_email.setMaxAge(0);
            user_remember_me.setMaxAge(0);
        }
        response.addCookie(user_email);
        response.addCookie(user_remember_me);
        AccountDAO myAccountDAO=new AccountDAO();
        Account myAccount=myAccountDAO.getAccount(email,encrypted_pass);
        if(myAccount.getRole_id()==myAccountDAO.getRole_Id("none")){
            String ms="Incorrect username or password";
            request.setAttribute("login_error", ms);
            request.getRequestDispatcher("homepage").forward(request, response);
        }
        else if(myAccount.getRole_id()==myAccountDAO.getRole_Id("customer")){
            session.setAttribute("user", myAccount);
            request.getRequestDispatcher("homepage_1").forward(request, response);
        }
        else if(myAccount.getRole_id()==myAccountDAO.getRole_Id("saler")){
            session.setAttribute("user", myAccount);
            request.getRequestDispatcher("salerdashboard").forward(request, response);
        }
         else if(myAccount.getRole_id()==myAccountDAO.getRole_Id("expert")){
            session.setAttribute("user", myAccount);
            request.getRequestDispatcher("exsubjectlist").forward(request, response);
        }
         else  if(myAccount.getRole_id()==myAccountDAO.getRole_Id("admin")){
            session.setAttribute("user", myAccount);
            request.getRequestDispatcher("subject-details").forward(request, response);
        }
        
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
    
    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9._%+-]+@fpt\\.edu\\.vn$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
    private boolean isValidPassword(String password) {
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,}$";
        Pattern pattern = Pattern.compile(passwordRegex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
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
