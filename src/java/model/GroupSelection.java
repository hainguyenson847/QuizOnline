/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPT SHOP
 */
public class GroupSelection {
    private int NumberOfQuestions;
    private int type_id;
    private String lesson_topic_name;

    public GroupSelection(int NumberOfQuestions, int type_id, String lesson_topic_name) {
        this.NumberOfQuestions = NumberOfQuestions;
        this.type_id = type_id;
        this.lesson_topic_name = lesson_topic_name;
    }

    public int getNumberOfQuestions() {
        return NumberOfQuestions;
    }

    public void setNumberOfQuestions(int NumberOfQuestions) {
        this.NumberOfQuestions = NumberOfQuestions;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getLesson_topic_name() {
        return lesson_topic_name;
    }

    public void setLesson_topic_name(String lesson_topic_name) {
        this.lesson_topic_name = lesson_topic_name;
    }

    @Override
    public String toString() {
        return "GroupSelection{" + "NumberOfQuestions=" + NumberOfQuestions + ", type_id=" + type_id + ", lesson_topic_name=" + lesson_topic_name + '}';
    }

    
    
    
}
