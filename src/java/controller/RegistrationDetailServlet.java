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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.Account;
import model.Registration;

/**
 *
 * @author ADMIN
 */
public class RegistrationDetailServlet extends HttpServlet {
   
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
            out.println("<title>Servlet RegistrationDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationDetailServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    public String getFormatDate(LocalDateTime myDateObj) {
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
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
        RegistrationDAO myRegistrationDAO=new RegistrationDAO();
        AccountDAO myAccountDAO=new AccountDAO();
        PackageDAO myPackageDAO=new PackageDAO();
        SubjectDAO mySubjectDAO=new SubjectDAO();
        String raw_account_id=request.getParameter("aid");
        int account_id=0;
        try {
            account_id=Integer.parseInt(raw_account_id);
        } catch (NumberFormatException e) {
        }
        String raw_registration_id=request.getParameter("rid");
        int registration_id=0;
        try {
            registration_id=Integer.parseInt(raw_registration_id);
        } catch (NumberFormatException e) {
        }
        //Send information about registration
        Registration registration_detail=myRegistrationDAO.getRegistrationById(registration_id);
        request.setAttribute("registration_id", registration_id);
        request.setAttribute("subject", mySubjectDAO.getSubjectByID(registration_detail.getSubject_id()).getSubjectName());
        request.setAttribute("registration_time", registration_detail.getRegistration_time());
        request.setAttribute("list_price", registration_detail.getList_price());
        request.setAttribute("sale_price", registration_detail.getSale_price());
        //send status information
        request.setAttribute("status", myRegistrationDAO.getRegistrationStatus(registration_detail.getStatus_id()));
        request.setAttribute("status_list", myRegistrationDAO.getRegistrationStatus());
        //send valid time
        request.setAttribute("from", getFormatDate(registration_detail.getValid_from()));
        request.setAttribute("to", getFormatDate(registration_detail.getValid_to()));
        //send package information
        request.setAttribute("price_package", myPackageDAO.getPricePackageById(registration_detail.getPackage_id()).getPackage_name());
        request.setAttribute("package_list", myPackageDAO.getAllPackage());

        //send registration about user
        Account myAccount = myAccountDAO.getAccountById(account_id);
        request.setAttribute("name", myAccount.getFirst_name()+" "+myAccount.getLast_name());
        request.setAttribute("gender", myAccount.getGender1());
        request.setAttribute("email", myAccount.getEmail());
        request.setAttribute("mobile", myAccount.getMobile());
        
        request.getRequestDispatcher("saler/registration_details.jsp").forward(request, response);
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
