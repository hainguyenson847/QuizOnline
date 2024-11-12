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
                                        <button class="btn btn-outline-success active">Overview</button>
                                        <a href="price-package">
                                            <button class="btn btn-outline-success">Price Package</button>

                                        </a>
                                        <a href="dimension">
                                            <button class="btn btn-outline-success">Dimension</button>
                                        </a>  
                                    </h5>
                                    <h6 class="card-subtitle text-muted"></h6>
                                </div>

                                <div class="card-body">
                                    <form action="subject-details" method="post"  enctype="multipart/form-data">
                                        <div class="row">
                                            <!-- First column: col-md-7 -->
                                            <div class="col-md-7">
                                                <div class="card bg-light py-2 py-md-3 border">
                                                    <div class="card-body">
                                                        <div>
                                                            <h5>Subject Name</h5>
                                                            <div class="card">
                                                                <div class="card-body">
                                                                    <input type="text" name="subjectName" class="form-control" placeholder="Write subject name here..." required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <h5>Subject Category</h5>
                                                            <div class="card">
                                                                <div class="card-body">
                                                                    <select name="subjectCategory" class="form-control mb-3" required>
                                                                        <option selected disabled>Select subject Category</option>

                                                                        <!-- Assume 'categories' is the list of SubjectCategory objects -->
                                                                    <c:forEach var="category" items="${listCategory}">
                                                                        <option value="${category.category_id}">${category.category_name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="card bg-light py-2 py-md-3 border">
                                                                    <div class="card-body">
                                                                        <h5>Featured</h5>
                                                                        <div class="form-check form-switch">
                                                                            <label class="form-check-label" for="flexSwitchCheckDefault">Featured subject</label>
                                                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name="featured">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="card bg-light py-2 py-md-3 border">
                                                                    <div class="card-body">
                                                                        <h5>Status</h5>
                                                                        <select name="status" class="form-control mb-3" required>
                                                                            <option selected disabled>Select Status</option>
                                                                            <option value="1">Active</option>
                                                                            <option value="0">Inactive</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Second column: col-md-5 -->
                                        <div class="col-md-5 text-center">
                                            <div class="card">
                                                <img id="imagePreview" class="card-img-top" src="img/photos/unsplash-2.jpg" alt="Unsplash">
                                                <div class="card-header">
                                                    <h5 class="card-title mb-0">Image</h5>
                                                </div>
                                                <div class="card-body">
                                                    <input type="file" name="image" class="form-control-file" accept="image/*" required onchange="previewImage(event)">
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            function previewImage(event) {
                                                const file = event.target.files[0];
                                                const preview = document.getElementById('imagePreview');

                                                if (file) {
                                                    const reader = new FileReader();

                                                    reader.onload = function (e) {
                                                        preview.src = e.target.result;
                                                    }

                                                    reader.readAsDataURL(file);
                                                }
                                            }
                                        </script>


                                    </div>

                                    <div class="card bg-light py-2 py-md-3 border">
                                        <div class="card-body">
                                            <div>
                                                <h5>Description</h5>
                                                <div class="card">
                                                    <div class="card-body">
                                                        <textarea name="description" class="form-control" rows="2" placeholder="Enter Description" required></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card bg-light py-2 py-md-3 border">
                                        <div class="card-body">
                                            <div>
                                                <h5>Tag line </h5>
                                                <div class="card">
                                                    <div class="card-body">
                                                        <input type="text" name="tagLine" class="form-control" placeholder="Write tag here..." required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card bg-light py-2 py-md-3 border">
                                        <div class="card-body">
                                            <div class="card-body">
                                                <h5 style="font-size: 20px; font-weight: bold;">Assigned Expert</h5>
                                                <div>
                                                    <h6>Expert's Name:</h6>

                                                    <select name="listExpert" class="form-select" id="validationDefault05" required="">
                                                        <c:forEach items="${listExpert}" var="listType">
                                                            <option value="${listType.account_id}">${listType.first_name} ${listType.last_name}</option>
                                                        </c:forEach>
                                                    </select>

                                        </div>
                                    </div>

                                    <div>
                                        <button type="button" class="btn btn-pill btn-success" data-bs-toggle="modal" data-bs-target="#confirmationModal">Submit</button>
                                    </div>


                                    <!-- Bootstrap Modal -->
                                    <div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmationModalLabel">Confirm Changes</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Are you sure you want to save changes?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <button type="submit" class="btn btn-primary" id="confirmSubmit">Save Changes</button>
                                                </div>
                                            </div>
                                        </div>
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
