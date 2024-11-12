<%-- 
    Document   : update_email
    Created on : Sep 27, 2024, 4:15:16 AM
    Author     : DELL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body style="background-color: #797272; position: relative" class="center ">
        <div style="position: absolute; background: white; top: 30px; left: 20px; border-radius: 100%; width: 40px; height: 40px"><a href="profile" style="display: flex; justify-content: center; padding-top: 5px; text-decoration: none; font-weight: 900; color: black"><</a></div>
        <form action="update_email" method="post" style="background-color: white; position: absolute; top: 100px; width: 800px; left: 600px; height: 200px; text-align: center; border-radius: 8px; box-shadow: 1px 1px 9px 1px">
            <c:if test="${sessionScope.confirm_code == null}">
                <h1>Update email</h1>
                <p>Send code to your email</p>
                <input type="submit" value="Send Code" name="sendcode"/>
            </c:if>
            <c:if test="${sessionScope.confirm_code != null && !confirm_ss && !update_ss && !comfirm_new_ss}">
                <h1>Confirm your email</h1>
                <p>Enter code sent to your email</p>
                <c:if test="${confirm_err != null}">
                    <div style="color: red">
                        ${confirm_err}
                    </div>
                </c:if>
                <input type="text" name="confirm_code" placeholder="xxxxxx" required=""/><br><br>
                <input type="submit" value="Confirm" name="sendcode"/>
            </c:if>

            <c:if test="${confirm_ss && !comfirm_new_ss}">
                <h1>New email</h1>
                <p>Enter your new email</p>
                <c:if test="${duplicate_email != null}">
                    <div style="color: red">
                        ${duplicate_email}
                    </div>
                </c:if>
                <input type="email" name="new_email" placeholder="..@gmail.com" required=""/><br><br>
                <input type="submit" value="Confirm" name="sendcode"/>
            </c:if>

            <c:if test="${comfirm_new_ss && !update_ss}">
                <h1>Confirm new email</h1>
                <p>Enter code sent to your new email</p>
                <c:if test="${confirm_new_err != null}">
                    <div style="color: red">
                        ${confirm_new_err}
                    </div>
                </c:if>
                <input type="text" name="confirm_new_code" placeholder="xxxxxx" required=""/><br><br>
                <input type="submit" value="Confirm" name="sendcode"/>
            </c:if>

        </form>
        <c:if test="${update_ss}">
            <div style="background-color: white; position: absolute; top: 100px; width: 800px; left: 600px; height: 200px; text-align: center; border-radius: 8px; box-shadow: 1px 1px 9px 1px">
                <h1>UPDATE SUCCESS!</h1>
                <br>
                <a href="profile">return</a>
            </div>
        </c:if>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>
