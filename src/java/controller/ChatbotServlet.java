/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import model.Chatbot;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Phuong Anh
 */
public class ChatbotServlet extends HttpServlet {

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
            out.println("<title>Servlet ChatbotServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChatbotServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    private Chatbot chatbot = new Chatbot();

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
        
        
        // {message: userMessage} Format cua javascript -> Json.stringfly chuyen tu javascript sang json 
        StringBuilder sb = new StringBuilder();
        String line;
        BufferedReader reader = request.getReader();
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        
        // Chuyển đổi dữ liệu thành JSONObject
        JSONObject json = new JSONObject(sb.toString());
//        String userMessage=  json.getString("message"); 
        JSONArray qaQueue = json.getJSONArray("message");
        
        String finalUserMessage = "Bạn là một chatbot trả lời những câu hỏi trong khóa học của tôi \n";
        finalUserMessage += "Sau đây là cuộc hội thoại của bạn và người dùng đã lưu: \n";
        for (int i = 0; i < qaQueue.length(); i++) {
            JSONObject qaPair = qaQueue.getJSONObject(i);
            String question = qaPair.getString("question");
            String answer = qaPair.getString("answer");
            finalUserMessage += "----------------------------";
            if (question != null){
                finalUserMessage += "Question " + i+1 + ": " + question;
            }
            if (answer != null) {
                finalUserMessage += "ChatbotAnswer: " + i+1 + ": " + answer;
            }
        }
//        finalUserMessage += "Dựa vào cuộc hội thoại mà bạn đã trao đổi với người dùng. Bạn hãy trả lời bằng kiến thức của mình";
        
        String finalAnswer = chatbot.sendMessageToChatGPT(finalUserMessage);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Trả về phản hồi
        response.getWriter().write("{\"chatbot_response\": \"" + finalAnswer + "\"}");

//        request.getRequestDispatcher("customer/lesson_detail.jsp").forward(request, response);
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
