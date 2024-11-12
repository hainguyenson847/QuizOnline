/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.lang.reflect.Array;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import model.Registration;
import model.Registration_Status;
import model.Subject;

/**
 *
 * @author ADMIN
 */
public class RegistrationDAO extends DBContext {

    /**
     * Get all registration list which contains (user_email, registration_time,
     * subject name, package name, cost, status name)
     *
     * @return an array list
     */
    public ArrayList<Registration> getRegistrationList() {
        PreparedStatement stm;
        PreparedStatement stm_view;
        ResultSet rs;
        ArrayList<Registration> registration_list = new ArrayList<Registration>();
        try {
            String strSelect = "SELECT registration_id, registration_time, account_id, subject_id ,package_id, cost, status_id FROM Registration  ";
            String strView = "ALTER VIEW [RegistrationView] AS SELECT registration_id, registration_time, account_id, subject_id ,package_id, cost, status_id "
                    + " FROM Registration  ";
            stm = connection.prepareStatement(strSelect);
            stm_view = connection.prepareStatement(strView);
            stm_view.executeUpdate();
            rs = stm.executeQuery();
            while (rs.next()) {
                Registration registration = new Registration();
                registration.setRegistration_id(rs.getInt("registration_id"));
                registration.setAccount_id(rs.getInt("account_id"));
                registration.setRegistration_time(rs.getTimestamp("registration_time").toLocalDateTime());
                registration.setSubject_id(rs.getInt("subject_id"));
                registration.setPackage_id(rs.getInt("package_id"));
                registration.setCost(rs.getDouble("cost"));
                registration.setStatus_id(rs.getInt("status_id"));
                registration_list.add(registration);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return registration_list;
    }
    
    


    /**
     * Get an user's registration list using his/her email
     *
     * @param email
     * @return an array list
     */
    public ArrayList<Registration> getRegistrationListByEmail(String email) {
        PreparedStatement stm;
        PreparedStatement stm_view;
        ResultSet rs;
        ArrayList<Registration> registration_list = new ArrayList<Registration>();
        try {
            String strSelect = "SELECT registration_id, registration_time, account_id, subject_id ,package_id, cost, status_id FROM Registration"
                    + " WHERE account_id in(SELECT account_id from Account WHERE email LIKE ?)";
            String strView = "ALTER VIEW [RegistrationView] AS SELECT registration_id, registration_time, account_id, subject_id ,package_id, cost, status_id FROM Registration"
                    + " WHERE account_id in(SELECT account_id from Account WHERE email LIKE '" + email + "')";
            stm = connection.prepareStatement(strSelect);
            stm_view = connection.prepareStatement(strView);
            stm.setString(1, email);
            rs = stm.executeQuery();
            stm_view.executeUpdate();
            while (rs.next()) {
                Registration registration = new Registration();
                registration.setRegistration_id(rs.getInt("registration_id"));
                registration.setAccount_id(rs.getInt("account_id"));
                registration.setRegistration_time(rs.getTimestamp("registration_time").toLocalDateTime());
                registration.setSubject_id(rs.getInt("subject_id"));
                registration.setPackage_id(rs.getInt("package_id"));
                registration.setCost(rs.getDouble("cost"));
                registration.setStatus_id(rs.getInt("status_id"));
                registration_list.add(registration);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return registration_list;
    }

    /**
     * Get status of a registration by status_id
     *
     * @param status_id
     * @return
     */
    public String getRegistrationStatus(int status_id) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String strSelect = "SELECT  status_name FROM Registration_Status WHERE status_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, status_id);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("status_name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Sort registration list by cost
     *
     * @param type ascending or descending
     * @return a registration list in order
     */
    public ArrayList<Registration> sortRegistrationListByCost(String type) {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Registration> registration_list = new ArrayList<Registration>();
        try {
            String strSelect = "SELECT registration_id, registration_time, account_id, subject_id ,package_id, cost, status_id FROM RegistrationView"
                    + " ORDER BY cost " + type + "";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Registration registration = new Registration();
                registration.setAccount_id(rs.getInt("account_id"));
                registration.setRegistration_id(rs.getInt("registration_id"));
                registration.setRegistration_time(rs.getTimestamp("registration_time").toLocalDateTime());
                registration.setSubject_id(rs.getInt("subject_id"));
                registration.setPackage_id(rs.getInt("package_id"));
                registration.setCost(rs.getDouble("cost"));
                registration.setStatus_id(rs.getInt("status_id"));
                registration_list.add(registration);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return registration_list;
    }

    /**
     * Sort registration list by date
     *
     * @param type ascending or descending
     * @return a registration list in order
     */
    public ArrayList<Registration> sortRegistrationListByDate(String type) {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Registration> registration_list = new ArrayList<Registration>();
        try {
            String strSelect = "SELECT registration_id, registration_time, account_id, subject_id ,package_id, cost, status_id FROM RegistrationView"
                    + " ORDER BY registration_time " + type + "";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Registration registration = new Registration();
                registration.setAccount_id(rs.getInt("account_id"));
                registration.setRegistration_id(rs.getInt("registration_id"));
                registration.setRegistration_time(rs.getTimestamp("registration_time").toLocalDateTime());
                registration.setSubject_id(rs.getInt("subject_id"));
                registration.setPackage_id(rs.getInt("package_id"));
                registration.setCost(rs.getDouble("cost"));
                registration.setStatus_id(rs.getInt("status_id"));
                registration_list.add(registration);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return registration_list;
    }

    /**
     * Get registration status list
     *
     * @return an array list
     */
    public ArrayList<Registration_Status> getRegistrationStatus() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Registration_Status> registration_status_list = new ArrayList<Registration_Status>();
        try {
            String strSelect = "SELECT status_id, status_name FROM Registration_Status";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Registration_Status registration_status = new Registration_Status();
                registration_status.setStatus_id(rs.getInt("status_id"));
                registration_status.setStatus_name(rs.getString("status_name"));
                registration_status_list.add(registration_status);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return registration_status_list;
    }

    /**
     * Get registration list based on subject name
     *
     * @param subject_name
     * @return an array list of registration list
     */
    public ArrayList<Registration> filterRegistrationList(String subject_name, String lower_registration_date,
            String upper_registration_date, String status_name) {
        PreparedStatement stm;
        PreparedStatement stm_view;
        ResultSet rs;
        ArrayList<Registration> registration_list = new ArrayList<Registration>();
        try {
            String strSelect = "Select registration_id, registration_time, account_id, subject_id ,package_id, cost, status_id FROM Registration"
                    + " WHERE  subject_id in(SELECT subject_id FROM Subject where subject_name LIKE ?)"
                    + " AND registration_time >= '" + lower_registration_date + " 00:00:00.000' AND registration_time <= '" + upper_registration_date + " 23:59:00.000'"
                    + " AND status_id IN (SELECT status_id FROM Registration_Status WHERE status_name LIKE ?)";

            String strView = "ALTER VIEW [RegistrationView] AS Select registration_id, registration_time, account_id, subject_id ,package_id, cost, status_id FROM Registration"
                    + " WHERE  subject_id in(SELECT subject_id FROM Subject where subject_name LIKE '" + subject_name + "' )"
                    + " AND registration_time >= '" + lower_registration_date + " 00:00:00.000' AND registration_time <= '" + upper_registration_date + " 23:59:00.000'"
                    + " AND status_id IN (SELECT status_id FROM Registration_Status WHERE status_name LIKE '" + status_name + "') ";
            stm = connection.prepareStatement(strSelect);
            stm_view = connection.prepareStatement(strView);
            stm.setString(1, subject_name);
            stm.setString(2, status_name);

            rs = stm.executeQuery();
            stm_view.executeUpdate();
            while (rs.next()) {
                Registration registration = new Registration();
                registration.setAccount_id(rs.getInt("account_id"));
                registration.setRegistration_id(rs.getInt("registration_id"));
                registration.setRegistration_time(rs.getTimestamp("registration_time").toLocalDateTime());
                registration.setSubject_id(rs.getInt("subject_id"));
                registration.setPackage_id(rs.getInt("package_id"));
                registration.setCost(rs.getDouble("cost"));
                registration.setStatus_id(rs.getInt("status_id"));
                registration_list.add(registration);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return registration_list;
    }

    /**
     * Update a registration
     *
     * @param package_id
     * @param list_price
     * @param sale_price
     * @param cost
     * @param status_id
     * @param valid_from
     * @param valid_to
     * @param note
     * @param registration_id
     */
    public void UpdateRegistration(int package_id, double list_price, double sale_price, double cost,
            int status_id, String valid_from, String valid_to, String note, int registration_id) {
        PreparedStatement stm;
        try {
            String strSelect = "UPDATE Registration"
                    + " SET package_id=?,"
                    + " list_price=?,"
                    + " sale_price=?,"
                    + " cost=?,"
                    + " status_id=?,"
                    + " valid_from=?,"
                    + " valid_to=?,"
                    + " note=?"
                    + " WHERE registration_id= ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, package_id);
            stm.setDouble(2, list_price);
            stm.setDouble(3, sale_price);
            stm.setDouble(4, cost);
            stm.setInt(5, status_id);
            stm.setString(6, valid_from);
            stm.setString(7, valid_to);
            stm.setString(8, note);
            stm.setInt(9, registration_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * Delete an unused registration
     *
     * @param registration_id
     */
    public void DeleteRegistration(int registration_id) {
        PreparedStatement stm;
        try {
            String strSelect = "DELETE FROM Registration WHERE registration_id=?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, registration_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Registration getRegistrationById(int id) {
        PreparedStatement stm;
        ResultSet rs;
        Registration registration = new Registration();
        try {
            String strSelect = "SELECT list_price,sale_price, registration_time, account_id, subject_id ,package_id,valid_from, valid_to, status_id"
                    + " FROM Registration where registration_id=?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                registration.setList_price(rs.getDouble("list_price"));
                registration.setRegistration_time(rs.getTimestamp("registration_time").toLocalDateTime());
                registration.setSubject_id(rs.getInt("subject_id"));
                registration.setPackage_id(rs.getInt("package_id"));
                registration.setSale_price(rs.getDouble("sale_price"));
                registration.setStatus_id(rs.getInt("status_id"));
                registration.setValid_from(rs.getTimestamp("valid_from").toLocalDateTime());
                registration.setValid_to(rs.getTimestamp("valid_to").toLocalDateTime());
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return registration;
    }

    /**
     * Get revenue of a month
     *
     * @return an array list that provides revenue of 12 months
     */
    public ArrayList<Integer> getListPriceByMonth() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Integer> list = new ArrayList<>();
           ArrayList<Integer> outcome_list = new ArrayList<>();
        try {
            String strSelect = "  SELECT SUM(e.earnings) as earning, e.mon from "
                    + " ( Select SUM(list_price) as earnings, MONTH(registration_time ) as mon FROM Registration GROUP BY registration_time) as e Group by e.mon";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("earning"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
         ArrayList<Integer> list_day = new ArrayList<>();
        list_day.add(1);
        list_day.add(2);
        list_day.add(3);
        list_day.add(4);
        list_day.add(5);
        list_day.add(6);
        list_day.add(7);
        list_day.add(8);
        list_day.add(9);
        list_day.add(10);
        list_day.add(11);
        list_day.add(12);
        
        int listday_index = 0;
        int check_date=1;
        for (int i = 0; i < 12; i++) {
            //if there is a date that should have in the the outcome_list but
            //not exist in the list_day 
            if ((int) list_day.get(listday_index) != check_date) {
                outcome_list.add(i, 0);
            } else {
                outcome_list.add(i, (int) list.get(listday_index));
                if (listday_index <= list_day.size() - 3) {
                    //since the value in the list_registration has been asigned to outcome_list,
                    //we move to the next element in the list_registration
                    listday_index++;
                }

            }

            check_date++;
        }
        return outcome_list;
    }

    /**
     * Get number of registration in a month
     *
     * @return an array list that provides number of registration of 12 months
     */
    public ArrayList<Integer> getRegistrationByMonth() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Integer> list = new ArrayList<>();
        ArrayList<Integer> outcome_list = new ArrayList<>();
        try {
            String strSelect = " SELECT COUNT(e.number) as earning, e.mon from"
                    + " ( Select COUNT(*) as number, MONTH(registration_time ) as mon FROM Registration GROUP BY registration_time) as e Group by e.mon";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("earning"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        ArrayList<Integer> list_day = new ArrayList<>();
        list_day.add(1);
        list_day.add(2);
        list_day.add(3);
        list_day.add(4);
        list_day.add(5);
        list_day.add(6);
        list_day.add(7);
        list_day.add(8);
        list_day.add(9);
        list_day.add(10);
        list_day.add(11);
        list_day.add(12);
        
        int listday_index = 0;
        int check_date=1;
        for (int i = 0; i < 12; i++) {
            //if there is a date that should have in the the outcome_list but
            //not exist in the list_day 
            if ((int) list_day.get(listday_index) != check_date) {
                outcome_list.add(i, 0);
            } else {
                outcome_list.add(i, (int) list.get(listday_index));
                if (listday_index <= list_day.size() - 3) {
                    //since the value in the list_registration has been asigned to outcome_list,
                    //we move to the next element in the list_registration
                    listday_index++;
                }

            }

            check_date++;
        }
        return outcome_list;
    }

    /**
     * Get all revenue of all months
     *
     * @return revenue of all months
     */
    public double getAllMonthRevenue() {
        PreparedStatement stm;
        ResultSet rs;
        double revenue = 0;
        try {
            String strSelect = "SELECT SUM(list_price) as revenue FROM Registration";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            if (rs.next()) {
                revenue = rs.getDouble("revenue");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return revenue;
    }

    public double getMonthRevenue(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        int month = now.getMonthValue();
        double revenue = 0;
        try {
            String strSelect = "SELECT SUM(list_price) as revenue FROM Registration WHERE MONTH(registration_time)=?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            rs = stm.executeQuery();
            if (rs.next()) {
                revenue = rs.getDouble("revenue");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return revenue;
    }

    /**
     * Get total revenue of a week
     *
     * @param now the current date
     * @return revenue
     */
    public double getAllWeekRevenue(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        double revenue = 0;
        int month = now.getMonthValue();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int day = dayOfWeek.getValue();
        int dayOfMonth = now.getDayOfMonth();
        try {
            String strSelect = "SELECT SUM(e.earnings) as revenue FROM (Select SUM(list_price) as earnings, MONTH(registration_time ) as mon, DAY(registration_time) as day FROM Registration\n"
                    + "WHERE MONTH(registration_time)=? AND DAY(registration_time)>=? AND DAY(registration_time)<=? GROUP BY registration_time)\n"
                    + "AS e";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            stm.setInt(2, dayOfMonth - day + 1);
            stm.setInt(3, dayOfMonth + 7 - day);
            rs = stm.executeQuery();
            if (rs.next()) {
                revenue = rs.getDouble("revenue");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return revenue;
    }

    /**
     * Get revenue of a week
     *
     * @param now
     * @return an array list that provides revenue of 7 days in a week
     */
    public ArrayList<Integer> getRevenueByWeek(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        //some days in a week might not have data
        ArrayList<Integer> list_revenue = new ArrayList<>();
        //some days in a week might not be contained
        ArrayList<Integer> list_day = new ArrayList<>();
        int month = now.getMonthValue();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int day = dayOfWeek.getValue();
        int dayOfMonth = now.getDayOfMonth();

        try {
            String strSelect = "SELECT SUM(e.earnings) as revenue, e.day as day FROM (Select SUM(list_price) as earnings, MONTH(registration_time ) as mon, DAY(registration_time) as day FROM Registration\r\n"
                    + //
                    "  WHERE MONTH(registration_time)=? AND DAY(registration_time)>=? AND DAY(registration_time)<=? GROUP BY registration_time)\r\n"
                    + //
                    "  AS e GROUP BY e.day";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            stm.setInt(2, dayOfMonth - day + 1);
            stm.setInt(3, dayOfMonth + 7 - day);
            rs = stm.executeQuery();
            while (rs.next()) {
                list_revenue.add(rs.getInt("revenue"));
                list_day.add(rs.getInt("day"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        //contains info of 7 days in a week
        ArrayList<Integer> outcome_list = new ArrayList();
        //check from the first day of the week that corespond to the date user choose
        //Ex: user choose thursday the 15th then check_date is 12th
        int check_date = dayOfMonth - day + 1;
        //list day and list should be coressponding
        int listday_index = 0;
        for (int i = 0; i < 7; i++) {
            //if there is a date that should have in the the outcome_list but
            //not exist in the list_day 
            if ((int) list_day.get(listday_index) != check_date) {
                outcome_list.add(i, 0);
            } else {
                outcome_list.add(i, (int) list_revenue.get(listday_index));
                if (listday_index <= list_day.size() - 2) {
                    //since the value in the list_revenue has been asigned to outcome_list,
                    //we move to the next element in the list_revenue
                    listday_index++;
                }

            }

            check_date++;
        }
        return outcome_list;
    }

    /**
     * Get number of registration in a week
     *
     * @param now
     * @return an array list that provides number of registration of 7 days in a
     * week
     */
    public ArrayList<Integer> getNumberofRegistrationsInAWeek(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        //some days in a week might not have data
        ArrayList<Integer> list_registration = new ArrayList<>();
        //some days in a week might not be contained
        ArrayList<Integer> list_day = new ArrayList<>();
        int month = now.getMonthValue();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int day = dayOfWeek.getValue();
        int dayOfMonth = now.getDayOfMonth();

        try {
            String strSelect = "SELECT COUNT(*) as number, e.day as day FROM (Select COUNT(*) as numer, MONTH(registration_time ) as mon, DAY(registration_time) as day FROM Registration\r\n"
                    + //
                    "  WHERE MONTH(registration_time)=? AND DAY(registration_time)>=? AND DAY(registration_time)<=? GROUP BY registration_time)\r\n"
                    + //
                    "  AS e GROUP BY e.day";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            stm.setInt(2, dayOfMonth - day + 1);
            stm.setInt(3, dayOfMonth + 7 - day);
            rs = stm.executeQuery();
            while (rs.next()) {
                list_registration.add(rs.getInt("number"));
                list_day.add(rs.getInt("day"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        //contains info of 7 days in a week
        ArrayList<Integer> outcome_list = new ArrayList();
        //check from the first day of the week that corespond to the date user choose
        //Ex: user choose thursday the 15th then check_date is 12th
        int check_date = dayOfMonth - day + 1;
        //list day and list should be coressponding
        int listday_index = 0;
        for (int i = 0; i < 7; i++) {
            //if there is a date that should have in the the outcome_list but
            //not exist in the list_day 
            if ((int) list_day.get(listday_index) != check_date) {
                outcome_list.add(i, 0);
            } else {
                outcome_list.add(i, (int) list_registration.get(listday_index));
                if (listday_index <= list_day.size() - 2) {
                    //since the value in the list_registration has been asigned to outcome_list,
                    //we move to the next element in the list_registration
                    listday_index++;
                }

            }

            check_date++;
        }
        return outcome_list;
    }

    /**
     * Get total number of registration in a week
     *
     * @param now the current date
     * @return all registration in a week
     */
    public int getAllWeekRegitration(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        int month_registration = 0;
        int month = now.getMonthValue();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int day = dayOfWeek.getValue();
        int dayOfMonth = now.getDayOfMonth();
        try {
            String strSelect = "SELECT COUNT(*) as number FROM (Select COUNT(*) as numer, MONTH(registration_time ) as mon, DAY(registration_time) as day FROM Registration\n"
                    + "WHERE MONTH(registration_time)=? AND DAY(registration_time)>=? AND DAY(registration_time)<=? GROUP BY registration_time)\n"
                    + "AS e ";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            stm.setInt(2, dayOfMonth - day + 1);
            stm.setInt(3, dayOfMonth + 7 - day);
            rs = stm.executeQuery();
            if (rs.next()) {
                month_registration = rs.getInt("number");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return month_registration;
    }

    /**
     * Get total number of registration in all months
     *
     * @return all registration in all months
     */
    public int getAllMonthRegitration() {
        PreparedStatement stm;
        ResultSet rs;
        int week_registration = 0;
        try {
            String strSelect = "SELECT COUNT(*) as number FROM Registration";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            if (rs.next()) {
                week_registration = rs.getInt("number");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return week_registration;
    }

    /**
     * Get total number of registration in the current month
     *
     * @param now the current date
     * @return all registration in current month
     */
    public int getMonthRegitration(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        int month = now.getMonthValue();
        int week_registration = 0;
        try {
            String strSelect = "SELECT COUNT(*) as number FROM Registration where MONTH(registration_time)=?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            rs = stm.executeQuery();
            if (rs.next()) {
                week_registration = rs.getInt("number");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return week_registration;
    }

    /**
     * Get registration status of 12 months
     *
     * @return array list contains number of 3 status
     */
    public ArrayList<Integer> getMonthRegistrationStatus() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Integer> month_registration_status = new ArrayList<>();
        try {
            String strSelect = "SELECT COUNT(status_id) as number, status_id FROM Registration WHERE MONTH(registration_time)=? GROUP BY status_id";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, LocalDate.now().getMonthValue());
            rs = stm.executeQuery();
            while (rs.next()) {
                month_registration_status.add(rs.getInt("number"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return month_registration_status;
    }

    /**
     * Get number of registration status in a week
     *
     * @param now the current date
     * @return array list contains number of 3 status
     */
    public ArrayList<Integer> getWeekRegistrationStatus(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Integer> month_registration_status = new ArrayList<>();
        int month = now.getMonthValue();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int day = dayOfWeek.getValue();
        int dayOfMonth = now.getDayOfMonth();
        try {
            String strSelect = "SELECT COUNT(e.status_id) as number, Registration_Status.status_id FROm Registration_Status LEFT JOIN (Select  status_id  FROM Registration\n"
                    + "WHERE MONTH(registration_time)=? AND DAY(registration_time)>=? AND DAY(registration_time)<=? )as e\n"
                    + "ON Registration_Status.status_id=e.status_id GROUP BY Registration_Status.status_id,e.status_id";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            stm.setInt(2, dayOfMonth - day + 1);
            stm.setInt(3, dayOfMonth + 7 - day);
            rs = stm.executeQuery();
            while (rs.next()) {
                month_registration_status.add(rs.getInt("number"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return month_registration_status;
    }

    /**
     * Get number of users in all months
     *
     * @return array list contains data of 12 months
     */
    public ArrayList<Integer> getMonthUser() {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Integer> month_user = new ArrayList<>();
        try {
            String strSelect = "SELECT COUNT(account_id) as number, MONTH(registration_time) as mon FROM Account GROUP BY MONTH(registration_time)";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                month_user.add(rs.getInt("number"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return month_user;
    }

    /**
     * Get number of user in a week
     *
     * @param now
     * @return an array list that provides number of user of 7 days in a week
     */
    public ArrayList<Integer> getNumberofUsersInAWeek(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        //some days in a week might not have data
        ArrayList<Integer> list_registration = new ArrayList<>();
        //some days in a week might not be contained
        ArrayList<Integer> list_day = new ArrayList<>();
        int month = now.getMonthValue();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int day = dayOfWeek.getValue();
        int dayOfMonth = now.getDayOfMonth();

        try {
            String strSelect = "SELECT COUNT(*) as number, e.day as day FROM (Select COUNT(*) as numer, MONTH(registration_time ) as mon, DAY(registration_time) as day FROM Account\r\n"
                    + //
                    "WHERE MONTH(registration_time)=? AND DAY(registration_time)>=? AND DAY(registration_time)<=? GROUP BY registration_time)\r\n"
                    + //
                    "AS e GROUP BY e.day";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            stm.setInt(2, dayOfMonth - day + 1);
            stm.setInt(3, dayOfMonth + 7 - day);
            rs = stm.executeQuery();
            while (rs.next()) {
                list_registration.add(rs.getInt("number"));
                list_day.add(rs.getInt("day"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        //contains info of 7 days in a week
        ArrayList<Integer> outcome_list = new ArrayList();
        //check from the first day of the week that corespond to the date user choose
        //Ex: user choose thursday the 15th then check_date is 12th
        int check_date = dayOfMonth - day + 1;
        //list day and list should be coressponding
        int listday_index = 0;
        for (int i = 0; i < 7; i++) {
            //if there is a date that should have in the the outcome_list but
            //not exist in the list_day 
            if ((int) list_day.get(listday_index) != check_date) {
                outcome_list.add(i, 0);
            } else {
                outcome_list.add(i, (int) list_registration.get(listday_index));
                if (listday_index <= list_day.size() - 2) {
                    //since the value in the list_registration has been asigned to outcome_list,
                    //we move to the next element in the list_registration
                    listday_index++;
                }

            }

            check_date++;
        }
        return outcome_list;
    }

    /**
     * Get total number of user 12 months
     *
     * @return all user in all months
     */
    public int getAllUser() {
        PreparedStatement stm;
        ResultSet rs;
        int week_registration = 0;
        try {
            String strSelect = "SELECT COUNT(*) as number FROM Account";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            if (rs.next()) {
                week_registration = rs.getInt("number");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return week_registration;
    }

    public int getUserInAMonth(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        int month = now.getMonthValue();
        int week_registration = 0;
        try {
            String strSelect = "SELECT COUNT(*) as number FROM Account WHERE MONTH(registration_time)=?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            rs = stm.executeQuery();
            if (rs.next()) {
                week_registration = rs.getInt("number");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return week_registration;
    }

    /**
     * Get total number of user in a week
     *
     * @param now the current date
     * @return all user in a week
     */
    public int getAllUserInAWeek(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        int month_registration = 0;
        int month = now.getMonthValue();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int day = dayOfWeek.getValue();
        int dayOfMonth = now.getDayOfMonth();
        try {
            String strSelect = "SELECT COUNT(*) as number FROM (Select COUNT(*) as numer, MONTH(registration_time ) as mon, DAY(registration_time) as day FROM Account\n"
                    + "WHERE MONTH(registration_time)=? AND DAY(registration_time)>=? AND DAY(registration_time)<=? GROUP BY registration_time)\n"
                    + "AS e ";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            stm.setInt(2, dayOfMonth - day + 1);
            stm.setInt(3, dayOfMonth + 7 - day);
            rs = stm.executeQuery();
            if (rs.next()) {
                month_registration = rs.getInt("number");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return month_registration;
    }

    public ArrayList<Subject> getRegisteredSubjectsByUserId(int userId) {
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Subject> registeredSubjects = new ArrayList<>();

        try {
            String sql = "SELECT s.subject_id, s.subject_name, s.category_id, s.status, s.isFeatured, "
                    + "s.thumbnail, s.tagline, s.description, s.account_id "
                    + "FROM Subject s "
                    + "JOIN Registration r ON s.subject_id = r.subject_id "

                    + "WHERE r.account_id = ? AND r.status_id=3";

            stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);

            rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSubjectId(rs.getInt("subject_id"));
                subject.setSubjectName(rs.getString("subject_name"));
                subject.setCategoryId(rs.getInt("category_id"));
                subject.setStatus(rs.getBoolean("status"));
                subject.setIsFeatured(rs.getBoolean("isFeatured"));
                subject.setThumbnail(rs.getString("thumbnail"));
                subject.setTagline(rs.getString("tagline"));
                subject.setDescription(rs.getString("description"));
                subject.setAccountId(rs.getInt("account_id"));

                registeredSubjects.add(subject);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return registeredSubjects;
    }
    public boolean AddRegistration(Registration registration) {
        PreparedStatement stm;
        try {
            String strSelect = "INSERT INTO Registration (registration_time, account_id, subject_id, cost, list_price, sale_price, status_id, note) VALUES (?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(strSelect);
            stm.setTimestamp(1, java.sql.Timestamp.valueOf(registration.getRegistration_time()));
            stm.setInt(2, registration.getAccount_id());
            stm.setInt(3, registration.getSubject_id());
            stm.setDouble(4, registration.getCost());
            stm.setDouble(5, registration.getList_price());
            stm.setDouble(6, registration.getSale_price());
            stm.setInt(7, registration.getStatus_id());
            stm.setString(8, registration.getNote());
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
    
    public boolean RemoveRegistration(int account_id,int subject_id){
        PreparedStatement stm;
        try {
            String strSelect = "Update Registration"
                    + " SET status_id=1"
                    + " WHERE account_id=? AND subject_id=?";
            stm = connection.prepareStatement(strSelect);     
            stm.setInt(1, account_id);
            stm.setInt(2, subject_id);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
    public int GetAllBoughtSubjects(){
        PreparedStatement stm;
        ResultSet rs;
        int count = 0;
        try {
            String strSelect = "SELECT COUNT(*) as count FROM Registration WHERE  status_id=3";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public ArrayList<Subject> getTop5BoughtSubjects(){
        PreparedStatement stm;
        ResultSet rs;
        ArrayList<Subject> top5BoughtSubjects = new ArrayList<>();
        try {
            String strSelect = "SELECT TOP 5 s.subject_id, s.subject_name, s.description, COUNT(r.subject_id) as count FROM Subject s \r\n" + //
                                "JOIN Registration r ON s.subject_id = r.subject_id \r\n" + //
                                "WHERE r.status_id=3 GROUP BY s.subject_id, s.subject_name, s.description ORDER BY count DESC"
                    ;
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setSubjectId(rs.getInt("subject_id"));
                subject.setSubjectName(rs.getString("subject_name"));

                subject.setDescription(rs.getInt("count")+"");

                top5BoughtSubjects.add(subject);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return top5BoughtSubjects;
    }



    public static void main(String[] args) {
        RegistrationDAO a =new RegistrationDAO();
       ArrayList<Registration> h=a.getRegistrationList();
        System.out.println(h.size());
       
    }

    /**
     * Get number of registration in a week
     *
     * @param now
     * @return an array list that provides number of registration of 7 days in a
     * week
     */
    public ArrayList<Integer> getNumberofBoughtSubjectInAWeek(LocalDate now) {
        PreparedStatement stm;
        ResultSet rs;
        //some days in a week might not have data
        ArrayList<Integer> list_registration = new ArrayList<>();
        //some days in a week might not be contained
        ArrayList<Integer> list_day = new ArrayList<>();
        int month = now.getMonthValue();
        DayOfWeek dayOfWeek = now.getDayOfWeek();
        int day = dayOfWeek.getValue();
        int dayOfMonth = now.getDayOfMonth();

        try {
            String strSelect = "SELECT COUNT(*) as number, e.day as day FROM (Select COUNT(*) as numer, MONTH(registration_time ) as mon, DAY(registration_time) as day FROM Registration\r\n"
                    + //
                    "  WHERE MONTH(registration_time)=? AND DAY(registration_time)>=? AND DAY(registration_time)<=? AND status_id=3 GROUP BY registration_time)\r\n"
                    + //
                    "  AS e GROUP BY e.day";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, month);
            stm.setInt(2, dayOfMonth - day + 1);
            stm.setInt(3, dayOfMonth + 7 - day);
            rs = stm.executeQuery();
            while (rs.next()) {
                list_registration.add(rs.getInt("number"));
                list_day.add(rs.getInt("day"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        //contains info of 7 days in a week
        ArrayList<Integer> outcome_list = new ArrayList();
        //check from the first day of the week that corespond to the date user choose
        //Ex: user choose thursday the 15th then check_date is 12th
        int check_date = dayOfMonth - day + 1;
        //list day and list should be coressponding
        int listday_index = 0;
        for (int i = 0; i < 7; i++) {
            //if there is a date that should have in the the outcome_list but
            //not exist in the list_day 
            if ((int) list_day.get(listday_index) != check_date) {
                outcome_list.add(i, 0);
            } else {
                outcome_list.add(i, (int) list_registration.get(listday_index));
                if (listday_index <= list_day.size() - 2) {
                    //since the value in the list_registration has been asigned to outcome_list,
                    //we move to the next element in the list_registration
                    listday_index++;
                }

            }

            check_date++;
        }
        return outcome_list;
    }

    public boolean CheckIfUserBoughtSubject(int account_id, int subject_id) {
        PreparedStatement stm;
        ResultSet rs;
        try {
            String strSelect = "SELECT * FROM Registration WHERE account_id=? AND subject_id=? AND(status_id=2 or status_id=3)";    
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, account_id);
            stm.setInt(2, subject_id);
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean CofirmRegistration(LocalDateTime registration_time,int account_id, int subject_id, double sale_price,
            double list_price, double cost, LocalDateTime valid_from, LocalDateTime valid_to, int package_id) {
        PreparedStatement stm;
        try {
            String strSelect = "Update Registration"
                    + " SET status_id=3,"
                    + " registration_time=?,"
                    + " cost=?,"
                    + " sale_price=?,"
                    + " list_price=?,"
                    + " valid_from=?,"
                    + " valid_to=?,"
                    + " package_id=?"
                    + " WHERE account_id=? AND subject_id=? AND status_id=2";
            stm = connection.prepareStatement(strSelect);
            stm.setTimestamp(1, java.sql.Timestamp.valueOf(registration_time));
            stm.setDouble(2, cost);
            stm.setDouble(3, sale_price);
            stm.setDouble(4, list_price);
            stm.setTimestamp(5, java.sql.Timestamp.valueOf(valid_from));
            stm.setTimestamp(6, java.sql.Timestamp.valueOf(valid_to));
            stm.setInt(7, package_id);
            stm.setInt(8, account_id);
            stm.setInt(9, subject_id);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
    
    public boolean PurchasedSubject(LocalDateTime registration_time,int account_id, int subject_id, double sale_price,
            double list_price, double cost, LocalDateTime valid_from, LocalDateTime valid_to, int package_id) {
        PreparedStatement stm;
        try {
            String strSelect = "INSERT INTO Registration (registration_time, account_id, subject_id, cost, list_price, sale_price, status_id, valid_from, valid_to, package_id, note) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(strSelect);
            stm.setTimestamp(1, java.sql.Timestamp.valueOf(registration_time));
            stm.setInt(2, account_id);
            stm.setInt(3, subject_id);
            stm.setDouble(4, cost);
            stm.setDouble(5, list_price);
            stm.setDouble(6, sale_price);
            stm.setInt(7, 3);
            stm.setTimestamp(8, java.sql.Timestamp.valueOf(valid_from));
            stm.setTimestamp(9, java.sql.Timestamp.valueOf(valid_to));
            stm.setInt(10, package_id);
            stm.setString(11, "Online Payment");
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
    
    public boolean IfSubjectsInRegistration(int account_id, int subject_id){
        PreparedStatement stm;
        ResultSet rs;
        try {
            String strSelect = "SELECT * FROM Registration WHERE account_id=? AND subject_id=? AND status_id=2 ";    
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, account_id);
            stm.setInt(2, subject_id);
            rs = stm.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public static String getMD5(String input) {
        try {

            MessageDigest md = MessageDigest.getInstance("MD5");
            // Chuyển đổi chuỗi đầu vào thành mảng byte
            byte[] messageDigest = md.digest(input.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : messageDigest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public void processExpiredRegistrations() {
        PreparedStatement stm;
        try {
            String strSelect = "UPDATE Registration SET status_id=1 WHERE valid_to < GETDATE() AND status_id=3";
            stm = connection.prepareStatement(strSelect);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}