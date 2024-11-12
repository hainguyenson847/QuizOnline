<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
        <meta name="author" content="AdminKit">
        <meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="shortcut icon" href="img/icons/icon-48x48.png" />

        <link rel="canonical" href="pages-blank.html" />

        <title>Blank Page | AdminKit Demo</title>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&amp;display=swap" rel="stylesheet">

        <!-- Choose your prefered color scheme -->
        <!-- <link href="css/light.css" rel="stylesheet"> -->
        <!-- <link href="css/dark.css" rel="stylesheet"> -->

        <!-- BEGIN SETTINGS -->
        <!-- Remove this after purchasing -->
        <link class="js-stylesheet" href="css/light.css" rel="stylesheet">
        <script src="js/settings.js"></script>
        <style>body {
                opacity: 0;
            }
        </style>
        <!-- END SETTINGS -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-120946860-10"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-120946860-10', {'anonymize_ip': true});
        </script>
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>


    </head>

    <body data-theme="default" data-layout="fluid" data-sidebar-position="left" data-sidebar-layout="default">
        <div class="wrapper">
            <jsp:include page="admin_sidebar.jsp"></jsp:include>

                <div class="main">
                <jsp:include page="navbar.jsp"></jsp:include>

                    <main class="content">
                        <div class="container-fluid p-0">
                            <h1 class="h3 mb-3">Subject Detail 
                                <button class="btn btn-outline-primary">View Lesson</button>
                            </h1>

                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title">
                                        <a href="subject-details">
                                            <button class="btn btn-outline-success ">Overview</button>
                                        </a>  
                                        <a href="price-package">
                                            <button class="btn btn-outline-success">Price Package</button>

                                        </a>   
                                        <a href="dimension">
                                            <button class="btn btn-outline-success active">Dimension</button>
                                        </a>  
                                    </h5>
                                    <h6 class="card-subtitle text-muted"></h6>
                                </div>




                            <c:if test="${action == 'edit'}">
                                <c:if test="${empty messfordimension && empty error}">




                                    <form action="dimension" method="post" class="row g-3">

                                        <input value="${dimension.dimension_id}" hidden="" name="id">
                                        <input value="${action}" hidden="" name="action">
                                        <div class="col-md-4">
                                            <label for="validationDefault01" class="form-label">Dimension Name</label>
                                            <input name="dimension_name" type="text" class="form-control" id="validationDefault01" value="${dimension.dimension_name}" required="">
                                        </div>



                                        <div class="col-md-3">
                                            <label for="validationDefault04" class="form-label">State</label>
                                            <select name="dimension_type_id" class="form-select" id="validationDefault04" required="">
                                                <option  value="${dimension.dimension_type_id1.dimension_type_id}">${dimension.dimension_type_id1.dimension_type_name}</option>
                                                <c:forEach items="${listDimensionType}" var="listType">
                                                    <option value="${listType.dimension_type_id}">${listType.dimension_type_name}</option>
                                                </c:forEach>


                                            </select>
                                        </div>


                                        <div class="col-12">
                                            <button class="btn btn-primary" type="submit">Submit form</button>
                                        </div>
                                    </form>
                                </c:if>

                                <!--                            </div>-->
                            </c:if>
                            <div class="container mt-3">
                                <!-- Success message -->
                                <c:if test="${not empty messfordimension}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        ${messfordimension}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>

                                <!-- Error message -->
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        ${error}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>
                            </div>



                            <div    > <!-- Initially hidden -->

                                <form action="dimension" method="post" class="row g-3">
                                    <input value="create" hidden="" name="action">
                                    <div class="col-md-4">
                                        <label for="validationDefault01" class="form-label">Dimension Name</label>
                                        <input name="dimension_name" type="text" class="form-control" id="validationDefault01"  required="">
                                    </div>



                                    <div class="col-md-3">
                                        <label for="validationDefault04" class="form-label">Type</label>
                                        <select name="dimension_type_id" class="form-select" id="validationDefault04" required="">
                                            <c:forEach items="${listDimensionType}" var="listType">
                                                <option value="${listType.dimension_type_id}">${listType.dimension_type_name}</option>
                                            </c:forEach>


                                        </select>
                                    </div>


                                    <div class="col-md-3">
                                        <label for="validationDefault05" class="form-label">Subject</label>
                                        <input name="subjectNamefordimension" value="${requestScope.subjectNamefordimension}" type="text" class="form-control"  >
                                        <input name="subject_id" value="${maxid}" type="text" class="form-control"  hidden>

                                    </div>


                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Submit form</button>
                                    </div>
                                </form>
                            </div>

                            <div class="container mt-3">
                                <!-- Success message -->
                                <c:if test="${not empty messforlessontopic}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        ${messforlessontopic}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>

                                <!-- Error message -->
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        ${error}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>
                            </div>

                            <div> <!-- Initially hidden -->
                                <form action="adminaddlessontopic" method="post" class="row g-3">
                                    <input value="create" type="hidden" name="action">

                                    <!-- Lesson Topic Name Input -->
                                    <div class="col-md-4">
                                        <label for="lessonTopicName" class="form-label">Lesson Topic Name</label>
                                        <input name="lesson_topic_name" type="text" class="form-control" id="lessonTopicName" required>
                                    </div>

                                    <!-- Subject Name and ID (Hidden) -->
                                    <div class="col-md-3">
                                        <label for="subjectName" class="form-label">Subject</label>
                                        <input name="subjectNameforlessontopic" value="${requestScope.subjectNameforlessontopic}" type="text" class="form-control" id="subjectName" >
                                        <input name="subject_id" value="${maxid}" type="hidden">
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Submit form</button>
                                    </div>
                                </form>
                            </div>


                            <script>
            function toggleForm() {
                var formDiv = document.getElementById("create");
                if (formDiv.style.display === "none") {
                    formDiv.style.display = "block"; // Show the form
                } else {
                    formDiv.style.display = "none"; // Hide the form
                }
            }
                            </script>



                        </div>
                </main>



            </div>
        </div>
        <script src="js/app.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                setTimeout(function () {
                    if (localStorage.getItem('popState') !== 'shown') {
                        window.notyf.open({
                            type: "success",
                            message: "Get access to all 500+ components and 45+ pages with AdminKit PRO. <u><a class=\"text-white\" href=\"https://adminkit.io/pricing\" target=\"_blank\">More info</a></u> 🚀",
                            duration: 10000,
                            ripple: true,
                            dismissible: false,
                            position: {
                                x: "left",
                                y: "bottom"
                            }
                        });

                        localStorage.setItem('popState', 'shown');
                    }
                }, 15000);
            });
        </script>
    </body>

</html>
