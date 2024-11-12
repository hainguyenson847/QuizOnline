/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.SubjectDAO;
import dal.CategoryDAO;
import dal.PackageDAO;
import dal.PostDAO;
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
import model.Post;
import model.Subject;

/**
 *
 * @author Phuong Anh
 */
public class SearchByCategory extends HttpServlet {

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
            out.println("<title>Servlet SearchByCategory</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchByCategory at " + request.getContextPath() + "</h1>");
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
        String category = request.getParameter("categories");
        String keyword = request.getParameter("text");
        String view = request.getParameter("view");

        SubjectDAO mySubjectDAO = new SubjectDAO();
        PostDAO myPostDAO = new PostDAO();
        CategoryDAO myCategoryDAO = new CategoryDAO();

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
        request.setAttribute("selectedDuration", selectedDuration);
        request.setAttribute("selectedPackageModel", selectedPackageModel);

        List<Subject> subject_list = mySubjectDAO.getSubject();
        List<Subject> featuredSubjects = mySubjectDAO.getFeaturedSubjects();
        request.setAttribute("featuredSubjects", featuredSubjects);

        List<Post> post_list = myPostDAO.getPost();
        List<Post> hottest_post_list = myPostDAO.getHottestPost();
        request.setAttribute("hottest_post_list", hottest_post_list);

        AccountDAO accountDAO = new AccountDAO();
        List<Account> account_list = new ArrayList<>();
        for (Post blog : post_list) {
            Account account = accountDAO.getAccountById(blog.getAccount_id());
            account_list.add(account);
        }
        request.setAttribute("account_list", account_list);
                
        List<Category> category_list;
        if (keyword != null && !keyword.isEmpty()) {
            category_list = myCategoryDAO.searchCategories(keyword);
        } else {
            category_list = myCategoryDAO.getCategory();
        }
        request.setAttribute("category_list", category_list);

        List<Subject> filteredSubjectsByCategory = mySubjectDAO.searchSubjectsByCategory(category);
        List<Post> filteredBlogsByCategory = myPostDAO.searchBlogsByCategory(category);

        if (filteredSubjectsByCategory != null && !filteredSubjectsByCategory.isEmpty()) {
            request.setAttribute("subject_list", filteredSubjectsByCategory);
        } else {
            request.setAttribute("subject_list", subject_list);
        }

        if (filteredBlogsByCategory != null && !filteredBlogsByCategory.isEmpty()) {
            request.setAttribute("post_list", filteredBlogsByCategory);
        } else {
            request.setAttribute("post_list", post_list);
        }

        HttpSession session = request.getSession(false); // Kiểm tra session

        if (session != null) {
            Account user = (Account) session.getAttribute("user");
            if (user != null) {
                // User is logged in
                if (view != null && view.equalsIgnoreCase("blogs")) {
                    request.getRequestDispatcher("customer/blog_list.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("customer/subject_list.jsp").forward(request, response);
                }
            } else {
                // Session exists but no user account
                if (view != null && view.equalsIgnoreCase("blogs")) {
                    request.getRequestDispatcher("common/blog_list.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("common/subject_list.jsp").forward(request, response);
                }
            }
        } else {
            // No session
            if (view != null && view.equalsIgnoreCase("blogs")) {
                request.getRequestDispatcher("common/blog_list.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("common/subject_list.jsp").forward(request, response);
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
