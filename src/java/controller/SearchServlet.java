/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SliderDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Post;
import model.Slider;
import model.Subject;

/**
 *
 * @author Phuong Anh
 */
public class SearchServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        SubjectDAO mySubjectDAO = new SubjectDAO();
        ArrayList<Subject> subject_list = mySubjectDAO.getSubject();
        ArrayList<Subject> filteredSubjects = mySubjectDAO.searchSubjects(keyword);
        List<Subject> featuredSubjects = mySubjectDAO.getFeaturedSubjects();
        request.setAttribute("featuredSubjects", featuredSubjects);

        dal.PostDAO myPostDAO = new dal.PostDAO();
        ArrayList<Post> post_list = myPostDAO.getPost();
        request.setAttribute("post_list", post_list);

        ArrayList<Post> hottest_post_list = myPostDAO.getHottestPost();
        request.setAttribute("hottest_post_list", hottest_post_list);

        if (keyword != null && !keyword.trim().isEmpty()) {
            for (Subject subject : subject_list) {
                if (subject.getDescription().toLowerCase().contains(keyword.trim().toLowerCase())) {
                    filteredSubjects.add(subject);
                }
            }
        } else {
            filteredSubjects = subject_list;
        }

        request.setAttribute("subject_list", filteredSubjects);
        request.setAttribute("keyword", keyword);

        String page = request.getParameter("page");

        SliderDAO sliderDAO = new SliderDAO();
        List<Slider> sliders_list = sliderDAO.getAllSlider();
        request.setAttribute("sliders_list", sliders_list);

        if ("subject".equals(page)) {
            request.getRequestDispatcher("subject_list.jsp").forward(request, response);
        } else if ("blog".equals(page)) {
            request.getRequestDispatcher("blog_list.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("homepage").forward(request, response);
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
        doGet(request, response);
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
