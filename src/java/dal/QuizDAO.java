/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Dimension;
import model.Lesson_Topic;
import model.Level;
import model.Quiz;
import model.Quiz_Type;
import model.Subject;
import java.sql.*;
import java.time.Duration;
import java.time.LocalDateTime;
import model.GroupSelection;
import model.Practice_Record;
import model.Question;
import model.Quiz_Question;

/**
 *
 * @author FPT SHOP
 */
public class QuizDAO extends DBContext {

    public List<Subject> getAllSubject() {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT * FROM Subject";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                int category_id = rs.getInt("category_id");
                boolean status = rs.getBoolean("status");
                boolean isFeatured = rs.getBoolean("isFeatured");
                String thumbnail = rs.getString("thumbnail");
                String tagline = rs.getString("tagline");
                String description = rs.getString("description");
                int account_id = rs.getInt("account_id");
                java.sql.Timestamp created_date = rs.getTimestamp("created_date");
                Subject subject = new Subject(subject_id, subject_name, category_id, status, isFeatured, thumbnail, tagline, description, account_id, created_date);
                list.add(subject);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Level> getAllLevel() {
        List<Level> list = new ArrayList<>();
        String sql = "SELECT * FROM Level";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int level_id = rs.getInt("level_id");
                String level_name = rs.getString("level_name");
                list.add(new Level(level_id, level_name));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Subject getSubjectById(int id) {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT * FROM Subject WHERE subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int subject_id = rs.getInt("subject_id");
                String subject_name = rs.getString("subject_name");
                int category_id = rs.getInt("category_id");
                boolean status = rs.getBoolean("status");
                boolean isFeatured = rs.getBoolean("isFeatured");
                String thumbnail = rs.getString("thumbnail");
                String tagline = rs.getString("tagline");
                String description = rs.getString("description");
                int account_id = rs.getInt("account_id");
                java.sql.Timestamp created_date = rs.getTimestamp("created_date");
                Subject subject = new Subject(subject_id, subject_name, category_id, status, isFeatured, thumbnail, tagline, description, account_id, created_date);
                return subject;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Level getLevelById(int level_id_raw) {
        String sql = "SELECT * FROM Level WHERE level_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, level_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int level_id = rs.getInt("level_id");
                String level_name = rs.getString("level_name");
                return new Level(level_id, level_name);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Account getAccountById(String accountId) {
        String sql = "SELECT account_id, full_name, gender, email, mobile, password, avatar, role_id "
                + "FROM Account WHERE account_id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            // Set the account ID parameter
            pstmt.setString(1, accountId);

            // Execute the query
            ResultSet rs = pstmt.executeQuery();

            // If a record is found, map it to the Account object
            if (rs.next()) {
                Account account = new Account();
                account.setFirst_name(rs.getString("first_name"));
                account.setLast_name(rs.getString("last_name"));
                account.setGender(rs.getInt("gender") == 1); // Assuming gender is stored as a boolean
                account.setEmail(rs.getString("email"));
                account.setMobile(rs.getString("mobile"));
                account.setPassword(rs.getString("password"));
                account.setAvatar(rs.getString("avatar"));

                account.setRole_id(rs.getInt("role_id"));

                return account;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
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
                list.add(new Quiz_Type(quiz_type_id, quiz_type_name));;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public Quiz_Type getQuizType(int quiz_typeid) {
        String sql = "SELECT * FROM Quiz_Type where quiz_type_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quiz_typeid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int quiz_type_id = rs.getInt("quiz_type_id");
                String quiz_type_name = rs.getString("quiz_type_name");
                return new Quiz_Type(quiz_type_id, quiz_type_name);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

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

    public List<Dimension> getAllDimensionByType(int dimension_type_id_raw, int subject_id_raw) {
        List<Dimension> list = new ArrayList<>();
        String sql = "SELECT dimension_id, dimension_name, Dimension.dimension_type_id, subject_id\n"
                + "                FROM Dimension\n"
                + "                JOIN Dimension_Type\n"
                + "                ON Dimension_Type.dimension_type_id = Dimension.dimension_type_id\n"
                + "                WHERE Dimension_Type.dimension_type_id = ? AND subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, dimension_type_id_raw);
            st.setInt(2, subject_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int dimension_id = rs.getInt("dimension_id");
                String dimension_name = rs.getString("dimension_name");
                int dimension_type_id = rs.getInt("dimension_type_id");
                int subject_id = rs.getInt("subject_id");
                list.add(new Dimension(dimension_id, dimension_name, dimension_type_id, subject_id));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Dimension> getAllDimensionBySubjectId(int subject_id_raw) {
        List<Dimension> list = new ArrayList<>();
        String sql = "SELECT dimension_id, dimension_name, Dimension.dimension_type_id, subject_id\n"
                + "                FROM Dimension\n"
                + "                JOIN Dimension_Type\n"
                + "                ON Dimension_Type.dimension_type_id = Dimension.dimension_type_id\n"
                + "                WHERE subject_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int dimension_id = rs.getInt("dimension_id");
                String dimension_name = rs.getString("dimension_name");
                int dimension_type_id = rs.getInt("dimension_type_id");
                int subject_id = rs.getInt("subject_id");
                list.add(new Dimension(dimension_id, dimension_name, dimension_type_id, subject_id));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public int countFinishedQuiz(Account a) {
        String sql = "select COUNT(*) as countQuiz from Practice_Record\n"
                + "where account_id = ?";
        int count = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, a.getAccount_id());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("countQuiz");
            }
        } catch (Exception e) {
        }
        return count;
    }

    public void addQuiz(Quiz quiz) {
        String sql = "INSERT INTO [dbo].[Quiz]\n"
                + "           ([quiz_name]\n"
                + "           ,[subject_id]\n"
                + "           ,[level_id]\n"
                + "           ,[number_of_questions]\n"
                + "           ,[duration]\n"
                + "           ,[passrate]\n"
                + "           ,[quiz_type_id]\n"
                + "           ,[quiz_description]\n"
                + "           ,[created_date]\n"
                + "           ,[updated_date]\n"
                + "           ,[account_id]\n"
                + "           ,[selectedGroup])\n"
                + "     VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, quiz.getQuiz_name());
            st.setInt(2, quiz.getSubject_id());
            st.setInt(3, quiz.getLevel_id());
            st.setInt(4, quiz.getNumber_of_questions());
            Duration duration = quiz.getDuration();
            long minutes = duration.toMinutes();
            st.setFloat(5, (float) minutes);
            st.setDouble(6, quiz.getPassrate());
            st.setInt(7, quiz.getQuiz_type_id());
            st.setString(8, quiz.getQuiz_description());
            st.setTimestamp(9, quiz.getCreated_date());
            st.setTimestamp(10, quiz.getUpdated_date());
            st.setInt(11, quiz.getAccount_id());
            st.setInt(12, quiz.getSelectedGroup());

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    
    public void addQuizQuestion(Quiz_Question quiz_question) {
        String sql = "INSERT INTO [dbo].[Quiz_Question]\n"
                + "           ([quiz_id]\n"
                + "           ,[question_id])\n"
                + "     VALUES(?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, quiz_question.getQuiz_id());
            st.setInt(2, quiz_question.getQuestion_id());

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int getNumberOfQuestionBySubjectAndLessonTopic(int subject_id, int lesson_topic_id, int level_id) {
        String sql = "SELECT COUNT(question_id) AS result FROM Question WHERE subject_id = ? AND lesson_topic_id = ? AND level_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id);
            st.setInt(2, lesson_topic_id);
            st.setInt(3, level_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("result");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public int getNumberOfQuestionBySubjectAndDimensionId(int subject_id, int dimension_id, int level_id) {
        String sql = "SELECT COUNT(question_id) AS result FROM Question WHERE subject_id = ? AND dimension_id = ? AND level_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id);
            st.setInt(2, dimension_id);
            st.setInt(3, level_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("result");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
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

    public Dimension getDimensionById(int dimension_id_raw) {
        String sql = "SELECT * FROM Dimension WHERE dimension_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, dimension_id_raw);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int dimension_id = rs.getInt("dimension_id");
                String dimension_name = rs.getString("dimension_name");
                int dimension_type_id = rs.getInt("dimension_type_id");
                int subject_id = rs.getInt("subject_id");
                return new Dimension(dimension_id, dimension_name, dimension_type_id, subject_id);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Question> getAllSelectQuestionByTopic(int subject_id_raw, int lesson_topic_id_raw, int number_of_questions_raw, int level_id_raw) {
        List<Question> list = new ArrayList<>();
        String sql = "SELECT TOP " + number_of_questions_raw + " * from Question where subject_id = ? and lesson_topic_id = ? and level_id = ?\n"
                + "ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id_raw);
            st.setInt(2, lesson_topic_id_raw);
            st.setInt(3, level_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int question_id = rs.getInt("question_id");
                int subject_id = rs.getInt("subject_id");
                int dimension_id = rs.getInt("dimension_id");
                int lesson_topic_id = rs.getInt("lesson_topic_id");
                int level_id = rs.getInt("level_id");
                boolean status = rs.getBoolean("status");
                String question_content = rs.getString("question_content");
                String explanation = rs.getString("explanation");
                String media = rs.getString("media");

                Question question = new Question(question_id, subject_id, dimension_id, lesson_topic_id, level_id, status, question_content, explanation, media);
                list.add(question);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Question> getAllSelectQuestionByDimension(int subject_id_raw, int dimension_id_raw, int number_of_questions_raw, int level_id_raw) {
        List<Question> list = new ArrayList<>();
        String sql = "SELECT TOP " + number_of_questions_raw + " * from Question where subject_id = ? and dimension_id = ? AND level_id = ?\n"
                + "ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id_raw);
            st.setInt(2, dimension_id_raw);
            st.setInt(3, level_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int question_id = rs.getInt("question_id");
                int subject_id = rs.getInt("subject_id");
                int dimension_id = rs.getInt("dimension_id");
                int lesson_topic_id = rs.getInt("lesson_topic_id");
                int level_id = rs.getInt("level_id");
                boolean status = rs.getBoolean("status");
                String question_content = rs.getString("question_content");
                String explanation = rs.getString("explanation");
                String media = rs.getString("media");

                Question question = new Question(question_id, subject_id, dimension_id, lesson_topic_id, level_id, status, question_content, explanation, media);
                list.add(question);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Quiz> getAllQuiz() {
        List<Quiz> list = new ArrayList<>();
        String sql = "SELECT * FROM Quiz";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
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

    public Quiz getQuiz(int quizId) {
        String sql = "SELECT * FROM Quiz where quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quizId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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

                return new Quiz(quiz_id, quiz_name, subject_id, level_id, number_of_questions, Duration.ofMillis((long) (duration * 60 * 1000)), passrate, quiz_type_id, quiz_description, created_date, updated_date, account_id, selectedGroup);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Quiz getQuiz_OldVersion(int quizId) {
        String sql = "SELECT * FROM Quiz where quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quizId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
                SubjectDAO sd = new SubjectDAO();
                Subject sub = sd.getSubjectByID(subject_id);
                Quiz nq = new Quiz(quiz_id, quiz_name, subject_id, level_id, number_of_questions, Duration.ofMillis((long) (duration * 60 * 1000)), passrate, quiz_type_id, quiz_description, created_date, updated_date, account_id);
                nq.setQuiz_type(getQuizType(quiz_type_id));
                nq.setSubject(sub);
                return nq;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public Quiz getNewlyAddedQuiz() {
        String sql = "SELECT top 1 * FROM Quiz ORDER BY quiz_id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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

                return new Quiz(quiz_id, quiz_name, subject_id, level_id, number_of_questions, Duration.ZERO, passrate, quiz_type_id, quiz_description, created_date, updated_date, account_id, selectedGroup);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    public Quiz getNewlyAddedQuizByAccountId(int acount_id) {
        String sql = "SELECT top 1 * FROM Quiz where account_id = ? ORDER BY quiz_id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, acount_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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

                return new Quiz(quiz_id, quiz_name, subject_id, level_id, number_of_questions, Duration.ZERO, passrate, quiz_type_id, quiz_description, created_date, updated_date, account_id, selectedGroup);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public int getNumberOfQuestion(int quizId) {
        String sql = "select number_of_questions from Quiz where quiz_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("number_of_questions");
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public float getPassRate(int quizId) {
        String sql = "select passrate from Quiz where quiz_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quizId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getFloat("passrate");
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getDuration(int quiz_id) {
        String sql = "select duration from Quiz where quiz_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quiz_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("duration");
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public void addPracticeRecord(Practice_Record pr) {
        String sql = "INSERT INTO [dbo].[Practice_Record]\n"
                + "           ([practice_name]\n"
                + "           ,[created_date]\n"
                + "           ,[practice_duration]\n"
                + "           ,[correct_questions]\n"
                + "           ,[correct_rate]\n"
                + "           ,[account_id]\n"
                + "           ,[quiz_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pr.getPractice_name());
            ps.setTimestamp(2, pr.getCreated_date());
            ps.setInt(3, 0);
            ps.setInt(4, 0);
            ps.setInt(5, 0);
            ps.setInt(6, pr.getAccount_id());
            ps.setInt(7, pr.getQuiz_id());
            ps.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public void updatePracticeRecord(Practice_Record pr) {
        // Câu lệnh SQL UPDATE
        String sql = "UPDATE [dbo].[Practice_Record] \n"
                + "SET [practice_name] = ?, \n"
                + "    [created_date] = ?, \n"
                + "    [practice_duration] = ?, \n"
                + "    [correct_questions] = ?, \n"
                + "    [correct_rate] = ?, \n"
                + "    [account_id] = ?, \n"
                + "    [quiz_id] = ? \n"
                + "WHERE [practice_id] = ?";

        try {
            // Chuẩn bị PreparedStatement
            PreparedStatement ps = connection.prepareStatement(sql);

            // Đặt giá trị cho các tham số
            ps.setString(1, pr.getPractice_name());
            ps.setTimestamp(2, pr.getCreated_date()); // Sử dụng setTimestamp cho cột kiểu datetime
            ps.setInt(3, pr.getPractice_duration());
            ps.setInt(4, pr.getCorrect_questions());
            ps.setDouble(5, pr.getCorrect_rate()); // Nếu correct_rate là kiểu số thực (float, double)
            ps.setInt(6, pr.getAccount_id());
            ps.setInt(7, pr.getQuiz_id());
            ps.setInt(8, pr.getPractice_id()); // Điều kiện WHERE với practice_id

            // Thực thi câu lệnh
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi nếu có vấn đề
        }
    }

    public Practice_Record getPracticeRecord(int practice_id) {
        String sql = "select practice_id\n"
                + "  , practice_name\n"
                + "  , created_date\n"
                + "  , practice_duration \n"
                + "  , correct_questions\n"
                + "  , correct_rate\n"
                + "  , account_id\n"
                + "  , quiz_id\n"
                + "  from Practice_Record\n"
                + "  where practice_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, practice_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Practice_Record pr = new Practice_Record();
                pr.setAccount_id(rs.getInt("account_id"));
                pr.setCorrect_questions(rs.getInt("correct_questions"));
                pr.setCorrect_rate(rs.getInt("correct_rate"));
                pr.setCreated_date(rs.getTimestamp("created_date"));
                pr.setPractice_id(rs.getInt("practice_id"));
                pr.setPractice_duration(rs.getInt("practice_duration"));
                pr.setPractice_name(rs.getString("practice_name"));
                pr.setQuiz_id(rs.getInt("quiz_id"));

                return pr;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Practice_Record> getPracticeRecordListByAccountId(int account_id) {
        String sql = "select practice_id\n"
                + "  , practice_name\n"
                + "  , created_date\n"
                + "  , practice_duration \n"
                + "  , correct_questions\n"
                + "  , correct_rate\n"
                + "  , account_id\n"
                + "  , quiz_id\n"
                + "  from Practice_Record\n"
                + "  where account_id = ?\n"
                + "  order by created_date desc";
        List<Practice_Record> listPrac = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, account_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Practice_Record pr = new Practice_Record();
                pr.setAccount_id(rs.getInt("account_id"));
                pr.setCorrect_questions(rs.getInt("correct_questions"));
                pr.setCorrect_rate(rs.getInt("correct_rate"));
                pr.setCreated_date(rs.getTimestamp("created_date"));
                pr.setPractice_id(rs.getInt("practice_id"));
                pr.setPractice_duration(rs.getInt("practice_duration"));
                pr.setPractice_name(rs.getString("practice_name"));
                pr.setQuiz_id(rs.getInt("quiz_id"));
                pr.setQuiz(getQuiz_OldVersion(rs.getInt("quiz_id")));

                listPrac.add(pr);
            }
        } catch (SQLException e) {

        }

        return listPrac;
    }

    public List<Practice_Record> getPracticeRecordListByAccountIdOrder(int account_id, String o) {
        String sql = "select practice_id\n"
                + "  , practice_name\n"
                + "  , created_date\n"
                + "  , practice_duration \n"
                + "  , correct_questions\n"
                + "  , correct_rate\n"
                + "  , account_id\n"
                + "  , quiz_id\n"
                + "  from Practice_Record\n"
                + "  where account_id = ?\n";
        if (o.equalsIgnoreCase("correct")) {
            sql += "  order by correct_rate desc";
        } else if (o.equalsIgnoreCase("duration")) {
            sql += "  order by practice_duration desc";
        }
        List<Practice_Record> listPrac = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, account_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Practice_Record pr = new Practice_Record();
                pr.setAccount_id(rs.getInt("account_id"));
                pr.setCorrect_questions(rs.getInt("correct_questions"));
                pr.setCorrect_rate(rs.getInt("correct_rate"));
                pr.setCreated_date(rs.getTimestamp("created_date"));
                pr.setPractice_id(rs.getInt("practice_id"));
                pr.setPractice_duration(rs.getInt("practice_duration"));
                pr.setPractice_name(rs.getString("practice_name"));
                pr.setQuiz_id(rs.getInt("quiz_id"));
                pr.setQuiz(getQuiz_OldVersion(rs.getInt("quiz_id")));

                listPrac.add(pr);
            }
        } catch (SQLException e) {

        }

        return listPrac;
    }

    public List<Practice_Record> getPracticeRecordListByAccountIdAndSubject(int account_id, int subject_id) {
        String sql = "select pr.practice_id, pr.practice_name, pr.created_date, pr.practice_duration, pr.correct_questions, pr.correct_rate, pr.account_id, pr.quiz_id\n"
                + "from Practice_Record pr join Quiz q on pr.quiz_id = q.quiz_id\n"
                + "join Subject s on s.subject_id = q.subject_id\n"
                + "where s.subject_id = ? and pr.account_id = ?";

        List<Practice_Record> listPrac = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subject_id);
            ps.setInt(2, account_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Practice_Record pr = new Practice_Record();
                pr.setAccount_id(rs.getInt("account_id"));
                pr.setCorrect_questions(rs.getInt("correct_questions"));
                pr.setCorrect_rate(rs.getInt("correct_rate"));
                pr.setCreated_date(rs.getTimestamp("created_date"));
                pr.setPractice_id(rs.getInt("practice_id"));
                pr.setPractice_duration(rs.getInt("practice_duration"));
                pr.setPractice_name(rs.getString("practice_name"));
                pr.setQuiz_id(rs.getInt("quiz_id"));
                pr.setQuiz(getQuiz_OldVersion(rs.getInt("quiz_id")));

                listPrac.add(pr);
            }
        } catch (SQLException e) {

        }

        return listPrac;
    }

//    String sql = "SELECT * FROM Subject WHERE subject_name LIKE ? OR description LIKE ?";
//
//        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
//            String searchKeyword = "%" + keyword + "%";
//            pstmt.setString(1, searchKeyword);
//            pstmt.setString(2, searchKeyword);
    public List<Practice_Record> getPracticeRecordListByAccountIdAndKey(int account_id, String key) {
        String sql = "select practice_id\n"
                + "  , practice_name\n"
                + "  , created_date\n"
                + "  , practice_duration \n"
                + "  , correct_questions\n"
                + "  , correct_rate\n"
                + "  , account_id\n"
                + "  , quiz_id\n"
                + "  from Practice_Record\n"
                + "  where account_id = ? and practice_name like ?\n"
                + "  order by created_date desc";
        List<Practice_Record> listPrac = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, account_id);
            String searchKeyword = "%" + key + "%";
            ps.setString(2, searchKeyword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Practice_Record pr = new Practice_Record();
                pr.setAccount_id(rs.getInt("account_id"));
                pr.setCorrect_questions(rs.getInt("correct_questions"));
                pr.setCorrect_rate(rs.getInt("correct_rate"));
                pr.setCreated_date(rs.getTimestamp("created_date"));
                pr.setPractice_id(rs.getInt("practice_id"));
                pr.setPractice_duration(rs.getInt("practice_duration"));
                pr.setPractice_name(rs.getString("practice_name"));
                pr.setQuiz_id(rs.getInt("quiz_id"));
                pr.setQuiz(getQuiz_OldVersion(rs.getInt("quiz_id")));

                listPrac.add(pr);
            }
        } catch (SQLException e) {

        }

        return listPrac;
    }

    public Duration getTotalDurationBySubjectId(int subjectId) {
        String sql = "SELECT SUM(duration) AS totalDuration FROM Quiz WHERE subject_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subjectId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                float totalDurationInMinutes = rs.getFloat("totalDuration");
                return Duration.ofMinutes((long) totalDurationInMinutes);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return Duration.ZERO;
    }

    public int searchNewlyPractice(int account_id) {
        String sql = "select top 1 practice_id from Practice_Record where account_id = ? order by practice_id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, account_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("practice_id");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getQuizCount() {
        String sql = "SELECT COUNT(*) FROM Quiz";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);  // Lấy giá trị đếm từ cột đầu tiên
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return count;
    }

    public List<GroupSelection> getSelectedGroupTopic(int quiz_id) {
        List<GroupSelection> list = new ArrayList<>();
        String sql = "SELECT COUNT(Lesson_Topic.lesson_topic_id) as NumberOfQuestions, Lesson_Topic.lesson_topic_id, Lesson_Topic.lesson_topic_name from Quiz_Question JOIN Question ON Quiz_Question.question_id = Question.question_id JOIN Lesson_Topic ON Question.lesson_topic_id = Lesson_Topic.lesson_topic_id WHERE quiz_id = ?\n"
                + "GROUP BY Lesson_Topic.lesson_topic_id, Lesson_Topic.lesson_topic_name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quiz_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int NumberOfQuestions = rs.getInt("NumberOfQuestions");
                int type_id = rs.getInt("lesson_topic_id");
                String lesson_topic_name = rs.getString("lesson_topic_name");
                list.add(new GroupSelection(NumberOfQuestions, type_id, lesson_topic_name));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<GroupSelection> getSelectedGroupDimension(int quiz_id) {
        List<GroupSelection> list = new ArrayList<>();
        String sql = "SELECT COUNT(Dimension.dimension_id) AS NumberOfQuestions, Dimension.dimension_id, Dimension.dimension_name FROM Quiz_Question JOIN Question ON Quiz_Question.question_id = Question.question_id JOIN Dimension ON Dimension.dimension_id = Question.dimension_id WHERE quiz_id = ?\n"
                + "group by Dimension.dimension_id, Dimension.dimension_name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quiz_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int NumberOfQuestions = rs.getInt("NumberOfQuestions");
                int type_id = rs.getInt("dimension_id");
                String lesson_topic_name = rs.getString("dimension_name");
                list.add(new GroupSelection(NumberOfQuestions, type_id, lesson_topic_name));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public int getTotalQuizzesBySubjectId(int subject_id) {
        String sql = "SELECT COUNT(*) FROM Quiz WHERE subject_id = ?";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, subject_id); // Thiết lập tham số subject_id
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);  // Lấy giá trị đếm từ cột đầu tiên
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return count;
    }

    public void updateQuiz(Quiz quiz) {
        String sql = "UPDATE [dbo].[Quiz]\n"
                + "   SET [quiz_name] = ?\n"
                + "      ,[subject_id] = ?\n"
                + "      ,[level_id] = ?\n"
                + "      ,[number_of_questions] = ?\n"
                + "      ,[duration] = ?\n"
                + "      ,[passrate] = ?\n"
                + "      ,[quiz_type_id] = ?\n"
                + "      ,[quiz_description] = ?\n"
                + "      ,[created_date] = ?\n"
                + "      ,[updated_date] = ?\n"
                + "      ,[account_id] = ?\n"
                + "      ,[selectedGroup] = ?\n"
                + " WHERE quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, quiz.getQuiz_name());
            st.setInt(2, quiz.getSubject_id());
            st.setInt(3, quiz.getLevel_id());
            st.setInt(4, quiz.getNumber_of_questions());
            Duration duration = quiz.getDuration();
            long minutes = duration.toMinutes();
            st.setFloat(5, (float) minutes);
            st.setDouble(6, quiz.getPassrate());
            st.setInt(7, quiz.getQuiz_type_id());
            st.setString(8, quiz.getQuiz_description());
            st.setTimestamp(9, quiz.getCreated_date());
            st.setTimestamp(10, quiz.getUpdated_date());
            st.setInt(11, quiz.getAccount_id());
            st.setInt(12, quiz.getSelectedGroup());
            st.setInt(13, quiz.getQuiz_id());

            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteQuiz_Question(int quiz_id) {
        String sql = "DELETE FROM [dbo].[Quiz_Question]\n"
                + "      WHERE quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quiz_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteQuiz(int quiz_id) {
        String sql = "DELETE FROM [dbo].[Quiz]\n"
                + "      WHERE quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quiz_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int countLessonByQuizId(int quiz_id) {
        String sql = "SELECT COUNT(Quiz.quiz_id) AS result FROM Quiz JOIN Lesson ON Quiz.quiz_id = Lesson.quiz_id WHERE Quiz.quiz_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quiz_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("result");
                return count;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
    }

    public static void main(String[] args) {
        QuizDAO dao = new QuizDAO();
        List<Practice_Record> l = dao.getPracticeRecordListByAccountIdAndSubject(6, 4);
        System.out.println(l);
    }
}
