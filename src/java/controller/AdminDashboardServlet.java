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
import model.Subject;

import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class AdminDashboardServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AdminDashboardServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashboardServlet at " + request.getContextPath () + "</h1>");
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
        RegistrationDAO myRegistrationDAO = new RegistrationDAO();
        //revenue in 12 months
        ArrayList<Integer> month_revenue = myRegistrationDAO.getListPriceByMonth();
        request.setAttribute("month_revenue", month_revenue);
        double all_month_revenue = myRegistrationDAO.getMonthRevenue(LocalDate.now());
        request.setAttribute("all_month_revenue", all_month_revenue);
        //number of registration of 12 months
        ArrayList<Integer> month_registrations = myRegistrationDAO.getRegistrationByMonth();
        request.setAttribute("month_registration", month_registrations);
        int all_month_registration=myRegistrationDAO.getMonthRegitration(LocalDate.now());
        request.setAttribute("all_month_registration", all_month_registration);
        ArrayList<Integer> month_registration_status=myRegistrationDAO.getMonthRegistrationStatus();
        request.setAttribute("month_registration_status", month_registration_status);
        //get revenue of a week
        ArrayList<Integer> week_revenue = myRegistrationDAO.getRevenueByWeek(LocalDate.now());
        request.setAttribute("week_revenue", week_revenue);
        double all_week_revenue=myRegistrationDAO.getAllWeekRevenue(LocalDate.now());
        request.setAttribute("all_week_revenue", all_week_revenue);
        //get numbr of registration of 1 week
        ArrayList<Integer> week_registrations = myRegistrationDAO.getNumberofRegistrationsInAWeek(LocalDate.now());
        request.setAttribute("week_registration", week_registrations);
        int all_week_registration=myRegistrationDAO.getAllWeekRegitration(LocalDate.now());
        request.setAttribute("all_week_registration", all_week_registration);
        ArrayList<Integer> week_registration_status=myRegistrationDAO.getWeekRegistrationStatus(LocalDate.now());
        request.setAttribute("week_registration_status", week_registration_status);
        //get user of a month
        ArrayList<Integer> month_user = myRegistrationDAO.getMonthUser();
        request.setAttribute("month_user", month_user);
        int all_month_user=myRegistrationDAO.getUserInAMonth(LocalDate.now());
        request.setAttribute("all_month_user", all_month_user);
        //get user of a week
        ArrayList<Integer> week_user = myRegistrationDAO.getNumberofUsersInAWeek(LocalDate.now());
        request.setAttribute("week_user", week_user);
        int all_week_user=myRegistrationDAO.getAllUserInAWeek(LocalDate.now());
        request.setAttribute("all_week_user", all_week_user);
        
        //Total revenue
        double total_revenue=myRegistrationDAO.getAllMonthRevenue();
        request.setAttribute("total_revenue",total_revenue);
        
        //Total user
        int total_user=myRegistrationDAO.getAllUser();
        request.setAttribute("total_user",total_user);
        
        //Total bought subjects
        int total_bought_subject=myRegistrationDAO.GetAllBoughtSubjects();
        request.setAttribute("total_bought_subject",total_bought_subject);
        ArrayList<Subject> bought_subjects=myRegistrationDAO.getTop5BoughtSubjects();

        request.setAttribute("top_5_bought_subjects",bought_subjects);
        

        request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);
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

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
