/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPT SHOP
 */
public class Lesson_Topic {
    private int lesson_topic_id;
    private String lesson_topic_name;
    private int subject_id;

    public Lesson_Topic() {
    }

    public Lesson_Topic(int lesson_topic_id, String lesson_topic_name, int subject_id) {
        this.lesson_topic_id = lesson_topic_id;
        this.lesson_topic_name = lesson_topic_name;
        this.subject_id = subject_id;
    }

    public int getLesson_topic_id() {
        return lesson_topic_id;
    }

    public void setLesson_topic_id(int lesson_topic_id) {
        this.lesson_topic_id = lesson_topic_id;
    }

    public String getLesson_topic_name() {
        return lesson_topic_name;
    }

    public void setLesson_topic_name(String lesson_topic_name) {
        this.lesson_topic_name = lesson_topic_name;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    @Override
    public String toString() {
        return "Lesson_Topic{" + "lesson_topic_id=" + lesson_topic_id + ", lesson_topic_name=" + lesson_topic_name + ", subject_id=" + subject_id + '}';
    }
    
    
}
