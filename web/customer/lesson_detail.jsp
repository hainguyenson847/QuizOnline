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

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">

        <style>
            /* CSS ?ã ???c c?p nh?t */
            body {
                font-family: 'Roboto', sans-serif;
            }
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

            #chat-box {
                width: 300px;
                height: 400px;
                border: 1px solid #ccc;
                position: fixed;
                bottom: 10px;
                right: -320px; /* ??y h?p chat ra ngoài màn hình ban ??u */
                transition: right 0.3s ease; /* Thêm hi?u ?ng chuy?n ti?p */
                display: flex;
                flex-direction: column;
                background-color: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            #chat-box.show {
                right: 10px; /* Khi có class "show", h?p chat s? hi?n ra */
            }

            #chat-messages {
                flex: 1;
                overflow-y: auto;
                padding: 10px;
                background-color: #ffffff;
                border-radius: 10px;
                margin: 10px;
            }

            .message {
                margin-bottom: 10px;
                padding: 8px;
                border-radius: 8px;
            }

            .user-message {
                font-family: 'Roboto', sans-serif;
                background-color: #d1e7dd;
                align-self: flex-end;
            }

            .chatbot-message {
                font-family: 'Roboto', sans-serif;
                font-size: 14px;
                color: #333; /* Thêm màu ch? cho d? nhìn */
            }

            #chat-input {
                width: calc(100% - 50px);
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin: 10px;
                font-family: 'Roboto', sans-serif;

            }

            #send-btn:hover {
                background-color: #0056b3;
            }

            #toggle-chat {
                position: fixed; /* V? trí c? ??nh */
                bottom: 30px; /* Kho?ng cách t? ?áy màn hình */
                right: 30px; /* Kho?ng cách t? bên ph?i */
                padding: 10px 15px; /* Padding cho nút */
                background-color: #4806ac; /* Màu n?n */
                color: white; /* Màu ch? */
                border: none; /* Xóa ???ng vi?n */
                border-radius: 5px; /* Bo góc */
                font-size: 16px; /* Kích th??c ch? */
                cursor: pointer; /* Hi?n th? con tr? chu?t khi di chu?t vào */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* ?? bóng */
                transition: background-color 0.3s, transform 0.2s; /* Hi?u ?ng chuy?n ??i */
            }

            #toggle-chat:hover {
                background-color: #0056b3; /* Màu n?n khi hover */
                transform: translateY(-2px); /* Hi?u ?ng nh?c lên */
            }

            #toggle-chat:active {
                transform: translateY(0); /* Tr? v? v? trí ban ??u khi nh?n */
            }

        </style>

    </head>

    <body id="bg">
        <div class="page-wraper">
            <header class="header rs-nav header-transparent">
                <%@include file="header.jsp" %>
            </header>
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner2.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Lesson Details</h1>
                        </div>
                    </div>
                </div>
                <div class="content-block">
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <!-- Left part start -->
                                <div class="col-lg-8 col-xl-8">
                                    <!-- lesson start -->
                                    <c:choose>
                                        <c:when test="${not empty lesson}">
                                            <div class="recent-news blog-lg">
                                                <div class="action-box blog-lg" style="text-align: center;">
                                                    <iframe width="100%" height="450" src="${lesson.video_link}" frameborder="0" allowfullscreen></iframe>
                                                </div>
                                                <div class="info-bx">
                                                    <h2 class="post-title" style="font-size: 24px; margin-bottom: 10px;">${lesson.lesson_name}</h2>
                                                    <h5 class="post-title" style="font-size: 18px; color: #666; margin-bottom: 15px;">${lesson.summary}</h5>
                                                    <p style="line-height: 1.6;">${lesson.lesson_content}</p>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p>Lesson not found.</p>
                                        </c:otherwise>
                                    </c:choose>
                                    <!-- blog END -->
                                </div>

                                <!-- Left part END -->
                                <div class="col-lg-4 col-xl-4">
                                    <aside class="side-bar sticky-top">
                                        <!-- Thêm nút ?? m? h?p chat -->
                                        <button id="toggle-chat" style="position: fixed; bottom: 450px; padding-left: 20px;">You don't understand? Ask Me Anything</button>
                                        <div id="chat-box">
                                            <div id="chat-messages"></div>
                                            <input type="text" id="chat-input" placeholder="Enter message...">
                                        </div>
                                    </aside>
                                </div>
                                <!-- Side bar END -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Content END-->
            </div>
        </div>

        <script>
            const qaQueue = [];
            // Thêm s? ki?n click cho nút m? chat
            document.getElementById("toggle-chat").addEventListener("click", function () {
                const chatBox = document.getElementById("chat-box");
                chatBox.classList.toggle("show");
                this.textContent = chatBox.classList.contains("show") ? "Close Chat" : "You don't understand? Ask Me Anything";
            });

            // Thêm s? ki?n nh?n phím Enter ?? g?i tin nh?n
            document.getElementById("chat-input").addEventListener("keypress", function (e) {
                if (e.key === 'Enter') {
                    sendMessage();
                }
            });

            // Hàm g?i tin nh?n ??n server
            function sendMessage() {
                const input = document.getElementById("chat-input");
                const userMessage = input.value.trim();

                if (userMessage) {
                    addMessage(userMessage, "user");
                    input.value = ''; // Xóa n?i dung input

                    console.log("DEBUG: ", userMessage);
                    saveQA(userMessage, ""); // ??t câu tr? l?i t?m th?i là r?ng

                    fetch("chatbot", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/x-www-form-urlencoded"
                        },
                        body: JSON.stringify({message: qaQueue})
                    })
                            .then(response => response.json())
                            .then(data => {
                                console.log("Data", data.chatbot_response);
                                addMessage(data.chatbot_response, "chatbot");
                                updateLastQAAnswer(data.chatbot_response);
                            })

                            .catch(error => {
                                console.error("Error:", error);
                                addMessage("Error", "chatbot");
                                // restart function
//                                    removeLastQA();
//                                    sendMessage();
                            });
                }
            }

            // Hàm thêm tin nh?n vào chat box
            function addMessage(message, sender) {
                const chatMessages = document.getElementById("chat-messages");
                const messageElement = document.createElement("div");
                messageElement.className = "message " + (sender === "user" ? "user-message" : "chatbot-message");
                messageElement.textContent = message;
                chatMessages.appendChild(messageElement);
                chatMessages.scrollTop = chatMessages.scrollHeight; // Cu?n xu?ng d??i cùng
            }
            function saveQA(question, answer) {
                // Thêm c?p QA vào queue
                qaQueue.push({question: question, answer: answer});

                // N?u queue ?ã ??y (10 c?p), xóa c?p c? nh?t
                if (qaQueue.length > 10) {
                    qaQueue.shift(); // Xóa ph?n t? ??u tiên trong m?ng
                }

                // In ra queue ?? ki?m tra
                console.log("Current QA Queue:", qaQueue);
            }
            function updateLastQAAnswer(answer) {
                if (qaQueue.length > 0) {
                    qaQueue[qaQueue.length - 1].answer = answer; // C?p nh?t câu tr? l?i cho c?p QA cu?i cùng
                }
            }
            function removeLastQA() {
                if (qaQueue.length > 0) {
                    qaQueue.pop(); // Xóa ph?n t? cu?i cùng trong m?ng
                    console.log("Last QA pair removed. Current QA Queue:", qaQueue);
                } else {
                    console.log("No QA pairs to remove.");
                }
            }
        </script>
    </body>
</html>
