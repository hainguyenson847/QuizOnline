/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author ADMIN
 */
// File: RegistrationTask.java

import dal.RegistrationDAO;

public class RegistrationTask implements Runnable {

    @Override
    public void run() {
        RegistrationDAO registrationDAO = new RegistrationDAO();
        try {
            registrationDAO.processExpiredRegistrations();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}