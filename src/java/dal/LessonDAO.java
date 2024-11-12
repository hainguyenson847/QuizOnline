/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import model.Lesson;
import model.Lesson_Topic;
import model.Quiz;
import model.Quiz_Type;
import java.sql.*;
import model.Lesson_Type;

/**
 *
 * @author FPT SHOP
 */
public class LessonDAO extends DBContext {

    public List<Lesson_Topic> getAllLessonTopicBySubjectId(int subject_id_raw) {
        List<Lesson_Topic> list = new ArrayList<>();
        String sql = "SELECT * FROM Lesson_Topic WHERE subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int lesson_topic_id = rs.getInt("lesson_topic_id");
                String lesson_topic_name = rs.getString("lesson_topic_name");
                int subject_id = rs.getInt("subject_id");
                list.add(new Lesson_Topic(lesson_topic_id, lesson_topic_name, subject_id));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Quiz_Type> getAllQuizType() {
        List<Quiz_Type> list = new ArrayList<>();
        String sql = "SELECT * FROM Quiz_Type";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int quiz_type_id = rs.getInt("quiz_type_id");
                String quiz_type_name = rs.getString("quiz_type_name");
                list.add(new Quiz_Type(quiz_type_id, quiz_type_name));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Quiz> getAllQuizBySubjectId(int subject_id_raw) {
        List<Quiz> list = new ArrayList<>();
        String sql = "SELECT * FROM Quiz WHERE subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int quiz_id = rs.getInt("quiz_id");
                String quiz_name = rs.getString("quiz_name");
                int subject_id = rs.getInt("subject_id");
                int level_id = rs.getInt("level_id");
                int number_of_questions = rs.getInt("number_of_questions");
                float duration = rs.getFloat("duration");
                float passrate = rs.getFloat("passrate");
                int quiz_type_id = rs.getInt("quiz_type_id");
                String quiz_description = rs.getString("quiz_description");
                Timestamp created_date = rs.getTimestamp("created_date");
                Timestamp updated_date = rs.getTimestamp("updated_date");
                int account_id = rs.getInt("account_id");
                int selectedGroup = rs.getInt("selectedGroup");
                
                list.add(new Quiz(quiz_id, quiz_name, subject_id, level_id, number_of_questions, Duration.ofMillis((long) (duration * 60 * 1000)), passrate, quiz_type_id, quiz_description, created_date, updated_date, account_id, selectedGroup));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public void addLesson(Lesson lesson) {
        String sql = "INSERT INTO [dbo].[Lesson]\n"
                + "           ([lesson_name]\n"
                + "           ,[lesson_order]\n"
                + "           ,[summary]\n"
                + "           ,[status]\n"
                + "           ,[lesson_type_id]\n"
                + "           ,[subject_id]\n"
                + "           ,[lesson_topic_id]\n"
                + "           ,[video_link]\n"
                + "           ,[lesson_content]\n"
                + "           ,[quiz_id])"
                + "     VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, lesson.getLesson_name());
            st.setInt(2, lesson.getLesson_order());
            st.setString(3, lesson.getSummary());
            st.setBoolean(4, lesson.isStatus());
            st.setInt(5, lesson.getLesson_type_id());
            st.setInt(6, lesson.getSubject_id());
            st.setInt(7, lesson.getLesson_topic_id());
            st.setString(8, lesson.getVideo_link());
            st.setString(9, lesson.getLesson_content());
            st.setObject(10, lesson.getQuiz_id());

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public List<Lesson> getAllLessonBySubjectId(int subject_id_raw) {
        List<Lesson> list = new ArrayList<>();
        String sql = "SELECT * FROM Lesson WHERE subject_id = ? ORDER BY lesson_id ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int lesson_id = rs.getInt("lesson_id");
                String lesson_name = rs.getString("lesson_name");
                int lesson_order = rs.getInt("lesson_order");
                String summary = rs.getString("summary");
                boolean status = rs.getBoolean("status");
                int lesson_type_id = rs.getInt("lesson_type_id");
                int subject_id = rs.getInt("subject_id");
                int lesson_topic_id = rs.getInt("lesson_topic_id");
                String video_link = rs.getString("video_link");
                String lesson_content = rs.getString("lesson_content");
                int quiz_id = rs.getInt("quiz_id");

                list.add(new Lesson(lesson_id, lesson_name, lesson_order, summary, status, lesson_type_id, subject_id, lesson_topic_id, video_link, lesson_content, quiz_id));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Lesson_Type getLessonTypeById(int lesson_type_id_raw) {
        String sql = "SELECT * FROM Lesson_Type WHERE lesson_type_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson_type_id_raw);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int lesson_type_id = rs.getInt("lesson_type_id");
                String lesson_type_name = rs.getString("lesson_type_name");
                return new Lesson_Type(lesson_type_id, lesson_type_name);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Lesson getLessonById(int lesson_id_raw) {
        String sql = "SELECT * FROM Lesson WHERE lesson_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson_id_raw);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int lesson_id = rs.getInt("lesson_id");
                String lesson_name = rs.getString("lesson_name");
                int lesson_order = rs.getInt("lesson_order");
                String summary = rs.getString("summary");
                boolean status = rs.getBoolean("status");
                int lesson_type_id = rs.getInt("lesson_type_id");
                int subject_id = rs.getInt("subject_id");
                int lesson_topic_id = rs.getInt("lesson_topic_id");
                String video_link = rs.getString("video_link");
                String lesson_content = rs.getString("lesson_content");
                int quiz_id = rs.getInt("quiz_id");

                return new Lesson(lesson_id, lesson_name, lesson_order, summary, status, lesson_type_id, subject_id, lesson_topic_id, video_link, lesson_content, quiz_id);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void updateLesson(Lesson lesson) {
        String sql = "UPDATE [dbo].[Lesson]\n"
                + "   SET [lesson_name] = ?\n"
                + "      ,[lesson_order] = ?\n"
                + "      ,[summary] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[lesson_type_id] = ?\n"
                + "      ,[subject_id] = ?\n"
                + "      ,[lesson_topic_id] = ?\n"
                + "      ,[video_link] = ?\n"
                + "      ,[lesson_content] = ?\n"
                + "      ,[quiz_id] = ?\n"
                + " WHERE lesson_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, lesson.getLesson_name());
            st.setInt(2, lesson.getLesson_order());
            st.setString(3, lesson.getSummary());
            st.setBoolean(4, lesson.isStatus());
            st.setInt(5, lesson.getLesson_type_id());
            st.setInt(6, lesson.getSubject_id());
            st.setInt(7, lesson.getLesson_topic_id());
            st.setString(8, lesson.getVideo_link());
            st.setString(9, lesson.getLesson_content());
            st.setObject(10, lesson.getQuiz_id());
            st.setInt(11, lesson.getLesson_id());

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public Lesson_Topic getLessonTopicById(int lesson_topic_id_raw) {
        String sql = "SELECT * FROM Lesson_Topic WHERE lesson_topic_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson_topic_id_raw);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int lesson_topic_id = rs.getInt("lesson_topic_id");
                String lesson_topic_name = rs.getString("lesson_topic_name");
                int subject_id = rs.getInt("subject_id");
                return new Lesson_Topic(lesson_topic_id, lesson_topic_name, subject_id);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Lesson_Type> getLessonTypesBySubjectId(int subjectId) {
        List<Lesson_Type> lessonTypes = new ArrayList<>();
        String sql = "SELECT DISTINCT lt.* "
                + "FROM Lesson_Type lt "
                + "JOIN Lesson l ON lt.lesson_type_id = l.lesson_type_id "
                + "WHERE l.subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subjectId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int lesson_type_id = rs.getInt("lesson_type_id");
                String lesson_type_name = rs.getString("lesson_type_name");
                lessonTypes.add(new Lesson_Type(lesson_type_id, lesson_type_name));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return lessonTypes;
    }

    public List<Lesson_Topic> getLessonTopicsBySubjectId(int subjectId) {
        List<Lesson_Topic> lessonTopics = new ArrayList<>();
        String sql = "SELECT * FROM Lesson_Topic WHERE subject_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, subjectId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int lesson_topic_id = rs.getInt("lesson_topic_id");
                    String lesson_topic_name = rs.getString("lesson_topic_name");
                    lessonTopics.add(new Lesson_Topic(lesson_topic_id, lesson_topic_name, subjectId));
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return lessonTopics;
    }

    public List<Lesson> getAllLessonBySubjectId1(int subject_id_raw) {
        List<Lesson> list = new ArrayList<>();
        String sql = "SELECT l.*, lt.lesson_type_name, lt2.lesson_topic_name FROM Lesson l "
                + "INNER JOIN Lesson_Type lt ON l.lesson_type_id = lt.lesson_type_id "
                + "INNER JOIN Lesson_Topic lt2 ON l.lesson_topic_id = lt2.lesson_topic_id "
                + "WHERE l.subject_id = ? ORDER BY l.lesson_id ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int lesson_id = rs.getInt("lesson_id");
                String lesson_name = rs.getString("lesson_name");
                int lesson_order = rs.getInt("lesson_order");
                String summary = rs.getString("summary");
                boolean status = rs.getBoolean("status");
                int lesson_type_id = rs.getInt("lesson_type_id");
                String lesson_type_name = rs.getString("lesson_type_name");
                int subject_id = rs.getInt("subject_id");
                int lesson_topic_id = rs.getInt("lesson_topic_id");
                String video_link = rs.getString("video_link");
                String lesson_topic_name = rs.getString("lesson_topic_name"); // Lấy tên của lesson topic

                Lesson lesson = new Lesson(lesson_id, lesson_name, lesson_order, summary, status, lesson_type_id, subject_id, lesson_topic_id, video_link, lesson_name, subject_id);
                lesson.setLessonTypeName(lesson_type_name);
                lesson.setLessonTopicName(lesson_topic_name); // Set tên chủ đề bài học
                list.add(lesson);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public int countLessonsBySubjectId(int subject_id_raw) {
        String sql = "SELECT COUNT(*) FROM Lesson WHERE subject_id = ?";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id_raw);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1); // Lấy giá trị đếm từ cột đầu tiên
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return count;
    }

    public int countTotalLessons() {
        String sql = "SELECT COUNT(*) FROM Lesson";
        int totalCount = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt(1); // Lấy giá trị đếm từ cột đầu tiên
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return totalCount;
    }

    public Lesson getLessonByLessonId(int lessonId) {
        String sql = "SELECT l.*, lt.lesson_type_name, lt2.lesson_topic_name "
                + "FROM Lesson l "
                + "INNER JOIN Lesson_Type lt ON l.lesson_type_id = lt.lesson_type_id "
                + "INNER JOIN Lesson_Topic lt2 ON l.lesson_topic_id = lt2.lesson_topic_id "
                + "WHERE l.lesson_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessonId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int lesson_id = rs.getInt("lesson_id");
                String lesson_name = rs.getString("lesson_name");
                int lesson_order = rs.getInt("lesson_order");
                String summary = rs.getString("summary");
                boolean status = rs.getBoolean("status");
                int lesson_type_id = rs.getInt("lesson_type_id");
                String lesson_type_name = rs.getString("lesson_type_name");
                int subject_id = rs.getInt("subject_id");
                int lesson_topic_id = rs.getInt("lesson_topic_id");
                String video_link = rs.getString("video_link");
                String lesson_content = rs.getString("lesson_content");
                String lesson_topic_name = rs.getString("lesson_topic_name");

                Lesson lesson = new Lesson(lesson_id, lesson_name, lesson_order, summary, status,
                        lesson_type_id, subject_id, lesson_topic_id, video_link, lesson_content, 0);
                lesson.setLessonTypeName(lesson_type_name);
                lesson.setLessonTopicName(lesson_topic_name);
                return lesson;
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return null;
    }
    
    public void deleteLesson(int lesson_id) {
        String sql = "DELETE FROM [dbo].[Lesson]\n"
                + "      WHERE lesson_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lesson_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public static void main(String[] args) {
        LessonDAO dao = new LessonDAO();

       
    }

}
