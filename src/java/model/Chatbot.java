/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import com.lilittlecat.chatgpt.offical.ChatGPT;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Phuong Anh
 */
public class Chatbot {

    private static final String API_KEY = ""; 
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";

    public static void main(String[] args) {
        String userMessage = "giải thích đạo hàm";
        String response = sendMessageToChatGPT(userMessage);
        System.out.println("ChatGPT: " + response);

    }

    public static String sendMessageToChatGPT(String message) {
        try {
            URL url = new URL(API_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json; utf-8");
            conn.setRequestProperty("Authorization", "Bearer " + API_KEY);
            conn.setDoOutput(true);

            JSONObject jsonInput = new JSONObject();
            jsonInput.put("model", "gpt-3.5-turbo");

            // Khởi tạo mảng messages với một tin nhắn từ người dùng
            JSONArray messages = new JSONArray();
            messages.put(new JSONObject().put("role", "user").put("content", message));
            jsonInput.put("messages", messages);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInput.toString().getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int statusCode = conn.getResponseCode();
            if (statusCode != 200) {
                System.out.println("Lỗi từ API: Mã phản hồi HTTP " + statusCode);
                return "Không thể kết nối tới ChatGPT.";
            }

            StringBuilder response = new StringBuilder();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
            }

            JSONObject jsonResponse = new JSONObject(response.toString());
            return jsonResponse.getJSONArray("choices").getJSONObject(0).getJSONObject("message").getString("content");

        } catch (Exception e) {
            e.printStackTrace();
            return "Đã xảy ra lỗi khi gọi API ChatGPT.";
        }
    }

    public String getReply(String userMessage) {
        // Logic trả lời dựa vào userMessage
        if (userMessage.contains("hello")) {
            return "Xin chào! Tôi có thể giúp gì cho bạn?";
        } else if (userMessage.contains("bye")) {
            return "Tạm biệt! Hẹn gặp lại bạn.";
        }
        // Có thể thêm nhiều điều kiện khác ở đây
        return "Xin lỗi, tôi chưa hiểu câu hỏi của bạn. Bạn có thể thử lại!";
    }
}
