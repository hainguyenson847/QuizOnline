/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Slider;

/**
 *
 * @author trung
 */
@WebServlet(name = "SliderAdmin", urlPatterns = {"/slider"})
public class SliderAdmin extends HttpServlet {

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
            out.println("<title>Servlet SliderAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderAdmin at " + request.getContextPath() + "</h1>");
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
        SliderDAO sDao = new SliderDAO();
        List<Slider> slider = sDao.getAllSlider();
        request.setAttribute("sliderList", slider);

        request.getRequestDispatcher("admin/slider.jsp").forward(request, response);
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
        // Lấy dữ liệu từ form
        String action = request.getParameter("action");
        if (action.isEmpty()) {
            request.setAttribute("error", "action null");
        } else if ("edit".equals(action)) {
            // Lấy dữ liệu các trường từ form
            int sliderId = Integer.parseInt(request.getParameter("slider_id"));
            String sliderTitle = request.getParameter("slider_title");
            String sliderLink = request.getParameter("slider_link");
            String sliderDetail = request.getParameter("slider_detail");
            String sliderImage = request.getParameter("slider_image");

            // Lưu hoặc cập nhật slider trong cơ sở dữ liệu
            SliderDAO sliderDAO = new SliderDAO();
            boolean check = sliderDAO.updateSlider(sliderId, sliderTitle, sliderLink, sliderDetail, sliderImage);  // Cần phải viết phương thức update trong SliderDAO

            if (check) {
                request.setAttribute("mess", "Update Success");
            } else {
                request.setAttribute("error", "Update Failed");
            }

        } else if ("delete".equals(action)) {
            int sliderId = Integer.parseInt(request.getParameter("slider_id"));
            SliderDAO sliderDAO = new SliderDAO();
            boolean check = sliderDAO.deleteById(sliderId);

            if (check) {
                request.setAttribute("mess", "Delete Success");
            } else {
                request.setAttribute("error", "Delete Failed");
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
