
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

            <!-- Header Top -->
           <%@include file="header.html" %>
            <!-- Content -->
            <div class="page-content ">
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
                                    <div class="sort-options" style="margin-bottom: 20px; width: 30%; display: flex; align-items: center;">
                                        <form method="get" action="subject_list" style="display: flex; align-items: center; width: 100%;">
                                            <label for="sortBy" style="margin-right: 10px; white-space: nowrap;">Sort by:</label>
                                            <select id="sortBy" name="sort" onchange="this.form.submit()" style="flex-grow: 1; max-width: 200px;">
                                                <option value="featured" ${param.sort == 'featured' ? 'selected' : ''}>Featured Subjects</option>
                                                <option value="latest" ${param.sort == 'latest' ? 'selected' : ''}>Latest Subjects</option>
                                                <option value="oldest" ${param.sort == 'oldest' ? 'selected' : ''}>Oldest Subjects</option>
                                            </select>
                                        </form>
                                    </div>
                                    <%-- Thêm mã l?c subject --%>
                                    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                    <c:forEach items="${requestScope.subject_list}" var="c">
                                        <c:if test="${param.keyword == null || param.keyword == '' || c.description.toLowerCase().contains(param.keyword.toLowerCase())}">
                                            <div class="blog-post blog-md clearfix">
                                                <div class="ttr-post-media"> 
                                                    <a href="subject_details?subject_id=${c.subjectId}"><img src="${c.thumbnail}" alt=""></a> 
                                                </div>
                                                <div class="ttr-post-info">
                                                    <ul class="media-post">
                                                        <li><i class="fa fa-calendar"></i>${c.createdDate}</a></li>
                                                        <li><b>${c.tagline}</b></li>
                                                    </ul>
                                                    <h5 class="post-title"><a href="subject_details?subject_id=${c.subjectId}">${c.subjectName}</a></h5>
                                                    <p>${c.description}</p>
                                                    <div class="post-extra">
                                                        <del>$190</del>
                                                        <h4 class="price">$120</h4>
                                                        <div style="margin-left: 50px;"></div> 
                                                        <a href="register_subject?subject_id=${c.subjectId}" class="btn btn-primary">Register</a>
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

                                            <!-- Form tìm ki?m category theo t? khóa -->
                                            <div class="search-bx style-1">
                                                <form role="search" method="get" action="searchByCategory">
                                                    <div class="input-group">
                                                        <input name="text" class="form-control" placeholder="Enter your keywords..." type="text" id="output">
                                                        <span class="input-group-btn">
                                                            <button type="submit" class="fa fa-search text-primary"></button>
                                                        </span>
                                                    </div>
                                                </form>
                                            </div>
                                            <br>

                                            <!-- Danh sách các categories -->
                                            <div class="category-list" style="margin-bottom: 20px;">
                                                <form id="categoryForm" action="searchByCategory" method="get">
                                                    <c:forEach items="${requestScope.category_list}" var="c">
                                                        <div style="margin-bottom: 10px;">
                                                            <input type="checkbox" id="category_${c.category_id}" name="categories" value="${c.category_name}" onchange="document.getElementById('categoryForm').submit();">
                                                            <label for="category_${c.category_id}" style="font-size: 16px; margin-left: 8px;">${c.category_name}</label>
                                                        </div>
                                                    </c:forEach>
                                                </form>
                                            </div>

                                        </div>
                                        <br>
                                        <div class="widget recent-posts-entry">
                                            <h6 class="widget-title">Featured Subjects</h6>
                                            <div class="widget-post-bx">
                                                <!-- thêm danh sách các bài subject hot nhat-->
                                                <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                                <c:forEach items="${requestScope.featured_subject_list}" var="c">
                                                    <div class="widget-post clearfix">
                                                        <div class="ttr-post-media"> <img src="${c.thumbnail}" width="200" height="143" alt=""> </div>
                                                        <div class="ttr-post-info">
                                                            <div class="ttr-post-header">
                                                                <h6 class="post-title"><a href="subject_details?subject_id=${c.subjectId}">${c.subjectName}</a></h6>
                                                            </div>
                                                            <ul class="media-post">
                                                                <li>${c.tagline}</li>
                                                                <!--                                                                <li><a href="#"><i class="fa fa-user"></i>By William</a></li>-->
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
        </script>
    </body>

</html>