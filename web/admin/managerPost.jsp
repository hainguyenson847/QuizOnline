

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


                                    <!-- jQuery library -->
                                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

                                    <!-- DataTables CSS -->
                                    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

                                    <!-- DataTables JS -->
                                    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>


                                    <div class="container">
                                        <br><br>
                                        <a href="listBlogAdmin?action=create">
                                            <button class="btn btn-primary">Add new Blog</button>
                                        </a>

                                        <h1 class="my-4">List of Blog</h1>
                                        <table id="sliderTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Title</th>
                                                    <th>Thumbnail</th>
                                                    <th>Created Date</th>
                                                    <th>Summary</th>
                                                    <th>Status</th>
                                                    <th>Category</th>
                                                    <th>Author</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="post" items="${listPost}">
                                                    <tr>
                                                        <td>${post.blog_id}</td>
                                                        <td>${post.blog_title}</td>
                                                        <td><img src="${post.thumbnail}" alt="Thumbnail" style="width: 100px;"></td>
                                                        <td>${post.created_date}</td>
                                                        <td>${post.blog_summary}</td>
                                                        <td>${post.status ? 'Active' : 'Inactive'}</td>
                                                        <td>${post.category_id}</td>
                                                        <td>${post.account_id}</td>
                                                        <td>
                                                            <a href="listBlogAdmin?action=edit&&id=${post.blog_id}" class="btn btn-warning">Edit</a>
                                                            <button onclick="confirmDelete(${post.blog_id})" class="btn btn-danger">Delete</button>
                                                        </td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <script>
                                        function confirmDelete(blogId) {
                                            const userConfirmed = confirm("Bạn có chắc chắn muốn xóa blog này không?");
                                            if (userConfirmed) {
                                                window.location.href = 'listBlogAdmin?action=delete&id=' + blogId;
                                            }
                                        }
                                    </script>

                                    <script>
                                        $(document).ready(function () {
                                            $('#sliderTable').DataTable({
                                                "paging": true, // Phân trang
                                                "searching": true, // Tìm kiếm
                                                "ordering": true, // Sắp xếp
                                                "info": true, // Thông tin
                                                "pageLength": 5, // Số hàng hiển thị trên mỗi trang
                                                "lengthMenu": [5, 10, 25, 50], // Các tùy chọn số lượng hàng trên mỗi trang
                                                "language": {
                                                    "search": "Search:",
                                                    "paginate": {
                                                        "previous": "Trước",
                                                        "next": "Sau"
                                                    },
                                                    "lengthMenu": "Hiển thị _MENU_ hàng trên mỗi trang",
                                                    "info": "Hiển thị _START_ đến _END_ trong tổng số _TOTAL_ mục",
                                                    "infoEmpty": "Không có mục nào để hiển thị",
                                                    "zeroRecords": "Không tìm thấy kết quả phù hợp"
                                                }
                                            });
                                        });
                                    </script>












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
