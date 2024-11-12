
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="head.jsp" />

        <!-- DataTables CSS -->
        <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">

        <style>

            .container {
                max-width: 1200px;
                margin: 0 auto;
                background-color: white;
                border-radius: 8px;
                padding: 20px;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding-bottom: 15px;
            }

            .header h1 {
                font-size: 24px;
                color: #333;
            }

            .header nav button {
                margin-left: 10px;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn-blue {
                background-color: #007bff;
                color: white;
            }

            .btn-orange {
                background-color: #ff5722;
                color: white;
            }

            .tab-menu {
                display: flex;
                border-bottom: 2px solid #ccc;
                margin-bottom: 20px;
            }

            .tab-menu button {
                flex: 1;
                padding: 10px;
                background-color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
                color: #666;
                border-bottom: 4px solid transparent;
            }

            .tab-menu button.active {
                color: #5a2fc2;
                font-weight: bold;
                border-bottom-color: #5a2fc2;
            }

            .status {
                padding: 5px 10px;
                border-radius: 12px;
                font-size: 14px;
                text-align: center;
            }

            .status-published {
                background-color: #d4edda;
                color: #155724;
            }

            .status-unpublished {
                background-color: #f8d7da;
                color: #721c24;
            }
            #success-message {
                display: none;
            }
            #fail-message {
                display: none;
            }
            #importfail {
                display: none;
            }
            #importsuccess {
                display: none;
            }
        </style>

        <!-- jQuery (Required for DataTables) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#questionTable').DataTable({
                    "paging": true,
                    "searching": true,
                    "ordering": true,
                    "info": true
                });
            });
        </script>
    </head>

    <body data-theme="default" data-layout="fluid" data-sidebar-position="left" data-sidebar-layout="default">
        <div class="wrapper">
            <jsp:include page="expert_sidebar.jsp" />

            <div class="main">
                <jsp:include page="navbar.jsp"/>

                <main class="content">
                    <div id="success-message" class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    <div class="alert-message">
                        <strong>Changes saved! </strong>Quiz have been deleted
                    </div>
                </div>
                <div id="fail-message" class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        <div class="alert-message" style="background-color: red; color: white">
                            <strong>Can not Delete! </strong>This question is activated in another quiz!
                        </div>
                    </div>
                    <div id="importfail" class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        <div class="alert-message" style="background-color: red; color: white">
                            <strong>Import failed! </strong>Make sure you follow the template
                        </div>
                    </div>
                    <div id="importsuccess" class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    <div class="alert-message">
                        <strong>Import questions successful! </strong>
                    </div>
                </div>
                <script>
                <script>
                        document.addEventListener('DOMContentLoaded', (event) => {
                            let showMessageSuccess = ${requestScope.showSuccessMessage};
                            let message = document.getElementById('success-message');

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
                <script>
                        document.addEventListener('DOMContentLoaded', (event) => {
                            let showMessageSuccess = ${requestScope.showFailMessage};
                            let message = document.getElementById('fail-message');

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
                    <script>
                        document.addEventListener('DOMContentLoaded', (event) => {
                            let showImportFail = ${requestScope.importfail};
                            let message = document.getElementById('importfail');

                            if (showImportFail) {
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
                            <script>
                        document.addEventListener('DOMContentLoaded', (event) => {
                            let showImportSuccess = ${requestScope.importsuccess};
                            let message = document.getElementById('importsuccess');

                            if (showImportSuccess) {
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
                        <h1>Question List</h1>
                        <nav>
                            <button onclick="$('#importModal').modal('show');" class="btn btn-success">Question Import <i class="align-middle me-2 fas fa-fw fa-file-excel"></i></button>
                            <button onclick="window.location.href = 'question_detail_validation'" class="btn btn-orange">New Question <i class="align-middle me-2 fas fa-fw fa-plus-circle"></i></button>
                        </nav>
                    </div>
                    <div class="container">

                        <table id="questionTable" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Content</th>
                                    <th>Subject</th>
                                    <th>Level</th>
                                    <th>Status</th>
                                    <th>Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="question" items="${requestScope.listQuestion}">
                                    <tr>
                                        <td>${question.question_id}</td>
                                        <td>${question.question_content}</td>
                                        <td>${question.getSubject(requestScope.dao).getSubjectName()}</td>
                                        <td>${question.getLevel(requestScope.dao).getLevel_name()}</td>
                                        <c:if test="${question.status == true}">
                                            <td style="width: 120px"><span class="status status-published">Active</span></td>
                                        </c:if>
                                        <c:if test="${question.status == false}">
                                            <td style="width: 120px"><span class="status status-unpublished">InActive</span></td>
                                        </c:if>    
                                        <td style="width: 120px">
                                            <button type="button" class="btn btn-success" onclick="window.location.href='editquestionvalidation?question_id=${question.question_id}'"><i class="align-middle me-2 fas fa-fw fa-edit"></i></button>
                                            <button type="button" class="btn btn-danger" onclick="if(confirm('Are you sure you want to delete this question?')) { window.location.href='deletequestion?question_id=${question.question_id}'; }"><i class="align-middle me-2 fas fa-fw fa-trash-alt"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <!-- More rows can be added here -->
                            </tbody>
                        </table>
                    </div>
                    <!-- Import Modal -->
                    <div class="modal fade" id="importModal" tabindex="-1" aria-labelledby="importModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="importModalLabel">Import Questions</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Download link added here -->
                                    <a href="template/Sample.xlsx" download class="btn btn-secondary mb-3">
                                        Download Sample Excel File
                                    </a>

                                    <!-- Form for uploading file -->
                                    <form id="importForm" method="post" action="import" enctype="multipart/form-data">
                                        <div class="mb-3">
                                            <label for="fileInput" class="form-label">Select Excel File</label>
                                            <input type="file" class="form-control" id="fileInput" name="file" accept=".xls,.xlsx" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Upload</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                            </main>

                            <jsp:include page="footer.jsp"/>    
            </div>
        </div>
        <jsp:include page="script.jsp"/>
    </body>

</html>