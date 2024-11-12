<%-- 
    Document   : quiz_reviewing
    Created on : Oct 23, 2024, 8:48:37 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
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
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            /* Base Styling */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                padding: 20px;
                box-sizing: border-box;
            }

            /*#container {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }*/


            #container {
                width: 100%; /* Takes up 90% of the viewport width */
                max-width: 1900px; /* Sets an upper limit */
                padding: 20px;
                box-sizing: border-box;
            }

            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                max-width: 1900px;
                background-color: #f9f9f9;
                padding: 10px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            #time {
                font-size: 24px;
                font-weight: bold;
                color: #333;
            }



            header button:hover {
                background-color: #45a049;
            }

            hr {
                margin: 20px 0;
                border: 1px solid #ddd;
            }

            main {
                width: 100%;
                max-width: 1900px;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0px 4px 16px rgba(0, 0, 0, 0.1);
                margin-bottom: 80px;
            }

            .quiz h2 {
                font-size: 20px;
                color: #333;
                margin-bottom: 10px;
            }

            .quiz label {
                font-size: 16px;
                color: #333;
            }

            .quiz input[type="radio"] {
                margin-right: 8px;
            }

            .quiz img {
                width: 100%;
                max-width: 800px;
                height: auto;
                border-radius: 8px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            #footer {
                position: fixed;
                bottom: 0;
                width: 100%;
                height: 60px;
                background-color: #ffffff;
                display: flex;
                justify-content: center;
                align-items: center;
                box-shadow: 0px -1px 10px rgba(0, 0, 0, 0.1);
                padding: 0 20px;
                z-index: 100;
            }

            /*#footer .btn {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                margin: 0 10px;
                border-radius: 8px;
                border: none;
                font-size: 14px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }*/

            /*#footer .btn:hover {
                background-color: #45a049;
            }*/

            #popup, #popup_submit, #popup_submit_finished, #popup_submit_finished_nothing, #popup_submitted {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0px 4px 16px rgba(0, 0, 0, 0.2);
                padding: 20px;
                width: 80%;
                max-width: 400px;
                z-index: 2000;
                text-align: center;
            }

            #popup h3, #popup_submit h3, #popup_submit_finished h3, #popup_submit_finished_nothing h3, #popup_submitted h3 {
                color: #333;
                margin-bottom: 10px;
            }

            #popup p, #popup_submit p, #popup_submit_finished p, #popup_submit_finished_nothing p, #popup_submitted p {
                color: #333333;
                margin-bottom: 20px;
            }


            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.7);
                z-index: 1001;
            }

            .questionSelectPopup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0px 4px 16px rgba(0, 0, 0, 0.2);
                padding: 20px;
                width: 100%;
                max-width: 900px;
                z-index: 2000;
                border-radius: 8px;
                text-align: center;
            }




            #questionList {
                display: grid;
                grid-template-columns: repeat(10, 1fr);
                gap: 5px;
                max-width: 100%;
                margin: 20px 0;
            }

        </style>


    </head>
    <body id="bg" >
        <div id="">
            <div id="container" style="">
                <div class="" >
                    <!-- Thời gian đếm ngược -->
                    <header style="align-items: center; position: relative; height: 50px">
                        <button id="selectQuestionButton" class="btn" style="">Review Progress</button>
                        <div id="time"></div>
                    </header>
                    <hr>
                    <div id="overlay1" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); z-index:1001;"></div>
                    <div id="overlay2" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); z-index:1000;"></div>
                    <!-- Popup chọn câu hỏi -->
                    <div id="questionSelectPopup" class="questionSelectPopup" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; padding:20px; z-index:1002;">
                        <h3>Review Progress</h3>
                        <div id="filterButtons" style="display: flex; gap: 10px; margin-bottom: 10px;">
                            <button class="filter-button btn" data-filter="all">All Question</button>
                            <button class="filter-button btn" data-filter="correct"><span style='align-items: center; background-color: #d4edda; border: 1px solid #cccccc; padding: 0 9px; border-radius: 2px'></span>&nbsp;Correct</button>
                            <button class="filter-button btn" data-filter="incorrect"><span style='align-items: center; background-color: #f6b3b3; border: 1px solid #cccccc; padding: 0 9px; border-radius: 2px'></span>&nbsp;Incorrect</button>
                            <button class="filter-button btn" data-filter="unanswer"><span style='align-items: center; background-color: #f0f0f0; border: 1px solid #cccccc; padding: 0 9px; border-radius: 2px'></span>&nbsp;Unanswer</button>
                            <button class="filter-button btn" data-filter="marked"><i class="fa fa-bookmark" aria-hidden="true" style="color: red; "></i> Marked</button>
                            <button class="submit-button btn-danger" style="margin-left: 120px" onclick="backHome()"><a href="view_practice" style="; color: white">Quit Review</a></button>
                        </div>
                        <div id="questionList" style="display: grid; grid-template-columns: repeat(10, 1fr); gap: 5px;"></div>
                        <div style="font-weight: bold; color: ${sessionScope.practice_record.correct_rate >= passrate ? 'green':'red'}; background-color: ${sessionScope.practice_record.correct_rate >= passrate ? '#ccffcc':'#ffcccc'}; border-radius: 8px; height: 80px; display: flex; align-items: center; justify-content: center">
                            <span style="font-size: 30px">${sessionScope.practice_record.correct_rate}% | ${sessionScope.practice_record.correct_rate >= passrate ? 'PASS':'NOT PASS'}</span>


                        </div>
                        <br>
                        <button onclick="closeQuestionSelectPopup()" class="btn">Close</button>
                    </div>
                    <main id="body">
                        <form action="quiz_handling" method="post" id="submit_form">
                            <input type="text" value="0" name="dur" id="dur" style="display: none"/>
                            <c:forEach items="${sessionScope.list_quest_record}" var="qe" varStatus="status">
                                <div class="quiz" id="quiz${status.index}">
                                    <div style="text-align: center; margin-bottom: 30px" class="">
                                        <h2>
                                            <c:if test="${qe.is_mark}">
                                                <i class="fa fa-bookmark" id="mark_icon${status.index}" aria-hidden="true" style="color: red"></i>
                                            </c:if>
                                            Q${status.count} : ${qe.question_content}</h2>
                                        <input style="display: none" type="text" value="unmarked" name="mark${status.count}" class="mark_quest" id="mark_quest${status.index}"/>
                                        <c:if test="${qe.media != null && (qe.media.endsWith('.jpg') || qe.media.endsWith('.jpeg') || qe.media.endsWith('.png') || qe.media.endsWith('.gif'))}">
                                            <img src="${qe.media}" alt="alt" width="800" style="height: 100%"/> <br>
                                        </c:if>
                                    </div>


                                    <div style="">
                                        <c:forEach items="${qe.list_answer}" var="qe_a" varStatus="answerStatus">
                                            <!-- Sử dụng phép toán với mã ASCII để lấy các chữ cái A, B, C, D -->
                                            <div style="color: ${qe_a.isCorrect? 'green; font-weight: bold':''} ${qe.answered == qe_a.answer_detail && !qe_a.isCorrect ? 'red; font-weight: bold':''}; ">
                                                <input type="radio" value="${qe_a.answer_detail}" disabled="" ${qe_a.isCorrect? 'checked':''} ${qe.answered == qe_a.answer_detail && !qe_a.isCorrect ? 'checked':''}  >

                                                ${fn:substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', answerStatus.index, answerStatus.index + 1)}: ${qe_a.answer_detail} ${qe_a.isCorrect? '&#10003;':''} ${qe.answered == qe_a.answer_detail && !qe_a.isCorrect ? '&#10006':''}  <br>
                                            </div>

                                        </c:forEach>
                                        <c:if test="${qe.answered == null}">
                                            <span style="color: red; font-weight: bold; ">
                                                &#10006; 
                                            </span>
                                            Not answered
                                        </c:if>
                                    </div>
                                    <br>
                                    <div class="peek_at_question" style="display:none; width: 500px; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; color: #121010; padding:20px; z-index:1009; border-radius: 8px;">
                                        <h3>Explanation</h3>
                                        <p>The correct answer is ${fn:substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', qe.correct_answer, qe.correct_answer + 1)}.</p>
                                        <p>Explanation: ${qe.explanation}.</p>
                                        <p>${qe.dimension_type.dimension_type_name} : ${qe.dimension.dimension_name}.</p>
                                        <p>Source : ${qe.subject.subjectName}.</p>
                                        <div onclick="closePopupPeek()" class="btn">Close</div>
                                    </div>

                                </div>
                            </c:forEach>
                            <button id="peek_at_question" class="btn-dark" style="height: 50px; width: 200px; border-radius: 8px" type="button">Explanation</button>
                        </form>
                    </main>
                    <div id="overlay3" style="display: none;position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); z-index:1000;"></div>
                    <div id="popup_submitted" style="display: none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; padding:20px; z-index:2001;">
                        <h3 style="color: #f6b3b3">Warning</h3>
                        <p>You have submitted</p>
                        <button onclick="submitQuiz()" class="btn">OK</button>

                    </div>
                </div>
            </div>
            <div id="footer" style="display: flex; justify-content: space-around">
                <button id="prev" class="btn">Previous</button>
                <button id="next" class="btn">Next</button>
                <button id="submit" class="btn"><a href="view_practice">Quit Review</a></button>
            </div>
            <!-- Fixed buttons outside the footer -->
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
                            const totalQuestions = ${num_quest}; // Tổng số câu hỏi
                            let currentQuestion = 0; // Câu hỏi hiện tại bắt đầu từ 0
                            let totalTime = ${sessionScope.practice_record.practice_duration};
                            const timeEl = document.getElementById("time"); // Phần tử hiển thị thời gian
                            const quizzes = document.querySelectorAll(".quiz");
                            const mark_quest = document.querySelectorAll(".mark_quest");
                            const peeks = document.querySelectorAll(".peek_at_question");
                            const popup = document.getElementById("popup");
                            const popup_submit = document.getElementById("popup_submit");
                            const overlay1 = document.getElementById("overlay1");
                            const overlay2 = document.getElementById("overlay2");
                            const questionSelectPopup = document.getElementById("questionSelectPopup");
                            const questionList = document.getElementById("questionList");
                            const submit_button = document.getElementById("submit_button");
                            const peek_at_question = document.getElementById('peek_at_question');
                            function showPopupSubmitInShowQuest() {
                                closeQuestionSelectPopup();
                                if (answered_questions === 0) {
                                    popup_submit_finished_nothing.style.display = "block"; // Hiển thị popup                     } else if (answered_questions < totalQuestions) {
                                    let number_of_missing = document.getElementById('number_of_missing');
                                    number_of_missing.innerHTML = answered_questions + ' of ' + totalQuestions + ' Questions Answered';
                                    popup_submit_finished.style.display = "block";
                                } else {
                                    popup_submit_finished.style.display = "block"; // Hiển thị popup                     }
                                    overlay1.style.display = "block"; // Hiển thị lớp phủ
                                }
                            }
                            function backHome() {
                                sessionStorage.clear();
                            }

                            // Hàm đóng popup thông báo
                            function closePopupSubmitInShowQuest() {
                                if (answered_questions === 0) {
                                    popup_submit_finished_nothing.style.display = "none"; // Hiển thị popup
                                } else {
                                    popup_submit_finished.style.display = "none"; // Hiển thị popup
                                }
                                overlay1.style.display = "none"; // Ẩn lớp phủ
                            }

                            let markedQuestions = [];
                            let questionStatus = [];
                <c:forEach items="${sessionScope.list_quest_record}" var="qe">
                            markedQuestions.push("${qe.is_mark ? 'marked' : 'unmarked'}");
                            if (${qe.answered == null}) {
                                questionStatus.push('none');
                            } else {
                    <c:forEach items="${qe.list_answer}" var="qe_a">
                                if (${qe_a.isCorrect && qe.answered == qe_a.answer_detail}) {
                                    questionStatus.push('correct');
                                } else if (${qe_a.isCorrect && qe.answered != qe_a.answer_detail}) {
                                    questionStatus.push('incorrect');
                                }
                    </c:forEach>
                            }

                </c:forEach>

                            function closeQuestionSelectPopup() {
                                questionSelectPopup.style.display = "none"; // Ẩn popup
                                overlay2.style.display = "none"; // Ẩn lớp phủ
                            }
                            function closePopupPeek() {
                                //let peek = document.getElementById('peek_at_question' + currentQuestion);
                                let peek = peeks[currentQuestion];
                                peek.style.display = "none";
                                overlay2.style.display = "none";
                            }
                            peek_at_question.addEventListener('click', () => {
                                showPeek();
                            });
                            function showPeek() {
                                //let peek = document.getElementById('peek_at_question' + currentQuestion);
                                let peek = peeks[currentQuestion];
                                peek.style.display = "block";
                                overlay2.style.display = "block";
                            }

                            // Lưu câu hỏi hiện tại vào sessionStorage khi chuyển câu hỏi
                            function saveCurrentQuestion() {
                                sessionStorage.setItem("currentQuestion", currentQuestion);
                            }

                            // Khôi phục câu hỏi hiện tại từ sessionStorage khi tải lại trang
                            function restoreCurrentQuestion() {
                                const savedCurrentQuestion = sessionStorage.getItem("currentQuestion");
                                if (savedCurrentQuestion !== null) {
                                    currentQuestion = parseInt(savedCurrentQuestion, 10); // Chuyển đổi sang số nguyên
                                }
                            }

                            // Nút chọn câu hỏi
                            document.getElementById("selectQuestionButton").addEventListener("click", () => {
                                showQuestionSelectPopup(); // Mở popup với tất cả câu hỏi
                            });
                            // Điều hướng câu hỏi
                            const prevButton = document.getElementById("prev");
                            const nextButton = document.getElementById("next");
                            const submitButton = document.getElementById("submit");
                            // Gọi hàm này khi người dùng chuyển đổi câu hỏi
                            prevButton.addEventListener("click", () => {
                                if (currentQuestion > 0) {
                                    currentQuestion--; // Quay lại câu hỏi trước đó
                                    showQuestion(currentQuestion);
                                    saveCurrentQuestion();
                                }
                                updateNavigationButtons();
                            });
                            nextButton.addEventListener("click", () => {
                                if (currentQuestion < totalQuestions - 1) {
                                    currentQuestion++; // Chuyển sang câu hỏi tiếp theo
                                    showQuestion(currentQuestion);
                                    saveCurrentQuestion();
                                }
                                updateNavigationButtons();
                            });
                            // Hàm cập nhật trạng thái của các nút điều hướng và nút "Submit"
                            function updateNavigationButtons() {
                                prevButton.style.display = currentQuestion === 0 ? "none" : "inline";
                                nextButton.style.display = currentQuestion === totalQuestions - 1 ? "none" : "inline";
                                submitButton.style.display = currentQuestion === totalQuestions - 1 ? "inline" : "none";
                            }

                            // Hiển thị câu hỏi hiện tại
                            function showQuestion(questionIndex) {
                                for (let i = 0; i < totalQuestions; i++) {
                                    const quiz = quizzes[i];
                                    if (i === questionIndex) {
                                        quiz.style.display = "block"; // Hiển thị câu hỏi hiện tại
                                    } else {
                                        quiz.style.display = "none"; // Ẩn các câu hỏi khác
                                    }
                                }
                            }

                            function updateTimer() {

                                const hours = Math.floor(totalTime / (60 * 60));
                                const minutes = Math.floor(totalTime / 60);
                                const seconds = totalTime % 60;
                                if (totalTime >= 0) {
                                    timeEl.textContent = "Time Finished: " +
                                            (hours < 10 ? "0" + hours : hours) + ":" +
                                            (minutes < 10 ? "0" + minutes : minutes) + ":" +
                                            (seconds < 10 ? "0" + seconds : seconds);
                                }

                            }

                            // Thêm sự kiện cho các nút lọc
                            document.querySelectorAll(".filter-button").forEach(button => {
                                button.addEventListener("click", () => {
                                    const filterValue = button.getAttribute("data-filter");
                                    showQuestionSelectPopup(filterValue); // Gọi hàm hiển thị câu hỏi với bộ lọc được chọn
                                });
                            });
                            // Cập nhật hàm showQuestionSelectPopup để luôn hiển thị tất cả câu hỏi
                            function showQuestionSelectPopup(filterValue = "all") {
                                questionList.innerHTML = ""; // Clear previous question list
                                console.log(questionStatus.length);
                                let num_list = 0;
                                for (let i = 0; i < totalQuestions; i++) {
                                    const button = document.createElement("button");
                                    button.textContent = (i + 1);
                                    button.style.position = "relative";
                                    button.style.width = "100%";
                                    button.style.padding = "10px";
                                    button.style.border = "1px solid #ccc";
                                    button.style.cursor = "pointer";
                                    // Set background color based on question status
                                    if (questionStatus[i] === 'correct') {
                                        button.style.backgroundColor = "#d4edda";
                                    } else if (questionStatus[i] === 'incorrect') {
                                        button.style.backgroundColor = "#f6b3b3";
                                    } else if (questionStatus[i] === 'none') {
                                        button.style.backgroundColor = "#f0f0f0";
                                    }

                                    if (markedQuestions[i] === 'marked') {

                                        // Add a red dot to indicate the question is marked
                                        const redDot = document.createElement("span");
                                        redDot.innerHTML = '<i class="fa fa-bookmark" aria-hidden="true"></i>';
                                        redDot.style.position = "absolute";
                                        redDot.style.top = "-5px";
                                        redDot.style.right = "0px";
                                        redDot.style.width = "10px";
                                        redDot.style.height = "10px";
                                        redDot.style.color = 'red';
                                        button.appendChild(redDot);
                                    }

                                    button.onclick = () => {
                                        currentQuestion = i;
                                        saveCurrentQuestion();
                                        showQuestion(currentQuestion);
                                        updateNavigationButtons();
                                        closeQuestionSelectPopup();
                                    };
                                    if (
                                            (filterValue === 'all') ||
                                            (filterValue === 'correct' && questionStatus[i] === 'correct') ||
                                            (filterValue === 'incorrect' && questionStatus[i] === 'incorrect') ||
                                            (filterValue === 'marked' && markedQuestions[i] === 'marked') ||
                                            (filterValue === 'unanswer' && questionStatus[i] === 'none')
                                            ) {
                                        questionList.appendChild(button);
                                        num_list++;
                                    }
                                }
                                if (num_list === 0) {
                                    questionList.innerHTML = "Nothing";
                                }

                                questionSelectPopup.style.display = "block";
                                overlay2.style.display = "block";
                            }

                            window.onload = () => {
                                showQuestion(currentQuestion); // Hiển thị câu hỏi hiện tại
                                updateNavigationButtons();
                                updateTimer(); // Khởi tạo hiển thị thời gian
                            };
            </script>
        </div>
</html>
