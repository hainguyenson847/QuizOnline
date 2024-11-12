<%-- 
    Document   : question_detail
    Created on : Sep 18, 2024, 11:30:32 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="head.jsp" />
        <style>
            .container {
                max-width: 1200px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .cancel-button {
                background-color: #ff4d4d;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
            }

            h1, h2 {
                color: #333;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            .form-group input,
            .form-group select,
            .form-group textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .form-group textarea {
                height: 80px;
            }

            .buttons {
                display: flex;
                gap: 10px;
                margin-top: 10px;
            }

            .upload-btn, .preview-btn, .save-btn, .cancel-btn, .mark-btn, .edit-btn, .delete-btn {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 5px;
            }

            .upload-btn:hover, .preview-btn:hover, .save-btn:hover, .cancel-btn:hover, .mark-btn:hover, .edit-btn:hover, .delete-btn:hover {
                background-color: #0056b3;
            }

            .delete-btn {
                background-color: #ff4d4d;
            }

            .delete-btn:hover {
                background-color: #cc0000;
            }

            .cancel-btn {
                background-color: #f0ad4e;
            }

            .cancel-btn:hover {
                background-color: #ec971f;
            }

            .mark-btn {
                background-color: #5cb85c;
            }

            .mark-btn:hover {
                background-color: #4cae4c;
            }

            .answer {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 15px;
            }

            .answer textarea {
                width: calc(100% - 180px);
                height: 60px;
            }
            #message {
                display: none;
            }
            .required-asterisk {
                color: red;
            }

        </style>
    </head>

    <body data-theme="default" data-layout="fluid" data-sidebar-position="left" data-sidebar-layout="default">
        <div class="wrapper">
            <jsp:include page="expert_sidebar.jsp" />

            <div class="main">
                <jsp:include page="navbar.jsp"/>

                <main class="content">
                    <!-- Success Message component -->
                    <div id="message" class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        <div class="alert-message">
                            <strong>Changes saved</strong> Question have been updated
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
                    <!-- Header -->
                    <div class="header">
                        <h1>FPT University</h1>
                        <button class="btn btn-warning" type="submit" onclick="submitForm()" style="margin-left: 840px">Save</button>
                        <button class="btn btn-outline-warning" type="submit" onclick="window.location.href='questionlist'">Back</button>
                    </div>
                    
                    <!-- Submit the form when clicking on Save button -->
                    <script>
                        function submitForm() {
                            const requiredFields = [
                                document.getElementById('subject'),
                                document.getElementById('dimension'),
                                document.getElementById('lesson'),
                                document.getElementById('level'),
                                document.getElementById('status'),
                                document.getElementById('content'),
                                document.getElementById('explanation'),
                                document.getElementById('answer')
                            ];

                            // Check if all required fields are filled
                            for (let field of requiredFields) {
                                if (!field.value.trim()) {
                                    alert('Please fill in all required fields.');
                                    field.focus(); // Focus on the first empty field
                                    return; // Stop form submission
                                }
                            }

                            // Confirm before submission
                            if (confirm('Do you want to edit this Question?')) {
                                document.getElementById('questiondetail').submit();
                            }
                        }
                    </script>
                    

                    <!-- Question Details Section -->
                    <form id="questiondetail" action="editquestion" method="post" enctype="multipart/form-data">
                        <div class="container">
                            <div class="question-details">
                                
                                <h2>Edit Question</h2>
                                <c:set var="question" value="${requestScope.question}"/>
                                <input type="hidden" name="question_id" value="${question.question_id}">
                                <!-- Subject drop down -->
                                <div class="form-group">
                                    <label for="subject" >Subject <span class="required-asterisk">*</span></label>
                                    <c:set var="s" value="${requestScope.subject}"/>
                                    <select id="subject" name="subject_id" required>
                                        <option value="" disabled selected>Select an option</option>
                                        <c:forEach var="subject" items="${requestScope.listSubject}">
                                            <option value="${subject.subjectId}" 
                                                    ${subject.subjectId == requestScope.subject_id ? 'selected' : ''}>
                                                ${subject.subjectName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- Submit form directly when clicked on Subject drop down -->
                                <script>
                                    document.getElementById('subject').addEventListener('change', function () {
                                        var form = document.getElementById('questiondetail');
                                        form.action = 'editquestionvalidation'; // Set the URL of the target servlet
                                        form.submit(); // Submit the form
                                    });
                                </script>
                                
                                <!-- Dimension drop down -->
                                <div class="form-group">
                                    <label for="dimension">Dimension <span class="required-asterisk">*</span></label>
                                    <select id="dimension" name="dimension_id" required>
                                        <c:forEach var="dimension" items="${requestScope.listDimension}">
                                            <option value="${dimension.dimension_id}" ${dimension.dimension_id == question.dimension_id ? 'selected' : ''}> 
                                                ${dimension.dimension_name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <!-- Lesson drop down -->
                                <div class="form-group">
                                    <label for="lesson">Lesson <span class="required-asterisk">*</span></label>
                                    <select id="lesson" name="lesson_topic_id" required>
                                        <c:forEach var="lesson" items="${requestScope.listLesson_Topic}">
                                            <option value="${lesson.lesson_topic_id}" ${lesson.lesson_topic_id == question.lesson_topic_id ? 'selected' : ''}> 
                                                ${lesson.lesson_topic_name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <!-- Level drop down -->
                                <div class="form-group">
                                    <label for="level">Level <span class="required-asterisk">*</span></label>
                                    <select id="level" name="level_id" required>
                                        <c:forEach var="level" items="${requestScope.listLevel}">
                                            <option value="${level.level_id}" ${level.level_id == question.level_id ? 'selected' : ''}> 
                                                ${level.level_name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <!-- Status drop down -->
                                <div class="form-group">
                                    <label for="status">Status <span class="required-asterisk">*</span></label>
                                    <select id="status" name="status"  class="form-control" required>
                                        <option value="1" ${question.status == true ? 'selected' : ''}>Active</option>
                                        <option value="0" ${question.status == false ? 'selected' : ''}>Inactive</option>
                                    </select>
                                </div>
                                    
                                <!-- Question Content -->
                                <div class="form-group">
                                    <label for="content">Content <span class="required-asterisk">*</span></label>
                                    <textarea id="content" name="content" placeholder="Enter content" required>${question.question_content}</textarea>
                                </div>
                                
                                <!-- Explanation -->
                                <div class="form-group">
                                    <label for="explanation">Explanation <span class="required-asterisk">*</span></label>
                                    <textarea id="explanation" name="explanation" placeholder="Enter your explanation" required>${question.explanation}</textarea>
                                </div>
                                
                                <!-- File Upload -->
                                <div class="form-group">
                                    <label for="file-upload">Enter link or upload file</label>
                                    <input type="file" id="file-upload" name="media" accept="video/*,audio/*,image/*" style="display: none;" onchange="showPreview(event)">
                                    <div class="buttons">
                                        <button type="button" class="btn btn-warning" onclick="document.getElementById('file-upload').click();">Upload file</button>
                                    </div>
                                </div>
                                <!-- Preview container -->
                                <div id="preview-container" style="display: flex; justify-content: center; align-items: center; margin-top: 20px; height: 400px; border: 1px solid #ddd; padding: 10px;">
                                </div>

                                <script>
    // Function to display an initial image from requestScope if available
    window.onload = function() {
        const initialImage = 'img/question_media/${question.media}';
        const previewContainer = document.getElementById('preview-container');

        if (initialImage) {
            const imgElement = document.createElement('img');
            imgElement.src = initialImage;
            imgElement.style.maxWidth = '100%';
            imgElement.style.maxHeight = '100%';
            previewContainer.appendChild(imgElement);
        } else {
            previewContainer.innerHTML = '<p>No file chosen yet</p>';
        }
    }

    function showPreview(event) {
        const file = event.target.files[0];
        const previewContainer = document.getElementById('preview-container');

        // Clear any previous preview
        previewContainer.innerHTML = '';

        if (file) {
            const fileType = file.type;
            let previewElement;

            // Check file type and create appropriate preview
            if (fileType.startsWith('image/')) {
                previewElement = document.createElement('img');
                previewElement.src = URL.createObjectURL(file);
                previewElement.style.maxWidth = '100%';
                previewElement.style.maxHeight = '100%';
            } else if (fileType.startsWith('video/')) {
                previewElement = document.createElement('video');
                previewElement.src = URL.createObjectURL(file);
                previewElement.controls = true;
                previewElement.style.maxWidth = '100%';
                previewElement.style.maxHeight = '100%';
            } else if (fileType.startsWith('audio/')) {
                previewElement = document.createElement('audio');
                previewElement.src = URL.createObjectURL(file);
                previewElement.controls = true;
                previewElement.style.width = '100%';
            } else {
                previewElement = document.createElement('p');
                previewElement.textContent = 'File type not supported for preview.';
            }

            previewContainer.appendChild(previewElement);
        } else {
            previewContainer.innerHTML = '<p>No file chosen yet</p>';
        }
    }
</script>
                            </div>
                        </div>

                        <!-- Answer Details Section -->
                        <div class="container" style="margin-top: 10px">
                            <div class="answer-details">
                                <h2>Answer details</h2>

                                <div class="buttons">
                                    <button class="btn btn-success" id="add-btn">Add <i class="align-middle me-2 fas fa-fw fa-plus-circle"></i></button>
                                </div>

                                <c:forEach var="a" items="${requestScope.listAnswer}">
                                    <div class="form-group">
                                        <label for="answer">Answer <span class="required-asterisk">*</span></label>
                                        <!-- Check mark icon and input -->
                                        <span class="correct-icon" style="display: ${a.isCorrect ? 'inline' : 'none'};">✔️</span>
                                        <input type="hidden" name="is_correct" class="is-correct" value="${a.isCorrect}">
                                        <!-- Answer content -->
                                        <input style="margin-bottom: 5px" type="text" id="answer" name="answer" value="${a.answer_detail}" required>
                                        <button type="button" class="btn btn-danger" onclick="deleteAnswer(this)">Delete</button>
                                        <button type="button" class="btn btn-success" onclick="markAsCorrect(this)">Mark as correct</button>
                                    </div>
                                </c:forEach>


                                <!-- Handle Check Mark -->
                                <script>
                                    document.addEventListener('DOMContentLoaded', () => {
                                    document.querySelectorAll('.form-group').forEach(formGroup => {
                                        const hiddenInput = formGroup.querySelector('.is-correct');
                                        const icon = formGroup.querySelector('.correct-icon');
                                        if (hiddenInput.value === 'true') {
                                            icon.style.display = 'inline';
                                        } else {
                                            icon.style.display = 'none';
                                        }
                                    });
                                });
                                </script>
                                <script>
                                    function markAsCorrect(button) {
                                        const parentDiv = button.closest('.form-group');
                                        const icon = parentDiv.querySelector('.correct-icon');
                                        const hiddenInput = parentDiv.querySelector('.is-correct');

                                        if (hiddenInput.value === 'false') {
                                            hiddenInput.value = 'true'; // Mark as correct
                                            icon.style.display = 'inline'; // Show the icon
                                        } else {
                                            hiddenInput.value = 'false'; // Unmark
                                            icon.style.display = 'none'; // Hide the icon
                                        }
                                    }
                                </script>

                                <!-- Generate new Answer each time user click on Add button -->
                                <script>
                                    document.getElementById('add-btn').addEventListener('click', function () {
                                        const newFormGroup = document.createElement('div');
                                        newFormGroup.classList.add('form-group');
                                        newFormGroup.innerHTML = newFormGroup.innerHTML = `
                                        <label for="answer">Answer <span class="required-asterisk">*</span></label>
                                        <span class="correct-icon" style="display:none;">✔️</span>
                                        <input type="hidden" name="is_correct" class="is-correct" value="false">
                                        <input style="margin-bottom: 5px" type="text" id="answer" name="answer" required>
                                        <button type="button" class="btn btn-danger" onclick="deleteAnswer(this)">Delete</button>
                                        <button type="button" class="btn btn-success" onclick="markAsCorrect(this)">Mark as correct</button>
                                    `;
                                        document.querySelector('.answer-details').appendChild(newFormGroup);
                                    });
                                </script>
                                
                                <!-- Delete Answer each time user click on delete button -->
                                <script>
                                    function deleteAnswer(button) {
                                        const formGroup = button.closest('.form-group');
                                        if (formGroup) {
                                            formGroup.remove(); // Removes the form group from the DOM
                                        }
                                    }
                                </script>
  
                            </div>
                        </div>
                    </form>
                </main>

                <jsp:include page="footer.jsp"/>    
            </div>
        </div>
        <jsp:include page="script.jsp"/>
    </body>


</html>





