<!DOCTYPE html>
                                            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <!-- Header Top ==== -->
            <!-- header END ==== -->
            <!-- Content -->
            <div class="page-content">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner2.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Subjects Details</h1>
                        </div>
                    </div>
                </div>
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row d-flex flex-row-reverse">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="course-detail-bx">
                                        <div class="course-price">
                                            <div class="course-price">
                                                <label for="courseDuration">Choose duration:</label>
                                                <select id="courseDuration" name="courseDuration" class="form-control" onchange="updatePrice()">
                                                    <c:forEach var="pkg" items="${packageList}">
                                                        <option value="${pkg.duration}" data-price="${pkg.salePrice}$"  
                                                                <c:if test="${pkg.duration == selectedDuration}">selected</c:if>
                                                                    >
                                                                ${pkg.duration} months
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div class="course-price" style="margin-bottom: 5px;">
                                                <c:if test="${not empty selectedPackageModel}">
                                                    <del>${selectedPackageModel.listPrice}$</del>
                                                    <h4 class="price">${selectedPackageModel.salePrice}$</h4>
                                                </c:if>
                                            </div>

                                        </div>


                                        <div class="course-buy-now text-center">
                                            <a href="login.jsp" class="btn radius-xl text-uppercase">Buy Now This Courses</a>
                                        </div>
                                        <div class="teacher-bx">
                                            <div class="teacher-info">                                                
                                                <div class="teacher-name">
                                                    <span>Teacher</span>
                                                    <c:set var="c" value="${requestScope.account}" />
                                                    <h5 class="text-primary">${account.first_name} ${account.last_name}</h5> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="cours-more-info">
                                            <div class="price categories">
                                                <span>Categories</span>
                                                <c:set var="c" value="${requestScope.mySubject}" />

                                                <h5 class="text-primary">${categoryName}</h5> 
                                            </div>
                                        </div>

                                        <div class="course-info-list scroll-page">
                                            <ul class="navbar">
                                                <li><a class="nav-link" href="#overview"><i class="ti-zip"></i>Overview</a></li>
                                                <li><a class="nav-link" href="#curriculum"><i class="ti-bookmark-alt"></i>Curriculum</a></li>
                                                <li><a class="nav-link" href="#instructor"><i class="ti-user"></i>Instructor</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-9 col-md-8 col-sm-12">
                                    <!<!-- thÍm subject detail -->
                                    <c:set var="c" value="${requestScope.mySubject}" />
                                    <div class="courses-post">
                                        <div class="ttr-post-media media-effect">
                                            <a href="#"><img src="${c.thumbnail}" alt=""></a>
                                        </div>
                                        <div class="ttr-post-info">
                                            <div class="ttr-post-title ">
                                                <h2 class="post-title">${c.subjectName}</h2>
                                            </div>
                                            <div class="ttr-post-text">
                                                <p>${c.tagline}</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="courese-overview" id="overview">
                                        <h4>Overview</h4>
                                        <div class="row">
                                            <div class="col-md-12 col-lg-4">
                                                <ul class="course-features">
                                                    <li><i class="ti-book"></i> <span class="label">Lessons</span> <span class="value">${totalLessons}</span></li>
                                                    <li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">${totelQuiz}</span></li>
                                                    <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-12 col-lg-8">
                                                <h5 class="m-b5">Course Description</h5>
                                                <p>${c.description}</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!--lesson-> quiz/video-->     
                                    <!-- Curriculum Section -->
                                    <div class="m-b30" id="curriculum">
                                        <h4>Curriculum</h4>
                                        <ul class="curriculum-list">
                                            <c:forEach var="topic" items="${lessonTopics}">
                                                <li>
                                                    <h5>${topic.lesson_topic_name}</h5> 
                                                    
                                                    <ul>
                                                    <c:forEach var="lesson" items="${lessonList}">
                                                        <c:if test="${lesson.lesson_topic_id == topic.lesson_topic_id}">
                                                            <li>
                                                                <div class="curriculum-list-box">
                                                                    <span>Lesson ${lesson.lesson_order}.</span>
                                                            ${lesson.lesson_name}
                                                        </div>
                                                        <span>${lesson.lessonTypeName}</span>
                                                    </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>

                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>

                                    <div class="" id="instructor">
                                        <h4>Instructor</h4>
                                        <div class="instructor-bx">
                                            <div class="instructor-author">
                                                <img src="https://cdn.shopify.com/s/files/1/0597/6149/2152/t/49/assets/0007019893114747_b-1650694026425_1200x.jpg?v=1650694028" alt="">
                                            </div>
                                            <div class="instructor-info">
                                                <c:set var="c" value="${requestScope.account}" />
                                                <h5 class="text-primary">${account.first_name} ${account.last_name}</h5> 
                                                <span>Author</span>
                                                <br>
                                                <p class="m-b0">Teachers play a vital role in the education and development of students. They not only impart knowledge but also inspire and motivate learners to explore their potential. By employing innovative teaching methods, teachers create an engaging learning environment that encourages participation and critical thinking.</p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- contact area END -->

            </div>
            <!-- Content END-->
            <!-- Footer ==== -->
            <%@include file="footer.html" %>
            <!-- Footer END ==== -->
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
        <script src="assets/js/jquery.scroller.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src="assets/vendors/switcher/switcher.js"></script>

        <script>
                                                    function updatePrice() {
                                                        var select = document.getElementById('courseDuration');
                                                        var selectedOption = select.options[select.selectedIndex];
                                                        var salePrice = selectedOption.getAttribute('data-price');
                                                        var priceElement = document.querySelector('.course-price h4.price');

                                                        // C?p nh?t gi· hi?n th?
                                                        priceElement.innerText = salePrice;
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


            // ?√≥ng pop-up khi nh?n ra ngo√†i
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

