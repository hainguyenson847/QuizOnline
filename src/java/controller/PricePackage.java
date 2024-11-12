/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PackageDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Package;
import model.Subject;

@WebServlet(name = "PricePackage", urlPatterns = {"/price-package"})
public class PricePackage extends HttpServlet {

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
            out.println("<title>Servlet PricePackage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PricePackage at " + request.getContextPath() + "</h1>");
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

        PackageDAO pDao = new PackageDAO();
        SubjectDAO dao = new SubjectDAO();
        List<Package> listAllPackage = pDao.getAllPackage1();
        request.setAttribute("listAllPackage", listAllPackage);
        request.setAttribute("dao", dao);
        SubjectDAO sDao = new SubjectDAO();
        List<Subject> listSubject = sDao.getListSubject();
        request.setAttribute("listSubject", listSubject);
        String sid = request.getParameter("id");
        int packageId;
        if (sid != null) {
            packageId = Integer.parseInt(sid);
            request.setAttribute("subject_id", packageId);
        }

        String action = request.getParameter("action");
        if (action != null) {
            if (action.equalsIgnoreCase("edit")) {
                PackageDAO pdao = new PackageDAO();
                Package pricePackage = pDao.getPricePackageById1(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("pricePackage", pricePackage);
                request.setAttribute("action", "edit");
            }
        }

        request.getRequestDispatcher("admin/pricePackage.jsp").forward(request, response);
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
            // Retrieve form parameters
            String package_name = request.getParameter("package_name");
            int duration = Integer.parseInt(request.getParameter("duration"));
            double listPrice = Double.parseDouble(request.getParameter("listPrice"));
            double salePrice = Double.parseDouble(request.getParameter("salePrice"));
            int status = Integer.parseInt(request.getParameter("status"));
            int subject_id = Integer.parseInt(request.getParameter("dimension_type_id"));

            if (listPrice <= salePrice) {
                request.setAttribute("error", "The price must be bigger than sale");
            } else {
                PackageDAO pDao = new PackageDAO();
                boolean create = pDao.createPackage(package_name, duration, listPrice, salePrice, status, subject_id);

                if (create) {
                    request.setAttribute("mess", "Package created successfully!");
                } else {
                    request.setAttribute("error", "Failed to create package.");
                }
            }

        }
        if (action.equalsIgnoreCase("edit")) {

            int id = Integer.parseInt(request.getParameter("id"));
            String package_name = request.getParameter("package_name");
            int duration = Integer.parseInt(request.getParameter("duration"));
            double listPrice = Double.parseDouble(request.getParameter("listPrice"));
            double salePrice = Double.parseDouble(request.getParameter("salePrice"));
            int status = Integer.parseInt(request.getParameter("status"));
            int subject_id = Integer.parseInt(request.getParameter("dimension_type_id"));

            if (listPrice <= salePrice) {
                request.setAttribute("error", "The price must be bigger than sale");
            } else {
                PackageDAO pDao = new PackageDAO();
                boolean create = pDao.updatePackageById(id, package_name, duration, listPrice, salePrice, status, subject_id);

                if (create) {
                    request.setAttribute("mess", "Package update successfully!");
                } else {
                    request.setAttribute("error", "Failed to update package.");
                }
            }

        }
        if (action.equalsIgnoreCase("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            PackageDAO pDao = new PackageDAO();
            boolean delete = pDao.deleteById(id);

            if (delete) {
                request.setAttribute("mess", "Package delete successfully!");
            } else {
                request.setAttribute("error", "Failed to delete package.");
            }
        }

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
