<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
        <script src="https://kit.fontawesome.com/f36b960bbe.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <!-- PAGE TITLE HERE ============================================= -->
        <title>EduChamp : Education HTML Template </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
        <style>
            .popup {
                display: none;
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.7);
                justify-content: center;
                align-items: center;
            }
            .popup-content {
                background: white;
                padding: 20px;
                border-radius: 5px;
                text-align: center;
                max-width: 400px;
                margin: auto;
            }


        </style>

    </head>

    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <header class="header rs-nav header-transparent">
                <!-- login -->
                <%@include file="login.jsp" %>
                <!-- register     -->
                <%@include file="register.jsp" %>

                <%@include file="header.html" %>

                <%@include file="requestPassword.jsp" %>

            </header>
            <!-- header END ==== -->
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner2.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Blog List </h1>
                        </div>
                    </div>
                </div>

                <!-- contact area -->
                <div class="content-block">
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">

                                <!-- Left part start -->
                                <div class="col-lg-8">
                                    <div class="sort-options" >
                                        <form method="get" action="blog_list" style="display: flex; align-items: center; width: 100%;">
                                            <label for="sortBy" style="margin-right: 10px; white-space: nowrap;">Sort by:</label>
                                            <div  >
                                                <label style="margin-right: 10px" >
                                                    <input type="radio" name="sortBy" value="hottest" ${param.sort == 'hottest' ? 'checked' : ''} onchange="this.form.submit()"> Hottest
                                                </label>
                                                <label style="margin-right: 10px" >
                                                    <input type="radio" name="sortBy" value="latest" ${param.sort == 'latest' ? 'checked' : ''} onchange="this.form.submit()"> Latest
                                                </label>
                                                <label>
                                                    <input type="radio" name="sortBy" value="oldest" ${param.sort == 'oldest' ? 'checked' : ''} onchange="this.form.submit()"> Oldest
                                                </label>
                                            </div>
                                        </form>
                                    </div>

                                    <c:forEach items="${requestScope.post_list}" var="c" varStatus="status">
                                        <c:if test="${param.keyword == null || (c.blog_content.contains(param.keyword) || c.blog_summary.contains(param.keyword))}">
                                            <div class="blog-post blog-md clearfix">
                                                <div class="ttr-post-media">
                                                    <a href="blog_detail?blog_id=${c.blog_id}"><img src="${c.thumbnail}" alt=""></a>
                                                </div>
                                                <div class="ttr-post-info">
                                                    <ul class="media-post">
                                                        <li><a href="#"><i class="fa fa-calendar"></i>${c.created_date}</a></li>
                                                        <li><a href="#"><i class="fa fa-user"></i>By ${account_list[status.index].first_name} ${account_list[status.index].last_name}</a></li>
                                                    </ul>
                                                    <h5 class="post-title"><a href="blog_detail?blog_id=${c.blog_id}">${c.blog_title}</a></h5>
                                                    <p>${c.blog_summary}</p>
                                                    <div class="post-extra">
                                                        <a href="blog_detail?blog_id=${c.blog_id}" class="btn-link">READ MORE</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>


                                    <!-- Pagination start -->
                                    <div class="col-lg-12 m-b20">
                                        <div class="pagination-bx rounded-sm gray clearfix" style="text-align: center;">
                                            <ul class="pagination" style="display: flex; justify-content: center; align-items: center;">
                                                <li class="previous"><a href="#"><i class="ti-arrow-left"></i> Prev</a></li>
                                                <li class="active"><a href="#">1</a></li>
                                                <li class="next"><a href="#">Next <i class="ti-arrow-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Pagination END -->
                                </div>
                                <!-- Left part END -->
                                <!-- Side bar start -->
                                <div class="col-lg-4 sticky-top">
                                    <aside class="side-bar sticky-top">
                                        <div class="widget">
                                            <h6 class="widget-title">Search</h6>
                                            <div class="search-bx style-1">
                                                <form role="search" method="get" action="blog_list">
                                                    <div class="input-group">
                                                        <input name="keyword" value="${param.keyword != null ? param.keyword : ''}" class="form-control" placeholder="Enter your keywords..." type="text" id="output" style="width: 80%;">
                                                        <span class="input-group-btn">
                                                            <button type="submit" class="fa fa-search text-primary"></button>
                                                        </span>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                        <div class="widget widget_tag_cloud">
                                            <h6 class="widget-title">Categories</h6>
                                            <div class="search-bx style-1">
                                                <form role="search" method="get" action="searchByCategory"> <!-- ??m b?o ?i?u này tr? ??n endpoint chính xác -->
                                                    <div class="input-group">
                                                        <input name="text" class="form-control" placeholder="Enter your keywords..." type="text" id="output">
                                                        <input name="category" type="hidden" value="${param.category != null ? param.category : ''}">
                                                        <input name="view" type="hidden" value="blogs"> <!-- ??t view là blogs -->
                                                        <span class="input-group-btn">
                                                            <button type="submit" class="fa fa-search text-primary"></button>
                                                        </span>
                                                    </div>
                                                </form>
                                            </div>


                                            <br>
                                            <!-- Danh sách các categories -->
                                           <form role="search" method="get" action="searchByCategory" id="category_form"> <!-- ??m b?o ?i?u n�y tr? ??n endpoint ch�nh x�c -->
                                            <div class="category-list" style="margin-bottom: 20px;">
                                                <c:forEach items="${requestScope.category_list}" var="c">
                                                    <div style="margin-bottom: 10px;">
                                                        <input type="checkbox" id="category_${c.category_id}" name="categories" value="${c.category_name}" onclick="SearchByCategory()">
                                                        <label for="category_${c.category_id}" style="font-size: 16px; margin-left: 8px;">${c.category_name}</label>
                                                        <input type="text" value="blogs" name="view" hidden>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            </form>
                                            <!-- Nút tìm ki?m -->
                                        </div>
                                        <br>
                                        <div class="widget recent-posts-entry">
                                            <h6 class="widget-title">Hottest Posts</h6>
                                            <div class="widget-post-bx">
                                                <!-- thêm danh sách các bài post hot nhat-->
                                                <c:forEach items="${requestScope.hottest_post_list}" var="c">
                                                    <div class="widget-post clearfix">
                                                        <div class="ttr-post-media"> <img src="${c.thumbnail}" width="200" height="143" alt=""> </div>
                                                        <div class="ttr-post-info">
                                                            <div class="ttr-post-header">
                                                                <h6 class="post-title"><a href="blog_detail?blog_id=${c.blog_id}">${c.blog_title}</a></h6>
                                                            </div>
                                                            <ul class="media-post">
                                                                <li><a href="#"><i class="fa fa-calendar"></i>${c.created_date}</a></li>
                                                                <!--                                                                <li><a href="#"><i class="fa fa-comments-o"></i>15 Comment</a></li>-->
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </aside>
                                </div>
                                <!-- Side bar END -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content END-->
            <!-- Footer ==== -->
            <%@include file="footer.html" %>
            <!-- Footer END ==== -->
            <!-- scroll top button -->
            <button class="back-to-top fa fa-chevron-up" ></button>
        </div>
        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src='assets/vendors/switcher/switcher.js'></script>
        <script>
                                                        function search() {
                                                            var b = document.getElementById("myButton").value;
                                                            document.getElementById("output").value = b;

                                                        }
                                                        function SearchByCategory() {
                                                            var form=document.getElementById('category_form');
                                                            form.submit();
                                                        }
        </script>
        <script>
            //login
            const openLoginButton = document.getElementById('open-login-popup');
            const closeLoginButton = document.getElementById('close-login-popup');
            const loginPopup = document.getElementById('login-popup');
            const loginError = document.getElementById('login-error');
            const checkLoginError = document.getElementById('check-login-error');
            //register
            const openRegisterButton = document.getElementById('open-register-popup');
            const closeRegisterButton = document.getElementById('close-register-popup');
            const registerPopup = document.getElementById('register-popup');
            const emailError = document.getElementById('email-error');
            const checkEmailError = document.getElementById('check-email-error');
            const passError = document.getElementById('pass-error');
            const checkPassError = document.getElementById('check-pass-error');
            //requestPass
            const openRequestButton = document.getElementById('open-requestPass-popup');
            const closeRequestButton = document.getElementById('close-requestPass-popup');
            const RequestPopup = document.getElementById('requestPass-popup');
            const requestError = document.getElementById('requestPass-error');
            const checkRequestError = document.getElementById('check-requestPass-error');


            openLoginButton.onclick = function () {
                loginPopup.style.display = 'flex';
            };

            openRegisterButton.onclick = function () {
                registerPopup.style.display = 'flex';
            };

            closeLoginButton.onclick = function () {
                loginPopup.style.display = 'none';
            };
            closeRegisterButton.onclick = function () {
                registerPopup.style.display = 'none';
            };
            openRequestButton.onclick = function () {
                loginPopup.style.display = 'none';
                RequestPopup.style.display = 'flex';
            };
            closeRequestButton.onclick = function () {
                loginPopup.style.display = 'flex';
                RequestPopup.style.display = 'none';
            };
            function LoginAgain() {
                if (checkLoginError.textContent === loginError.textContent) {
                    loginPopup.style.display = 'flex';
                }
                if (checkEmailError.textContent === emailError.textContent) {
                    registerPopup.style.display = 'flex';
                }
                if (checkPassError.textContent === passError.textContent) {
                    registerPopup.style.display = 'flex';
                }
                if (requestError.textContent === 'Send request success') {
                    RequestPopup.style.display = 'flex';
                }
                if (requestError.textContent === 'Email not existed') {
                    RequestPopup.style.display = 'flex';
                }
                console.log(requestError.textContent);


            }


            // ?óng pop-up khi nh?n ra ngoài
            window.onclick = function (event) {
                if (event.target === loginPopup) {
                    loginPopup.style.display = 'none';
                }
            };

            window.onclick = function (event) {
                if (event.target === registerPopup) {
                    registerPopup.style.display = 'none';
                }
            };
        </script>
    </body>

</html>