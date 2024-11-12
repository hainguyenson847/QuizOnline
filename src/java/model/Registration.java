/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author ADMIN
 */
public class Registration {
    int registration_id;
    LocalDateTime registration_time;
    int subject_id;
    int package_id;
    double cost;
    LocalDateTime valid_from;
    LocalDateTime valid_to;
    int account_id;
    int status_id;
    double list_price;
    double sale_price;
    String note;

    public Registration() {
    }

    public Registration(int registration_id,LocalDateTime  registration_time, int subject_id, int package_id, double cost, LocalDateTime valid_from, LocalDateTime valid_to, int account_id, int status_id, double list_price, double sale_price, String note) {
        this.registration_id = registration_id;
        this.registration_time = registration_time;
        this.subject_id = subject_id;
        this.package_id = package_id;
        this.cost = cost;
        this.valid_from = valid_from;
        this.valid_to = valid_to;
        this.account_id = account_id;
        this.status_id = status_id;
        this.list_price = list_price;
        this.sale_price = sale_price;
        this.note = note;
    }
    public Registration(LocalDateTime  registration_time, int subject_id,  double cost,  int account_id, int status_id, double list_price, double sale_price) {
        this.registration_time = registration_time;
        this.subject_id = subject_id;
        this.cost = cost;
        this.account_id = account_id;
        this.status_id = status_id;
        this.list_price = list_price;
        this.sale_price = sale_price;
    }

    public int getRegistration_id() {
        return registration_id;
    }

    public void setRegistration_id(int registration_id) {
        this.registration_id = registration_id;
    }

    public LocalDateTime  getRegistration_time() {
        return registration_time;
    }

    public void setRegistration_time(LocalDateTime  registration_time) {
        this.registration_time = registration_time;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public int getPackage_id() {
        return package_id;
    }

    public void setPackage_id(int package_id) {
        this.package_id = package_id;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public LocalDateTime getValid_from() {
        return valid_from;
    }

    public void setValid_from(LocalDateTime valid_from) {
        this.valid_from = valid_from;
    }

    public LocalDateTime getValid_to() {
        return valid_to;
    }

    public void setValid_to(LocalDateTime valid_to) {
        this.valid_to = valid_to;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public double getList_price() {
        return list_price;
    }

    public void setList_price(double list_price) {
        this.list_price = list_price;
    }

    public double getSale_price() {
        return sale_price;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

   
    
    
}
