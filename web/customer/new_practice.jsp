<%-- 
    Document   : new_pactice
    Created on : Nov 9, 2024, 2:01:53 AM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
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
        <style>
            .dashboard_attribute{
                border-radius: 8px;
                background-color: #fff;
                padding: 20px 0 0 30px

            }

            .dashboard_brief {
                margin-left: 140px;
                background-color: black;
                display: flex;
                align-items: center;
                border-radius: 10px;
                position: absolute;
                right: 30px;
                cursor: pointer
            }
        </style>
    </head>
    <body id="bg" style="background-color: #001739">

        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <!-- Header Top ==== -->
            <!-- header END ==== -->
            <!-- Content -->

            <div class="page-content bg-white container" style="margin-top: 100px; height: 800px;  padding: 30px; width: 500px; position: relative; border-radius: 8px">
                <a href="view_practice" style="color: white; position: absolute; top: 40px; left: 318px; width: 150px; height: 50px; text-align: center; border-radius: 8px" class="btn-danger">Back To<br>Practice List</a>
                <h1>New practice</h1>
                <div style="margin-bottom: 30px">
                    <form action="new_practice" method="post">
                        <div class="" style=" width: 440px; align-items: center; margin-bottom: 10px; ">
                            <label style="width: 90px">Subject:</label>
                            <select style="width: 50px; font-size: 300px" name="sub" class="select-info" >
                                <option value="all" ${subject == null ? 'selected':''}>All subject</option>
                                <c:forEach items="${sessionScope.list_sub}" var="ls">
                                    <option value="${ls.subjectId}" ${subject == ls.subjectId.toString() ? 'selected':''}>${ls.subjectName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="width: 440px; align-items: center; margin-bottom: 10px">
                            <label style="width: 200px">Exam name:</label>
                            <input style="width: 440px; text-align: left" type="text" class="input-group-text" name="ex_name" value="${name != null ? name:''}" placeholder="Enter name of practice"/>
                        </div>
                        <div style="width: 440px; align-items: center; margin-bottom: 10px">
                            <label style="width: 200px">Number of question:</label>
                            <input style="width: 440px;text-align: left" type="number" class="input-group-text" value="${ex_num != null ? ex_num:''}" name="ex_num" placeholder="Enter number question of practice"/>
                        </div>
                        <div class="select-item" style=" width: 440px; align-items: center" >
                            <label style="width: 200px">Level:</label>
                            <select style="width: 50px; " name="level">
                                <option value="1" ${level == '1' ? 'selected':''}>Easy</option>
                                <option value="2" ${level == '2' ? 'selected':''}>Medium</option>
                                <option value="3" ${level == '3' ? 'selected':''}>Hard</option>
                            </select>
                        </div>
                        <div class="select-item" style=" width: 440px; align-items: center" >
                            <label style="width: 400px">Questions are selected by A Topic or A Specific Dimension?</label>
                            <select style="width: 50px;" name="td" onchange="this.form.submit();">
                                <option value="" ${td == null ? 'selected':''}>Choose</option>
                                <option value="by_topic" ${td == 'by_topic' ? 'selected':''}>By Subject Topic</option>
                                <option value="by_dimension" ${td == 'by_dimension' ? 'selected':''}>By Dimension</option>
                            </select>
                        </div>
                        <div class="select-item" style=" width: 440px; align-items: center" >
                            <label style="width: 400px">Questions group (Choose One Topic/Dimension)</label>
                            <select style="width: 50px;" name="group">
                                <option value="" ${group == null ? 'selected':''}>Choose</option>
                                <c:if test="${topics != null}">
                                    <c:forEach items="${topics}" var="topic">
                                        <option value="${topic.lesson_topic_id}" ${group == topic.lesson_topic_id.toString() ? 'selected':''}>${topic.lesson_topic_name}</option>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${dims != null}">
                                    <c:forEach items="${dims}" var="dim">
                                        <option value="${dim.dimension_id}" ${group == dim.dimension_id.toString() ? 'selected':''}>${dim.dimension_name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <noscript><input type=”submit” value=”Submit”></noscript>


                        <input style="margin-top: 20px; cursor: pointer" class="btn-danger" name="sbm" value="Practice" type="submit"/>
                    </form>
                <p style="color: red">${no_subject != null ? no_subject:''}</p>
                    
                </div>
            </div> 
        </div> 

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
