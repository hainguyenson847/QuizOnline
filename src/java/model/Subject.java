/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.AccountDAO;
import dal.CategoryDAO;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author FPT SHOP
 */
public class Subject {
    private int subjectId;
    private String subjectName;
    private int categoryId;
    private boolean status;
    private boolean isFeatured;
    private String thumbnail;
    private String tagline;
    private String description;
    private int accountId;
    private java.sql.Timestamp createdDate;

    public Subject() {
    }

    public Subject(int subjectId, String subjectName, int categoryId, boolean status, boolean isFeatured, String thumbnail, String tagline, String description, int accountId, Timestamp createdDate) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.categoryId = categoryId;
        this.status = status;
        this.isFeatured = isFeatured;
        this.thumbnail = thumbnail;
        this.tagline = tagline;
        this.description = description;
        this.accountId = accountId;
        this.createdDate = createdDate;
    }

    
    
    
    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isIsFeatured() {
        return isFeatured;
    }

    public void setIsFeatured(boolean isFeatured) {
        this.isFeatured = isFeatured;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getTagline() {
        return tagline;
    }

    public void setTagline(String tagline) {
        this.tagline = tagline;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }
    
    public Category getCategory(CategoryDAO dao) {
        return dao.getCategoryByID(categoryId);
    }
    
    public Account getAccount(AccountDAO dao) {
        return dao.getAccountById(accountId);
    }
    
    @Override
    public String toString() {
        return "Subject{" + "subjectId=" + subjectId + ", subjectName=" + subjectName + ", categoryId=" + categoryId + ", status=" + status + ", isFeatured=" + isFeatured + ", thumbnail=" + thumbnail + ", tagline=" + tagline + ", description=" + description + ", accountId=" + accountId + ", createdDate=" + createdDate + '}';
    }
    

    
    
    
    
    
}
