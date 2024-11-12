/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.QuestionDAO;

/**
 *
 * @author FPT SHOP
 */
public class Question {
    private int question_id;
    private int subject_id;
    private int dimension_id;
    private int lesson_topic_id;
    private int level_id;
    private boolean status;
    private String question_content;
    private String explanation;
    private String media;

    public Question() {
    }

    
    
    public Question(int question_id, int subject_id, int dimension_id, int lesson_topic_id, int level_id, boolean status, String question_content, String explanation, String media) {
        this.question_id = question_id;
        this.subject_id = subject_id;
        this.dimension_id = dimension_id;
        this.lesson_topic_id = lesson_topic_id;
        this.level_id = level_id;
        this.status = status;
        this.question_content = question_content;
        this.explanation = explanation;
        this.media = media;
    }
    
    public Question(int subject_id, int dimension_id, int lesson_topic_id, int level_id, boolean status, String question_content, String explanation, String media) {
        this.subject_id = subject_id;
        this.dimension_id = dimension_id;
        this.lesson_topic_id = lesson_topic_id;
        this.level_id = level_id;
        this.status = status;
        this.question_content = question_content;
        this.explanation = explanation;
        this.media = media;
    }


    
    
    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public int getDimension_id() {
        return dimension_id;
    }

    public void setDimension_id(int dimension_id) {
        this.dimension_id = dimension_id;
    }

    public int getLesson_topic_id() {
        return lesson_topic_id;
    }

    public void setLesson_topic_id(int lesson_topic_id) {
        this.lesson_topic_id = lesson_topic_id;
    }

    public int getLevel_id() {
        return level_id;
    }

    public void setLevel_id(int level_id) {
        this.level_id = level_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getQuestion_content() {
        return question_content;
    }

    public void setQuestion_content(String question_content) {
        this.question_content = question_content;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }
    
    public Subject getSubject(QuestionDAO dao) {
        return dao.getSubjectById(subject_id);
    }
    
    public Level getLevel(QuestionDAO dao) {
        return dao.getLevelById(level_id);
    }

    @Override
    public String toString() {
        return "Question{" + "question_id=" + question_id + ", subject_id=" + subject_id + ", dimension_id=" + dimension_id + ", lesson_topic_id=" + lesson_topic_id + ", level_id=" + level_id + ", status=" + status + ", question_content=" + question_content + ", explanation=" + explanation + ", media=" + media + '}';
    }
    
    
}
