/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.RegistrationDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.Subject;

import model.Registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;

import org.apache.poi.ss.usermodel.Cell;
import static org.apache.poi.ss.usermodel.CellType.BOOLEAN;
import static org.apache.poi.ss.usermodel.CellType.NUMERIC;
import static org.apache.poi.ss.usermodel.CellType.STRING;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

/**
 *
 * @author ADMIN
 */
@MultipartConfig
public class SalerImportRegistration extends HttpServlet {

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
        // This method can be used to handle common logic for GET and POST if needed
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
        PrintWriter out = response.getWriter();
        out.print("Upload your registration Excel file using POST method.");
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

        PrintWriter out = response.getWriter();
        Part filePart = request.getPart("file");
        if (filePart == null || filePart.getSize() == 0) {
            out.println("No file uploaded.");
            return;
        }

        List<String> errors = new ArrayList<>();

        try (InputStream fileContent = filePart.getInputStream(); Workbook workbook = WorkbookFactory.create(fileContent)) {

            Sheet sheet = workbook.getSheetAt(0);
            FormulaEvaluator formulaEval = workbook.getCreationHelper().createFormulaEvaluator();
            boolean isFirstRow = true;

            for (Row row : sheet) {
                if (isFirstRow) {
                    isFirstRow = false;
                    continue; // Skip header row
                }

                List<Object> rowData = new ArrayList<>();
                Object value;
                for (Cell cell : row) {
                    switch (formulaEval.evaluateInCell(cell).getCellType()) {
                        case NUMERIC:
                            value = (int) cell.getNumericCellValue();
                            rowData.add(value);
                            break;
                        case STRING:
                            value = cell.getStringCellValue();
                            rowData.add(value);
                            break;
                        case BOOLEAN:
                            value = cell.getBooleanCellValue();
                            rowData.add(value);
                            break;
                        default:
                            out.print("UNKNOWN\t"); // Fallback for any unknown types
                            rowData.add("none");
                            break;
                    }
                }

                // Parse subject_name (String)
                String subjectName = rowData.get(0) instanceof String ? (String) rowData.get(0) : "";
                if (subjectName.isEmpty()) {
                    errors.add("Subject name is empty at row " + (row.getRowNum() + 1));
                    continue;
                }
                // Parse cost (double)
                double cost = rowData.get(1) instanceof Number ? ((Number) rowData.get(1)).doubleValue() : -1;
                if (cost < 0) {
                    errors.add("Invalid cost at row " + (row.getRowNum() + 1));
                    continue;
                }
                // Parse email (String)
                String email = rowData.get(2) instanceof String ? (String) rowData.get(2) : "";
                if (email.isEmpty() || !isValidEmail(email)) {
                    errors.add("Invalid email at row " + (row.getRowNum() + 1));
                    continue;
                }
                SubjectDAO mysubjectDAO = new SubjectDAO();
                RegistrationDAO myregistrationDAO = new RegistrationDAO();
                AccountDAO myaccountDAO = new AccountDAO();
                int account_id = myaccountDAO.getAccount(email).getAccount_id();
                int subject_id = mysubjectDAO.GetSubjectIdBySubjectName(subjectName);
                if (myregistrationDAO.CheckIfUserBoughtSubject(account_id, subject_id)) {
                    errors.add("Invalid subject name at row " + (row.getRowNum() + 1));
                    continue;
                }

                // Create Registration object
                out.print(email + subjectName + cost);
                int status_id = 2;
                LocalDateTime registrationTime = LocalDateTime.now();
                double list_price = 0;
                double sale_price = 0;
                Registration registration = new Registration();
                registration.setAccount_id(account_id);
                registration.setSubject_id(subject_id);
                registration.setStatus_id(status_id);
                registration.setRegistration_time(registrationTime);
                registration.setList_price(list_price);
                registration.setSale_price(sale_price);
                registration.setCost(cost);
                registration.setNote("Direct Payment");
                boolean check = myregistrationDAO.AddRegistration(registration);
                if (check) {
                  
                }

            }
        } catch (Exception e) {
            out.println("Error reading Excel file: " + e.getMessage());
            return;
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
        } else {
            request.setAttribute("message", "Registrations imported successfully.");
        }
        request.getRequestDispatcher("salerregistrationlist").forward(request, response);
    }

    /**
     * Validates email format.
     *
     * @param email the email string to validate
     * @return true if email is valid, false otherwise
     */
    private boolean isValidEmail(String email) {
        // Simple regex for email validation
        String emailRegex = "^[A-Za-z0-9._%+-]+@fpt\\.edu\\.vn$";
        return email.matches(emailRegex);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet for importing registrations from an Excel file.";
    }// </editor-fold>

}
