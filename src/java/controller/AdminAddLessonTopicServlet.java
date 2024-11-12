package controller;

import dal.DimensionDAO;
import dal.LessonTopicDAO;
import dal.SubjectDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Dimension;
import model.DimensionType;
import model.Lesson_Topic;
import model.Subject;

/**
 * Servlet for handling the addition of lesson topics by an admin.
 */
public class AdminAddLessonTopicServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method to display the add lesson topic
     * form.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subjectName = request.getParameter("subjectName");
        SubjectDAO sDao = new SubjectDAO();
        int maxid = sDao.getMaxSubjectId();

        // 
        DimensionDAO dDao = new DimensionDAO();
        List<Dimension> listD = dDao.getAllDimension1();
        request.setAttribute("listD", listD);

        String action = request.getParameter("action");

        List<DimensionType> listDimensionType = dDao.getAllType();

        request.setAttribute("listDimensionType", listDimensionType);
        request.setAttribute("subjectNamefordimension", subjectName);
        request.setAttribute("subjectNameforlessontopic", subjectName);
        request.setAttribute("maxid", maxid);

        List<Subject> listSubject = sDao.getListSubject();
        request.setAttribute("listSubject", listSubject);
        if (action != null) {

            if (action.equalsIgnoreCase("edit")) {

                int dimensionId = Integer.parseInt(request.getParameter("id"));
                Dimension dimension = dDao.getDimensionById1(dimensionId);
                request.setAttribute("dimension", dimension);
                request.setAttribute("action", "edit");

            }
            if (action.equalsIgnoreCase("delete")) {
                request.setAttribute(action, "delete");
            }

        }

        request.getRequestDispatcher("admin/adddimensionandlessontopic.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method to process the addition of a
     * lesson topic.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the lesson topic name and subject ID from the form input
        String lessonTopicName = request.getParameter("lesson_topic_name");
        String subjectIdParam = request.getParameter("subject_id");
        String subjectName=request.getParameter("subjectNameforlessontopic");

        // Validate the inputs
        if (lessonTopicName != null && !lessonTopicName.trim().isEmpty() && subjectIdParam != null) {
            try {
                int subjectId = Integer.parseInt(subjectIdParam);

                // Create a Lesson_Topic object and set its properties
                Lesson_Topic lessonTopic = new Lesson_Topic();
                lessonTopic.setLesson_topic_name(lessonTopicName);
                lessonTopic.setSubject_id(subjectId);

                // Use LessonTopicDAO to add the lesson topic to the database
                LessonTopicDAO lessonTopicDAO = new LessonTopicDAO();
                lessonTopicDAO.addLessonTopic(lessonTopic);
                request.setAttribute("messforlessontopic", "Create successfully!");
                request.removeAttribute("action");
                SubjectDAO sDao = new SubjectDAO();
                int maxid = sDao.getMaxSubjectId();

                // 
                DimensionDAO dDao = new DimensionDAO();
                List<Dimension> listD = dDao.getAllDimension1();
                request.setAttribute("listD", listD);

                String action = request.getParameter("action");

                List<DimensionType> listDimensionType = dDao.getAllType();

                request.setAttribute("listDimensionType", listDimensionType);
                request.setAttribute("subjectName", subjectName);
                request.setAttribute("maxid", maxid);

                List<Subject> listSubject = sDao.getListSubject();
                request.setAttribute("listSubject", listSubject);
                if (action != null) {

                    if (action.equalsIgnoreCase("edit")) {

                        int dimensionId = Integer.parseInt(request.getParameter("id"));
                        Dimension dimension = dDao.getDimensionById1(dimensionId);
                        request.setAttribute("dimension", dimension);
                        request.setAttribute("action", "edit");

                    }
                    if (action.equalsIgnoreCase("delete")) {
                        request.setAttribute(action, "delete");
                    }

                }

                request.getRequestDispatcher("admin/adddimensionandlessontopic.jsp").forward(request, response);

                // Redirect to the list page or success message page
                //response.sendRedirect("admin/adddimensionandlessontopic.jsp");
            } catch (NumberFormatException e) {
                // Handle case where subject ID is not a valid integer
                request.setAttribute("errorMessage", "Invalid subject ID.");
                //request.getRequestDispatcher("admin/adddimensionandlessontopic.jsp").forward(request, response);
            }
        } else {
            // Display error message if input is empty or invalid
            request.setAttribute("errorMessage", "Lesson topic name and subject ID cannot be empty.");

        }
    }

    /**
     * Provides a brief description of the servlet.
     */
    @Override
    public String getServletInfo() {
        return "Servlet for adding lesson topics";
    }
}
