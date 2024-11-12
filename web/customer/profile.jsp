<%-- 
    Document   : profile
    Created on : Sep 20, 2024, 1:32:49 PM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body id="bg" onload="${requestScope.erru == null ? 'firstAccess()':'updateAcces()'}">

        <%@include file="header.jsp" %>
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <!-- Header Top ==== -->
            <!-- header END ==== -->
            <!-- Content -->
            <c:set value="${sessionScope.user}" var="acc"/>
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <div class="page-banner ovbl-dark" style="background-image:url(assets/images/banner/banner1.jpg);">
                    <div class="container">
                        <div class="page-banner-entry">
                            <h1 class="text-white">Profile</h1>
                        </div>
                    </div>
                </div>               
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="profile-bx text-center">
                                        <div class="user-profile-thumb">
                                            <img src="${acc.avatar == null ? 'img\\avatars\\default-avatar.jpg':acc.avatar}" alt=""/>

                                        </div>
                                        <div class="profile-info">
                                            <h4>${acc.first_name} ${acc.last_name}</h4>
                                        </div>
                                        <hr>
                                        <label style="cursor: pointer" onclick="changeAvatar()" id="changeavt_label">Change Avatar</label>
                                        <form action="changavt" method="post" style="display: none" enctype="multipart/form-data" id="change_avt">
                                            <input type="file" id="imageInput" style="width: 100px" name="avt" required>
                                            <br><br>
                                            <img id="imagePreview" style="width: 70px; height: 70px; display: none; border-radius: 100%; margin: 0 65% 10% 35%">
                                            <input type="submit" value="Change" onclick="return confirmUpload();" />

                                            <script>
                                                const imageInput = document.getElementById('imageInput');
                                                const imagePreview = document.getElementById('imagePreview');
                                                const maxFileSize = 2 * 1024 * 1024; // Giới hạn dung lượng (2MB)

                                                imageInput.addEventListener('change', function (event) {
                                                    const file = event.target.files[0];

                                                    if (file) {
                                                        // Kiểm tra loại file
                                                        const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
                                                        if (!allowedTypes.includes(file.type)) {
                                                            alert('Avatar must be JPG, PNG or GIF.');
                                                            imageInput.value = ''; // Xóa file đã chọn
                                                            imagePreview.style.display = 'none'; // Ẩn ảnh xem trước nếu không đúng định dạng
                                                            return;
                                                        }

                                                        // Kiểm tra dung lượng file
                                                        if (file.size > maxFileSize) {
                                                            alert('Size of file cannot exceed 2MB.');
                                                            imageInput.value = ''; // Xóa file đã chọn
                                                            imagePreview.style.display = 'none'; // Ẩn ảnh xem trước nếu quá dung lượng
                                                            return;
                                                        }

                                                        // Xem trước hình ảnh
                                                        const reader = new FileReader();
                                                        reader.onload = function (e) {
                                                            imagePreview.src = e.target.result;
                                                            imagePreview.style.display = 'block';
                                                        };
                                                        reader.readAsDataURL(file);
                                                    }
                                                });

                                                // Xác nhận trước khi thực hiện thay đổi ảnh
                                                function confirmUpload() {
                                                    return confirm("Are you sure to change?");
                                                }
                                            </script>
                                        </form>
                                        <div class="profile-tabnav">
                                            <ul class="nav nav-tabs">
                                                <li class="nav-item">
                                                    <a class="nav-link" id="first_link" data-toggle="tab" href="#quiz-results"><i class="ti-bookmark-alt"></i>Dashboard</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#edit-profile" id="err_pro"><i class="ti-pencil-alt"></i>Edit Profile</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#change-password"><i class="ti-lock"></i>Change Password</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-12 m-b30">
                                    <div class="profile-content-bx">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="courses">
                                            </div>
                                            <div class="tab-pane" id="quiz-results" style="background-color: #faf9f6; ">
                                                <div class="profile-head">
                                                    <h3>Dashboard</h3>
                                                </div>
                                                <div class="courses-filter">
                                                    <div class="row" style="margin-left: 60px">
                                                        <div class="col-md-12 col-lg-12 row " style="">
                                                            <div class="col-md-5 dashboard_attribute" >
                                                                <div style="display: flex; justify-content: normal; position: relative">
                                                                    <h6>Total Enrolled Subject</h6>
                                                                    <a class="dashboard_brief" href="customerregistrationlist" >
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16" style="width: 40px;  color: white;">
                                                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                                                        </svg>
                                                                    </a>

                                                                </div>

                                                                <p>${sessionScope.enrolled_subject}</p>

                                                            </div>
                                                            <div class="col-md-1" >

                                                            </div>
                                                            <div class="col-md-5 dashboard_attribute" style="">
                                                                <div style="display: flex; justify-content: normal; position: relative">
                                                                    <h6>Total Quiz Done</h6>
                                                                    <a class="dashboard_brief" href="view_practice" style="">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="25" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16" style="width: 40px;  color: white;">
                                                                        <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                                                        <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                                                        </svg>
                                                                    </a>

                                                                </div>

                                                                <p>${sessionScope.finished_quiz}</p>

                                                            </div>
                                                            <%--
                                                            <ul class="course-features">
                                                                <li><i class="ti-book"></i> <span class="label">Lectures</span> <span class="value">8</span></li>
                                                                <li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">1</span></li>
                                                                <li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">60 hours</span></li>
                                                                <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
                                                                <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                                <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>
                                                                <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                            </ul>
                                                            --%>

                                                        </div>
                                                        <div class="col-md-12 col-lg-12">
                                                            <%--
                                                            <ul class="course-features">
                                                                <li><i class="ti-book"></i> <span class="label">Lectures</span> <span class="value">8</span></li>
                                                                <li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">1</span></li>
                                                                <li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">60 hours</span></li>
                                                                <li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
                                                                <li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
                                                                <li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>
                                                                <li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
                                                            </ul>
                                                            --%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="profile-head" style="margin-top: 20px">
                                                    <h3>Recently Enrolled Subjects</h3>

                                                </div>
                                                <div class="courses-filter">
                                                    <div class="clearfix">
                                                        <ul id="masonry" class="ttr-gallery-listing magnific-image row">
                                                            <c:forEach items="${sessionScope.recently_enrolled_subject}" var="r_subject">
                                                                <li class="action-card col-xl-4 col-lg-6 col-md-12 col-sm-6 publish">
                                                                    <div class="cours-bx">

                                                                        <div class="action-box">
                                                                            <img src="${r_subject.thumbnail}" alt="">
                                                                            <a href="subject_details?subject_id=${r_subject.subjectId}" class="btn">Read More</a>
                                                                        </div>
                                                                        <div class="info-bx text-center">
                                                                            <h5><a href="subject_details?subject_id=${r_subject.subjectId}">${r_subject.subjectName}</a></h5>
                                                                            <span>${r_subject.tagline}</span>
                                                                        </div>
                                                                        <div class="cours-more-info">
                                                                            <div class="review">
                                                                                <span>Enrolled Date</span>
                                                                                <br><!-- comment -->
                                                                                <span>${r_subject.registration_time}</span>
                                                                            </div>
                                                                            <div class="price">
                                                                                <h5>Cost:</h5>
                                                                                <h5>$${r_subject.cost}</h5>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </c:forEach>

                                                        </ul>
                                                    </div>
                                                </div>
                                                <c:if test="${sessionScope.no_enrolled_subject}">
                                                    <div class="profile-head" >
                                                        <h3>NO ENROLLED SUBJECT</h3>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <!--                                            xử lý dữ liệu ở đây-->

                                            <div class="tab-pane" id="edit-profile">
                                                <div class="profile-head">
                                                    <h3>Edit Profile</h3>
                                                </div>
                                                <form class="edit-profile" action="profile" method="post">
                                                    <div class="">
                                                        <div class="form-group row">
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                                <h3>Personal Details</h3>
                                                            </div>
                                                        </div>
                                                        <div style="margin-bottom: 30px; color: red">
                                                            <c:if test="${requestScope.erru != null}">
                                                                ${requestScope.erru}
                                                            </c:if>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Full Name</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">

                                                                <input class="form-control" type="text" value="${acc.first_name} ${acc.last_name}" name="fullname" required="">

                                                                <%-- 
                                                                private String fullName, email, avatar, password, mobile, gender;
                                                                private int roleId;
                                                                --%>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Gender</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7" style="display: flex; align-items: center">
                                                                <input type="radio" name="gender" value="Male" ${acc.gender ? 'checked':''} required=""/>&nbsp;Male 
                                                                <input style="margin-left: 50px" type="radio" name="gender" value="Female" ${acc.gender ? '':'checked'} required/>&nbsp;Female
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Phone No.</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7" >
                                                                <input class="form-control" type="text" value="${acc.mobile}" name="mobile" id="mobile" required>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Email</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input class="form-control" type="email" value="${acc.email}" name="email" id="email" disabled="">
                                                                <button type="button" class="btn"><a href="update_email">Update Email</a></button>
                                                            </div>
                                                        </div>
                                                        <div class="seperator"></div>
                                                        <div id="errorupdate" style="text-align: center; margin-bottom: 30px; color: red">

                                                        </div>
                                                    </div>
                                                    <div class="">
                                                        <div class="">
                                                            <div class="row">
                                                                <%--
                                                                <div class="col-lg-9 col-12 col-sm-9 col-md-9 col-lg-7 center row">
                                                                    <label class="col-12 col-sm-4 col-md-3 col-lg-2 col-form-label">Enter Password</label>
                                                                    <div class="col-12 col-sm-4 col-md-8 col-lg-7">
                                                                        <input class="form-control" type="text" name="email" id="">
                                                                    </div>
                                                                    <button type="button" class="btn" id="">Confirm</button>

                                                                </div>
                                                                <button type="button" class="btn" id="">Update Profile</button>
                                                                <br>
                                                                --%>

                                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7" style="display: ">
                                                                    <button type="button" class="btn" id="updatepro" onclick="updateProfile()">Save changes</button>
                                                                    <button type="reset" class="btn-secondry">Cancel</button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="tab-pane" id="change-password">
                                                <div class="profile-head">
                                                    <h3>Change Password</h3>
                                                </div>
                                                <form class="edit-profile" id="edit_pass" action="profile" method="post">
                                                    <div class="">
                                                        <div class="form-group row">
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-9 ml-auto">
                                                                <h3>Password</h3>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                <input class="form-control" type="password" value="" name="currPass" id="curr">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">New Password</label>
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                <input class="form-control" type="password" value="" id="newpass" name="newpass">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Re Type New Password</label>
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                <input class="form-control" type="password" value="" id="renewpass">
                                                            </div>
                                                        </div>
                                                        <div id="error" style="text-align: center; margin-bottom: 30px; color: red">

                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12 col-sm-4 col-md-4 col-lg-3">
                                                        </div>
                                                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                            <button id="changepass" type="button" class="btn" onclick="checkCurrentPass(document.getElementById('curr').value)">Save changes</button>
                                                            <button type="reset" class="btn-secondry">Cancel</button>
                                                        </div>
                                                    </div>

                                                </form>
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
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src='assets/vendors/switcher/switcher.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>


        <script >
                                                                function changeAvatar() {
                                                                    document.getElementsByClassName('ff')[0]
                                                                    let changeForm = document.getElementById('change_avt');
                                                                    let changeLabel = document.getElementById('changeavt_label');
                                                                    if (changeForm.style.display === 'none') {
                                                                        changeForm.style.display = 'block';
                                                                        changeLabel.innerHTML = 'Cancel';
                                                                    } else {
                                                                        changeForm.style.display = 'none';
                                                                        changeLabel.innerHTML = 'Change Avatar';
                                                                    }
                                                                }
                                                                
                                                                function firstAccess() {
                                                                    if (${requestScope.updatesc != null}) {
                                                                        window.alert('Update successfully');
                                                                    } else if (${requestScope.cpsuccess != null}) {
                                                                        window.alert('Change password successfully');
                                                                    } else if (${sessionScope.changed_avt != null}) {
                                                                        window.alert('Change avatar successfully');
                                                                                                                                            <%
                                                                                                                                                session.setAttribute("changed_avt", null);
                                                                                                                                                %>
                                                                    }
                                                                    document.getElementById("first_link").click();
                                                                }

                                                                function updateAcces() {
                                                                    document.getElementById("err_pro").click();
                                                                }

                                                                function checkCurrentPass(pass) {
                                                                    let err = document.getElementById('error');
                                                                    let newPass = document.getElementById('newpass');
                                                                    let reNewPass = document.getElementById('renewpass');
                                                                    let cp = document.getElementById('changepass');
                                                                    const computedHash = CryptoJS.MD5(pass).toString();
                                                                    const op = '${acc.password}'.toString();

                                                                    // Kiểm tra mật khẩu hiện tại
                                                                    if (computedHash !== op) {
                                                                        console.log(computedHash);
                                                                        cp.type = 'reset';
                                                                        err.innerHTML = 'Current password is not correct';
                                                                    }
                                                                    // Kiểm tra độ dài của mật khẩu mới
                                                                    else if (newPass.value.length === 0) {
                                                                        cp.type = 'button';
                                                                        err.innerHTML = 'Enter new password';
                                                                    }
                                                                    // Kiểm tra định dạng của mật khẩu mới
                                                                    else if (!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(newPass.value)) {
                                                                        cp.type = 'button';
                                                                        err.innerHTML = 'Password must be at least 8 characters long, include letters, numbers, and special characters';
                                                                    }
                                                                    // Kiểm tra xác nhận lại mật khẩu mới
                                                                    else if (newPass.value !== reNewPass.value) {
                                                                        cp.type = 'button';
                                                                        err.innerHTML = 'Re-typed new password does not match';
                                                                    }
                                                                    // Xác nhận thay đổi mật khẩu
                                                                    else if (window.confirm("Are you sure you want to save these changes?")) {
                                                                        err.innerHTML = '';
                                                                        cp.type = 'submit';
                                                                    }
                                                                }


                                                                function updateProfile() {
                                                                    let mobile = document.getElementById('mobile');
                                                                    let errU = document.getElementById('errorupdate');
                                                                    let updatePro = document.getElementById('updatepro');
                                                                    if (!Number(mobile.value) || mobile.value.length !== 10) {
                                                                        errU.innerHTML = 'Phone number must have 10 number';
                                                                    } else if (window.confirm("Are you sure you want to save these changes?")) {
                                                                        updatePro.type = 'submit';
                                                                    }
                                                                }

        </script>
    </body>

</html>


