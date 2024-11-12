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
                display: none; /* Hide by default */
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
                            <h2>Lesson Details</h2>
                            <div class="button-group">
                                <button class="btn btn-primary" onclick="submitForm1()">Save</button>
                                <button class="btn btn-outline-primary" onclick="window.location.href='listlesson?subjectId=${requestScope.subjectId}'">Back</button>
                            </div>
                        </div>
                        <script>
                            function submitForm1() {
                                if (validateForm1()) {
                                document.getElementById('form1').submit();
                            }
                        }
                        </script>
                        <form id="form1" action="addlesson" method="post" onsubmit="return validateForm()">
                            <input type="hidden" value="${requestScope.subjectId}" name="subjectId">
                            <div class="form-group">
                                <label for="type">Type</label>
                                <select id="type-selector-lesson" name="type">
                                    <option value="lesson">Lesson Topic</option>
                                    <option value="video">Video</option>
                                    <option value="quiz">Quiz</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" id="name" name="name" placeholder="Enter Lesson Name" required>
                            </div>

                            <div class="form-group">
                                <label for="topic">Topic</label>
                                <select type="text" id="topic" name="topic">
                                    <c:forEach var="lesson_topic" items="${requestScope.listLesson_Topic}">
                                        <option value="${lesson_topic.lesson_topic_id}">${lesson_topic.lesson_topic_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="summary">Summary</label>
                                <textarea id="summary" name="summary" placeholder="Enter Summary" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="order">Order</label>
                                <input type="number" id="order" name="order" value="1" min="1" onkeydown="return false;" required>
                            </div>

                            <div class="form-group">
                                <label for="status">Status</label>
                                <select id="status" name="status">
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>
                        </form>
                            <script>
                                function validateForm1() {
                                    // Get form elements
                                    const name = document.getElementById("name").value.trim();
                                    const summary = document.getElementById("summary").value.trim();
                                    const order = document.getElementById("order");

                                    // Check if required fields are empty
                                    if (!name || !summary) {
                                        alert("Please fill out all required fields.");
                                        return false;
                                    }

                                    // Set default value for 'order' if empty
                                    if (!order.value || order.value < 1) {
                                        order.value = 1;
                                    }

                                    return true;  // Allow form submission
                                }
                                </script>
                    </div>

                    <!-- Page 2: Video Type -->
                    <div class="container video" id="video">
                        <div class="header">
                            <h2>Lesson Details</h2>
                            <div class="button-group">
                                <button class="btn btn-primary" onclick="submitForm2()">Save</button>
                                <button class="btn btn-outline-primary" onclick="window.location.href='listlesson?subjectId=${requestScope.subjectId}'">Back</button>
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
                                if (validateForm2()) {
                                    document.getElementById('form2').submit();
                                }
                            }
                        </script>
                        <form id="form2" action="addlesson" method="post">
                            <input type="hidden" value="${requestScope.subjectId}" name="subjectId">
                            <div class="form-group">
                                <label for="type">Type</label>
                                <select id="type-selector-video" name="type">
                                    <option value="lesson">Lesson Topic</option>
                                    <option value="video" selected>Video</option>
                                    <option value="quiz">Quiz</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="name2">Name</label>
                                <input type="text" id="name2" placeholder="Enter Lesson Name" name="name" required>
                            </div>

                            <div class="form-group">
                                <label for="topic">Topic</label>
                                <select type="text" id="topic" name="topic">
                                    <c:forEach var="lesson_topic" items="${requestScope.listLesson_Topic}">
                                        <option value="${lesson_topic.lesson_topic_id}">${lesson_topic.lesson_topic_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="summary2">Summary</label>
                                <textarea id="summary2" name="summary" placeholder="Enter summary" required></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label for="order">Order</label>
                                <input type="number" id="order2" name="order" value="1" min="1" onkeydown="return false;" required>
                            </div>

                            <div class="form-group">
                                <label for="status">Status</label>
                                <select id="status" name="status">
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="video_link">Video Link</label>
                                <input type="url" id="video_link" name="url" placeholder="Ex: https://www.youtube.com/embed/example" required>
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
                                        </div>
                                        <input type="hidden" name="quillContent" id="quillContent">
                                    </div>
                                </div>
                            </div>
                            <script>
                                function validateForm2() {
                                    // Get form elements
                                    const name = document.getElementById("name2").value.trim();
                                    const summary = document.getElementById("summary2").value.trim();
                                    const order = document.getElementById("order2");
                                    const video_link = document.getElementById("video_link");
                                    // Check if required fields are empty
                                    if (!name || !summary) {
                                        alert("Please fill out all required fields.");
                                        return false;
                                    }
                                    else if (!video_link.validity.valid) {
                                        alert("Invalid URL");
                                        return false;
                                    }
                                    return true;  // Allow form submission
                                }
                            </script>
                        </form>
                    </div>

                    <!-- Page 3: Quiz Type -->
                    <div class="container quiz" id="quiz">
                        <div class="header">
                            <h2>Lesson Details</h2>
                            <div class="button-group">
                                <button class="btn btn-primary" onclick="submitForm3()">Save</button>
                                <button class="btn btn-outline-primary" onclick="window.location.href='listlesson?subjectId=${requestScope.subjectId}'">Back</button>
                            </div>
                        </div>
                        <script>
                            function submitForm3() {
                                // Submit the form
                                if (validateForm3()) {
                                    document.getElementById('form3').submit();
                                }
                            }
                        </script>
                        <form id="form3" action="addlesson" method="post">
                            <input type="hidden" value="${requestScope.subjectId}" name="subjectId">
                            <div class="form-group" name="lesson_type">
                                <label for="type">Type</label>
                                <select id="type-selector-quiz" name="type">
                                    <option value="lesson">Lesson Topic</option>
                                    <option value="video">Video</option>
                                    <option value="quiz" selected>Quiz</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="name3">Name</label>
                                <input type="text" id="name3" name="name" placeholder="Enter Lesson Name" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="topic">Topic</label>
                                <select type="text" id="topic" name="topic">
                                    <c:forEach var="lesson_topic" items="${requestScope.listLesson_Topic}">
                                        <option value="${lesson_topic.lesson_topic_id}">${lesson_topic.lesson_topic_name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="summary3">Summary</label>
                                <textarea id="summary3" name="summary" placeholder="Enter Summary" required></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label for="order3">Order</label>
                                <input type="number" id="order3" name="order" value="1" min="1" onkeydown="return false;" required>
                            </div>

                            <div class="form-group">
                                <label for="status">Status</label>
                                <select id="status" name="status">
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="quiz">Quiz Selected</label>
                                <select id="quiz" name="quiz" required>
                                    <c:forEach var="quiz" items="${requestScope.listQuiz}">
                                        <option value="${quiz.quiz_id}">${quiz.quiz_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <script>
                                function validateForm3() {
                                    // Get form elements
                                    const name = document.getElementById("name3").value.trim();
                                    const summary = document.getElementById("summary3").value.trim();
                                    // Check if required fields are empty
                                    if (!name || !summary) {
                                        alert("Please fill out all required fields.");
                                        return false;
                                    }
                                    return true;  // Allow form submission
                                }
                            </script>
                        </form>
                    </div>
                </main>

                <jsp:include page="footer.jsp"/>    
            </div>
        </div>
        <jsp:include page="script.jsp"/>

        <!-- JavaScript for dynamic screen switching -->
        <script>
            function handleTypeChange(selectedType) {
                // Hide all containers
                document.getElementById('lesson-topic').style.display = 'none';
                document.getElementById('video').style.display = 'none';
                document.getElementById('quiz').style.display = 'none';

                // Show the selected container and set the dropdown value correctly
                if (selectedType === 'lesson') {
                    document.getElementById('lesson-topic').style.display = 'block';
                    document.getElementById('type-selector-lesson').value = 'lesson'; // Reset to Lesson
                } else if (selectedType === 'video') {
                    document.getElementById('video').style.display = 'block';
                    document.getElementById('type-selector-video').value = 'video'; // Reset to Video
                } else if (selectedType === 'quiz') {
                    document.getElementById('quiz').style.display = 'block';
                    document.getElementById('type-selector-quiz').value = 'quiz'; // Reset to Quiz
                }
            }

// Add event listeners to dropdowns dynamically
            document.querySelectorAll('select[id^="type-selector-"]').forEach(function (dropdown) {
                dropdown.addEventListener('change', function () {
                    handleTypeChange(this.value);
                });
            });

// Initialize the correct screen based on the selected value of any visible dropdown
            window.addEventListener('load', function () {
                let selectedType = document.getElementById('type-selector-lesson').value || 'lesson';
                handleTypeChange(selectedType);
            });

        </script>
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
