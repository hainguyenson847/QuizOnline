/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Practice_Record {
    private int practice_id;
    private String practice_name;
    private java.sql.Timestamp created_date;
    private int practice_duration;
    private int correct_questions;
    private int correct_rate;
    private int account_id;
    private int quiz_id;
    private Quiz quiz;

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    public Practice_Record(int practice_id, String practice_name, Timestamp created_date, int practice_duration, int correct_questions, int correct_rate, int account_id, int quiz_id) {
        this.practice_id = practice_id;
        this.practice_name = practice_name;
        this.created_date = created_date;
        this.practice_duration = practice_duration;
        this.correct_questions = correct_questions;
        this.correct_rate = correct_rate;
        this.account_id = account_id;
        this.quiz_id = quiz_id;
    }

    public Practice_Record(String practice_name, Timestamp created_date, int practice_duration, int correct_questions, int correct_rate, int account_id, int quiz_id) {
        this.practice_name = practice_name;
        this.created_date = created_date;
        this.practice_duration = practice_duration;
        this.correct_questions = correct_questions;
        this.correct_rate = correct_rate;
        this.account_id = account_id;
        this.quiz_id = quiz_id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }
    

    public Practice_Record() {
    }

    public Practice_Record(int practice_id, String practice_name, Timestamp created_date, int practice_duration, int correct_questions, int correct_rate, int account_id) {
        this.practice_id = practice_id;
        this.practice_name = practice_name;
        this.created_date = created_date;
        this.practice_duration = practice_duration;
        this.correct_questions = correct_questions;
        this.correct_rate = correct_rate;
        this.account_id = account_id;
    }

    public int getPractice_id() {
        return practice_id;
    }

    public void setPractice_id(int practice_id) {
        this.practice_id = practice_id;
    }

    public String getPractice_name() {
        return practice_name;
    }

    public void setPractice_name(String practice_name) {
        this.practice_name = practice_name;
    }

    public Timestamp getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Timestamp created_date) {
        this.created_date = created_date;
    }

    public int getPractice_duration() {
        return practice_duration;
    }

    public void setPractice_duration(int practice_duration) {
        this.practice_duration = practice_duration;
    }

    public int getCorrect_questions() {
        return correct_questions;
    }

    public void setCorrect_questions(int correct_questions) {
        this.correct_questions = correct_questions;
    }

    public int getCorrect_rate() {
        return correct_rate;
    }

    public void setCorrect_rate(int correct_rate) {
        this.correct_rate = correct_rate;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }
    
}
