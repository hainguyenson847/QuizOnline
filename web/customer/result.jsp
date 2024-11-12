<%-- 
    Document   : result
    Created on : Oct 15, 2024, 3:50:02 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/quiz.css"/>
    </head>
    <body id="bg" style="display: flex; justify-content: center">
        <div id="container">
            <div id="">
                <div class="" >
                    <!-- Thời gian đếm ngược -->
                    <header style="align-items: center; height: 50px; text-align: center">
                        <div id="time"></div>

                    </header>

                    <hr>


                    <%-- 
                     const button = document.createElement("button");
                            button.textContent = (i + 1);
                            button.style.position = "relative";
                            button.style.width = "100%";
                            button.style.padding = "10px";
                            button.style.border = "1px solid #ccc";
                            button.style.cursor = "pointer";
                            // Set background color based on question status
                            if (questionStatus[i] === 'answered') {
                                button.style.backgroundColor = "#d4edda";
                            } else {
                                button.style.backgroundColor = "#f0f0f0";
                            }
                    --%>


                    <main id="body" style="font-size: 20px">
                        <ul style="padding: 0 30px; color: black; font-weight: bold">
                            <li>Correct: ${correct_quest}</li>
                            <li>Incorrect: ${incorrect}</li>
                            <li>Unanswered: ${una}</li>
                        </ul>
                        <div style="font-weight: bold; color: ${correct_rate >= passrate ? 'green':'red'}; background-color: ${correct_rate >= passrate ? '#ccffcc':'#ffcccc'}; border-radius: 8px; height: 100px; display: flex; align-items: center; justify-content: center">
                            <span style="font-size: 30px">${correct_rate}% | ${correct_rate >= passrate ? 'PASS':'NOT PASS'}</span>


                        </div>
                        <br>
                        <div style="font-size: 30px">
                            <a href="quiz_review?practice_id=${sessionScope.new_practice_id}"><button id="prev" class="btn" style="width: 100%">Review Now</button></a> <br>
                            <button id="prev" class="btn" style="width: 100%" id="back" onclick="backHome()"><a href="view_practice">Back</a></button>
                        </div>
                    </main>


                </div>
            </div>
            <!-- Fixed buttons outside the footer -->


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
                                const totalTime = ${dur};
                                const back = document.getElementById('back');
                                const timeEl = document.getElementById("time"); // Phần tử hiển thị thời gian
                                function updateTimer() {
                                    const hours = Math.floor(totalTime / (60 * 60));
                                    const minutes = Math.floor(totalTime / 60);
                                    const seconds = totalTime % 60;
                                    if (totalTime >= 0) {
                                        timeEl.textContent = 'TIME FINISHED: ' +
                                                (hours < 10 ? "0" + hours : hours) + ":" +
                                                (minutes < 10 ? "0" + minutes : minutes) + ":" +
                                                (seconds < 10 ? "0" + seconds : seconds);
                                    }

                                }
                                function backHome() {
                                    sessionStorage.clear();
                                }

                                window.onload = () => {
                                    sessionStorage.setItem("isSubmitted", "true");
                                    updateTimer();
                                };

        </script>
    </body>
</html>
