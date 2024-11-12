/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Lesson_Type {
    private int lesson_type_id;
    private String lesson_type_name;

    public Lesson_Type() {
    }

    public Lesson_Type(int lesson_type_id, String lesson_type_name) {
        this.lesson_type_id = lesson_type_id;
        this.lesson_type_name = lesson_type_name;
    }

    public int getLesson_type_id() {
        return lesson_type_id;
    }

    public void setLesson_type_id(int lesson_type_id) {
        this.lesson_type_id = lesson_type_id;
    }

    public String getLesson_type_name() {
        return lesson_type_name;
    }

    public void setLesson_type_name(String lesson_type_name) {
        this.lesson_type_name = lesson_type_name;
    }

    @Override
    public String toString() {
        return "Lesson_Type{" + "lesson_type_id=" + lesson_type_id + ", lesson_type_name=" + lesson_type_name + '}';
    }
    
}
