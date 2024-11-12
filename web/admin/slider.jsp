

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
                                        <br>
                                        <br>
                                        <a href="addSlider">
                                             <button class="btn btn-primary">
                                            AddNewSlider
                                        </button>
                                        </a>
                                        <h1 class="my-4">List of Sliders</h1>
                                        <table id="sliderTable" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Image</th>
                                                    <th>Link</th>
                                                    <th>Title</th>
                                                    <th>Details</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="slider" items="${sliderList}">
                                                    <tr>
                                                        <td>${slider.slider_id}</td>
                                                        <td><img src="${slider.slider_image}" alt="Slider Image" width="100"></td>
                                                        <td><a href="${slider.slider_link}" target="_blank">${slider.slider_link}</a></td>
                                                        <td>${slider.slider_title}</td>
                                                        <td>${slider.slider_detail}</td>

                                                        <td>
                                                            <!-- Nút Edit -->
                                                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editSliderModal${slider.slider_id}">
                                                                Edit
                                                            </button>

                                                            <!-- Nút Delete -->
                                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteSliderModal${slider.slider_id}">
                                                                Delete
                                                            </button>
                                                        </td>


                                                        <!-- Modal -->
                                                <div class="modal fade" id="editSliderModal${slider.slider_id}" tabindex="-1" aria-labelledby="editSliderModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="editSliderModalLabel">Edit Slider</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <form action="slider" method="post">
                                                                <div class="modal-body">
                                                                    <!-- Form để chỉnh sửa slider -->
                                                                    <input type="text" hidden="" name="action" value="edit"> <!-- Đặt name cho action -->

                                                                    <div class="mb-3">
                                                                        <label for="sliderId" class="form-label">Slider ID</label>
                                                                        <input type="text" class="form-control" id="sliderId" name="slider_id" placeholder="Enter slider ID" value="${slider.slider_id}">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="slider_image" class="form-label">Slider Image</label>
                                                                        <input type="text" class="form-control" id="slider_image" name="slider_image" placeholder="Enter slider Image" value="${slider.slider_image}">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="sliderTitle" class="form-label">Slider Title</label>
                                                                        <input type="text" class="form-control" id="sliderTitle" name="slider_title" placeholder="Enter slider title" value="${slider.slider_title}">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="sliderLink" class="form-label">Slider Link</label>
                                                                        <input type="text" class="form-control" id="sliderLink" name="slider_link" placeholder="Enter slider link" value="${slider.slider_link}">
                                                                    </div>
                                                                    <div class="mb-3">
                                                                        <label for="sliderDetail" class="form-label">Slider Detail</label>
                                                                        <textarea class="form-control" id="sliderDetail" name="slider_detail" rows="3" placeholder="Enter slider detail">${slider.slider_detail}</textarea>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                                </div>
                                                            </form>



                                                        </div>
                                                    </div>
                                                </div>






                                                <!-- Modal for Delete Confirmation -->
                                                <div class="modal fade" id="deleteSliderModal${slider.slider_id}" tabindex="-1" aria-labelledby="deleteSliderModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="deleteSliderModalLabel">Delete Slider</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Are you sure you want to delete this slider?
                                                            </div>
                                                            <form action="slider" method="post">
                                                                    <input type="text" hidden="" name="action" value="delete"> <!-- Đặt name cho action -->
                                                                    <input type="text" name="slider_id" hidden="" value="${slider.slider_id}">

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                    <button type="submit" class="btn btn-danger">Delete</button>
                                                                </div>
                                                                <form/>

                                                        </div>
                                                    </div>
                                                </div>







                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>











                                </div>
                            </div>
                        </div>

                    </div>
                </main>



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
                        "lengthMenu": " _MENU_",
                        "info": "Hiển thị từ _START_ đến _END_ của _TOTAL_ hàng"
                    }
                });
            });
                </script>





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
