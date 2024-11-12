<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="head.jsp" />
        <link rel="canonical" href="forms-editors.html" />
        <style>
            .container {
                max-width: 900px;
                margin: 0 auto;
                background-color: #f8f9fa;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            }

            .lesson-details {
                background-color: #fff;
                padding: 20px;
                margin: 20px auto;
                width: 90%;
                max-width: 600px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            h2 {
                color: #333;
            }

            .edit-btn, .delete-btn {
                padding: 10px 15px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .delete-btn {
                background-color: #dc3545;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
                color: #333;
            }

            input, textarea, select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }

            textarea {
                resize: vertical;
            }

            button {
                cursor: pointer;
            }
            #message {
                display: none;
            }
        </style>
    </head>

    <body data-theme="default" data-layout="fluid" data-sidebar-position="left" data-sidebar-layout="default">
        <div class="wrapper">
            <jsp:include page="expert_sidebar.jsp" />

            <div class="main">
                <jsp:include page="navbar.jsp"/>

                <main class="content">
                    <!-- Page 1: Lesson Topic -->
                    <c:set var="lesson" value="${requestScope.lesson}"/>
                    <c:choose>
                        <c:when test="${lesson.lesson_type_id == 1}">
                            <!-- Content for condition1 -->
                            <div class="container lesson-topic" id="lesson-topic">
                                <div id="message" class="alert alert-success alert-dismissible" role="alert">
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    <div class="alert-message">
                                        <strong>Changes saved</strong> Quiz have been updated
                                    </div>
                                </div>
                                <!-- Handle Showing success message -->
                                <script>
                                    document.addEventListener('DOMContentLoaded', (event) => {
                                        let showMessageSuccess = ${requestScope.showSuccessMessage};
                                        let message = document.getElementById('message');

                                        if (showMessageSuccess) {
                                            // Show the message initially
                                            message.style.display = 'block';
                                            message.style.opacity = 1;

                                            // Fade out after 0.5 seconds
                                            setTimeout(() => {
                                                let opacity = 1;
                                                let interval = setInterval(() => {
                                                    if (opacity <= 0) {
                                                        clearInterval(interval);
                                                        message.style.display = 'none';
                                                    } else {
                                                        opacity -= 0.05; // Adjust the decrement step for different speeds
                                                        message.style.opacity = opacity;
                                                    }
                                                }, 50); // Adjust interval timing as needed
                                            }, 1000); // Show duration before starting fade-out
                                        }
                                    });
                                </script>
                                <div class="header">
                                    <h2>Edit Lesson</h2>
                                    <div class="button-group">
                                        <button class="btn btn-primary" onclick="submitForm1()">Save</button>
                                        <button class="btn btn-outline-primary" onclick="window.location.href='listlesson?subjectId=${lesson.subject_id}'">Back</button>
                                    </div>
                                </div>
                                <script>
                                    function submitForm1() {
                                        var form = document.getElementById('form1');
                                        form.submit();
                                    }
                                </script>
                                <form id="form1" action="editlesson" method="post">
                                    <input type="hidden" name="lesson_id" value="${lesson.lesson_id}">
                                    <div class="form-group">
                                        <label for="type">Type</label>
                                        <select id="type-selector-lesson" name="type" disabled>
                                            <option value="lesson" selected>Lesson Topic</option>
                                        </select>
                                        <input type="hidden" name="type" value="lesson">
                                    </div>

                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" id="name" name="name" value="${lesson.lesson_name}">
                                    </div>

                                    <div class="form-group">
                                        <label for="topic">Topic</label>
                                        <select type="text" id="topic" name="topic">
                                            <c:forEach var="lesson_topic" items="${requestScope.listLesson_Topic}">
                                                <option value="${lesson_topic.lesson_topic_id}" ${lesson_topic.lesson_topic_id == lesson.lesson_topic_id ? 'selected' : ''}>${lesson_topic.lesson_topic_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="summary">Summary</label>
                                        <textarea id="summary" name="summary" placeholder="Enter Summary">${lesson.summary}</textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="order">Order</label>
                                        <input type="number" id="order" name="order" value="${lesson.lesson_order}">
                                    </div>

                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <select id="status" name="status">
                                            <option value="1" ${lesson.status == true ? 'selected' : ''}>Active</option>
                                            <option value="0" ${lesson.status == false ? 'selected' : ''}>Inactive</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </c:when>
                        <c:when test="${lesson.lesson_type_id == 2}">
                            <!-- Content for condition2 -->
                            <!-- Page 2: Video Type -->
                            <div class="container video" id="video">
                                <div class="header">
                                    <h2>Lesson Details</h2>
                                    <div class="button-group">
                                        <button class="btn btn-primary" onclick="submitForm2()">Save</button>
                                        <button class="btn btn-outline-primary" onclick="window.location.href='listlesson?subjectId=${lesson.subject_id}'">Back</button>
                                    </div>
                                </div>
                                <script>
                                    function submitForm2() {
                                        // Get the content from Quill editor
                                        var quillEditor = new Quill('#quill-editor');
                                        var quillContent = quillEditor.root.innerHTML; // Get the HTML content

                                        // Set the content into the hidden input field
                                        document.getElementById('quillContent').value = quillContent;

                                        // Submit the form
                                        document.getElementById('form2').submit();
                                    }
                                </script>
                                <form id="form2" action="editlesson" method="post">
                                    <input type="hidden" name="lesson_id" value="${lesson.lesson_id}">
                                    <div id="message" class="alert alert-success alert-dismissible" role="alert">
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    <div class="alert-message">
                                        <strong>Changes saved</strong> Quiz have been updated
                                    </div>
                                    </div>
                                    <!-- Handle Showing success message -->
                                    <script>
                                        document.addEventListener('DOMContentLoaded', (event) => {
                                            let showMessageSuccess = ${requestScope.showSuccessMessage};
                                            let message = document.getElementById('message');

                                            if (showMessageSuccess) {
                                                // Show the message initially
                                                message.style.display = 'block';
                                                message.style.opacity = 1;

                                                // Fade out after 0.5 seconds
                                                setTimeout(() => {
                                                    let opacity = 1;
                                                    let interval = setInterval(() => {
                                                        if (opacity <= 0) {
                                                            clearInterval(interval);
                                                            message.style.display = 'none';
                                                        } else {
                                                            opacity -= 0.05; // Adjust the decrement step for different speeds
                                                            message.style.opacity = opacity;
                                                        }
                                                    }, 50); // Adjust interval timing as needed
                                                }, 1000); // Show duration before starting fade-out
                                            }
                                        });
                                    </script>
                                    <div class="form-group">
                                        <label for="type">Type</label>
                                        <select id="type-selector-video" name="type" disabled>
                                            <option value="video" selected>Lesson</option>
                                        </select>
                                        <input type="hidden" name="type" value="video">
                                    </div>

                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" id="name" placeholder="Enter Lesson Name" name="name" value="${lesson.lesson_name}">
                                    </div>

                                    <div class="form-group">
                                        <label for="topic">Topic</label>
                                        <select type="text" id="topic" name="topic">
                                            <c:forEach var="lesson_topic" items="${requestScope.listLesson_Topic}">
                                                <option value="${lesson_topic.lesson_topic_id}" ${lesson.lesson_topic_id == lesson_topic.lesson_topic_id ? 'selected' : ''}>${lesson_topic.lesson_topic_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="summary">Summary</label>
                                        <textarea id="summary" name="summary" placeholder="Enter summary">${lesson.summary}</textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="order">Order</label>
                                        <input type="number" id="order" name="order" value="${lesson.lesson_order}">
                                    </div>

                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <select id="status" name="status">
                                            <option value="1" ${lesson.status == true ? 'selected' : ''}>Active</option>
                                            <option value="0" ${lesson.status == false ? 'selected' : ''}>Inactive</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="video-link">Video Link</label>
                                        <input type="url" id="video-link" name="url" placeholder="Ex: https://www.youtube.com/embed/example" value="${lesson.video_link}">
                                    </div>

                                    <div class="form-group">
                                        <label for="content">Content</label>
                                        <div class="card-body">
                                            <div class="clearfix">
                                                <div id="quill-toolbar">
                                                    <span class="ql-formats">
                                                        <select class="ql-font"></select>
                                                        <select class="ql-size"></select>
                                                    </span>
                                                    <span class="ql-formats">
                                                        <button class="ql-bold"></button>
                                                        <button class="ql-italic"></button>
                                                        <button class="ql-underline"></button>
                                                        <button class="ql-strike"></button>
                                                    </span>
                                                    <span class="ql-formats">
                                                        <select class="ql-color"></select>
                                                        <select class="ql-background"></select>
                                                    </span>
                                                    <span class="ql-formats">
                                                        <button class="ql-script" value="sub"></button>
                                                        <button class="ql-script" value="super"></button>
                                                    </span>
                                                    <span class="ql-formats">
                                                        <button class="ql-header" value="1"></button>
                                                        <button class="ql-header" value="2"></button>
                                                        <button class="ql-blockquote"></button>
                                                        <button class="ql-code-block"></button>
                                                    </span>
                                                    <span class="ql-formats">
                                                        <button class="ql-list" value="ordered"></button>
                                                        <button class="ql-list" value="bullet"></button>
                                                        <button class="ql-indent" value="-1"></button>
                                                        <button class="ql-indent" value="+1"></button>
                                                    </span>
                                                    <span class="ql-formats">
                                                        <button class="ql-direction" value="rtl"></button>
                                                        <select class="ql-align"></select>
                                                    </span>
                                                    <span class="ql-formats">
                                                        <button class="ql-link"></button>
                                                        <button class="ql-image"></button>
                                                        <button class="ql-video"></button>
                                                    </span>
                                                    <span class="ql-formats">
                                                        <button class="ql-clean"></button>
                                                    </span>
                                                </div>
                                                <div id="quill-editor">
                                                    ${lesson.lesson_content}
                                                </div>
                                                <input type="hidden" name="quillContent" id="quillContent">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- Default content if none of the conditions are true -->
                            <!-- Page 3: Quiz Type -->
                            <div class="container quiz" id="quiz">
                                <div class="header">
                                    <h2>Lesson Details</h2>
                                    <div class="button-group">
                                        <button class="btn btn-primary" onclick="submitForm3()">Save</button>
                                        <button class="btn btn-outline-primary" onclick="window.location.href='listlesson?subjectId=${lesson.subject_id}'">Back</button>
                                    </div>
                                </div>
                                <script>
                                    function submitForm3() {
                                        // Submit the form
                                        document.getElementById('form3').submit();
                                    }
                                </script>
                                <form id="form3" action="editlesson" method="post">
                                    <input type="hidden" name="lesson_id" value="${lesson.lesson_id}">
                                    <div id="message" class="alert alert-success alert-dismissible" role="alert">
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    <div class="alert-message">
                                        <strong>Changes saved</strong> Quiz have been updated
                                    </div>
                                    </div>
                                    <!-- Handle Showing success message -->
                                    <script>
                                        document.addEventListener('DOMContentLoaded', (event) => {
                                            let showMessageSuccess = ${requestScope.showSuccessMessage};
                                            let message = document.getElementById('message');

                                            if (showMessageSuccess) {
                                                // Show the message initially
                                                message.style.display = 'block';
                                                message.style.opacity = 1;

                                                // Fade out after 0.5 seconds
                                                setTimeout(() => {
                                                    let opacity = 1;
                                                    let interval = setInterval(() => {
                                                        if (opacity <= 0) {
                                                            clearInterval(interval);
                                                            message.style.display = 'none';
                                                        } else {
                                                            opacity -= 0.05; // Adjust the decrement step for different speeds
                                                            message.style.opacity = opacity;
                                                        }
                                                    }, 50); // Adjust interval timing as needed
                                                }, 1000); // Show duration before starting fade-out
                                            }
                                        });
                                    </script>
                                    <div class="form-group" name="lesson_type">
                                        <label for="type">Type</label>
                                        <select id="type-selector-quiz" name="type" disabled>
                                            <option value="quiz" selected>Quiz</option>
                                        </select>
                                        <input type="hidden" name="type" value="quiz">
                                    </div>

                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" id="name" name="name" placeholder="Enter Lesson Name" value="${lesson.lesson_name}">
                                    </div>

                                    <div class="form-group">
                                        <label for="topic">Topic</label>
                                        <select type="text" id="topic" name="topic">
                                            <c:forEach var="lesson_topic" items="${requestScope.listLesson_Topic}">
                                                <option value="${lesson_topic.lesson_topic_id}" ${lesson_topic.lesson_topic_id == lesson.lesson_topic_id ? 'selected' : ''}>${lesson_topic.lesson_topic_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="summary">Summary</label>
                                        <textarea id="summary" name="summary" placeholder="Enter Summary">${lesson.summary}</textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="order">Order</label>
                                        <input type="number" id="order" name="order" value="${lesson.lesson_order}">
                                    </div>

                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <select id="status" name="status">
                                            <option value="1" ${lesson.status == true ? 'selected' : ''}>Active</option>
                                            <option value="0" ${lesson.status == false ? 'selected' : ''}>Inactive</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="quiz">Quiz Selected</label>
                                        <select id="quiz" name="quiz">
                                            <c:forEach var="quiz" items="${requestScope.listQuiz}">
                                                <option value="${quiz.quiz_id}" ${quiz.quiz_id == lesson.quiz_id ? 'selected' : ''}>${quiz.quiz_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </main>

                <jsp:include page="footer.jsp"/>    
            </div>
        </div>
        <jsp:include page="script.jsp"/>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var editor = new Quill("#quill-editor", {
                    modules: {
                        toolbar: "#quill-toolbar"
                    },
                    placeholder: "Type something",
                    theme: "snow"
                });
                var bubbleEditor = new Quill("#quill-bubble-editor", {
                    placeholder: "Compose an epic...",
                    modules: {
                        toolbar: "#quill-bubble-toolbar"
                    },
                    theme: "bubble"
                });
            });
        </script>
    </body>
</html>
