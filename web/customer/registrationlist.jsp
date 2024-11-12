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
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">

    </head>
    <body id="bg">
        <div class="page-wraper">
            <header class="header rs-nav header-transparent">
                <%@include file="header.jsp" %>
            </header>
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner3.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">My Registrations</h1>
                        </div>
                    </div>
                </div>
                <!-- Breadcrumb row END -->
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="widget courses-search-bx placeani">
                                        <div class="form-group">
                                            <form action="customersearchregistration">
                                                <div class="input-group">
                                                    <label>Search My Registrations</label>
                                                    <input name="dzName" type="text" required class="form-control"><br><br>
                                                    <input type="submit" value="Search" class="btn radius-xl text-uppercase">
                                                    <input type="text" value="search" hidden name="action">
                                                </div>
                                            </form>                                           
                                        </div>
                                    </div>
                                    <div class="widget recent-posts-entry widget-courses">
                                        <h5 class="widget-title style-1">My Subjects</h5>
                                        <div class="widget-post-bx">
                                            <!--                                       <them danh sach subject da dang ky o day-->
                                            <c:forEach items="${requestScope.registeredSubject_list}" var="c">
                                                <c:if test="${fn:contains(fn:toLowerCase(c.subjectName), fn:toLowerCase(param.keyword))}">
                                                    <div class="blog-post blog-md clearfix">
                                                        <div class="ttr-post-media"  >
                                                            <a href="subject_details?subject_id=${c.subjectId}"><img src="${c.thumbnail}" alt=""></a>
                                                            <h5 class="post-title"><a href="subject_details?subject_id=${c.subjectId}">${c.subjectName}</a></h5>
                                                        </div>

                                                    </div>
                                                </c:if>

                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-12">
                                    <div class="row">


                                        <c:forEach var="subject" items="${registration_subject_list}" varStatus="status">
                                            <div class="col-md-6 col-lg-4 col-sm-6 m-b30">
                                                    <div class="item" style="width: 250px; height: 300px;">
                                                        <div class="cours-bx" style="background-color: #fff; width: 100%; height: 100%; border-radius: 5px;">
                                                            <div class="action-box" style="width: 100%; height: 57%;">
                                                                <img src="${subject.thumbnail}" alt="" style="width: 100%; height: 100%;">
                                                                <a href="customersearchregistration?action=remove&id=${subject.subjectId}" class="btn">Remove</a>
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
                                            </div>
                                        </c:forEach>
                                        <c:if test="${empty requestScope.registration_subject_list}">
                                            <p>No subjects found matching your search.</p>
                                        </c:if>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- contact area END -->

            </div>
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
    </body>

</html>
