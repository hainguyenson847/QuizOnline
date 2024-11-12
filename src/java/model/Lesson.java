/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.LessonDAO;

/**
 *
 * @author ADMIN
 */
public class Lesson {

    private int lesson_id;
    private String lesson_name;
    private int lesson_order;
    private String summary;
    private boolean status;
    private int lesson_type_id;
    private int subject_id;
    private int lesson_topic_id;
    private String video_link;
    private String lesson_content;
    private Integer quiz_id;
    private String lessonTypeName;
    private String lessonTopicName;

    public Lesson() {
    }

    public Lesson(int lesson_id, String lesson_name, int lesson_order, String summary, boolean status, int lesson_type_id, int subject_id, int lesson_topic_id, String video_link, String lesson_content, Integer quiz_id) {
        this.lesson_id = lesson_id;
        this.lesson_name = lesson_name;
        this.lesson_order = lesson_order;
        this.summary = summary;
        this.status = status;
        this.lesson_type_id = lesson_type_id;
        this.subject_id = subject_id;
        this.lesson_topic_id = lesson_topic_id;
        this.video_link = video_link;
        this.lesson_content = lesson_content;
        this.quiz_id = quiz_id;
    }

    public Lesson(String lesson_name, int lesson_order, String summary, boolean status, int lesson_type_id, int subject_id, int lesson_topic_id, String video_link, String lesson_content, Integer quiz_id) {
        this.lesson_name = lesson_name;
        this.lesson_order = lesson_order;
        this.summary = summary;
        this.status = status;
        this.lesson_type_id = lesson_type_id;
        this.subject_id = subject_id;
        this.lesson_topic_id = lesson_topic_id;
        this.video_link = video_link;
        this.lesson_content = lesson_content;
        this.quiz_id = quiz_id;
    }

    public Lesson(int lesson_id, String lesson_name, int lesson_order, String summary, boolean status, int lesson_type_id, int subject_id, int lesson_topic_id, String video_link, String lesson_content, Integer quiz_id, String lessonTypeName, String lessonTopicName) {
        this.lesson_id = lesson_id;
        this.lesson_name = lesson_name;
        this.lesson_order = lesson_order;
        this.summary = summary;
        this.status = status;
        this.lesson_type_id = lesson_type_id;
        this.subject_id = subject_id;
        this.lesson_topic_id = lesson_topic_id;
        this.video_link = video_link;
        this.lesson_content = lesson_content;
        this.quiz_id = quiz_id;
        this.lessonTypeName = lessonTypeName;
        this.lessonTopicName = lessonTopicName;
    }
    
    public String getLessonTopicName() {
        return lessonTopicName;
    }

    public void setLessonTopicName(String lessonTopicName) {
        this.lessonTopicName = lessonTopicName;
    }
    
    public String getLessonTypeName() {
        return lessonTypeName;
    }

    public void setLessonTypeName(String lessonTypeName) {
        this.lessonTypeName = lessonTypeName;
    }

    public int getLesson_id() {
        return lesson_id;
    }

    public void setLesson_id(int lesson_id) {
        this.lesson_id = lesson_id;
    }

    public String getLesson_name() {
        return lesson_name;
    }

    public void setLesson_name(String lesson_name) {
        this.lesson_name = lesson_name;
    }

    public int getLesson_order() {
        return lesson_order;
    }

    public void setLesson_order(int lesson_order) {
        this.lesson_order = lesson_order;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getLesson_type_id() {
        return lesson_type_id;
    }

    public void setLesson_type_id(int lesson_type_id) {
        this.lesson_type_id = lesson_type_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public int getLesson_topic_id() {
        return lesson_topic_id;
    }

    public void setLesson_topic_id(int lesson_topic_id) {
        this.lesson_topic_id = lesson_topic_id;
    }

    public String getVideo_link() {
        return video_link;
    }

    public void setVideo_link(String video_link) {
        this.video_link = video_link;
    }

    public String getLesson_content() {
        return lesson_content;
    }

    public void setLesson_content(String lesson_content) {
        this.lesson_content = lesson_content;
    }

    public Integer getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(Integer quiz_id) {
        this.quiz_id = quiz_id;
    }

    public Lesson_Type getLesson_Type(LessonDAO dao) {
        return dao.getLessonTypeById(lesson_type_id);
    }
    
    @Override
    public String toString() {
        return "Lesson{" + "lesson_id=" + lesson_id + ", lesson_name=" + lesson_name + ", lesson_order=" + lesson_order + ", summary=" + summary + ", status=" + status + ", lesson_type_id=" + lesson_type_id + ", subject_id=" + subject_id + ", lesson_topic_id=" + lesson_topic_id + ", video_link=" + video_link + ", lesson_content=" + lesson_content + ", quiz_id=" + quiz_id + '}';
    }

}
