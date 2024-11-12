/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SubjectDAO;
import dal.CategoryDAO;
import dal.PackageDAO;
import dal.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Subject;
import model.SubjectCategory;
import jakarta.servlet.http.HttpSession;
import java.util.HashSet;

/**
 *
 * @author Phuong Anh
 */
public class SubjectListServlet extends HttpServlet {

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
            out.println("<title>Servlet SubjectListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectListServlet at " + request.getContextPath() + "</h1>");
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
        String sort = request.getParameter("sort");
        String keyword = request.getParameter("keyword");

        RegistrationDAO registerDAO = new RegistrationDAO();
        SubjectDAO mySubjectDAO = new SubjectDAO();
        HttpSession session = request.getSession(false);
        // Lấy đối tượng người dùng từ session
        Account user = (Account) session.getAttribute("user");
        if (session != null) {
            if (user == null) {
                List<Subject> subject_list = new ArrayList<>();

                List<Subject> featuredSubjects = mySubjectDAO.getFeaturedSubjects();
                request.setAttribute("featuredSubjects", featuredSubjects);

                subject_list = mySubjectDAO.getSubject();

                if (keyword != null && !keyword.trim().isEmpty()) {
                    subject_list = mySubjectDAO.searchSubjects(keyword);
                } else {
                    if (sort != null && sort.equals("featured")) {
                        subject_list = mySubjectDAO.getFeaturedSubjects();
                    } else if (sort != null && sort.equals("latest")) {
                        subject_list = mySubjectDAO.getLatestSubjects();
                    } else if (sort != null && sort.equals("oldest")) {
                        subject_list = mySubjectDAO.getOldestSubjects();
                    }
                }

                request.setAttribute("subject_list", subject_list);

                CategoryDAO myCategoryDAO = new CategoryDAO();
                List<Category> category_list = myCategoryDAO.getCategory();
                request.setAttribute("category_list", category_list);

                PackageDAO packageDAO = new PackageDAO();
                List<model.Package> packageList = packageDAO.getAllPackage();
                String selectedDuration = request.getParameter("courseDuration");
                model.Package selectedPackageModel = packageList.get(0);
                if (selectedDuration != null) {
                    try {
                        int duration = Integer.parseInt(selectedDuration);
                        for (model.Package pkg : packageList) {
                            if (pkg.getDuration() == duration) {
                                selectedPackageModel = pkg;
                                break;
                            }
                        }
                    } catch (NumberFormatException e) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course duration.");
                        return;
                    }
                }
                request.setAttribute("pkgDAO", packageDAO);
                request.setAttribute("selectedDuration", selectedDuration);
                request.setAttribute("selectedPackageModel", selectedPackageModel);

                request.getRequestDispatcher("common/subject_list.jsp").forward(request, response);
                return;
            } else {
                int account_id = user.getAccount_id();
                List<Subject> subject_list = new ArrayList<>();

                List<Subject> featuredSubjects = mySubjectDAO.getFeaturedSubjects();
                request.setAttribute("featuredSubjects", featuredSubjects);
                subject_list = mySubjectDAO.getSubject();

                if (keyword != null && !keyword.trim().isEmpty()) {
                    subject_list = mySubjectDAO.searchSubjects(keyword);
                } else {
                    if (sort != null && sort.equals("featured")) {
                        subject_list = mySubjectDAO.getFeaturedSubjects();
                    } else if (sort != null && sort.equals("latest")) {
                        subject_list = mySubjectDAO.getLatestSubjects();
                    } else if (sort != null && sort.equals("oldest")) {
                        subject_list = mySubjectDAO.getOldestSubjects();
                    }
                }

                request.setAttribute("subject_list", subject_list);
                request.setAttribute("subjectDAO", mySubjectDAO);

                CategoryDAO myCategoryDAO = new CategoryDAO();
                List<Category> category_list = myCategoryDAO.getCategory();
                request.setAttribute("category_list", category_list);

                PackageDAO packageDAO = new PackageDAO();
                List<model.Package> packageList = packageDAO.getAllPackage1();
                String selectedDuration = request.getParameter("courseDuration");
                model.Package selectedPackageModel = packageList.get(0);
                if (selectedDuration != null) {
                    try {
                        int duration = Integer.parseInt(selectedDuration);
                        for (model.Package pkg : packageList) {
                            if (pkg.getDuration() == duration) {
                                selectedPackageModel = pkg;
                                break;
                            }
                        }
                    } catch (NumberFormatException e) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid course duration.");
                        return;
                    }
                }
                request.setAttribute("pkgDAO", packageDAO);

                request.setAttribute("selectedDuration", selectedDuration);
                request.setAttribute("selectedPackageModel", selectedPackageModel);
                request.getRequestDispatcher("customer/subject_list.jsp").forward(request, response);
            }
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
