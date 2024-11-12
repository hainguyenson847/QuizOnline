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



                            <div id="create" style="display: none;"> <!-- Initially hidden -->

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
                                        <select name="listExpert" class="form-select" id="validationDefault05" required="">
                                            <c:forEach items="${listExpert}" var="expert">
                                                <option value="${expert.account_id}">${expert.first_name} ${expert.last_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>


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


                            <div>
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <div>
                                            <h5 class="card-title">Contextual Classes</h5>
                                            <h6 class="card-subtitle text-muted">Use contextual classes to color table rows or individual cells.</h6>
                                        </div>
                                        <button class="btn btn-outline-success active" onclick="toggleForm()">Create new Dimension</button>
                                    </div>


                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th style="width:20%;">#</th>
                                                <th style="width:30%">Type</th>
                                                <th class="d-none d-md-table-cell" style="width:25%">Dimension</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listD}" var="list">
                                                <tr>
                                                    <td>${list.dimension_id}</td>
                                                    <td>${list.dimension_type_id1.dimension_type_name}</td>
                                                    <td class="d-none d-md-table-cell">${list.dimension_name}</td>
                                                    <td class="table-action">

                                                        <!-- Edit Button -->
                                                        <a href="dimension?id=${list.dimension_id}&&action=edit" class="btn btn-outline-primary btn-sm">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle">
                                                            <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                                            </svg>
                                                        </a>

                                                        <!-- Delete Button (with form) -->
                                                        <form method="post" action="dimension" class="d-inline" onsubmit="return confirmDelete()">
                                                            <input type="hidden" name="id" value="${list.dimension_id}">
                                                            <input type="hidden" name="action" value="delete">
                                                            <button type="submit" class="btn btn-outline-danger btn-sm">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle">
                                                                <polyline points="3 6 5 6 21 6"></polyline>
                                                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                                </svg>
                                                            </button>
                                                            <script type="text/javascript">
                                                                function confirmDelete() {
                                                                    return confirm("Are you sure you want to delete this dimension?");
                                                                }
                                                            </script>

                                                        </form>


                                                    </td>

                                                </tr>


                                            </c:forEach>





                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div>
                                <form action="dimension" method="post" class="row g-3">
                                    <input value="create" hidden="" name="action">
                                    <div class="col-md-4">
                                        <label for="validationDefault01" class="form-label">Lesson Topic Name</label>
                                        <input name="dimension_name" type="text" class="form-control" id="validationDefault01"  required="">
                                    </div>



                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Submit form</button>
                                    </div>
                                </form>
                            </div>


                        </div>
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
