<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Subject" %>
<%@ page import="dal.SubjectDAO" %>
<%@ page import="dal.PackageDAO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Create New Order</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .header {
                border-bottom: 1px solid #e5e5e5;
                margin-bottom: 20px;
            }
            .header h3 {
                margin: 0;
                padding: 10px 0;
                color: #6c757d;
            }
            h3 {
                color: #343a40;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            .form-group input[type="number"],
            .form-group input[type="text"] {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                border: 1px solid #ced4da;
                border-radius: 4px;
            }
            .btn {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
            }
            .btn:hover {
                background-color: #0056b3;
            }
            .footer {
                text-align: center;
                padding: 20px 0;
                border-top: 1px solid #e5e5e5;
                margin-top: 20px;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY</h3>
            </div>
            <h3>Create New Order</h3>
            <% 
                String raw_id = request.getParameter("subject_id");
                int id = 0;
                try {
                    id = Integer.parseInt(raw_id);
                } catch (NumberFormatException e) {
                    // Handle exception
                }
                SubjectDAO subjectDAO = new SubjectDAO();
                Subject subject = subjectDAO.getSubjectByID(id);
            %>
            <div class="table-responsive">
                <form action="vnpayajax?name=<%=subject.getSubjectName()%>" method="post">
                    <% 
                        String raw_package_id = request.getParameter("courseDuration");
                        int package_id=Integer.parseInt(raw_package_id);    
    PackageDAO packageDAO=new PackageDAO();
    double sale_price_raw = packageDAO.getPricePackageById(package_id).getSalePrice() * 20000;
double list_price_raw = packageDAO.getPricePackageById(package_id).getListPrice() * 20000;
String sale_price = String.format("%.0f", sale_price_raw);
String list_price = String.format("%.0f", list_price_raw);
                    
                    %>
                    <div class="form-group">
                        <label for="amount">Price:</label>
                        <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." name="amount" type="number" value="<%=sale_price%>" />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input class="form-control" data-val="true" data-val-required="The Description field is required." id="description" max="100000000" min="1" name="description" type="text" value="Buy Subject: <%=subject.getSubjectName() %>" />
                    </div>
                    <input type="text" value="<%=request.getParameter("subject_id")%>" name="subject_id" hidden>
                    <input type="text" value="<%=request.getParameter("account_id")%>" name="account_id" hidden>
                    <input type="text" value="<%=sale_price%>" name="sale_price" hidden>
                    <input type="text" value="<%=list_price%>" name="list_price" hidden>
                    <input type="text" value="<%=package_id%>" name="package_id" hidden>
                    <button type="submit" class="btn">Purchase</button>
                </form>
            </div>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $(this).serialize();
                var submitUrl = $(this).attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>
    </body>
</html>
