/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Account;
import model.Blog;
import model.Category;
import model.Post;

/**
 *
 * @author trung
 */
@WebServlet(name = "ListBlogController", urlPatterns = {"/listBlogAdmin"})
@MultipartConfig
public class ListBlogController extends HttpServlet {

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
            out.println("<title>Servlet ListBlogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListBlogController at " + request.getContextPath() + "</h1>");
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

        PostDAO pdao = new PostDAO();

        if (request.getParameter("action") != null) {
            String action = request.getParameter("action");
            if (action.equalsIgnoreCase("create")) {

                List<Category> listCategry = pdao.getALLCategory();
                request.setAttribute("listCategry", listCategry);

                request.getRequestDispatcher("admin/createBlog.jsp").forward(request, response);

            } else if (action.equalsIgnoreCase("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean check = pdao.deleteById(id);

                if (check) {
                    request.setAttribute("mess", "delete success");
                } else {
                    request.setAttribute("error", "delete false");

                }

            } else if (action.equalsIgnoreCase("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Post post = pdao.getPostByBlogID(id);

                request.setAttribute("post", post);
                List<Category> listCategry = pdao.getALLCategory();
                request.setAttribute("listCategry", listCategry);

                request.getRequestDispatcher("admin/editPost.jsp").forward(request, response);
                return;
            }
        }

        List<Post> listPost = pdao.getALLPost();
        request.setAttribute("listPost", listPost);

        request.getRequestDispatcher("admin/managerPost.jsp").forward(request, response);

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
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("create")) {
            String blogTitle = request.getParameter("blog_title");
            String blogSummary = request.getParameter("blog_summary");
            String blogContent = request.getParameter("blog_content");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            int categoryId = Integer.parseInt(request.getParameter("category_id"));

            // HttpSession session = request.getSession();
            // Account acc = (Account) session.getAttribute("user");
            int authorId = 1;

            // Xử lý tải lên tệp hình ảnh (thumbnail)
            Part filePart = request.getPart("thumbnail");
            String thumbnailFileName = filePart.getSubmittedFileName(); // Lưu tên tệp

            // Đường dẫn đến thư mục lưu trữ hình ảnh
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);

            // Tạo thư mục nếu chưa tồn tại
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Lưu tệp vào thư mục
            String fullPath = uploadPath + File.separator + thumbnailFileName; // Đường dẫn đầy đủ
            filePart.write(fullPath); // Lưu tệp

            // Tạo đối tượng Blog
            Blog newBlog = new Blog();
            newBlog.setBlog_title(blogTitle);
            newBlog.setBlog_summary(blogSummary);
            newBlog.setBlog_content(blogContent);
            newBlog.setStatus(status);
            newBlog.setCategory_id(categoryId);
            newBlog.setAccount_id(authorId);

            // Lưu đường dẫn ảnh vào Blog
            String imagePath = "uploads/" + thumbnailFileName; // Đường dẫn tương đối để lưu vào cơ sở dữ liệu
            newBlog.setThumbnail(imagePath); // Lưu đường dẫn vào đối tượng Blog

            // Lưu blog vào cơ sở dữ liệu
            PostDAO blogDAO = new PostDAO();
            blogDAO.createBlog(newBlog);

            response.sendRedirect("listBlogAdmin");
        }

       if (action.equalsIgnoreCase("edit")) {
    int blogId = Integer.parseInt(request.getParameter("blog_id"));
    String blogTitle = request.getParameter("blog_title");
    String blogSummary = request.getParameter("blog_summary");
    String blogContent = request.getParameter("blog_content");
    boolean status = Boolean.parseBoolean(request.getParameter("status"));
    int categoryId = Integer.parseInt(request.getParameter("category_id"));

    // Khởi tạo đối tượng PostDAO để lấy thông tin blog cũ
    PostDAO blogDAO = new PostDAO();
    Blog existingBlog = blogDAO.getBlogById(blogId); // Phương thức này sẽ lấy blog cũ từ cơ sở dữ liệu

    // Lấy thông tin thumbnail nếu người dùng không tải lên tệp mới
    String thumbnailFileName = null;
    Part filePart = request.getPart("thumbnail");
    if (filePart.getSize() > 0) { // Kiểm tra nếu người dùng có tải lên hình ảnh mới
        thumbnailFileName = filePart.getSubmittedFileName(); // Lưu tên tệp

        // Lưu tệp vào thư mục
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String fullPath = uploadPath + File.separator + thumbnailFileName; // Đường dẫn đầy đủ
        filePart.write(fullPath); // Lưu tệp
    }

    // Tạo đối tượng Blog để chỉnh sửa
    Blog updatedBlog = new Blog();
    updatedBlog.setBlog_id(blogId); // Giả định có setter cho blog_id
    updatedBlog.setBlog_title(blogTitle);
    updatedBlog.setBlog_summary(blogSummary);
    updatedBlog.setBlog_content(blogContent);
    updatedBlog.setStatus(status);
    updatedBlog.setCategory_id(categoryId);

    // Giữ nguyên thumbnail nếu không có tệp mới
    if (thumbnailFileName != null) {
        String imagePath = "uploads/" + thumbnailFileName;
        updatedBlog.setThumbnail(imagePath);
    } else {
        // Giữ nguyên thumbnail cũ
        updatedBlog.setThumbnail(existingBlog.getThumbnail());
    }

    // Cập nhật blog vào cơ sở dữ liệu
    blogDAO.updateBlog(updatedBlog);

    response.sendRedirect("listBlogAdmin");
}


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
