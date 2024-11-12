/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Post {

    int blog_id;
    String blog_title;
    String thumbnail;
    String blog_summary;
    String blog_content;
    String created_date;
    String updated_date;
    boolean isFeatured;
    boolean status;
    int category_id;
    int account_id;
    private int number_of_access;

    public Post() {
    }

    public Post(int blog_id, String blog_title, String thumbnail, String blog_summary, String blog_content, String created_date, String updated_date, boolean isFeatured, boolean status, int category_id, int account_id, int number_of_access) {
        this.blog_id = blog_id;
        this.blog_title = blog_title;
        this.thumbnail = thumbnail;
        this.blog_summary = blog_summary;
        this.blog_content = blog_content;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.isFeatured = isFeatured;
        this.status = status;
        this.category_id = category_id;
        this.account_id = account_id;
        this.number_of_access = number_of_access;
    }

 

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public String getBlog_title() {
        return blog_title;
    }

    public void setBlog_title(String blog_title) {
        this.blog_title = blog_title;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getBlog_summary() {
        return blog_summary;
    }

    public void setBlog_summary(String blog_summary) {
        this.blog_summary = blog_summary;
    }

    public String getBlog_content() {
        return blog_content;
    }

    public void setBlog_content(String blog_content) {
        this.blog_content = blog_content;
    }

    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(String updated_date) {
        this.updated_date = updated_date;
    }

    public boolean isIsFeatured() {
        return isFeatured;
    }

    public void setIsFeatured(boolean isFeatured) {
        this.isFeatured = isFeatured;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getNumber_of_access() {
        return number_of_access;
    }

    public void setNumber_of_access(int number_of_access) {
        this.number_of_access = number_of_access;
    }

}
