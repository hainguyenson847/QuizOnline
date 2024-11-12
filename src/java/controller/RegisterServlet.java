/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class RegisterServlet extends HttpServlet {
   
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
            out.println("<title>Servlet RegisterServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath () + "</h1>");
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
        AccountDAO myAccountDAO = new AccountDAO();
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String encrypted_pass=getMD5(pass);
        String confirmed_pass = request.getParameter("confirmedPass");
        if (!isValidEmail(email)) {
            String ms = "Email must end with @fpt.edu.vn";
            request.setAttribute("email_error", ms);
            request.getRequestDispatcher("homepage").forward(request, response);
            return;
        }
                if(!isValidPassword(pass)){
            String ms = "Password must contain at least 8 characters, 1 uppercase letter, 1 number and 1 special character";
            request.setAttribute("login_error", ms);
            request.getRequestDispatcher("homepage").forward(request, response);
            return;
        }
        HttpSession session=request.getSession();
        //thong bao loi gui lai nguoi dung
        String register_error = "";
        //Neu mat khau xac nhan giong mat khau da nhap
        if (confirmed_pass.equals(pass)) {
            //neu email do to tai trong database
            if (myAccountDAO.getAccountByEmail(email) == null) {
                myAccountDAO.addAccount( email, encrypted_pass);
                Account myAccount=myAccountDAO.getAccount(email, encrypted_pass);
                session.setAttribute("user", myAccount);
                request.getRequestDispatcher("homepage_1").forward(request, response);
            } else {
                //gui lai cac thong tin nguoi dung da nhap sang page register de nguoi dung nhap tiep
                register_error = "Email existed!";
                request.setAttribute("email_error", register_error);
                request.setAttribute("email", email);
                request.setAttribute("pass", pass);
                request.getRequestDispatcher("homepage").forward(request, response);
            }
        } else {
            //gui lai cac thong tin nguoi dung da nhap sang page register de nguoi dung nhap tiep
            register_error = "Wrong confirmed password!";
            request.setAttribute("pass_error", register_error);
            request.setAttribute("email", email);
            request.getRequestDispatcher("homepage").forward(request, response);
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
