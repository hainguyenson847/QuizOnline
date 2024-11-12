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
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Account;
import model.Email;

/**
 *
 * @author DELL-PC
 */
public class UpdateEmail extends HttpServlet {

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
            out.println("<title>Servlet UpdateEmail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateEmail at " + request.getContextPath() + "</h1>");
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
        session.setAttribute("confirm_code", null);

        request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
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
        HttpSession session = request.getSession(true);
        Account a = (Account) session.getAttribute("user");
        AccountDAO ad = new AccountDAO();
        String confirmCode = (String) session.getAttribute("confirm_code");
        if (confirmCode == null) {
            String formattedNumber = generateOTP();
            session.setAttribute("confirm_code", formattedNumber);
            confirmCode = (String) session.getAttribute("confirm_code");
            Email.sendEmail(a.getEmail(), confirmCode, a.getFirst_name() + " " + a.getLast_name());
            request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
            return;
        }

        String confirm_code = request.getParameter("confirm_code");
        if (confirm_code != null) {
            if (!confirm_code.equalsIgnoreCase(confirmCode)) {
                request.setAttribute("confirm_err", "Code is not correct");
                request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("confirm_ss", true);
                request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
                return;
            }
        }

        String newEmail = request.getParameter("new_email");
        String confirm_new_code = request.getParameter("confirm_new_code");
        if (newEmail != null && confirm_new_code == null) {
            if (ad.getAccountByEmail(newEmail) != null) {
                request.setAttribute("confirm_ss", true);
                request.setAttribute("duplicate_email", "Email is used");
                request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
                return;
            }
            if(!isValidEmail(newEmail)) {
                request.setAttribute("confirm_ss", true);
                request.setAttribute("duplicate_email", "Email must end with @fpt.edu.vn");
                request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
                return;
            }
            String formattedNumber = generateOTP();
            session.setAttribute("confirm_code", formattedNumber);
            confirmCode = (String) session.getAttribute("confirm_code");
            Email.sendEmail(newEmail, confirmCode, a.getFirst_name() + " " + a.getLast_name());
            request.setAttribute("comfirm_new_ss", true);
            session.setAttribute("new_email", newEmail);
            request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
            return;
        }

        if (confirm_new_code != null) {
            if (!confirm_new_code.equalsIgnoreCase(confirmCode)) {
                request.setAttribute("comfirm_new_ss", true);
                request.setAttribute("confirm_new_err", "Code is not correct");
                request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
                return;
            } else {
                request.setAttribute("update_ss", true);
                String nE = (String) session.getAttribute("new_email");
                ad.updateEmail(nE, a);

                request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
                return;
            }
        }

        request.getRequestDispatcher("customer/update_email.jsp").forward(request, response);
    }

    public String generateOTP() {
        Random rd = new Random();
        int rdn = rd.nextInt(999999);
        String formattedNumber = String.format("%06d", rdn);
        if(formattedNumber.length() < 6) {
            for (int i = formattedNumber.length(); i < 6; i++) {
                formattedNumber = "0" + formattedNumber;
            }
        }
        return formattedNumber;
    }
    
    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9._%+-]+@fpt\\.edu\\.vn$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
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
