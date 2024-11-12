/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPT SHOP
 */
public class Quiz_Type {
    private int quiz_type_id;
    private String quiz_type_name;

    public Quiz_Type() {
    }

    public Quiz_Type(int quiz_type_id, String quiz_type_name) {
        this.quiz_type_id = quiz_type_id;
        this.quiz_type_name = quiz_type_name;
    }

    public int getQuiz_type_id() {
        return quiz_type_id;
    }

    public void setQuiz_type_id(int quiz_type_id) {
        this.quiz_type_id = quiz_type_id;
    }

    public String getQuiz_type_name() {
        return quiz_type_name;
    }

    public void setQuiz_type_name(String quiz_type_name) {
        this.quiz_type_name = quiz_type_name;
    }

    @Override
    public String toString() {
        return "Quiz_Type{" + "quiz_type_id=" + quiz_type_id + ", quiz_type_name=" + quiz_type_name + '}';
    }
    
    
}
