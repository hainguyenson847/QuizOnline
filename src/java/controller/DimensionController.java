/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DimensionDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Dimension;
import model.DimensionType;
import model.Subject;

/**
 *
 * @author trung
 */
@WebServlet(name = "DimensionController", urlPatterns = {"/dimension"})
public class DimensionController extends HttpServlet {

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
            out.println("<title>Servlet DimensionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DimensionController at " + request.getContextPath() + "</h1>");
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
        String subjectName = request.getParameter("subjectName");
        SubjectDAO sDao = new SubjectDAO();
        int maxid = sDao.getMaxSubjectId();

        // 
        DimensionDAO dDao = new DimensionDAO();
        List<Dimension> listD = dDao.getAllDimension1();
        request.setAttribute("listD", listD);

        String action = request.getParameter("action");

        List<DimensionType> listDimensionType = dDao.getAllType();

        request.setAttribute("listDimensionType", listDimensionType);
        request.setAttribute("subjectNamefordimension", subjectName);
        request.setAttribute("subjectNameforlessontopic", subjectName);
        request.setAttribute("maxid", maxid);

        List<Subject> listSubject = sDao.getListSubject();
        request.setAttribute("listSubject", listSubject);
        if (action != null) {

            if (action.equalsIgnoreCase("edit")) {

                int dimensionId = Integer.parseInt(request.getParameter("id"));
                Dimension dimension = dDao.getDimensionById1(dimensionId);
                request.setAttribute("dimension", dimension);
                request.setAttribute("action", "edit");

            }
            if (action.equalsIgnoreCase("delete")) {
                request.setAttribute(action, "delete");
            }

        }

        request.getRequestDispatcher("admin/adddimensionandlessontopic.jsp").forward(request, response);
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

        if (action.equalsIgnoreCase("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            String dimension_name = request.getParameter("dimension_name");
            int dimension_type_id = Integer.parseInt(request.getParameter("dimension_type_id"));

            DimensionDAO dDao = new DimensionDAO();
            boolean update = dDao.updateDimension(id, dimension_name, dimension_type_id);

            if (update) {
                request.setAttribute("messfordimension", "Update successfully!");
                request.removeAttribute("action");
            } else {
                request.setAttribute("eror", "Update falsess!");
            }
        }
        if (action.equalsIgnoreCase("create")) {
            String dimension_name = request.getParameter("dimension_name");
            int dimension_type_id = Integer.parseInt(request.getParameter("dimension_type_id"));
            int subject_id = Integer.parseInt(request.getParameter("subject_id"));
            String subjectName = request.getParameter("subjectNamefordimension");
            DimensionDAO dDao = new DimensionDAO();

            boolean create = dDao.createNewDimension(dimension_name, dimension_type_id, subject_id);
            if (create) {
                SubjectDAO sDao = new SubjectDAO();
                int maxid = sDao.getMaxSubjectId();

                // 
                List<Dimension> listD = dDao.getAllDimension1();
                request.setAttribute("listD", listD);

                List<DimensionType> listDimensionType = dDao.getAllType();

                request.setAttribute("listDimensionType", listDimensionType);
                request.setAttribute("maxid", maxid);

                List<Subject> listSubject = sDao.getListSubject();
                request.setAttribute("listSubject", listSubject);
                if (action != null) {

                    if (action.equalsIgnoreCase("edit")) {

                        int dimensionId = Integer.parseInt(request.getParameter("id"));
                        Dimension dimension = dDao.getDimensionById1(dimensionId);
                        request.setAttribute("dimension", dimension);
                        request.setAttribute("action", "edit");

                    }
                    if (action.equalsIgnoreCase("delete")) {
                        request.setAttribute(action, "delete");
                    }

                }
                request.setAttribute("messfordimension", "Create successfully!");
                request.removeAttribute("action");
                request.setAttribute("subjectNamefordimension", subjectName);
                request.setAttribute("subjectNameforlessontopic", subjectName);
               request.getRequestDispatcher("admin/adddimensionandlessontopic.jsp").forward(request, response);


            } else {
                request.setAttribute("eror", "Create falsess!");
            }
        }

        if (action.equalsIgnoreCase("delete")) {
            DimensionDAO dDao = new DimensionDAO();
            int id = Integer.parseInt(request.getParameter("id"));

            boolean delete = dDao.deleteDimension(id);

            if (delete) {
                request.setAttribute("mess", "Delete successfully!");
                request.removeAttribute("action");
            } else {
                request.setAttribute("eror", "Delete falsess!");
            }
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
