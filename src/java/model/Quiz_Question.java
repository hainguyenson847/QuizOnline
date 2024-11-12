/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPT SHOP
 */
public class Quiz_Question {
    private int quiz_id;
    private int question_id;

    public Quiz_Question(int quiz_id, int question_id) {
        this.quiz_id = quiz_id;
        this.question_id = question_id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    @Override
    public String toString() {
        return "Quiz_Question{" + "quiz_id=" + quiz_id + ", question_id=" + question_id + '}';
    }
    
    
}
