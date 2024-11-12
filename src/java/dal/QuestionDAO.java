/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Question;
import java.sql.*;
import java.util.Comparator;
import model.Answer;
import model.Dimension;
import model.DimensionType;
import model.Lesson_Topic;
import model.Level;
import model.Question_Handle;
import model.Quiz_Question;
import model.Subject;

/**
 *
 * @author FPT SHOP
 */
public class QuestionDAO extends DBContext {

    public List<Question> getAllQuestion() {
        List<Question> list = new ArrayList<>();
        String sql = "SELECT * FROM Question";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
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

    public List<Dimension> getAllDimension() {
        List<Dimension> list = new ArrayList<>();
        String sql = "SELECT * FROM Dimension";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
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

    public List<Dimension> getAllDimensionBySubjectId(int subject_id_raw) {
        List<Dimension> list = new ArrayList<>();
        String sql = "SELECT * FROM Dimension WHERE subject_id = ?";
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

    public void addQuestion(Question question) {
        String sql = "INSERT INTO [dbo].[Question] "
                + "([subject_id], [dimension_id], [lesson_topic_id], [level_id], [status], [question_content], [explanation], [media]) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, question.getSubject_id());
            st.setInt(2, question.getDimension_id());
            st.setInt(3, question.getLesson_topic_id());
            st.setInt(4, question.getLevel_id());
            st.setBoolean(5, question.isStatus());
            st.setString(6, question.getQuestion_content());
            st.setString(7, question.getExplanation());
            st.setString(8, question.getMedia());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void addAnswer(Answer answer) {
        String sql = "INSERT INTO [dbo].[Answer]\n"
                + "           ([answer_detail]\n"
                + "           ,[isCorrect]\n"
                + "           ,[question_id])\n"
                + "     VALUES(?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, answer.getAnswer_detail());
            st.setBoolean(2, answer.isIsCorrect());
            st.setInt(3, answer.getQuestion_id());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public Question getLastQuestion() {
        String sql = "SELECT TOP 1 * FROM Question ORDER BY question_id DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
                return question;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void addMutipleAnswers(Answer[] answers) {
        for (int i = 0; i < answers.length; i++) {
            this.addAnswer(answers[i]);
        }
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

    public List<Question_Handle> getAllQuestionByQuizId(int quiz_id, int num_quest) {
        List<Question_Handle> list = new ArrayList<>();
        DimensionDAO dd = new DimensionDAO();
        SubjectDAO sd = new SubjectDAO();
        String sql = "SELECT TOP (?) \n"
                + "    qe.question_id, \n"
                + "    qe.subject_id, \n"
                + "    qe.dimension_id, \n"
                + "    qe.lesson_topic_id, \n"
                + "    qe.level_id, \n"
                + "    qe.status, \n"
                + "    qe.question_content, \n"
                + "    qe.explanation, \n"
                + "    qe.media \n"
                + "FROM \n"
                + "    Quiz qz\n"
                + "JOIN \n"
                + "    Quiz_Question qq on qq.quiz_id = qz.quiz_id\n"
                + "Join\n"
                + "	Question qe on qe.question_id = qq.question_id\n"
                + "WHERE \n"
                + "    qz.quiz_id = ?\n"
                + "ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, num_quest);
            st.setInt(2, quiz_id);
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
                List<Answer> listAnswer = getAnswerOfQuestion(question_id);

                Question_Handle question = new Question_Handle(listAnswer, question_id, subject_id, dimension_id, lesson_topic_id, level_id, status, question_content, explanation, media);
                Dimension dimension = dd.getDimensionById(dimension_id);
                DimensionType dimension_type = dd.getType(dimension.getDimension_type_id());
                Subject subject = sd.getSubjectByID(subject_id);
                question.setDimension(dimension);
                question.setDimension_type(dimension_type);
                question.setSubject(subject);
                for (int i = 0; i < listAnswer.size(); i++) {
                    if (listAnswer.get(i).isIsCorrect()) {
                        question.setCorrect_answer(i);
                    }
                }
                list.add(question);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
//        list.sort(new Comparator() {
//            @Override
//            public int compare(Object o1, Object o2) {
//                Question_Handle qh1 = (Question_Handle) o1;
//                Question_Handle qh2 = (Question_Handle) o2;
//                return qh1.getQuestion_id() - qh2.getQuestion_id();
//            }
//        }
//        );
        Comparator<Question_Handle> cqh = new Comparator<Question_Handle>() {
            @Override
            public int compare(Question_Handle o1, Question_Handle o2) {
                return o1.getQuestion_id() - o2.getQuestion_id();
            }
        };
        list.sort(cqh);
        return list;
    }

    public List<Question_Handle> getAllQuestionByPracticeId(int practice_id) {
        List<Question_Handle> list = new ArrayList<>();
        DimensionDAO dd = new DimensionDAO();
        SubjectDAO sd = new SubjectDAO();
        String sql = "  select qr.practice_id, qr.question_id, qr.is_marked, qr.answered, qe.subject_id, \n"
                + "    qe.dimension_id, \n"
                + "    qe.lesson_topic_id, \n"
                + "    qe.level_id, \n"
                + "    qe.status, \n"
                + "    qe.question_content, \n"
                + "    qe.explanation, \n"
                + "    qe.media \n"
                + "  from Question_Record qr join Question qe on qe.question_id = qr.question_id\n"
                + "  where qr.practice_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, practice_id);
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
                List<Answer> listAnswer = getAnswerOfQuestion(question_id);

                Question_Handle question = new Question_Handle(listAnswer, question_id, subject_id, dimension_id, lesson_topic_id, level_id, status, question_content, explanation, media);
                Dimension dimension = dd.getDimensionById(dimension_id);
                DimensionType dimension_type = dd.getType(dimension.getDimension_type_id());
                Subject subject = sd.getSubjectByID(subject_id);
                question.setDimension(dimension);
                question.setDimension_type(dimension_type);
                question.setSubject(subject);
                question.setAnswered(rs.getString("answered"));
                question.setIs_mark(rs.getInt("is_marked") == 1);
                question.setPractice_id(rs.getInt("practice_id"));
                for (int i = 0; i < listAnswer.size(); i++) {
                    if (listAnswer.get(i).isIsCorrect()) {
                        question.setCorrect_answer(i);
                    }
                }
                list.add(question);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Answer> getAnswerOfQuestion(int quest_id) {
        String sql = "select answer_id, answer_detail, isCorrect, a.question_id from Question qe\n"
                + "join Answer a on qe.question_id = a.question_id\n"
                + "where a.question_id = ? \n"
                + "order by NEWID()";
        List<Answer> listAnswer = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quest_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int answer_id = rs.getInt("answer_id");
                String answer_detail = rs.getString("answer_detail");
                boolean isCorrect = rs.getBoolean("isCorrect");
                int question_id = rs.getInt("question_id");
                Answer a = new Answer(answer_id, answer_detail, isCorrect, question_id);
                listAnswer.add(a);
            }
        } catch (Exception e) {
        }
        return listAnswer;

    }

    public Question getQuestionById(int question_id_raw) {
        String sql = "SELECT * FROM Question WHERE question_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, question_id_raw);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
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
                return question;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void updateQuestion(Question question) {
        String sql = "UPDATE [dbo].[Question]\n"
                + "   SET [subject_id] = ?\n"
                + "      ,[dimension_id] = ?\n"
                + "      ,[lesson_topic_id] = ?\n"
                + "      ,[level_id] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[question_content] = ?\n"
                + "      ,[explanation] = ?\n"
                + "      ,[media] = ?\n"
                + " WHERE question_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, question.getSubject_id());
            st.setInt(2, question.getDimension_id());
            st.setInt(3, question.getLesson_topic_id());
            st.setInt(4, question.getLevel_id());
            st.setBoolean(5, question.isStatus());
            st.setString(6, question.getQuestion_content());
            st.setString(7, question.getExplanation());
            st.setString(8, question.getMedia());
            st.setInt(9, question.getQuestion_id());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteAnswer(int answer_id) {
        String sql = "DELETE FROM [dbo].[Answer]\n"
                + "      WHERE answer_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, answer_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void addPracticeQuestions(List<Question_Handle> lq) {
        try {
            for (Question_Handle question_Handle : lq) {
                String sql = "INSERT INTO [dbo].[Question_Record] \n"
                        + "           ([practice_id], [question_id], [answered], [is_marked]) \n"
                        + "     VALUES (?, ?, ?, ?)";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, question_Handle.getPractice_id());
                ps.setInt(2, question_Handle.getQuestion_id());
                ps.setString(3, question_Handle.getAnswered());
                ps.setInt(4, question_Handle.isIs_mark() ? 1 : 0);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//    public void addPracticeQuestions(List<Question_Handle> lq) {
//        try {
//            // Lặp qua từng câu hỏi
//            for (Question_Handle question_Handle : lq) {
//                // Câu lệnh SQL INSERT
//                String sql = "INSERT INTO [dbo].[Question_Record] \n"
//                        + "           ([practice_id], [question_id], [answered], [is_marked]) \n"
//                        + "     VALUES (?, ?, ?, ?)";
//
//                // Chuẩn bị PreparedStatement
//                PreparedStatement ps = connection.prepareStatement(sql);
//
//                // Đặt giá trị cho các tham số
//                ps.setInt(1, question_Handle.getPractice_id());
//                ps.setInt(2, question_Handle.getQuestion_id());
//                ps.setString(3, question_Handle.getAnswered());
//                ps.setInt(4, question_Handle.isIs_mark() ? 1 : 0); // Chuyển boolean thành 1 hoặc 0
//
//                // Thực thi câu lệnh
//                ps.executeUpdate(); // Sửa thành executeUpdate() để INSERT dữ liệu
//            }
//        } catch (SQLException e) {
//            // In ra thông báo lỗi nếu có
//            e.printStackTrace();
//        }
//    }

    public void updatePracticeQuestions(List<Question_Handle> lq) {
        try {
            for (Question_Handle question_Handle : lq) {
                // Câu lệnh SQL UPDATE
                String sql = "UPDATE [dbo].[Question_Record] \n"
                        + "SET [answered] = ?, \n"
                        + "    [is_marked] = ? \n"
                        + "WHERE [practice_id] = ? AND [question_id] = ?";

                // Chuẩn bị PreparedStatement
                PreparedStatement ps = connection.prepareStatement(sql);

                // Đặt giá trị cho các tham số
                ps.setString(1, question_Handle.getAnswered());
                ps.setInt(2, question_Handle.isIs_mark() ? 1 : 0); // Chuyển boolean thành 1 hoặc 0
                ps.setInt(3, question_Handle.getPractice_id());
                ps.setInt(4, question_Handle.getQuestion_id());

                // Thực thi câu lệnh
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            // In ra thông báo lỗi nếu có
            e.printStackTrace();
        }
    }

    public void deleteQuestion(int question_id) {
        String sql = "DELETE FROM [dbo].[Question]\n"
                + "      WHERE question_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, question_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteAnswers(int question_id) {
        String sql = "DELETE FROM [dbo].[Answer]\n"
                + "      WHERE question_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, question_id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    public Quiz_Question getQuiz_Question(int question_id_raw) {
        String sql = "select * from Quiz_Question where question_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, question_id_raw);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int quiz_id = rs.getInt("quiz_id");
                int question_id = rs.getInt("question_id");
                
                return new Quiz_Question(quiz_id, question_id);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();

    }
}
