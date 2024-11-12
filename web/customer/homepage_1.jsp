<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <link rel="stylesheet" type="text/css" href="admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">

        <!-- REVOLUTION SLIDER CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="assets/vendors/revolution/css/navigation.css">
        <link rel="stylesheet" type="text/css" href="admin/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="admin/assets/css/color/color-1.css">

        <style>



            .slider-container {
                width: 100%;
                overflow: hidden;
                position: relative;
            }
            .slider {
                display: flex;
                width: 200%;
                transition: 1s;
                animation: slide 8s infinite;
            }
            .slide {
                width: 100%;
                position: relative;
            }
            .slide img {
                width: 100%;
                height: 500px;
                object-fit: cover;
            }
            .text-overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                color: #fff;
                background-color: rgba(0, 0, 0, 0.5); /* L?p ph? che toàn slide */
                padding: 20px;
            }
            .text-overlay h1 {
                font-size: 3em;
                margin-bottom: 10px;
            }
            .text-overlay p {
                font-size: 1.2em;
            }
            @keyframes slide {
                0%, 50% {
                    transform: translateX(0);
                }
                50.01%, 100% {
                    transform: translateX(-50%);
                }
            }

        </style>
    </head>


    <body id="bg" >
        <div class="page-wraper">
            <!-- Header Top ==== -->
            <header class="header rs-nav header-transparent">
                <%@include file="header.jsp" %>
            </header>



            <!-- Content -->
            <div class="page-content bg-white">
                <!-- Main Slider -->
                <div class="slider-container">
                    <div class="slider">
                        <c:forEach var="slider" items="${sliders_list}">
                            <div class="slide">
                                <a href="${slider.slider_link}"><img src="${slider.slider_image}" alt="Slider Image"></a>
                                <div class="overlay"></div>
                                <div class="text-overlay">
                                    <h1 style="color: #FF9900;">Welcome To Quiz Online</h1>
                                    <p style="color: #F7B205; font-size: 1.2em; font-weight: 600; text-align: center; margin-bottom: 5px;">
                                        ${slider.slider_title}
                                    </p>
                                    <p style="color: white; font-size: 1em; text-align: center; line-height: 1.5; max-width: 600px; margin: 0 auto;">
                                        ${slider.slider_detail}
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Main Slider -->

                <div class="content-block">
                    <!--Registed Subject Form -->
                    <div class="section-area section-sp2 bg-fix ovbl-dark" style="background-image:url(assets/images/background/bg1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 heading-bx left">
                                    <h2 class="title-head" style="color: white">My <span>Subjects</span></h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="courses-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                    <!-- thêm subjedt list -->
                                    <c:forEach var="subject" items="${registeredSubject_list}" varStatus="status">
                                        <c:if test="${fn:contains(subject.description, param.keyword) || fn:contains(subject.subjectName, param.keyword)}">
                                            <div class="item" style="width: 300px; height: 350px;">
                                                <div class="cours-bx" style="background-color: #fff; width: 100%; height: 100%; border-radius: 5px;">
                                                    <div class="action-box" style="width: 100%; height: 57%;">
                                                        <img src="${subject.thumbnail}" alt="" style="width: 100%; height: 100%;">
                                                        <a href="subject_details?subject_id=${subject.subjectId}" class="btn">Read More</a>
                                                    </div>
                                                    <div class="info-bx text-center" style="padding: 10px;">
                                                        <h5>
                                                            <a href="subject_details?subject_id=${subject.subjectId}" 
                                                               style="color: black; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                                ${subject.description}
                                                            </a>
                                                        </h5>
                                                        <span>${subject.tagline}</span>
                                                    </div>
                                                    <div class="cours-more-info">
                                                        <div class="review">
                                                            <i class="fa fa-user"></i>      <span>Author</span>
                                                            <c:forEach var="account" items="${account_list}" varStatus="aStatus">
                                                                <c:if test="${aStatus.index == status.index}">
                                                                    <h5>${account.first_name} ${account.last_name}</h5>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="price">
                                                            <c:if test="${not empty selectedPackageModel}">
                                                                <del>${pkgDAO.getListPackageBySubjectID(subject.subjectId).get(0).listPrice}</del>
                                                                <h5>${pkgDAO.getListPackageBySubjectID(subject.subjectId).get(0).salePrice}</h5>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${empty requestScope.subject_list}">
                                        <p>No subjects found matching your search.</p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="section-area section-sp2 bg-fix ovbl-dark" style="background-image:url(assets/images/background/bg1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 heading-bx left">
                                    <h2 class="title-head" style="color: white">All <span>Subjects</span></h2>
                                </div>
                            </div>
                            <div class="row">
                                <div class="courses-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                    <!-- thêm subjedt list -->

                                    <c:forEach var="subject" items="${subject_list}" varStatus="status">
                                        <c:if test="${fn:contains(subject.description, param.keyword) || fn:contains(subject.subjectName, param.keyword)}">
                                            <div class="item" style="width: 300px; height: 350px;">
                                                <div class="cours-bx" style="background-color: #fff; width: 100%; height: 100%; border-radius: 5px;">
                                                    <div class="action-box" style="width: 100%; height: 57%;">
                                                        <img src="${subject.thumbnail}" alt="" style="width: 100%; height: 100%;">
                                                        <a href="subject_details?subject_id=${subject.subjectId}" class="btn">Read More</a>
                                                    </div>
                                                    <div class="info-bx text-center" style="padding: 10px;">
                                                        <h5>
                                                            <a href="subject_details?subject_id=${subject.subjectId}" 
                                                               style="color: black; display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                                ${subject.description}
                                                            </a>
                                                        </h5>
                                                        <span>${subject.tagline}</span>
                                                    </div>
                                                    <div class="cours-more-info">
                                                        <div class="review">
                                                            <i class="fa fa-user"></i>      <span>Author</span>
                                                            <c:forEach var="account" items="${account_list}" varStatus="aStatus">
                                                                <c:if test="${aStatus.index == status.index}">
                                                                    <h5>${account.first_name} ${account.last_name}</h5>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="price">
                                                            <c:if test="${not empty selectedPackageModel}">
                                                                <del>${selectedPackageModel.listPrice}</del>
                                                                <h5>${selectedPackageModel.salePrice}</h5>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${empty requestScope.subject_list}">
                                        <p>No subjects found matching your search.</p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Form END -->


                    <!-- All Post -->
                    <div class="section-area section-sp2 bg-fix ovbl-dark" style="background-image:url(assets/images/background/bg1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-white heading-bx left">
                                    <h2 class="title-head text-uppercase">All Posts</span></h2>
                                </div>
                            </div>
                            <div class="testimonial-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                <!--  thêm danh sách bài post m?i nh?t-->
                                <c:forEach items="${requestScope.post_list}" var="c" varStatus="status">
                                    <div class="blog-post blog-md clearfix" style="background-color: white; width: 550px; height: 450px; border-radius: 15px;"> 
                                        <a href="blog_detail?blog_id=${c.blog_id}">
                                            <img src="${c.thumbnail}" alt="" style="width: 100%; height: 70%;"> 
                                        </a>
                                        <div class="ttr-post-info" style="padding: 10px; height: 40%;"> 
                                            <ul class="media-post">
                                                <li><a href="#"><i class="fa fa-calendar"></i>${c.created_date}</a></li>                                      
                                                        <c:forEach var="account" items="${account_list}" varStatus="aStatus">
                                                            <c:if test="${aStatus.index == status.index}">
                                                        <li><a href="#"><i class="fa fa-user"></i>${account.first_name} ${account.last_name}</a></li>
                                                        </c:if>
                                                    </c:forEach>                                            </ul>
                                            <h5 class="post-title"><a href="blog_detail?blog_id=${c.blog_id}">${c.blog_title}</a></h5>
                                            <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${c.blog_summary}</p> 
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>               
                        </div>
                    </div>
                    <!-- All Post END -->

                    <!-- Hottest Post -->
                    <div class="section-area section-sp2 bg-fix ovbl-dark" style="background-image:url(assets/images/background/bg1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 text-white heading-bx left">
                                    <h2 class="title-head text-uppercase">Hottest Posts</span></h2>
                                </div>
                            </div>
                            <div class="testimonial-carousel owl-carousel owl-btn-1 col-12 p-lr0">
                                <!--  thêm danh sách bài post hot nh?t-->
                                <c:forEach items="${requestScope.hottest_post_list}" var="c"  varStatus="status">
                                    <div class="blog-post blog-md clearfix" style="background-color: white; width: 550px; height: 450px; border-radius: 15px;"> <!-- KÃ­ch th??c c? ??nh -->
                                        <a href="blog_detail?blog_id=${c.blog_id}">
                                            <img src="${c.thumbnail}" alt="" style="width: 100%; height: 70%;"> <!-- KÃ­ch th??c hÃ¬nh ?nh -->
                                        </a>
                                        <div class="ttr-post-info" style="padding: 10px; height: 40%;">
                                            <ul class="media-post">
                                                <li><a href="#"><i class="fa fa-calendar"></i>${c.created_date}</a></li>
                                                        <c:forEach var="account" items="${account_list}" varStatus="aStatus">
                                                            <c:if test="${aStatus.index == status.index}">
                                                        <li><a href="#"><i class="fa fa-user"></i>${account.first_name} ${account.last_name}</a></li>
                                                        </c:if>
                                                    </c:forEach>
                                            </ul>
                                            <h5 class="post-title"><a href="blog_detail?blog_id=${c.blog_id}">${c.blog_title}</a></h5>
                                            <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${c.blog_summary}</p> <!-- Gi?i h?n chi?u dÃ i bÃ i tÃ³m t?t -->
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>               
                        </div>
                    </div>
                    <!-- Hottest END -->			
                </div>
                <!-- contact area END -->
            </div>
            <!-- Content END-->
            <!-- Footer ==== -->
            <%@include file="\customer\footer.html" %>
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
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src='assets/vendors/switcher/switcher.js'></script>
        <!-- Revolution JavaScripts Files -->
        <script src="assets/vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="assets/vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <!-- Slider revolution 5.0 Extensions  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="assets/vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
        <script>
            jQuery(document).ready(function () {
                var ttrevapi;
                var tpj = jQuery;
                if (tpj("#rev_slider_486_1").revolution == undefined) {
                    revslider_showDoubleJqueryError("#rev_slider_486_1");
                } else {
                    ttrevapi = tpj("#rev_slider_486_1").show().revolution({
                        sliderType: "standard",
                        jsFileLocation: "assets/vendors/revolution/js/",
                        sliderLayout: "fullwidth",
                        dottedOverlay: "none",
                        delay: 9000,
                        navigation: {
                            keyboardNavigation: "on",
                            keyboard_direction: "horizontal",
                            mouseScrollNavigation: "off",
                            mouseScrollReverse: "default",
                            onHoverStop: "on",
                            touch: {
                                touchenabled: "on",
                                swipe_threshold: 75,
                                swipe_min_touches: 1,
                                swipe_direction: "horizontal",
                                drag_block_vertical: false
                            }
                            ,
                            arrows: {
                                style: "uranus",
                                enable: true,
                                hide_onmobile: false,
                                hide_onleave: false,
                                tmp: '',
                                left: {
                                    h_align: "left",
                                    v_align: "center",
                                    h_offset: 10,
                                    v_offset: 0
                                },
                                right: {
                                    h_align: "right",
                                    v_align: "center",
                                    h_offset: 10,
                                    v_offset: 0
                                }
                            },

                        },
                        viewPort: {
                            enable: true,
                            outof: "pause",
                            visible_area: "80%",
                            presize: false
                        },
                        responsiveLevels: [1240, 1024, 778, 480],
                        visibilityLevels: [1240, 1024, 778, 480],
                        gridwidth: [1240, 1024, 778, 480],
                        gridheight: [768, 600, 600, 600],
                        lazyType: "none",
                        parallax: {
                            type: "scroll",
                            origo: "enterpoint",
                            speed: 400,
                            levels: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 46, 47, 48, 49, 50, 55],
                            type: "scroll",
                        },
                        shadow: 0,
                        spinner: "off",
                        stopLoop: "off",
                        stopAfterLoops: -1,
                        stopAtSlide: -1,
                        shuffle: "off",
                        autoHeight: "off",
                        hideThumbsOnMobile: "off",
                        hideSliderAtLimit: 0,
                        hideCaptionAtLimit: 0,
                        hideAllCaptionAtLilmit: 0,
                        debugMode: false,
                        fallbacks: {
                            simplifyAll: "off",
                            nextSlideOnWindowFocus: "off",
                            disableFocusListener: false,
                        }
                    });
                }
            });
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

