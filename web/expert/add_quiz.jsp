<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <jsp:include page="head.jsp" />
        <style>
            .container {
                max-width: 900px;
                margin: 0 auto;
                background-color: #f8f9fa;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            }

            .tab {
                margin-top: 20px;
            }

            .nav-tabs {
                border-bottom: 2px solid #dee2e6;
            }

            .nav-tabs .nav-link {
                border: none;
                background-color: #e9ecef;
                padding: 10px 20px;
                margin-right: 5px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .nav-tabs .nav-link.active {
                background-color: #007bff;
                color: #fff;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: 500;
            }

            .form-group input,
            .form-group select,
            .form-group textarea {
                width: 100%;
                padding: 8px;
                border: 1px solid #ced4da;
                border-radius: 5px;
                background-color: #fff;
            }

            .tab-content {
                background-color: #fff;
                border: 1px solid #dee2e6;
                padding: 20px;
                border-radius: 5px;
            }

            .btn {
                background-color: #007bff;
                color: #fff;
                padding: 10px 15px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .btn:hover {
                background-color: #0056b3;
            }

            .btn-secondary {
                background-color: #6c757d;
            }

            .form-inline {
                display: flex;
                align-items: center;
                gap: 10px;
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
                <jsp:include page="navbar.jsp" />

                <main class="content">
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
                    <div class="container">
                        <form action="addquiz" method="post" id="quiz">
                            <!-- Send the value of the active tab -->
                            <input type="hidden" id="activeTab" name="activeTab" value="${requestScope.activeTab != null ? requestScope.activeTab : 'overview'}">
                            <div class="tab">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#overview" data-bs-toggle="tab" role="tab">Overview</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#setting" data-bs-toggle="tab" role="tab">Setting</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <!-- Overview Tab -->
                                    <div class="tab-pane active" id="overview" role="tabpanel">
                                        <h4>Quiz Details</h4>
                                        <p style="color: red">${requestScope.message}</p>
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" id="name" name="name" placeholder="Enter exam name" value="${requestScope.name}" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="subject">Subject</label>
                                            <select id="subject" name="subject_id" required>
                                                <option value="" disabled selected>Select an option</option>
                                                <c:forEach var="subject" items="${requestScope.listSubject}">
                                                    <option value="${subject.subjectId}" 
                                                            ${subject.subjectId == requestScope.subject_id ? 'selected' : ''}>
                                                        ${subject.subjectName}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <!<!-- Submit form directly when clicking on each subject -->
                                            <script>
                                                document.getElementById('subject').addEventListener('change', function () {
                                                    var form = document.getElementById('quiz');
                                                    form.action = 'addquiz'; // Set the URL of the target servlet
                                                    form.method = 'get';
                                                    form.submit(); // Submit the form
                                                });
                                            </script>
                                        </div>
                                        <div class="form-group">
                                            <label for="level">Exam Level</label>
                                            <select id="level" name="level_id" required>
                                                <c:forEach var="level" items="${requestScope.listLevel}">
                                                    <option value="${level.level_id}"} ${level.level_id == requestScope.level_id ? 'selected' : ''}> 
                                                        ${level.level_name}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="duration">Duration (minutes)</label>
                                            <input type="number" id="duration" name="duration" value="${requestScope.duration != null ? requestScope.duration : 50}" min="1" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="pass-rate">Pass Rate (%)</label>
                                            <input type="number" id="pass-rate" name="passrate" value="${requestScope.passrate != null ? requestScope.passrate : 50}" min="1" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="quiz-type">Quiz Type</label>
                                            <select id="quiz-type" name="quiztype_id" required>
                                                <c:forEach var="quiztype" items="${requestScope.listQuiz_Type}">
                                                    <option value="${quiztype.quiz_type_id}" ${quiztype.quiz_type_id == requestScope.quiztype_id ? 'selected' : ''}> 
                                                        ${quiztype.quiz_type_name}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="description">Description</label>
                                            <textarea id="description" name="description" placeholder="Enter description" required>${requestScope.description}</textarea>
                                        </div>
                                        <button type="submit" class="btn" onclick="return confirm('Do you want to save these changes?')">Submit</button>
                                        <button type="button" class="btn btn-secondary" onclick="window.location.href='quizlist'">Back</button>
                                    </div>

                                    <!-- Settings Tab -->
                                    <div class="tab-pane" id="setting" role="tabpanel">
                                        <h4>Settings</h4>
                                        <div class="form-group">
                                            <label for="total-questions">Total Number of Questions</label>
                                            <input type="number" id="total-questions" name="totalquestion" value="0" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="question-type">Question Type</label>
                                            <div class="form-inline">
                                                <input type="radio" id="theo-topic" name="question_type" value="topic" onchange="checkSubjectAndSubmit('topic')" ${requestScope.question_type == null || requestScope.question_type == "topic" ? 'checked' : ''}>
                                                <label for="theo-topic">By Topic</label>
                                                <input type="radio" id="theo-group" name="question_type" value="group" onchange="checkSubjectAndSubmit('group')" ${requestScope.question_type == "group" ? 'checked' : ''}>
                                                <label for="theo-group">By Group</label>
                                                <input type="radio" id="theo-domain" name="question_type" value="domain" onchange="checkSubjectAndSubmit('domain')" ${requestScope.question_type == "domain" ? 'checked' : ''}>
                                                <label for="theo-domain">By Domain</label>
                                            </div>
                                        </div>
                                        <script>
                                            function checkSubjectAndSubmit(questionType) {
                                                var subjectSelect = document.getElementById('subject');
                                                if (subjectSelect.value === "") {
                                                    alert("Please select a subject before choosing the question type.");
                                                    document.getElementById('theo-topic').checked = true;
                                                } else {
                                                    submitForm(); // Call the existing submit function if a subject is selected
                                                }
                                            }

                                            function submitForm() {
                                                var form = document.getElementById('quiz');
                                                form.action = 'addquiz'; // Set the URL of the target servlet
                                                form.method = 'get';
                                                form.submit(); // Submit the form
                                            }
                                        </script>
                                        <!-- Add button -->
                                        <button id="add-btn" type="button" class="btn btn-secondary" onclick="addGroup()">Add</button>
                                        <script>
                                            function submitForm() {
                                                var form = document.getElementById("quiz");
                                                form.method = 'get';
                                                form.submit();
                                            }
                                        </script>
                                        Choose Questions by Group
                                        <br>
                                        <br>
                                        <!-- Group Selection 1 -->
                                        <div class="form-group d-flex align-items-center mb-3">
                                            <label for="group-selection" class="me-3">Group Selection</label>
                                            <c:choose>
                                                <c:when test="${requestScope.questionTopic != null}">
                                                    <select id="group-selection" name="group_selection" class="form-select me-2" required>
                                                        <c:forEach var="lesson_topic" items="${requestScope.questionTopic}">
                                                            <option value="${lesson_topic.lesson_topic_id}"> 
                                                                ${lesson_topic.lesson_topic_name}
                                                            </option>
                                                        </c:forEach>
                                                        <!-- Add group options dynamically -->
                                                    </select>
                                                </c:when>
                                                <c:when test="${requestScope.questionGroup != null}">
                                                    <select id="group-selection" name="group_selection" class="form-select me-2" required>
                                                        <c:forEach var="dimension" items="${requestScope.questionGroup}">
                                                            <option value="${dimension.dimension_id}"> 
                                                                ${dimension.dimension_name}
                                                            </option>
                                                        </c:forEach>
                                                        <!-- Add group options dynamically -->
                                                    </select>
                                                </c:when>
                                                <c:otherwise>
                                                    <select id="group-selection" name="group_selection" class="form-select me-2" required>
                                                        <c:forEach var="dimension" items="${requestScope.questionDomain}">
                                                            <option value="${dimension.dimension_id}"> 
                                                                ${dimension.dimension_name}
                                                            </option>
                                                        </c:forEach>
                                                        <!-- Add group options dynamically -->
                                                    </select>
                                                </c:otherwise>
                                            </c:choose>
                                            <input type="number" class="form-control me-2 number-of-questions" name="number_of_questions" style="width: 100px; caret-color: transparent;" value="0" min="0" required>
                                            <button type="button" class="btn btn-secondary">Delete</button>
                                        </div>
                                        <script>
                                            // Function to add a new group selection div dynamically
                                            function addGroup() {
                                                // The div structure to be cloned and added
                                                var groupDiv = `
                                                        <div class="form-group d-flex align-items-center mb-3">
                                                            <label for="group-selection" class="me-3">Group Selection</label>
                                                            <select id="group-selection" name="group_selection" class="form-select me-2">
                                            <c:choose>
                                                <c:when test="${requestScope.questionTopic != null}">
                                                    <c:forEach var="lesson_topic" items="${requestScope.questionTopic}">
                                                                            <option value="${lesson_topic.lesson_topic_id}"> 
                                                        ${lesson_topic.lesson_topic_name}
                                                                            </option>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${requestScope.questionGroup != null}">
                                                    <c:forEach var="dimension" items="${requestScope.questionGroup}">
                                                                            <option value="${dimension.dimension_id}"> 
                                                        ${dimension.dimension_name}
                                                                            </option>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach var="dimension" items="${requestScope.questionDomain}">
                                                                            <option value="${dimension.dimension_id}"> 
                                                        ${dimension.dimension_name}
                                                                            </option>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                                            </select>
                                                            <input type="number" class="form-control me-2 number-of-questions" name="number_of_questions"  style="width: 100px; caret-color: transparent;" value="0" min="0" required>
                                                            <button type="button" class="btn btn-secondary" onclick="removeGroup(this)">Delete</button>
                                                        </div>
                                                    `;

                                                // Create a new div element to contain the groupDiv
                                                var newDiv = document.createElement('div');
                                                newDiv.innerHTML = groupDiv;

                                                // Append the new div to the form or desired location
                                                document.getElementById("setting").appendChild(newDiv);

                                                // Attach event listener for the new input
                                                attachInputListener(newDiv.querySelector('.number-of-questions'));
                                            }

                                            // Function to attach the input listener
                                            function attachInputListener(input) {
                                                input.addEventListener('input', updateTotalQuestions);
                                            }

                                            // Function to update total questions
                                            function updateTotalQuestions() {
                                                const totalQuestionsInput = document.getElementById('total-questions');
                                                let total = 0;

                                                // Sum values of all number_of_questions inputs
                                                const numberOfQuestionsInputs = document.querySelectorAll('.number-of-questions');
                                                numberOfQuestionsInputs.forEach(input => {
                                                    total += Number(input.value) || 0;
                                                });

                                                // Update the total questions input
                                                totalQuestionsInput.value = total;
                                            }

                                            // Function to remove the group and update total questions
                                            function removeGroup(button) {
                                                const groupDiv = button.parentElement;
                                                groupDiv.remove();
                                                updateTotalQuestions(); // Update the total after removing
                                            }

                                            // Initial event listener setup for existing inputs (if any)
                                            document.querySelectorAll('.number-of-questions').forEach(input => {
                                                attachInputListener(input);
                                            });
                                        </script>
                                        <script>
                                        document.querySelector('.number-of-questions').addEventListener('blur', function() {
                                            if (this.value === '') {
                                                this.value = 0;
                                            }
                                        });
                                    </script>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                </main>
                <!-- Script to handle active tab -->
                <script>
                    // Set the active tab before form submission
                    document.querySelectorAll('.nav-link').forEach(tab => {
                        tab.addEventListener('click', function () {
                            document.getElementById('activeTab').value = this.getAttribute('href').substring(1);  // Set the active tab id
                        });
                    });

                    // When the page loads, activate the correct tab and tab content
                    document.addEventListener("DOMContentLoaded", function () {
                        var activeTab = "${requestScope.activeTab}";
                        if (activeTab) {
                            // Activate the correct tab link
                            var tabElement = document.querySelector('a[href="#' + activeTab + '"]');
                            if (tabElement) {
                                // Remove 'active' class from previously active tabs
                                document.querySelectorAll('.nav-link').forEach(tab => tab.classList.remove('active'));
                                document.querySelectorAll('.tab-pane').forEach(pane => pane.classList.remove('active', 'show'));

                                // Add 'active' class to the clicked tab and show the corresponding tab pane
                                tabElement.classList.add('active');
                                document.querySelector('#' + activeTab).classList.add('active', 'show');
                            }
                        }
                    });
                </script>


                <jsp:include page="footer.jsp" />
            </div>
        </div>
        <jsp:include page="script.jsp" />

    </body>

</html>
