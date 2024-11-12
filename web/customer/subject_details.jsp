<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <header class="header rs-nav header-transparent">
                <%@include file="header.jsp" %>
            </header>
            <!-- Header Top ==== -->
            <!-- header END ==== -->
            <!-- Content -->
            <div class="page-content bg-white">
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
                                     <form action="vnpay_pay.jsp" >
                                            <div class="course-price">

                                                <div class="course-price">
                                                    <label for="courseDuration">Choose duration:</label>
                                                    <select id="courseDuration" name="courseDuration" class="form-control" onchange="updatePrice()">
                                                        <c:forEach var="pkg" items="${packageList}">
                                                            <option value="${pkg.package_id}" data-price="${pkg.salePrice}$" 
                                                                    <c:if test="${pkg.duration == selectedDuration}">selected</c:if>
                                                                        >
                                                                    ${pkg.duration} months
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
<!--                                                <input type="text" hidden value="${sessionScope.user.account_id}" name="account_id">
                                                <input type="text" hidden value="<%=request.getParameter("subject_id")%>" name="subject_id">
                                                <input type="text" hidden value="${selectedPackageModel.listPrice}" name="list_price">
                                                <input type="text" hidden value="${selectedPackageModel.salePrice}" name="sale_price">
-->                                                <div class="course-price" style="margin-bottom: 5px;">
                                                    <c:if test="${not empty selectedPackageModel}">
                                                        <del>${selectedPackageModel.listPrice}$</del>
                                                        <h4 class="price">${selectedPackageModel.salePrice}$</h4>
                                                    </c:if>
                                                </div>

                                            </div>
                                                <input type="text" value="${sessionScope.user.account_id}" hidden name="account_id"><!-- comment -->
<input type="text" value="<%=request.getParameter("subject_id")%>" hidden name="subject_id">
                                            <div class="course-buy-now text-center">    
                                                <c:if test="${!isRegistered}">
                                                    <button class="btn radius-xl text-uppercase" type="submit">Buy Now This Subject</button>
                                                </c:if>
                                            </div>
                                      </form>



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
                                    <!<!-- thêm subject detail -->
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
                                                                    <c:if test="${isRegistered}">
                                                                        <div class="curriculum-list-box">
                                                                            <c:choose>
                                                                                <c:when test="${lesson.lesson_type_id == 1}">
                                                                                    <a href="lesson_detail?lesson_id=${lesson.lesson_id}">
                                                                                        <span>Lesson </span>
                                                                                        ${lesson.lesson_name}
                                                                                    </a>
                                                                                </c:when>
                                                                                <c:when test="${lesson.lesson_type_id == 2}">
                                                                                    <a href="quiz_handling?id=${lesson.quiz_id}">
                                                                                        <span>Quiz </span>
                                                                                        ${lesson.lesson_name}
                                                                                    </a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <span>Unknown Lesson Type</span>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </div>
                                                                    </c:if>
                                                                    <c:if test="${!isRegistered}">
                                                                        <div class="curriculum-list-box">
                                                                            <span>Lesson </span>
                                                                            ${lesson.lesson_name}
                                                                        </div>
                                                                    </c:if>
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

                                                            // C?p nh?t giá hi?n th?
                                                            priceElement.innerText = salePrice;
                                                        }
        </script>
    </body>

</html>