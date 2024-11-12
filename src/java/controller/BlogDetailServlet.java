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
import model.Category;
import model.Post;

/**
 *
 * @author Phuong Anh
 */
public class BlogDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet BlogDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogDetailServlet at " + request.getContextPath() + "</h1>");
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
        String raw_blog_id = request.getParameter("blog_id");
        int blog_id = 0;
        try {
            blog_id = Integer.parseInt(raw_blog_id);
        } catch (NumberFormatException e) {
        }
        AccountDAO accountDAO = new AccountDAO();
        PostDAO myPostDAO = new PostDAO();
        Post myPost = myPostDAO.getPostByBlogID(blog_id);
        request.setAttribute("myPost", myPost);

        ArrayList<Post> post_list = myPostDAO.getPost();
        request.setAttribute("post_list", post_list);

        CategoryDAO myCategoryDAO = new CategoryDAO();
        List<Category> category_list = myCategoryDAO.getCategory();
        request.setAttribute("category_list", category_list);
        Account account = accountDAO.getAccountById(myPost.getAccount_id());
        request.setAttribute("account", account);

        HttpSession session = request.getSession(false);
        if (session == null) {
            request.getRequestDispatcher("common/blog_detail.jsp").forward(request, response);
        } else {
            Account user = (Account) session.getAttribute("user");
            if (user == null) {
                request.getRequestDispatcher("common/blog_detail.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("customer/blog_detail.jsp").forward(request, response);
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

        System.out.println("");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>\

}
