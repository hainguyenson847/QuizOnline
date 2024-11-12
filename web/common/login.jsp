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

        <div class="page-wraper popup" id="login-popup" style="margin-top: 50px" >
            <div class="account-form popup-content" >
                <div class="account-form-inner" style="background-color: white">
                    <div style="text-align: right">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-login-popup"></button></div>
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">Login to your <span>Account</span></h2>
                            <p>Don't have an account? <a href="#" id="open-register-popup-in-login">Create one here</a></p>
                        </div>	
                        <form class="contact-bx" action="login" method="post">
                            <div class="row placeani">
                                <c:set var="cookie" value="${pageContext.request.cookies}"/>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <p style="color: red" id="login-error">${requestScope.login_error}</p>
                                        <p style="color: red" id="check-login-error" hidden>Incorrect username or password</p>
                                        <label>Email</label>
                                        <input name="email" type="email" required="" class="form-control" value="${cookie.c_user.value}">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group password-container"> 
                                        <label>Your Password</label>
                                        <input name="userPass" id="userPass" type="password" class="form-control" required=""> 
                                        <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group form-forget">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"  id="customControlAutosizing" name="rem" ${(cookie.c_check_button!=null?'checked':'')}> 
                                            <label class="custom-control-label" for="customControlAutosizing">Remember me</label>
                                        </div>
                                        <a  href="#" class="ml-auto" id="open-requestPass-popup">Forgot Password?</a>
                                    </div>
                                </div>
                                <div class="col-lg-12 m-b30">
                                    <button name="submit" type="submit" value="Submit" class="btn button-md">Login</button>
                                </div>
                                <div class="col-lg-12">
                                    <h6>Login with Social media</h6>
                                    <div class="d-flex">
                                        <a class="btn flex-fill m-l5 google-plus" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/quizonline/googlelogin&response_type=code
                                           &client_id=393624416817-8crlnf1o21kjk410epg6pjg7q6bohd79.apps.googleusercontent.com&approval_prompt=force"><i class="fa fa-google-plus"></i>Google Plus</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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
            const openRegisterButtonInLogin = document.getElementById('open-register-popup-in-login');
            openRegisterButtonInLogin.onclick = function () {
                registerPopup.style.display = 'flex';
            };
        </script>
        
    </body>

</html>