/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.PackageDAO;
import dal.RegistrationDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Registration;

/**
 *
 * @author ADMIN
 */
public class SortRegistrationServlet extends HttpServlet {

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
            out.println("<title>Servlet SortRegistrationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortRegistrationServlet at " + request.getContextPath() + "</h1>");
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
        RegistrationDAO myRegistrationDAO = new RegistrationDAO();
        AccountDAO myAccountDAO = new AccountDAO();
        PackageDAO myPackageDAO = new PackageDAO();
        SubjectDAO mySubjectDAO = new SubjectDAO();
        String type = request.getParameter("type");
        String field = request.getParameter("field");
        if (field.equalsIgnoreCase("cost")) {
            //get list of register subject from user
            ArrayList<Registration> registration_list = myRegistrationDAO.sortRegistrationListByCost(type);
            request.setAttribute("accountDAO", myAccountDAO);
            request.setAttribute("subjectDAO", mySubjectDAO);
            request.setAttribute("packageDAO", myPackageDAO);
            request.setAttribute("field",field);
            request.setAttribute("type", type);
            request.setAttribute("registrationDAO", myRegistrationDAO);
            request.setAttribute("registration_list", registration_list);
            request.setAttribute("demand_list", registration_list);
            request.getRequestDispatcher("saler/registration_list.jsp").forward(request, response);
        }
        
            if (field.equalsIgnoreCase("date")) {
            //get list of register subject from user
            ArrayList<Registration> registration_list = myRegistrationDAO.sortRegistrationListByDate(type);
            request.setAttribute("accountDAO", myAccountDAO);
            request.setAttribute("subjectDAO", mySubjectDAO);
            request.setAttribute("packageDAO", myPackageDAO);
            request.setAttribute("field",field);
            request.setAttribute("type", type);
            request.setAttribute("registrationDAO", myRegistrationDAO);
            request.setAttribute("registration_list", registration_list);
            request.setAttribute("demand_list", registration_list);
            request.getRequestDispatcher("saler/registration_list.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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
