/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Explaination {
    private int explanation_id;
    private String explaination_content;
    private int question_id;

    public Explaination() {
    }

    public Explaination(int explanation_id, String explaination_content, int question_id) {
        this.explanation_id = explanation_id;
        this.explaination_content = explaination_content;
        this.question_id = question_id;
    }

    public int getExplanation_id() {
        return explanation_id;
    }

    public void setExplanation_id(int explanation_id) {
        this.explanation_id = explanation_id;
    }

    public String getExplaination_content() {
        return explaination_content;
    }

    public void setExplaination_content(String explaination_content) {
        this.explaination_content = explaination_content;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }
    
}
