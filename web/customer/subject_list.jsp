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
                <%@include file="header.jsp" %>
            </header>
            <!-- Content -->
            <div class="page-content">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner2.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Subject List</h1>
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
                                    <div class="sort-options">
                                        <form method="get" action="subject_list" style="display: flex; align-items: center; width: 100%;">
                                            <label for="sortBy" style="margin-right: 10px; white-space: nowrap;">Sort by:</label>
                                            <div  >
                                                <label style="margin-right: 10px" >
                                                    <input type="radio" name="sort" value="featured" ${param.sort == 'featured' ? 'checked' : ''} onchange="this.form.submit()"> Featured
                                                </label>
                                                <label style="margin-right: 10px" >
                                                    <input type="radio" name="sort" value="latest" ${param.sort == 'latest' ? 'checked' : ''} onchange="this.form.submit()"> Latest
                                                </label>
                                                <label>
                                                    <input type="radio" name="sort" value="oldest" ${param.sort == 'oldest' ? 'checked' : ''} onchange="this.form.submit()"> Oldest
                                                </label>
                                            </div>
                                        </form>
                                    </div>


                                    <!-- Subject list -->
                                    <c:forEach items="${requestScope.subject_list}" var="c">
                                        <c:if test="${param.keyword == null || param.keyword == '' || c.description.toLowerCase().contains(param.keyword.toLowerCase())}">
                                            <form action="customerregistersubject" >
                                                <div class="blog-post blog-md clearfix">
                                                    <div class="ttr-post-media">
                                                        <a href="subject_details?subject_id=${c.subjectId}"><img src="${c.thumbnail}" alt=""></a>
                                                    </div>
                                                    <div class="ttr-post-info">
                                                        <ul class="media-post">
                                                            <li><i class="fa fa-calendar"></i>${c.createdDate}</li>
                                                            <li><b>${c.tagline}</b></li>
                                                        </ul>
                                                        <h5 class="post-title"><a href="subject_details?subject_id=${c.subjectId}">${c.subjectName}</a></h5>
                                                        <p>${c.description}</p>
                                                        <div class="post-extra">
                                                            <c:if test="${not empty selectedPackageModel}">
                                                                <del>${pkgDAO.getListPackageBySubjectID(c.subjectId).get(0).listPrice}$</del>
                                                                <h4 class="price">${pkgDAO.getListPackageBySubjectID(c.subjectId).get(0).salePrice}$</h4>
                                                            </c:if>
                                                            <div style="margin-left: 50px;"></div>
                                                            <c:if test="${requestScope.subjectDAO.HasSubjectNotBeenInteract(sessionScope.user.account_id,c.subjectId)}">
                                                                <button type="submit" class="btn btn-primary">Register</button>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input type="text" hidden value="${sessionScope.user.account_id}" name="account_id">
                                                <input type="text" hidden value="${c.subjectId}" name="subject_id">
                                                <input type="text" hidden value="${selectedPackageModel.listPrice}" name="list_price">
                                                <input type="text" hidden value="${selectedPackageModel.salePrice}" name="sale_price">
                                            </form>
                                        </c:if>
                                    </c:forEach>
                                    <!-- Pagination END -->
                                </div>
                                <!-- Left part END -->
                                <!-- Side bar start -->
                                <div class="col-lg-4 sticky-top">
                                    <aside class="side-bar sticky-top">
                                        <div class="widget">
                                            <h6 class="widget-title">Search</h6>
                                            <div class="search-bx style-1">
                                                <form role="search" method="get" action="subject_list">
                                                    <div class="input-group">
                                                        <input name="keyword" value="${param.keyword != null ? param.keyword : ''}" class="form-control" placeholder="Enter your keywords..." type="text" id="output">
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
                                                <form role="search" method="get" action="searchByCategory">
                                                    <div class="input-group">
                                                        <input name="text" class="form-control" placeholder="Enter your keywords..." type="text" id="output">
                                                        <input name="category" type="hidden" value="${param.category != null ? param.category : ''}">
                                                        <span class="input-group-btn">
                                                            <button type="submit" class="fa fa-search text-primary"></button>
                                                        </span>
                                                    </div>
                                                </form>
                                            </div>
                                            <br>
                                            <!-- Danh sách các categories -->
                                            <form role="search" method="get" action="searchByCategory" id="category_form"> <!-- ??m b?o ?i?u này tr? ??n endpoint chính xác -->
                                                <div class="category-list" style="margin-bottom: 20px;">
                                                    <c:forEach items="${requestScope.category_list}" var="c">
                                                        <div style="margin-bottom: 10px;">
                                                            <input type="checkbox" id="category_${c.category_id}" name="categories" value="${c.category_name}" onclick="SearchByCategory()">
                                                            <label for="category_${c.category_id}" style="font-size: 16px; margin-left: 8px;">${c.category_name}</label>
                                                            <input type="text" value="s" name="view" hidden>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </form>
                                        </div>
                                        <br>
                                        <div class="widget recent-posts-entry">
                                            <h6 class="widget-title">Featured Subjects</h6>
                                            <div class="widget-post-bx">
                                                <!-- thêm danh sách các bài subject hot nhat-->
                                                <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                                <c:forEach items="${requestScope.featuredSubjects}" var="c">
                                                    <div class="widget-post clearfix">
                                                        <div class="ttr-post-media"> <img src="${c.thumbnail}" width="200" height="143" alt=""> </div>
                                                        <div class="ttr-post-info">
                                                            <div class="ttr-post-header">
                                                                <h6 class="post-title"><a href="subject_details?subject_id=${c.subjectId}">${c.subjectName}</a></h6>
                                                            </div>
                                                            <ul class="media-post">
                                                                <li>${c.tagline}</li>
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
            <button class="back-to-top fa fa-chevron-up" ></button>

            <!-- scroll top button -->
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
                                                                    var form = document.getElementById('category_form');
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