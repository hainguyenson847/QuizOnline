

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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

                            <h1 class="h3 mb-3">Manager Account</h1>

                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-header">
                                                <h5 class="card-title mb-0">Danh sách tài khoản</h5>
                                            </div>




                                            <!-- Button to Open the Modal -->

                                            <div>
                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addAccountModal">
                                                    Add account
                                                </button>
                                            </div>

                                            <!-- The Modal -->
                                            <div class="modal fade" id="addAccountModal" tabindex="-1" aria-labelledby="addAccountModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="addAccountModalLabel">Add New Account</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <form action="managerAccount" method="post" id="addAccountForm">
                                                            <div class="modal-body">
                                                                <div class="mb-3">
                                                                    <label for="firstName" class="form-label">First Name</label>
                                                                    <input type="text" name="firstName" class="form-control" id="firstName" required>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="lastName" class="form-label">Last Name</label>
                                                                    <input type="text" name="lastName" class="form-control" id="lastName" required>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="email" class="form-label">Email</label>
                                                                    <input type="email" name="email" class="form-control" id="email" required>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="mobile" class="form-label">Mobile</label>
                                                                    <input type="text" name="mobile" class="form-control" id="mobile" required>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="gender" class="form-label">Gender</label>
                                                                    <select name="gender" class="form-select" id="gender" required>
                                                                        <option value="1">Male</option>
                                                                        <option value="0">Female</option> <!-- Changed to 0 to match your integer representation -->
                                                                    </select>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="role" class="form-label">Role</label>
                                                                    <select name="role" class="form-select" id="role" required>
                                                                        <option value="1">Customer</option>
                                                                        <option value="2">Expert</option>
                                                                        <option value="3">Sale</option>
                                                                        <option value="4">Admin</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary" id="saveAccount">Save Account</button>
                                                            </div>
                                                        </form>




                                                    </div>
                                                </div>
                                            </div>






                                            <div class="card-body">
                                                <table id="accountTable" class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Email</th>
                                                            <th>Mobile</th>
                                                            <th>Gender</th>
                                                            <th>Role</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${listAllAccount}" var="account">
                                                        <tr>
                                                            <td>${account.account_id}</td>
                                                            <td>${account.first_name}</td>
                                                            <td>${account.last_name}</td>
                                                            <td>${account.email}</td>
                                                            <td>${account.mobile}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${account.gender == true}">Male</c:when>
                                                                    <c:otherwise>Female</c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>${requestScope.accountdao.getRoleNameByRoleId(account.role_id)} </td>

                                                            <td>
                                                                <a href="userDetail?id=${account.account_id}">
                                                                    <button>ViewDetail</button>

                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <script>
            $(document).ready(function () {
                // Khởi tạo DataTable với tính năng phân trang, sắp xếp và tìm kiếm
                $('#accountTable').DataTable({
                    "paging": true,
                    "ordering": true,
                    "searching": true,
                    "pageLength": 10, // Số dòng hiển thị mỗi trang
                    "lengthMenu": [5, 10, 25, 50], // Các tùy chọn số dòng mỗi trang
                    "order": [[0, "asc"]] // Sắp xếp mặc định theo cột đầu tiên (ID)
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
