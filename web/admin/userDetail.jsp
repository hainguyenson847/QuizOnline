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
        </script></head>
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
<!-- Bootstrap Alerts -->
<div class="container mt-3">
    <!-- Success Message -->
    <c:if test="${not empty mess}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${mess}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Error Message -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
</div>
                            <h1 class="h3 mb-3">Profile</h1>

                            <div class="row">
                                <div class="col-md-12 col-xl-12">
                                    <div class="card mb-3">
                                        <div class="card-header">
                                            <h5 class="card-title mb-0">Thông tin cá nhân</h5>
                                        </div>
                                        <div class="card-body text-center">
                                            <img src="${account.avatar}" alt="${account.avatar}" class="img-fluid rounded-circle mb-2" width="128" height="128" />
                                        <h5 class="card-title mb-0">${account.first_name} ${account.last_name}</h5>
                                        <div class="text-muted mb-2">${account.role_id1.role_name}</div>
                                        <div class="text-muted mb-2">${account.status}</div>

                                      <div>
                                        <a class="btn btn-primary btn-sm" href="#">Follow</a>
                                        <a class="btn btn-danger btn-sm" href="#" data-bs-toggle="modal" data-bs-target="#banModal">
                                            <span data-feather="ban"></span> ${account.status == 'ban' ? 'Unban' : 'Ban'}
                                        </a>
                                    </div>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body">
                                        <h5 class="h6 card-title">Skill</h5>
                                        <a href="#" class="badge bg-primary me-1 my-1">HTML</a>
                                        <a href="#" class="badge bg-primary me-1 my-1">JavaScript</a>
                                        <a href="#" class="badge bg-primary me-1 my-1">Sass</a>
                                        <a href="#" class="badge bg-primary me-1 my-1">Angular</a>
                                        <a href="#" class="badge bg-primary me-1 my-1">Vue</a>
                                        <a href="#" class="badge bg-primary me-1 my-1">React</a>
                                        <a href="#" class="badge bg-primary me-1 my-1">Redux</a>
                                        <a href="#" class="badge bg-primary me-1 my-1">UI</a>
                                        <a href="#" class="badge bg-primary me-1 my-1">UX</a>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body">
                                        <h5 class="h6 card-title">Infomation</h5>
                                        <ul class="list-unstyled mb-0">
                                            <li class="mb-1"><span data-feather="home" class="feather-sm me-1"></span>${account.email}</li>
                                            <li class="mb-1"><span data-feather="briefcase" class="feather-sm me-1"></span> ${account.mobile}</li>
                                        </ul>
                                    </div>
                                    <hr class="my-0" />

                                </div>
                            </div>
                        </div>


                    </div>
                </main>


                <!-- Modal -->
                <div class="modal fade" id="banModal" tabindex="-1" aria-labelledby="banModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="banModalLabel">Confirm the Ban</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              
                                
                              <div class="modal-body">
    Are you sure you want to ${account.status == 'ban' ? 'unban' : 'ban'} this user?
</div>

                            </div>
                            <form action="userDetail" method="post">
                                <div class="modal-footer">
                                    <input value="${account.account_id}" name="account_id" hidden="">
                                    <input value="${account.status}" name="status" hidden="">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-danger" id="confirmBan">${account.status == 'ban' ? 'Unban' : 'Ban'}</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
               


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
