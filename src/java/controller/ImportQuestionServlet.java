/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import model.Answer;
import model.Question;
import org.apache.poi.ss.usermodel.*;

/**
 *
 * @author FPT SHOP
 */
@MultipartConfig
public class ImportQuestionServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ImportQuestionServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportQuestionServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        QuestionDAO dao = new QuestionDAO();
        // Handle POST requests if necessary (currently not implemented)
        Part filePart = request.getPart("file");
        Workbook wb = null;
        try (InputStream fileContent = filePart.getInputStream()) {
            wb = WorkbookFactory.create(fileContent);
        }
        Sheet sheet = wb.getSheetAt(0);
        FormulaEvaluator formulaEval = wb.getCreationHelper().createFormulaEvaluator();
        boolean isFirstRow = true;
        
        for (Row row : sheet) {
            if(isFirstRow) {
                isFirstRow = false;
                continue;
            }
            List<Object> listObject = new ArrayList<>();
            Object value;
            for (Cell cell : row) {
                switch (formulaEval.evaluateInCell(cell).getCellType()) {
                    case NUMERIC:
                        value = (int) cell.getNumericCellValue();
                        listObject.add(value);
                        break;
                    case STRING:
                        value = cell.getStringCellValue();
                        listObject.add(value);
                        break;
                    case BOOLEAN:
                        value = cell.getBooleanCellValue();
                        listObject.add(value);
                        break;
                    default:
                        out.print("UNKNOWN\t"); // Fallback for any unknown types
                        listObject.add("none");
                        break;
                }
            }
            int subject_id;
            int dimension_id;
            int lesson_topic_id;
            int level_id;
            boolean status;
            try {
                subject_id = (int) listObject.get(0);
                dimension_id = (int) listObject.get(1);
                lesson_topic_id = (int) listObject.get(2);
                level_id = (int) listObject.get(3);
                status = (int) listObject.get(4) == 1 ? true : false;
            } catch (Exception ex) {
                response.sendRedirect("questionlist?importfail=true");
                return;
            }
            String question_content = (String) listObject.get(5);
            String explanation = (String) listObject.get(6);
            String media = (String) listObject.get(7);
            Question question = new Question(subject_id, dimension_id, lesson_topic_id, level_id, status, question_content, explanation, media);
            //Add Question
            try {
                dao.addQuestion(question);
            }
            catch (Exception ex) {
                response.sendRedirect("questionlist?importfail=true");
                return;
            }
            
            try {
                String answer_1 = (String) listObject.get(8);
            String answer_2 = (String) listObject.get(9);
            String answer_3 = (String) listObject.get(10);
            String answer_4 = (String) listObject.get(11);
            int isCorrect = (int) listObject.get(12);
            int question_id = dao.getLastQuestion().getQuestion_id();
                dao.addAnswer(new Answer(answer_1, isCorrect == 1 ? true : false, question_id));
                dao.addAnswer(new Answer(answer_2, isCorrect == 2 ? true : false, question_id));
                dao.addAnswer(new Answer(answer_3, isCorrect == 3 ? true : false, question_id));
                dao.addAnswer(new Answer(answer_4, isCorrect == 4 ? true : false, question_id));
            }
            catch(Exception ex) {
                response.sendRedirect("questionlist?importfail=true");
                return;
            }
        }
        request.setAttribute("importsuccess", true);
        request.getRequestDispatcher("questionlist").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
