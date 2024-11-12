/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.SubjectDAO;
import dal.CategoryDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SubjectCategory;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import model.Account;

/**
 *
 * @author trung
 */
@MultipartConfig

@WebServlet(name = "SubjectDetailsController", urlPatterns = {"/subject-details"})
public class SubjectDetailsController extends HttpServlet {

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
            out.println("<title>Servlet SubjectDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectDetailsController at " + request.getContextPath() + "</h1>");
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
        CategoryDAO cDao = new CategoryDAO();
        List<SubjectCategory> listCategory = cDao.getAllCategory();
        request.setAttribute("listCategory", listCategory);

        AccountDAO aDao = new AccountDAO();
        List<Account> listExpert = aDao.getExpertsByRoleId();
        request.setAttribute("listExpert", listExpert);

        request.getRequestDispatcher("admin/subjectDetail.jsp").forward(request, response);
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
        // Extract form data
        String subjectName = request.getParameter("subjectName");
        String subjectCategory = request.getParameter("subjectCategory");
        String description = request.getParameter("description");
        String tagLine = request.getParameter("tagLine");
        String accountId = request.getParameter("listExpert");
        boolean featured = request.getParameter("featured") != null;

        String statusString = request.getParameter("status");
        int status = 0;
        try {
            status = Integer.parseInt(statusString);
        } catch (NumberFormatException e) {
            Logger.getLogger(SubjectDetailsController.class.getName()).log(Level.SEVERE, "Invalid status value", e);
            response.sendRedirect("subject-details?error=invalid-status");
            return;
        }

        // Handle file upload
        String linkImage = "";
        Part filePart = request.getPart("image");

        if (filePart != null && filePart.getSize() > 0) {
            // Sanitize and create a new file name
            String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString().replaceAll("[^a-zA-Z0-9.-]", "_");
            String newFileName = System.currentTimeMillis() + "_" + originalFileName;

            // Define the upload directory
            String uploadDir = getServletContext().getRealPath("") + "subject/img/imageSubject";
            File uploadDirFile = new File(uploadDir);

            // Create directory if it doesn't exist
            if (!uploadDirFile.exists() && !uploadDirFile.mkdirs()) {
                Logger.getLogger(SubjectDetailsController.class.getName()).log(Level.SEVERE, "Failed to create directory: " + uploadDir);
                response.sendRedirect("subject-details?error=upload-dir");
                return;
            }

            // Save the file to the specified directory
            linkImage = "subject/img/imageSubject/" + newFileName;
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, Paths.get(uploadDir, newFileName), StandardCopyOption.REPLACE_EXISTING);
                Logger.getLogger(SubjectDetailsController.class.getName()).log(Level.INFO, "File uploaded successfully: " + linkImage);
            } catch (IOException e) {
                Logger.getLogger(SubjectDetailsController.class.getName()).log(Level.SEVERE, "Error saving file", e);
                response.sendRedirect("subject-details?error=file-upload");
                return;
            }
        }

        // Save subject to database
        SubjectDAO sDao = new SubjectDAO();
        sDao.createNewSubject(subjectName, subjectCategory, status, featured, linkImage, tagLine, description, accountId);

        // Redirect to success page
        response.sendRedirect("dimension?subjectName="+subjectName+"");
    }
//    public void createNewSubject(String subjectName, String subjectCategory, int status, boolean featured, String thumbnail, String tagLine, String description, String accountId) {
//        String sql = "INSERT INTO Subject (subject_name, category_id, status, isFeatured, thumbnail, tagline, description, account_id, created_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, GETDATE())";
//
//        try (
//                PreparedStatement pstmt = connection.prepareStatement(sql)) {
//
//            // Set parameters for the prepared statement
//            pstmt.setString(1, subjectName);
//            pstmt.setString(2, subjectCategory); // Ensure this matches your category ID from the categories table
//            pstmt.setInt(3, status);
//            pstmt.setBoolean(4, featured);
//            pstmt.setString(5, thumbnail);
//            pstmt.setString(6, tagLine);
//            pstmt.setString(7, description);
//            pstmt.setString(8, accountId);
//
//            // Execute the insert
//            pstmt.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace(); // Log the exception for debugging
//            // Handle exceptions (e.g., log, rethrow, or show an error message)
//        }
//    }

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
