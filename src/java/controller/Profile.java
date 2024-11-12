/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.PostDAO;
import dal.QuizDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.*;

/**
 *
 * @author DELL-PC
 */
public class Profile extends HttpServlet {

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
            out.println("<title>Servlet Profile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Profile at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        AccountDAO ad = new AccountDAO();
        Account ac = (Account) session.getAttribute("user");
        ac = ad.getAccountById(ac.getAccount_id());
        session.setAttribute("user", ac);
        SubjectDAO sd = new SubjectDAO();
        PostDAO pd = new PostDAO();
        QuizDAO qd = new QuizDAO();
        int quizDone = qd.countFinishedQuiz(ac);
        int enrolledSubject = sd.countEnrolledSubject(ac);
        int numberBlogs = pd.countCreatedBlogs(ac);
        session.setAttribute("enrolled_subject", enrolledSubject);
        session.setAttribute("created_blog", numberBlogs);
        session.setAttribute("finished_quiz", quizDone);
        List<RegisteredSubject> listSubject = sd.getEnrolledSubjectRecently(ac);
//        PrintWriter out = response.getWriter();
//        out.print(ac);
        if(listSubject.isEmpty()) {
            session.setAttribute("no_enrolled_subject", true);
        }
        session.setAttribute("recently_enrolled_subject", listSubject);
        //out.print(listSubject);
        request.getRequestDispatcher("customer/profile.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        AccountDAO ad = new AccountDAO();
        Account ac = (Account) session.getAttribute("user");
        String fullName = request.getParameter("fullname");
        String newPass = request.getParameter("newpass");
        if (fullName != null) {
            String gender = request.getParameter("gender");
            String mobile = request.getParameter("mobile");

            String[] name = fullName.split(" ");
            String firstName = name[0];
            String lastName = "";
            for (int i = 1; i < name.length; i++) {
                lastName += name[i] + " ";
            }
            lastName = lastName.trim();
            request.setAttribute("updatesc", "Update success");
            Account uAcc = new Account(ac.getAccount_id(), firstName, lastName, "Male".equalsIgnoreCase(gender), mobile);

            ad.updateProfile(uAcc);
        } else {
            String np = getMD5(newPass);
            ad.updatePassword(np, ac);
            ac = ad.getAccount(ac.getEmail());
            request.setAttribute("cpsuccess", "Update success");
        }
        ac = ad.getAccountById(ac.getAccount_id());
        session.setAttribute("user", ac);
        request.getRequestDispatcher("customer/profile.jsp").forward(request, response);
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
    
    public static String getMD5a(String input) {
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
