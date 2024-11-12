/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author DELL-PC
 */
public class Question_Handle extends Question{
    private int practice_id;
    private List<Answer> list_answer;
    private Dimension dimension;
    private DimensionType dimension_type;
    private Subject subject;
    private int correct_answer;
    private boolean is_mark;
    private String answered;

    public Question_Handle(int practice_id, boolean is_mark, String answered) {
        this.practice_id = practice_id;
        this.is_mark = is_mark;
        this.answered = answered;
    }
    

    
    public int getPractice_id() {
        return practice_id;
    }

    public void setPractice_id(int practice_id) {
        this.practice_id = practice_id;
    }

    
    public String getAnswered() {
        return answered;
    }

    public void setAnswered(String answered) {
        this.answered = answered;
    }

    public boolean isIs_mark() {
        return is_mark;
    }

    public void setIs_mark(boolean is_mark) {
        this.is_mark = is_mark;
    }

    public int getCorrect_answer() {
        return correct_answer;
    }

    public void setCorrect_answer(int correct_answer) {
        this.correct_answer = correct_answer;
    }
    

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public Dimension getDimension() {
        return dimension;
    }

    public void setDimension(Dimension dimension) {
        this.dimension = dimension;
    }

    public DimensionType getDimension_type() {
        return dimension_type;
    }

    public void setDimension_type(DimensionType dimension_type) {
        this.dimension_type = dimension_type;
    }
    

    public Question_Handle(List<Answer> list_answer) {
        this.list_answer = list_answer;
    }

    public Question_Handle(List<Answer> list_answer, int question_id, int subject_id, int dimension_id, int lesson_topic_id, int level_id, boolean status, String question_content, String explanation, String media) {
        super(question_id, subject_id, dimension_id, lesson_topic_id, level_id, status, question_content, explanation, media);
        this.list_answer = list_answer;
    }

    public Question_Handle(List<Answer> list_answer, int subject_id, int dimension_id, int lesson_topic_id, int level_id, boolean status, String question_content, String explanation, String media) {
        super(subject_id, dimension_id, lesson_topic_id, level_id, status, question_content, explanation, media);
        this.list_answer = list_answer;
    }

    public List<Answer> getList_answer() {
        return list_answer;
    }

    public void setList_answer(List<Answer> list_answer) {
        this.list_answer = list_answer;
    }

    @Override
    public String toString() {
        return "Question_Handle{" + "list_answer=" + list_answer + '}';
    }
    
    
    
}
