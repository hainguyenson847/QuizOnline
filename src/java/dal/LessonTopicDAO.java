/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import model.Lesson_Topic;

/**
 *
 * @author ADMIN
 */
public class LessonTopicDAO extends DBContext {
     public void addLessonTopic(Lesson_Topic lessonTopic) {
        String sql = "INSERT INTO [dbo].[Lesson_Topic](lesson_topic_name, subject_id) VALUES(?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, lessonTopic.getLesson_topic_name());
            st.setInt(2, lessonTopic.getSubject_id());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
}