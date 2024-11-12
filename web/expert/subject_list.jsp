
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
            table tbody tr:hover {
                background-color: #f5f5f5; /* Light gray background */
                cursor: pointer; /* Change cursor to pointer */
            }
        </style>

        <!-- jQuery (Required for DataTables) -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

        <script>
            $(document).ready(function () {
    // Initialize DataTable
    $('#questionTable').DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true
    });

    // Click event for table rows
    $('#questionTable tbody').on('click', 'tr', function (e) {
        // Exclude buttons from triggering the row click
        if (!$(e.target).closest('button').length) { 
            var href = $(this).data('href'); // Get the data-href attribute
            if (href) {
                window.location.href = href;  // Redirect to the URL in data-href
            }
        }
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

                    <div class="header">
                        <h1>Subject List</h1>
                    </div>
                    <div class="container">

                        <table id="questionTable" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Subject Name</th>
                                    <th>Category</th>
                                    <th>Number of lesson</th>
                                    <th>Status</th>
                                    <th>Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="subject" items="${requestScope.listSubject}">
                                    <tr style="cursor: pointer;">
                                        <td>${subject.subjectId}</td>
                                        <td>${subject.subjectName}</td>
                                        <td>${subject.getCategory(requestScope.cdao).getCategory_name()}</td>
                                        <td>${requestScope.sdao.getNumberOfLessonsBySubject(subject.subjectId)}</td>
                                        <c:if test="${subject.status == true}">
                                            <td style="width: 120px"><span class="status status-published">Published</span></td>
                                        </c:if>
                                        <c:if test="${subject.status == false}">
                                            <td style="width: 120px"><span class="status status-unpublished">UnPublished</span></td>
                                        </c:if>    
                                        <td style="width: 50px">
                                            <button type="button" class="btn btn-danger" onclick="window.location.href = 'listlesson?subjectId=${subject.subjectId}'"><i class="align-middle fas fa-eye"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <!-- More rows can be added here -->
                            </tbody>
                        </table>
                    </div>
                </main>

                <jsp:include page="footer.jsp"/>    
            </div>
        </div>
        <jsp:include page="script.jsp"/>
    </body>

</html>