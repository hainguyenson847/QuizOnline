
<div class="page-wraper popup" id="register-popup" style="margin-top: 50px">
    <div class="account-form popup-content" style="max-height: 100vh; overflow-y: auto;">
        <div class="account-form-inner">
            <div style="text-align: right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close-register-popup"></button></div>
            <div class="account-container">                     
                <div class="heading-bx left">      
                    <h2 class="title-head">Sign Up <span>Now</span></h2>
                </div>	
                <form class="contact-bx" action="register" method="post">
                    <div class="row placeani">

                        <div class="col-lg-12">
                            <p style="color: red" id="email-error">${requestScope.email_error}</p>
                            <div class="form-group">
                                <label>Your Email Address</label>
                                <input name="email" type="email" required="" class="form-control" value="${requestScope.email}">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group password-container">
                                <label>Password</label>
                                <input name="pass" id="userPassforregister" type="password" class="form-control" required="">  
                                 <i class="fas fa-eye toggle-password" onclick="togglePasswordRegister()"></i>
                            </div>
                        </div>
                        <div class="col-lg-12">
                             <p style="color: red" id="pass-error">${requestScope.pass_error}</p>
                            <div class="form-group password-container">
                                <label>Confirm Password</label>
                                <input name="confirmedPass" id="userPassforconfirm" type="password" class="form-control" required="">
                                 <i class="fas fa-eye toggle-password" onclick="togglePasswordConfirm()"></i>
                            </div>
                        </div>
                        <div class="col-lg-12 m-b30">
                            <button name="submit" type="submit" value="Submit" class="btn button-md">Sign Up</button>
                        </div>
                        <div class="col-lg-12">
                            <h6>Sign Up with Social media</h6>
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
