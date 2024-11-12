

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>



    </head>
    <!--
      HOW TO USE: 
      data-theme: default (default), dark, light, colored
      data-layout: fluid (default), boxed
      data-sidebar-position: left (default), right
      data-sidebar-layout: default (default), compact
    -->

    <body data-theme="default" data-layout="fluid" data-sidebar-position="left" data-sidebar-layout="default">
        <div class="wrapper">
            <jsp:include page="admin_sidebar.jsp"></jsp:include>


                <div class="main">
                <jsp:include page="navbar.jsp"></jsp:include>


                    <main class="content">
                        <div class="container-fluid p-0">

                            <!-- Toast Container -->
                            <div aria-live="polite" aria-atomic="true" style="position: relative; z-index: 1;">
                                <div class="toast-container position-fixed top-0 end-0 p-3">
                                <c:if test="${not empty mess}">
                                    <div id="successToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                                        <div class="toast-header">
                                            <strong class="me-auto">Thông báo</strong>
                                            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                        </div>
                                        <div class="toast-body">
                                            ${mess}
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${not empty error}">
                                    <div id="errorToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                                        <div class="toast-header">
                                            <strong class="me-auto">Lỗi</strong>
                                            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                        </div>
                                        <div class="toast-body">
                                            ${error}
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const successToast = document.getElementById('successToast');
                const errorToast = document.getElementById('errorToast');

                if (successToast) {
                    const toast = new bootstrap.Toast(successToast);
                    toast.show();
                    setTimeout(() => {
                        toast.hide();
                    }, 5000);
                }

                if (errorToast) {
                    const toast = new bootstrap.Toast(errorToast);
                    toast.show();
                    setTimeout(() => {
                        toast.hide();
                    }, 5000);
                }
            });
                        </script>

                        <div class="row">
                            <div class="col-12">
                                <div class="card">




                                    <div class="container">
                                        <h1 class="my-4">Create New Blog</h1>

                                        <form action="listBlogAdmin" method="post" enctype="multipart/form-data">
                                            <input name="action" hidden="" value="create">
                                            <div class="form-group">
                                                <label for="title">Blog Title</label>
                                                <input type="text" class="form-control" id="title" name="blog_title" placeholder="Enter blog title" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="thumbnail">Thumbnail</label>
                                                <input type="file" class="form-control-file" id="thumbnail" name="thumbnail" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="summary">Summary</label>
                                                <textarea class="form-control" id="summary" name="blog_summary" rows="3" placeholder="Enter blog summary" required></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="content">Content</label>
                                                <textarea class="form-control" id="content" name="blog_content" rows="6" placeholder="Enter blog content" required></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="status">Status</label>
                                                <select class="form-control" id="status" name="status">
                                                    <option value="true">Active</option>
                                                    <option value="false">Inactive</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="category">Category</label>
                                                <select class="form-control" id="category" name="category_id" required>
                                                    <c:forEach var="category" items="${listCategry}">
                                                        <option value="${category.category_id}">${category.category_name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                           

                                            <button type="submit" class="btn btn-primary">Create Blog</button>
                                        </form>
                                    </div>






                                </div>
                            </div>
                        </div>

                    </div>
                </main>







                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row text-muted">
                            <div class="col-6 text-start">
                                <p class="mb-0">
                                    <a href="https://adminkit.io/" target="_blank" class="text-muted"><strong>AdminKit</strong></a> &copy;
                                </p>
                            </div>
                            <div class="col-6 text-end">
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Support</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Help Center</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Privacy</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="text-muted" href="#">Terms</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>
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
        </script></body>

</html>
