/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.QuizDAO;
import java.sql.Timestamp;
import java.time.Duration;
/**
 *
 * @author ADMIN
 */
public class Quiz {
    private int quiz_id;
    private String quiz_name;
    private int subject_id;
    private int level_id;
    private int number_of_questions;
    private Duration duration;
    private double passrate;
    private int quiz_type_id;
    private String quiz_description;
    private java.sql.Timestamp created_date;
    private java.sql.Timestamp updated_date;
    private int account_id;
    private int selectedGroup; 
    private Quiz_Type quiz_type;
    private Subject subject;

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }
    

    public Quiz_Type getQuiz_type() {
        return quiz_type;
    }

    public void setQuiz_type(Quiz_Type quiz_type) {
        this.quiz_type = quiz_type;
    }
            
    public Quiz() {
    }

    public Quiz(String quiz_name, int subject_id, int level_id, int number_of_questions, Duration duration, double passrate, int quiz_type_id, String quiz_description, Timestamp created_date, Timestamp updated_date, int account_id, int selectedGroup) {
        this.quiz_name = quiz_name;
        this.subject_id = subject_id;
        this.level_id = level_id;
        this.number_of_questions = number_of_questions;
        this.duration = duration;
        this.passrate = passrate;
        this.quiz_type_id = quiz_type_id;
        this.quiz_description = quiz_description;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.account_id = account_id;
        this.selectedGroup = selectedGroup;
    }
    
    public Quiz(String quiz_name, int subject_id, int level_id, int number_of_questions, Duration duration, double passrate, int quiz_type_id, String quiz_description, Timestamp created_date, Timestamp updated_date, int account_id) {
        this.quiz_name = quiz_name;
        this.subject_id = subject_id;
        this.level_id = level_id;
        this.number_of_questions = number_of_questions;
        this.duration = duration;
        this.passrate = passrate;
        this.quiz_type_id = quiz_type_id;
        this.quiz_description = quiz_description;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.account_id = account_id;
    }
    
    

    public Quiz(int quiz_id, String quiz_name, int subject_id, int level_id, int number_of_questions, Duration duration, double passrate, int quiz_type_id, String quiz_description, Timestamp created_date, Timestamp updated_date, int account_id, int selectedGroup) {
        this.quiz_id = quiz_id;
        this.quiz_name = quiz_name;
        this.subject_id = subject_id;
        this.level_id = level_id;
        this.number_of_questions = number_of_questions;
        this.duration = duration;
        this.passrate = passrate;
        this.quiz_type_id = quiz_type_id;
        this.quiz_description = quiz_description;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.account_id = account_id;
        this.selectedGroup = selectedGroup;
    }
    
    public Quiz(int quiz_id, String quiz_name, int subject_id, int level_id, int number_of_questions, Duration duration, double passrate, int quiz_type_id, String quiz_description, Timestamp created_date, Timestamp updated_date, int account_id) {
        this.quiz_id = quiz_id;
        this.quiz_name = quiz_name;
        this.subject_id = subject_id;
        this.level_id = level_id;
        this.number_of_questions = number_of_questions;
        this.duration = duration;
        this.passrate = passrate;
        this.quiz_type_id = quiz_type_id;
        this.quiz_description = quiz_description;
        this.created_date = created_date;
        this.updated_date = updated_date;
        this.account_id = account_id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public String getQuiz_name() {
        return quiz_name;
    }

    public void setQuiz_name(String quiz_name) {
        this.quiz_name = quiz_name;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public int getLevel_id() {
        return level_id;
    }

    public void setLevel_id(int level_id) {
        this.level_id = level_id;
    }

    public int getNumber_of_questions() {
        return number_of_questions;
    }

    public void setNumber_of_questions(int number_of_questions) {
        this.number_of_questions = number_of_questions;
    }

    public Duration getDuration() {
        return duration;
    }

    public void setDuration(Duration duration) {
        this.duration = duration;
    }

    public double getPassrate() {
        return passrate;
    }

    public void setPassrate(double passrate) {
        this.passrate = passrate;
    }

    public int getQuiz_type_id() {
        return quiz_type_id;
    }

    public void setQuiz_type_id(int quiz_type_id) {
        this.quiz_type_id = quiz_type_id;
    }

    public String getQuiz_description() {
        return quiz_description;
    }

    public void setQuiz_description(String quiz_description) {
        this.quiz_description = quiz_description;
    }

    public Timestamp getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Timestamp created_date) {
        this.created_date = created_date;
    }

    public Timestamp getUpdated_date() {
        return updated_date;
    }

    public void setUpdated_date(Timestamp updated_date) {
        this.updated_date = updated_date;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }
    
    public Subject getSubject(QuizDAO dao) {
        return dao.getSubjectById(subject_id);
    }
    
    public Level getLevel(QuizDAO dao) {
        return dao.getLevelById(level_id);
    }

    public int getSelectedGroup() {
        return selectedGroup;
    }

    public void setSelectedGroup(int selectedGroup) {
        this.selectedGroup = selectedGroup;
    }
    public long getLongDuration() {
        long minutes = duration.toMinutes();
        return minutes / 60;
    }

    @Override
    public String toString() {
        return "Quiz{" + "quiz_id=" + quiz_id + ", quiz_name=" + quiz_name + ", subject_id=" + subject_id + ", level_id=" + level_id + ", number_of_questions=" + number_of_questions + ", duration=" + duration + ", passrate=" + passrate + ", quiz_type_id=" + quiz_type_id + ", quiz_description=" + quiz_description + ", created_date=" + created_date + ", updated_date=" + updated_date + ", account_id=" + account_id + '}';
    }

    
    
}
