/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.TokenForgetPassword;

/**
 *
 * @author HP
 */
public class TokenForgetDAO extends DBContext {

    //format to insert into sql table
    public String getFormatDate(LocalDateTime myDateObj) {
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = myDateObj.format(myFormatObj);
        return formattedDate;
    }

    //each request to rết pasword generate a token, add to database
    public boolean insertTokenForget(TokenForgetPassword tokenForget) {
        String sql = """
                     INSERT INTO [dbo].[TokenForgetPassword]
                                ([token]
                                ,[expiryTime]
                                ,[isUsed]
                                ,[account_id])
                          VALUES(?, ?, ?, ?)""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tokenForget.getToken());
            ps.setTimestamp(2, Timestamp.valueOf(getFormatDate(tokenForget.getExpiryTime())));
            ps.setBoolean(3, tokenForget.isIsUsed());
            ps.setInt(4, tokenForget.getUserId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     * Find a TokenForgetPassword base on token
     * @param token
     * @return a TokenForgetPassword object
     */
    public TokenForgetPassword getTokenPassword(String token) {
        String sql = "Select * from [TokenForgetPassword] where token = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, token);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new TokenForgetPassword(
                        rs.getInt("id"),
                        rs.getInt("account_id"),
                        rs.getBoolean("isUsed"),
                        rs.getString("token"),
                        rs.getTimestamp("expiryTime").toLocalDateTime()
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Each TokenForgetPassword contains an account_id, the method get one base on token
     * @param token
     * @return an integer
     */
    public int getTokenAccount_id(String token) {
        String sql = "Select * from [tokenForgetPassword] where token = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, token);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("account_id");

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     * After user click the link on email to reset password, token is disabled
     * @param token 
     */
    public void updateStatus(TokenForgetPassword token) {
        System.out.println("token = " + token);
        String sql = "UPDATE [dbo].[tokenForgetPassword]\n"
                + "   SET [isUsed] = ?\n"
                + " WHERE token = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, token.isIsUsed());
            st.setString(2, token.getToken());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
//        TokenForgetDAO a= new TokenForgetDAO();
//        TokenForgetPassword h=new  TokenForgetPassword(1, 1, true, "token", a.getFormatDate(LocalDateTime.MAX));
//        a.insertTokenForget(h);
    }

}
