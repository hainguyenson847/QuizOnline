/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.accessibility.AccessibleRole;

/**
 *
 * @author ADMIN
 */
public class UpdateRegistrationServlet extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateRegistrationServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateRegistrationServlet at " + request.getContextPath () + "</h1>");
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
        //Get account id
        String raw_registration_id=request.getParameter("registration_id");
        int registration_id=0;
        try {
            registration_id=Integer.parseInt(raw_registration_id);
        } catch (NumberFormatException e) {
        }
        //Get package id
        String raw_package_id=request.getParameter("package");
        int package_id=0;
        try {
            package_id=Integer.parseInt(raw_package_id);
        } catch (NumberFormatException e) {
        }
        //Get list price
        String raw_list_price=request.getParameter("list_price");
        double list_price=0;
        try {
            list_price=Double.parseDouble(raw_list_price);
        } catch (NumberFormatException e) {
        }
        //Get sale price
        String raw_sale_price=request.getParameter("sale_price");
        double sale_price=0;
        try {
            sale_price=Double.parseDouble(raw_sale_price);
        } catch (NumberFormatException e) {
        }
        //Get cost
        String raw_cost=request.getParameter("cost");
        double cost=0;
        try {
            cost=Double.parseDouble(raw_cost);
        } catch (NumberFormatException e) {
        }
        //Get status id
        String raw_status_id=request.getParameter("status");
        int status_id=0;
        try {
            status_id=Integer.parseInt(raw_status_id);
        } catch (NumberFormatException e) {
        }
        //Get valid time
        String from=request.getParameter("from");
        String to=request.getParameter("to");
        String note=request.getParameter("note");
//        PrintWriter out =response.getWriter();
//        out.println("Cost:"+cost);
//        out.println(from+to);
//        out.println("Note:"+note);
//        out.println(sale_price+""+cost+""+list_price);
//        out.println(status_id+""+package_id);
    RegistrationDAO myRegistrationDAO=new RegistrationDAO();
    myRegistrationDAO.UpdateRegistration(package_id, list_price, sale_price, cost, status_id, from, to, note, registration_id);
    request.getRequestDispatcher("salerregistrationlist").forward(request, response);
    
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
