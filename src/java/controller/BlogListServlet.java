/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.PostDAO;
import dal.CategoryDAO;
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
import model.Blog;
import model.Category;
import model.Post;

/**
 *
 * @author Phuong Anh
 */
public class BlogListServlet extends HttpServlet {

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
            out.println("<title>Servlet BlogListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogListServlet at " + request.getContextPath() + "</h1>");
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
        PostDAO myPostDAO = new PostDAO();
        String keyword = request.getParameter("keyword");
        String sortBy = request.getParameter("sortBy");

        ArrayList<Post> post_list;

        // Handle sorting and searching
        if (sortBy != null) {
            switch (sortBy) {
                case "latest":
                    post_list = myPostDAO.getLatestPosts();
                    break;
                case "oldest":
                    post_list = myPostDAO.getOldestPosts();
                    break;
                case "hottest":
                    post_list = myPostDAO.getHottestPost1();
                    break;
                default:
                    post_list = myPostDAO.getPost();
                    break;
            }
        } else if (keyword != null && !keyword.trim().isEmpty()) {
            post_list = myPostDAO.searchPosts(keyword);
        } else {
            post_list = myPostDAO.getPost();
        }

        request.setAttribute("post_list", post_list);

        // Get hottest posts and categories
        ArrayList<Post> hottest_post_list = myPostDAO.getHottestPost();
        request.setAttribute("hottest_post_list", hottest_post_list);

        CategoryDAO myCategoryDAO = new CategoryDAO();
        List<Category> category_list = myCategoryDAO.getCategory();
        request.setAttribute("category_list", category_list);

        AccountDAO accountDAO = new AccountDAO();
        List<Account> account_list = new ArrayList<>();
        for (Post blog : post_list) {
            Account account = accountDAO.getAccountById(blog.getAccount_id());
            account_list.add(account);
        }
        request.setAttribute("account_list", account_list);

        // Proper session handling
        HttpSession session = request.getSession(false);
        if (session != null) {
            Account user = (Account) session.getAttribute("user");
            if (user == null) {
                request.getRequestDispatcher("common/blog_list.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("customer/blog_list.jsp").forward(request, response);
            }
        } else {
            // If session is null, handle accordingly (e.g., redirect to login)
            response.sendRedirect("login.jsp");
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
