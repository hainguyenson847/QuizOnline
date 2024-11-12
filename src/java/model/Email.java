/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.*;

/**
 *
 * @author DELL-PC
 */
//Email: hainshe186086@fpt.edu.vn
//password: tfof xqfg raof gptk
public class Email {

    static final String from = "hainshe186086@fpt.edu.vn";
    static final String password = "tfof xqfg raof gptk";

    public static void main(String[] args) {
        
        Random rd = new Random();
        int rdn = rd.nextInt(999999);
        String formattedNumber = String.format("%06d", 000111);
        //sendEmail("htbd28@gmail.com", formattedNumber, "Hai");
        System.out.println(formattedNumber);
    }

    public static boolean sendEmail(String to, String code, String accountName) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP HOST
        props.put("mail.smtp.port", "587"); //TLS 587 SSL 465
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);

        
        //create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
            }

        };

        //phien lam viec
        Session session = Session.getInstance(props, auth);

        //Send Email
        //final String to = "htbd28@gmail.com";

        //create a message
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            //sender
            msg.setFrom(from);
            //receiver
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //title
            msg.setSubject("Update Email");
            //set send Date
            msg.setSentDate(new Date());
            //set response email
            //msg.setReplyTo(InternetAddress.parse(to, false));

            //Content
            //msg.setText("This is content");
            msg.setContent("<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <title>Confirm Email Code</title>\n"
                + "</head>\n"
                + "<body style=\"font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;\">\n"
                + "\n"
                + "    <table style=\"width: 100%; max-width: 600px; margin: 20px auto; background-color: #ffffff; border-collapse: collapse;\">\n"
+ "        <tr>\n"
                + "            <td style=\"padding: 20px; text-align: center; background-color: #0865FF; color: #ffffff; font-size: 24px;\">\n"
                + "                Update Email Code\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "        <tr>\n"
                + "            <td style=\"padding: 20px;\">\n"
                + "                <p>Hi "+ accountName +",</p>\n"
                + "                <p>Someone has requested a new email for your account. If you didn't make this request, just ignore this email. If you'd like to proceed, please use the following code to reset your password:</p>\n"
                + "                <p style=\"font-size: 28px; font-weight: bold; color: #0865FF;\">" + code + "</p>\n"
                + "                <p>Thanks for reading!</p>\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "        <tr>\n"
                + "            <td style=\"padding: 20px; text-align: center; background-color: #0865FF; color: #ffffff;\">\n"
                + "                &copy; 2024 Quiz Online\n"
                + "            </td>\n"
                + "        </tr>\n"
                + "    </table>\n"
                + "\n"
                + "</body>\n"
                + "</html>", "text/html");
            //Send email
            Transport.send(msg);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
