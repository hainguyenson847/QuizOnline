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
                max-width: 900px;
                z-index: 2000;
                text-align: center;
                height: 360px;
            }

            #popup h3, #popup_submit h3, #popup_submit_finished h3, #popup_submit_finished_nothing h3, #popup_submitted h3 {
                color: #333;
                margin-bottom: 40px;
                font-size: 30px;
            }

            #popup p, #popup_submit p, #popup_submit_finished p, #popup_submit_finished_nothing p, #popup_submitted p {
                color: #555;
                margin-bottom: 50px;
                font-size: 20px;
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
    <body id="bg" onload="isSubmitted()">
        <div id="">
            <div id="container" style="">
                <div class="" >
                    <!-- Thời gian đếm ngược -->
                    <header style="align-items: center; position: relative; height: 50px">
                        <button id="selectQuestionButton" class="btn" style="">Review Progress</button>
                        <div id="time"></div>

                        <!-- Nút đánh dấu câu hỏi hiện tại -->
                        <button id="markCurrentQuestion" class="btn" style=""> Mark Question</button>
                    </header>

                    <hr>

                    <div id="popup" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; padding:20px; z-index:2001;">
                        <h3>Warning</h3>
                        <p>Time is up! The exam will be submitted.</p>
                        <button onclick="submitQuiz()" class="btn">OK</button>
                    </div>
                    <div id="popup_submit" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; padding:20px; z-index:1009;">
                        <h3>Warning</h3>
                        <p>Do you want to submit?</p>
                        <button onclick="submitQuiz()" class="btn">OK</button>
                        <button onclick="closePopupSubmit()" class="btn">Close</button>

                    </div>

                    <div id="popup_submit_finished" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; padding:20px; z-index:1009;">
                        <h3>Score Exam?</h3>
                        <p style="color: red" id="number_of_missing"></p>
                        <p>By clicking in the [Score Exam] button below, you will complete your current exam and receive your score. You will not be able to change any answer after this point.</p>
                        <button onclick="closePopupSubmitInShowQuest()" class="btn"><i class="ti-arrow-left"></i> Back</button>
                        <button onclick="submitQuiz()" class="btn">Score Exam</button>

                    </div>

                    <div id="popup_submit_finished_nothing" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; padding:20px; z-index:1009;">
                        <h3>Exit Exam?</h3>
                        <p>You have not answered any question. By clicking in the [Exit Exam] button below, you will complete your current exam and be returned to the dashboard.</p>
                        <button onclick="closePopupSubmitInShowQuest()" class="btn"><i class="ti-arrow-left"></i> Back</button>
                        <button onclick="submitQuiz()" class="btn">Exit Exam</button>

                    </div>


                    <div id="overlay1" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); z-index:1001;"></div>
                    <div id="overlay2" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); z-index:1000;"></div>
                    <!-- Popup chọn câu hỏi -->
                    <div id="questionSelectPopup" class="questionSelectPopup" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; padding:20px; z-index:1002;">
                        <h3>Review Progress</h3>
                        <p>Review before scoring exam</p>
                        <div id="filterButtons" style="display: flex; gap: 10px; margin-bottom: 10px;">
                            <button class="filter-button btn" data-filter="all">All Question</button>
                            <button class="filter-button btn" data-filter="answered"><span style='align-items: center; background-color: #d4edda; border: 1px solid #cccccc; padding: 0 9px; border-radius: 2px'></span>&nbsp;Answered</button>
                            <button class="filter-button btn" data-filter="unanswered"><span style='align-items: center; background-color: #f0f0f0; border: 1px solid #cccccc; padding: 0 9px; border-radius: 2px'></span>&nbsp;Unanswered</button>
                            <button class="filter-button btn" data-filter="marked"><i class="fa fa-bookmark" aria-hidden="true" style="color: red; "></i> Marked</button>
                            <button class="submit-button btn" id="submit_button" style="margin-left: 178px">Score Exam Now</button>
                        </div>
                        <div id="questionList" style="display: grid; grid-template-columns: repeat(10, 1fr); gap: 5px;"></div>
                        <button onclick="closeQuestionSelectPopup()" class="btn">Close</button>
                    </div>
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


                    <main id="body">
                        <form action="quiz_handling" method="post" id="submit_form">
                            <input type="text" value="0" name="dur" id="dur" style="display: none"/>
                            <input type="text" value="${sessionScope.num_quest}" name="una" id="una" style="display: none"/>
                            <c:forEach items="${sessionScope.questions}" var="qe" varStatus="status">
                                <div class="quiz" id="quiz${status.index}">
                                    <div style="text-align: center; margin-bottom: 30px" class="">
                                        <h2><i class="fa fa-bookmark" id="mark_icon${status.index}" aria-hidden="true" style="color: red; display: none"></i> Q${status.count} : ${qe.question_content}</h2>
                                        <input style="display: none" type="text" value="unmarked" name="mark${status.count}" class="mark_quest" id="mark_quest${status.index}"/>
                                        <c:if test="${qe.media != null && (qe.media.endsWith('.jpg') || qe.media.endsWith('.jpeg') || qe.media.endsWith('.png') || qe.media.endsWith('.gif'))}">
                                            <img src="${qe.media}" alt="alt" width="800" style="height: 100%"/> <br>
                                        </c:if>
                                    </div>


                                    <div style="">
                                        <c:forEach items="${qe.list_answer}" var="qe_a" varStatus="answerStatus">
                                            <!-- Sử dụng phép toán với mã ASCII để lấy các chữ cái A, B, C, D -->
                                            <input type="radio" name="question${status.count}" value="${qe_a.answer_detail}">
                                            ${fn:substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', answerStatus.index, answerStatus.index + 1)}: ${qe_a.answer_detail} <br>
                                        </c:forEach>
                                    </div>
                                    <br>
                                    <c:if test="${prac}" >
                                        <div class="peek_at_question" style="display:none; width: 500px; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; padding:20px; z-index:1009;">
                                            <h3>Peek At Answer</h3>
                                            <p>The correct answer is ${fn:substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', qe.correct_answer, qe.correct_answer + 1)}.</p>
                                            <p>Explanation: ${qe.explanation}.</p>
                                            <p>${qe.dimension_type.dimension_type_name} : ${qe.dimension.dimension_name}.</p>
                                            <p>Source : ${qe.subject.subjectName}.</p>
                                            <div onclick="closePopupPeek()" class="btn">Close</div>

                                        </div>
                                    </c:if>


                                </div>
                            </c:forEach>
                            <c:if test="${prac}" >
                                <button id="peek_at_question" class="btn-dark" style="height: 50px; width: 200px; border-radius: 8px" type="button">Peek At Question</button>
                            </c:if>



                        </form>
                    </main>



                    <div >



                    </div>
                    <div id="overlay3" style="display: none;position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.7); z-index:1000;"></div>
                    <div id="popup_submitted" style="display: none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); background-color:white; border:1px solid black; padding:20px; z-index:2001;">
                        <h3>Warning</h3>
                        <p>You have submitted</p>
                        <button  class="btn"><a href="view_practice">OK</a></button>

                    </div>
                </div>
            </div>
            <div id="footer" style="display: flex; justify-content: space-around">
                <button id="prev" class="btn">Previous</button>
                <button id="next" class="btn">Next</button>
                <button id="submit" class="btn" onclick="showPopupSubmitInShowQuest()">Submit</button>
            </div>
            <!-- Fixed buttons outside the footer -->


        </div>



        <!-- Mã HTML và JavaScript của bài kiểm tra -->

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
                    const totalQuestions = ${sessionScope.num_quest}; // Tổng số câu hỏi
                    let currentQuestion = ${sessionScope.curr_quest}; // Câu hỏi hiện tại bắt đầu từ 0
                    let totalTime = sessionStorage.getItem("totalTime") || ${prac ? 0:sessionScope.duration};
                    let answered_questions = sessionStorage.getItem("answered") || 0;
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
                    const form = document.getElementById("submit_form");
                    const submit_button = document.getElementById("submit_button");
                    const popup_submit_finished = document.getElementById("popup_submit_finished");
                    const popup_submit_finished_nothing = document.getElementById("popup_submit_finished_nothing");
                    const una = document.getElementById('una');
                    const time_left = sessionStorage.getItem("time_finish") || (${sessionScope.duration} + Math.floor(new Date().getTime() / 1000));
                    let dur = document.getElementById('dur');
                    const isSub = sessionStorage.getItem("isSubmitted");
                    const peek_at_question = document.getElementById('peek_at_question');
                    submit_button.addEventListener("click", () => {
                        showPopupSubmitInShowQuest()();
                    });

                    function closePopupPeek() {
                        //let peek = document.getElementById('peek_at_question' + currentQuestion);
                        let peek = peeks[currentQuestion];
                        peek.style.display = "none";
                        overlay2.style.display = "none";
                    }
                    if (${prac}) {
                        peek_at_question.addEventListener('click', () => {
                            showPeek();
                        });
                    }

                    function showPopupSubmitInShowQuest() {
                        closeQuestionSelectPopup();
                        if (answered_questions === 0) {
                            popup_submit_finished_nothing.style.display = "block"; // Hiển thị popup
                        } else if (answered_questions < totalQuestions) {
                            let number_of_missing = document.getElementById('number_of_missing');
                            number_of_missing.innerHTML = answered_questions + ' of ' + totalQuestions + ' Questions Answered';
                            popup_submit_finished.style.display = "block";
                        } else {
                            popup_submit_finished.style.display = "block"; // Hiển thị popup
                        }
                        overlay1.style.display = "block"; // Hiển thị lớp phủ
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

                    function showPopupSubmit() {
                        popup_submit.style.display = "block"; // Hiển thị popup
                        overlay1.style.display = "block"; // Hiển thị lớp phủ
                    }

                    // Hàm đóng popup thông báo
                    function closePopupSubmit() {
                        popup_submit.style.display = "none"; // Ẩn popup
                        overlay1.style.display = "none"; // Ẩn lớp phủ
                    }
                    let markedQuestions = Array(totalQuestions).fill('unmarked');
                    // Mảng trạng thái cho câu hỏi (unanswered, answered, marked)
                    let questionStatus = Array(totalQuestions).fill('unanswered');
// Hàm đánh dấu câu hỏi hiện tại
                    document.getElementById("markCurrentQuestion").addEventListener("click", () => {
                        let mark_icon = document.getElementById('mark_icon' + currentQuestion);
                        let mark_quest = document.getElementById('mark_quest' + currentQuestion);
                        if (markedQuestions[currentQuestion] !== 'marked') {
                            markedQuestions[currentQuestion] = 'marked';
                            mark_icon.style.display = 'inline';
                            mark_quest.value = 'marked';
                        } else {
                            markedQuestions[currentQuestion] = 'unmarked';
                            mark_icon.style.display = 'none';
                            mark_quest.value = 'unmarked';
                        }
                        saveQuestionStatus();
                    });
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

                    // Khởi tạo mảng trạng thái đã đánh dấu từ sessionStorage
                    function restoreMarkedQuestions() {
                        const savedMarkedQuestions = sessionStorage.getItem("markedQuestions");
                        if (savedMarkedQuestions) {
                            markedQuestions = JSON.parse(savedMarkedQuestions);
                        }
                    }

                    function restoreMarkedQuests() {
                        for (let i = 0; i < totalQuestions; i++) {
                            if (markedQuestions[i] === 'marked') {
                                let mark_icon = document.getElementById('mark_icon' + i);
                                document.getElementById('mark_quest' + i).value = 'marked';
                                mark_icon.style.display = 'inline';
                            }
                        }

                    }

                    // Cập nhật hàm lưu trạng thái câu hỏi để bao gồm trạng thái đánh dấu
                    function saveQuestionStatus() {
                        updateCurrentQuestionStatus();
                        sessionStorage.setItem("questionStatus", JSON.stringify(questionStatus));
                        sessionStorage.setItem("markedQuestions", JSON.stringify(markedQuestions)); // Lưu trạng thái đã đánh dấu
                        for (let i = 0; i < totalQuestions; i++) {
                            const answers = document.getElementsByName('question' + (i + 1));
                            answers.forEach((answer, index) => {
                                if (answer.checked) {
                                    sessionStorage.setItem('question' + (i + 1), index); // Lưu vị trí của đáp án được chọn
                                }
                            });
                        }


                    }

                    // Hàm để khôi phục trạng thái các câu hỏi từ sessionStorage
                    function restoreQuestionStatus() {
                        const savedStatus = sessionStorage.getItem("questionStatus");
                        if (savedStatus) {
                            questionStatus = JSON.parse(savedStatus);
                        }

                        for (let i = 0; i < totalQuestions; i++) {
                            const answers = document.getElementsByName('question' + (i + 1));
                            const savedAnswer = sessionStorage.getItem('question' + (i + 1));
                            if (savedAnswer !== null) {
                                answers[savedAnswer].checked = true; // Đặt lại trạng thái đã chọn cho câu hỏi
                            }
                        }
                    }

// Lưu trạng thái khi người dùng chọn câu trả lời hoặc đánh dấu câu hỏi
                    document.querySelectorAll("input[type='radio']").forEach((input) => {
                        input.addEventListener("change", saveQuestionStatus);
                    });
// Tải trạng thái câu hỏi từ sessionStorage khi tải trang
                    function loadQuestionStatus() {
                        const savedStatus = sessionStorage.getItem("questionStatus");
                        if (savedStatus) {
                            questionStatus = JSON.parse(savedStatus);
                            // Cập nhật hiển thị trạng thái màu của từng câu hỏi nếu cần
                            questionStatus.forEach((status, index) => {
                                const button = document.getElementById("question" + (index + 1));
                                if (button) {
                                    if (status === 'answered') {
                                        button.style.backgroundColor = "#d4edda";
                                    } else if (status === 'marked') {
                                        button.style.backgroundColor = "#fff3cd";
                                    } else {
                                        button.style.backgroundColor = "#f0f0f0";
                                    }
                                }
                            });
                        }
                    }

                    // Khôi phục câu hỏi hiện tại từ sessionStorage khi tải lại trang
                    function restoreCurrentQuestion() {
                        const savedCurrentQuestion = sessionStorage.getItem("currentQuestion");
                        if (savedCurrentQuestion !== null) {
                            currentQuestion = parseInt(savedCurrentQuestion, 10); // Chuyển đổi sang số nguyên
                        }
                    }

// Cập nhật trạng thái của câu hỏi hiện tại và lưu lại
                    function updateCurrentQuestionStatus() {
                        const answers = document.getElementsByName('question' + (currentQuestion + 1));
                        let answerSelected = false;
                        answers.forEach(answer => {
                            if (answer.checked) {
                                answerSelected = true;
                            }
                        });
                        if (answerSelected && questionStatus[currentQuestion] !== 'answered') {
                            questionStatus[currentQuestion] = 'answered';
                            ++answered_questions;
                            una.value = totalQuestions - answered_questions;
                            sessionStorage.setItem("answered", answered_questions);
                        }
                        console.log(answered_questions);
                    }

                    // Cập nhật thời gian đếm ngược
                    function updateTimer() {

                        const hours = Math.floor(totalTime / (60 * 60));
                        const minutes = Math.floor(totalTime / 60);
                        const seconds = totalTime % 60;
                        if (totalTime >= 0) {
                            timeEl.textContent =
                                    (hours < 10 ? "0" + hours : hours) + ":" +
                                    (minutes < 10 ? "0" + minutes : minutes) + ":" +
                                    (seconds < 10 ? "0" + seconds : seconds);
                        }

                        sessionStorage.setItem("totalTime", totalTime);

                        if (sessionStorage.getItem("time_finish") === null) {
                            let tt = ${sessionScope.duration};
                            let ttt = Math.floor(new Date().getTime() / 1000) + tt;
                            sessionStorage.setItem("time_finish", ttt);
                        }

                    }

                    // Bắt đầu đếm ngược
                    const timerInterval = setInterval(() => {
                        if (${prac}) {
                            isSubmitted();
                            totalTime++;
                            dur.value = totalTime;
                            updateTimer();
                        } else {
                            isSubmitted();
                            totalTime = time_left - Math.floor(new Date().getTime() / 1000);
                            if (totalTime >= 0) {
                                dur.value = ${sessionScope.duration} - totalTime;
                            }
                            updateTimer();
                            if (totalTime <= 0) {
                                clearInterval(timerInterval);
                                // Hết thời gian, hiển thị popup
                                showPopup(); // Hiển thị popup
                                //submitQuiz(); // Gọi hàm nộp bài

                            }
                        }

                    }, 1000); // Cập nhật mỗi giây

                    // Hàm hiển thị popup thông báo
                    function showPopup() {
                        questionSelectPopup.style.display = "none";
                        popup.style.display = "block"; // Hiển thị popup
                        overlay1.style.display = "block"; // Hiển thị lớp phủ
                    }

                    // Hàm đóng popup thông báo
                    function closePopup() {
                        popup.style.display = "none"; // Ẩn popup
                        overlay1.style.display = "none"; // Ẩn lớp phủ
                    }

                    // Nút chọn câu hỏi
                    document.getElementById("selectQuestionButton").addEventListener("click", () => {
                        showQuestionSelectPopup(); // Mở popup với tất cả câu hỏi
                    });
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
                            if (questionStatus[i] === 'answered') {
                                button.style.backgroundColor = "#d4edda";
                            } else {
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
                                    (filterValue === 'answered' && questionStatus[i] === 'answered') ||
                                    (filterValue === 'unanswered' && questionStatus[i] === 'unanswered') ||
                                    (filterValue === 'marked' && markedQuestions[i] === 'marked')
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


                    // Hàm đóng popup chọn câu hỏi
                    function closeQuestionSelectPopup() {
                        questionSelectPopup.style.display = "none"; // Ẩn popup
                        overlay2.style.display = "none"; // Ẩn lớp phủ
                    }

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
                        console.log(answered_questions);
                        updateNavigationButtons();
                    });
                    // Hàm cập nhật trạng thái của các nút điều hướng và nút "Submit"
                    function updateNavigationButtons() {
                        prevButton.style.display = currentQuestion === 0 ? "none" : "inline";
                        nextButton.style.display = currentQuestion === totalQuestions - 1 ? "none" : "inline";
                        submitButton.style.display = currentQuestion === totalQuestions - 1 ? "inline" : "none";
                    }

                    // Hàm nộp bài
                    function submitQuiz() {
                        sessionStorage.setItem("isSubmitted", "true");
                        closePopupSubmitInShowQuest();
                        form.submit();
                    }

// Hàm kiểm tra xem người dùng đã nộp bài hay chưa khi tải lại trang
                    function isSubmitted() {
                        const isSub = sessionStorage.getItem("isSubmitted"); // Lấy giá trị từ sessionStorage
                        if (isSub === "true") {
                            const popup_submitted = document.getElementById("popup_submitted");
                            const overlay3 = document.getElementById("overlay3");
                            popup_submitted.style.display = "block"; // Hiển thị popup
                            overlay3.style.display = "block"; // Hiển thị lớp phủ
                            clearInterval(timerInterval); // Dừng bộ đếm thời gian
                        }
                    }

// Tải trạng thái câu hỏi từ sessionStorage khi tải trang
                    window.onload = () => {
                        restoreCurrentQuestion(); // Khôi phục câu hỏi hiện tại
                        restoreQuestionStatus(); // Khôi phục trạng thái câu hỏi
                        restoreMarkedQuestions(); // Khôi phục trạng thái đánh dấu câu hỏi
                        showQuestion(currentQuestion); // Hiển thị câu hỏi hiện tại
                        updateNavigationButtons();
                        updateTimer(); // Khởi tạo hiển thị thời gian
                        isSubmitted(); // Kiểm tra xem người dùng đã nộp bài chưa
                    };

        </script>

    </body>




</html>
