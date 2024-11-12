/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPT SHOP
 */
public class Answer {
    private int answer_id;
    private String answer_detail;
    private boolean isCorrect;
    private int question_id;

    public Answer() {
    }

    public Answer(int answer_id, String answer_detail, boolean isCorrect, int question_id) {
        this.answer_id = answer_id;
        this.answer_detail = answer_detail;
        this.isCorrect = isCorrect;
        this.question_id = question_id;
    }
    
    public Answer(String answer_detail, boolean isCorrect, int question_id) {
        this.answer_detail = answer_detail;
        this.isCorrect = isCorrect;
        this.question_id = question_id;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer_id) {
        this.answer_id = answer_id;
    }

    public String getAnswer_detail() {
        return answer_detail;
    }

    public void setAnswer_detail(String answer_detail) {
        this.answer_detail = answer_detail;
    }

    public boolean isIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    @Override
    public String toString() {
        return "Answer{" + "answer_id=" + answer_id + ", answer_detail=" + answer_detail + ", isCorrect=" + isCorrect + ", question_id=" + question_id + '}';
    }
    
    
    
}
