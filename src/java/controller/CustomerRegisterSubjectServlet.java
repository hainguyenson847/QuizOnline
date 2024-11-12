/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Registration;

/**
 *
 * @author ADMIN
 */
public class CustomerRegisterSubjectServlet extends HttpServlet {
   
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
            out.println("<title>Servlet CustomerRegisterSubjectServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerRegisterSubjectServlet at " + request.getContextPath () + "</h1>");
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
        RegistrationDAO registrationDAO = new RegistrationDAO();
        String raw_duration=request.getParameter("courseDuration");
        int duration=0;
        try {
            duration=Integer.parseInt(raw_duration);
        } catch (NumberFormatException e) {
        }
        String raw_account_id=request.getParameter("account_id");
        int account_id=0;
        try {
            account_id=Integer.parseInt(raw_account_id);
        } catch (NumberFormatException e) {
        }
        String raw_subject_id=request.getParameter("subject_id");
        int subject_id=0;
        try {
            subject_id=Integer.parseInt(raw_subject_id);
        } catch (NumberFormatException e) {
        }
        String raw_list_price=request.getParameter("list_price");
        double list_price=0;
        try {
            list_price=Double.parseDouble(raw_list_price);
        } catch (NumberFormatException e) {
        }
        String raw_sale_price=request.getParameter("sale_price");
        double sale_price=0;
        try {
            sale_price=Double.parseDouble(raw_sale_price);
        } catch (NumberFormatException e) {
        }
        double cost=0;
        Registration registration=new Registration(LocalDateTime.now(), subject_id, 0, account_id, 2, list_price, sale_price);
        registration.setNote("Online Payment");
        registrationDAO.AddRegistration(registration);
        request.getRequestDispatcher("customerregistrationlist").forward(request, response);
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
        processRequest(request, response);
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
