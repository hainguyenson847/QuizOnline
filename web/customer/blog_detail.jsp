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

    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div> 
            <header class="header rs-nav header-transparent">
                <!-- login -->


                <%@include file="header.jsp" %>


            </header>
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner2.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Blog Details</h1>
                        </div>
                    </div>
                </div>
                <div class="content-block">
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <!-- Left part start -->
                                <div class="col-lg-8 col-xl-8">
                                    <!-- blog start -->
                                    <!<!-- th�m blog detail -->
                                    <c:set var="post" value="${requestScope.myPost}" />
                                    <div class="recent-news blog-lg">
                                        <div class="action-box blog-lg">
                                            <img src="${post.thumbnail}" alt="">
                                        </div>
                                        <div class="info-bx">
                                            <ul class="media-post">
                                                <li><a href="#"><i class="fa fa-calendar"></i>${post.created_date}</a></li>
                                                        <c:set var="account" value="${requestScope.account}" />
                                                <li><i class="fa fa-comments-o"></i> By: ${account.first_name} ${account.last_name}</li>
                                            </ul>
                                            <h5 class="post-title"><a href="#">${post.blog_summary}</a></h5>
                                            <p>${post.blog_content}</p>
                                            <div class="ttr-divider bg-gray"><i class="icon-dot c-square"></i></div>
                                            <div class="ttr-divider bg-gray"><i class="icon-dot c-square"></i></div>
                                            <div class="ttr-divider bg-gray"><i class="icon-dot c-square"></i></div>
                                        </div>
                                    </div>

                                    <!-- blog END -->
                                </div>
                                <!-- Left part END -->
                                <!-- Side bar start -->
                                <div class="col-lg-4 col-xl-4">
                                    <aside  class="side-bar sticky-top">
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
                                                <form role="search" method="get" action="searchByCategory"> <!-- ??m b?o ?i?u n�y tr? ??n endpoint ch�nh x�c -->
                                                    <div class="input-group">
                                                        <input name="text" class="form-control" placeholder="Enter your keywords..." type="text" id="output">
                                                        <input name="category" type="hidden" value="${param.category != null ? param.category : ''}">
                                                        <input name="view" type="hidden" value="blogs"> <!-- ??t view l� blogs -->
                                                        <span class="input-group-btn">
                                                            <button type="submit" class="fa fa-search text-primary"></button>
                                                        </span>
                                                    </div>
                                                </form>
                                            </div>


                                            <br>
                                            <!-- Danh s�ch c�c categories -->
                                            <div class="category-list" style="margin-bottom: 20px;">
                                                <c:forEach items="${requestScope.category_list}" var="c">
                                                    <div style="margin-bottom: 10px;">
                                                        <input type="checkbox" id="category_${c.category_id}" name="categories" value="${c.category_id}">
                                                        <label for="category_${c.category_id}" style="font-size: 16px; margin-left: 8px;">${c.category_name}</label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <!-- N�t t�m ki?m -->
                                        </div>
                                        <br>                                            
                                        <div class="widget recent-posts-entry">
                                            <h6 class="widget-title">Latest Posts</h6>
                                            <div class="widget-post-bx">
                                                <!-- th�m danh s�ch c�c b�i post hot nhat-->
                                                <c:forEach items="${requestScope.post_list}" var="c">
                                                    <div class="widget-post clearfix">
                                                        <div class="ttr-post-media"> <img src="${c.thumbnail}" width="200" height="143" alt=""> </div>
                                                        <div class="ttr-post-info">
                                                            <div class="ttr-post-header">
                                                                <h6 class="post-title"><a href="blog_detail?blog_id=${c.blog_id}">${c.blog_summary}</a></h6>
                                                            </div>
                                                            <ul class="media-post">
                                                                <li><a href="#"><i class="fa fa-calendar"></i>${c.created_date}</a></li>
                                                                        <c:set var="c" value="${requestScope.account}" />
                                                                <li><i class="fa fa-comments-o"></i> By: ${account.first_name} ${account.last_name}</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="widget-post-bx">
                                            <!--  th�m danh sach 5 bai posst gan day-->
                                            <c:forEach items="${requestScope.blog_detail}" var="c">
                                                <div class="widget-post clearfix">
                                                    <div class="ttr-post-media"> <img src="assets/images/blog/recent-blog/pic1.jpg" width="200" height="143" alt=""> </div>
                                                    <div class="ttr-post-info">
                                                        <div class="ttr-post-header">
                                                            <h6 class="post-title"><a href="blog-details.html">${c.blog_summary}</a></h6>
                                                        </div>
                                                        <ul class="media-post">
                                                            <li><a href="#"><i class="fa fa-calendar"></i>${c.created_date}</a></li>
                                                                    <c:set var="c" value="${requestScope.account}" />
                                                            <li><i class="fa fa-comments-o"></i> By: ${account.first_name} ${account.last_name}</a></li>
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
    <script >
        function getLinkContent() {
            var c = document.getElementById("categorie").value();
            document.getElementById("output").value = c;
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


        // ?�ng pop-up khi nh?n ra ngo�i
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