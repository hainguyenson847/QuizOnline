/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.PackageDAO;
import dal.SubjectDAO;

/**
 *
 * @author trung
 */
public class Package {
    private int package_id;
    private String package_name;
    private int duration;
    private double listPrice;
    private double salePrice;
    private String status;
    private int subject_id;

    public Package() {
    }

    public Package(int package_id, String package_name, int duration, double listPrice, double salePrice, String status, int subject_id) {
        this.package_id = package_id;
        this.package_name = package_name;
        this.duration = duration;
        this.listPrice = listPrice;
        this.salePrice = salePrice;
        this.status = status;
        this.subject_id = subject_id;
    }

   
    public int getPackage_id() {
        return package_id;
    }

    public void setPackage_id(int package_id) {
        this.package_id = package_id;
    }

    public String getPackage_name() {
        return package_name;
    }

    public void setPackage_name(String package_name) {
        this.package_name = package_name;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public double getListPrice() {
        return listPrice;
    }

    public void setListPrice(double listPrice) {
        this.listPrice = listPrice;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }
    
    public Subject getSubject(SubjectDAO dao) {
        return dao.getSubjectByID(subject_id);
    }

    @Override
    public String toString() {
        return "Package{" + "package_id=" + package_id + ", package_name=" + package_name + ", duration=" + duration + ", listPrice=" + listPrice + ", salePrice=" + salePrice + ", status=" + status + ", subject_id=" + subject_id + '}';
    }
    
    
    
}
