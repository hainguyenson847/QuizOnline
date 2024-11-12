
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="head.jsp" />

        <style>

            .container {
                max-width: 1200px;
                margin: 0 auto;
                background-color: white;
                border-radius: 8px;
                padding: 20px;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding-bottom: 15px;
            }

            .header h1 {
                font-size: 24px;
                color: #333;
            }

            .header nav button {
                margin-left: 10px;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn-blue {
                background-color: #007bff;
                color: white;
            }

            .btn-orange {
                background-color: #ff5722;
                color: white;
            }

            .tab-menu {
                display: flex;
                border-bottom: 2px solid #ccc;
                margin-bottom: 20px;
            }

            .tab-menu button {
                flex: 1;
                padding: 10px;
                background-color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
                color: #666;
                border-bottom: 4px solid transparent;
            }

            .tab-menu button.active {
                color: #5a2fc2;
                font-weight: bold;
                border-bottom-color: #5a2fc2;
            }

            .status {
                padding: 5px 10px;
                border-radius: 12px;
                font-size: 14px;
                text-align: center;
            }

            .status-published {
                background-color: #d4edda;
                color: #155724;
            }

            .status-unpublished {
                background-color: goldenrod;
                color: yellow;
            }
            .status-canceled{
                background-color: #f8d7da;
                color: #721c24;
            }

        </style>



    </head>
    <body  >
        <div class="wrapper" >
            <jsp:include page="admin_sidebar.jsp" />
            <div class="main" >
                <jsp:include page="dashboard_navbar.jsp" />
                <main class="content">
                    <div class="container-fluid p-0">
                        <div class="row">
                            <div class="card col-6" >
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mt-0">
                                            <h5 class="card-title" id="week_user_label">Total Revenue</h5>
                                        </div>

                                        <div class="col-auto">
                                            <div class="stat text-primary">
                                                <i class="align-middle" data-feather="dollar-sign"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h1 class="mt-1 mb-3" id="all_week_user">${requestScope.total_revenue} $ </h1>
                                </div>
                            </div>
                            <div class="card col-6">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mt-0">
                                            <h5 class="card-title" id="week_user_label">Total User</h5>
                                        </div>

                                        <div class="col-auto">
                                            <div class="stat text-primary">
                                                <i class="align-middle" data-feather="user"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h1 class="mt-1 mb-3" id="all_week_user">${requestScope.total_user} </h1>
                                </div>
                            </div>
                            <div class="card col-6" >
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mt-0">
                                            <h5 class="card-title" id="week_user_label">Number of access</h5>
                                        </div>

                                        <div class="col-auto">
                                            <div class="stat text-primary">
                                                <i class="align-middle" data-feather="dollar-sign"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h1 class="mt-1 mb-3" id="all_week_user">${applicationScope.visitorCount}</h1>
                                </div>
                            </div>
                            <div class="card col-6" >
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col mt-0">
                                            <h5 class="card-title" id="week_user_label">Total Bought Subjects</h5>
                                        </div>

                                        <div class="col-auto">
                                            <div class="stat text-primary">
                                                <i class="align-middle" data-feather="dollar-sign"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <h1 class="mt-1 mb-3" id="all_week_user">${requestScope.total_bought_subject} </h1>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">Top 5 Subjects Purchased</h5>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Subject Name</th>
                                                    <th>Quantity Purchased</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="subject" items="${requestScope.top_5_bought_subjects}" varStatus="status">
                                                    <tr>
                                                        <td>${status.index + 1}</td>
                                                        <td>${subject.subjectName}</td>
                                                        <td>${subject.description}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h1 class="h3 mb-3"><strong>Statistic</strong> in</h1>
                    </div>
                    <div style="margin-left: 10px; margin-bottom: 10px">
                        <select name="cars" id="cars" onchange="changeId()" >
                            <option value="volvo">This Week </option>
                            <option value="saab">Months</option>
                        </select>
                    </div>
                    <!-- Revenue statistics-->
                    <div class="row">
                        <div class="col-xl-4 col-xxl-3 d-flex">
                            <div class="w-100">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col mt-0">
                                                        <h5 class="card-title" id="month_revenue_label" style="display: none">Month Revenue</h5>
                                                        <h5 class="card-title" id="week_revenue_label">Week Revenue</h5>
                                                    </div>

                                                    <div class="col-auto">
                                                        <div class="stat text-primary">
                                                            <i class="align-middle" data-feather="dollar-sign"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h1 class="mt-1 mb-3" id="all_month_revenue" style="display: none">${requestScope.all_month_revenue} $</h1>
                                                <h1 class="mt-1 mb-3" id="all_week_revenue">${requestScope.all_week_revenue} $</h1>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col mt-0">
                                                        <h5 class="card-title" id="month_registration_label" style="display: none">Month Registrations</h5>
                                                        <h5 class="card-title" id="week_registration_label">Week Registrations</h5>
                                                    </div>

                                                    <div class="col-auto">
                                                        <div class="stat text-primary">
                                                            <i class="align-middle" data-feather="credit-card"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h1 class="mt-1 mb-3" id="all_month_registration" style="display: none">${requestScope.all_month_registration} </h1>
                                                <h1 class="mt-1 mb-3" id="all_week_registration">${requestScope.all_week_registration} </h1>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Month Revenue statistics-->
                        <div class="col-xl-8 col-xxl-9" id="month_revenue" style="display: none">
                            <div class="card flex-fill w-100">
                                <div class="card-header">

                                    <h5 class="card-title mb-0">Recent Month Revenue</h5>
                                </div>
                                <div class="card-body py-3">
                                    <div class="chart chart-sm">
                                        <canvas id="chartjs-dashboard-month-revenue"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Week Revenue statistics-->
                        <div class="col-xl-8 col-xxl-9" id="week_revenue">
                            <div class="card flex-fill w-100">
                                <div class="card-header">

                                    <h5 class="card-title mb-0">Recent Week Revenue</h5>
                                </div>
                                <div class="card-body py-3">
                                    <div class="chart chart-sm">
                                        <canvas id="chartjs-dashboard-week-revenue"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!--Registration statistic-->
                    <div class="row">
                        <div class="col-xl-4 col-xxl-3 d-flex">
                            <div class="w-100">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col mt-0">
                                                <h5 class="card-title" id="month_registration_status_label"style="display: none"> Month Registration status</h5>
                                                <h5 class="card-title" id="week_registration_status_label"> Week Registration status</h5>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="chart chart-sm" id="month_registration_status"  style="display: none">
                                                    <canvas id="chartjs-pie-month-registration-status"></canvas>
                                                </div>
                                                <div class="chart chart-sm" id="week_registration_status">
                                                    <canvas id="chartjs-pie-week-registration-status"></canvas>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--month registrations-->
                        <div class="col-xl-8 col-xxl-9" id="month_registration" style="display: none">
                            <div class="card flex-fill w-100">
                                <div class="card-header">

                                    <h5 class="card-title mb-0">Recent Month Registrations</h5>
                                </div>
                                <div class="card-body py-3">
                                    <div class="chart chart-sm">
                                        <canvas id="chartjs-dashboard-month-registrations"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--week registration-->
                        <div class="col-xl-8 col-xxl-9" id="week_registration">
                            <div class="card flex-fill w-100">
                                <div class="card-header">

                                    <h5 class="card-title mb-0">Recent Week Registrations</h5>
                                </div>
                                <div class="card-body py-3">
                                    <div class="chart chart-sm">
                                        <canvas id="chartjs-dashboard-week-registrations"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--User statistic-->
                    <div class="row">
                        <div class="col-xl-4 col-xxl-3 d-flex">
                            <div class="w-100">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col mt-0">
                                                        <h5 class="card-title" id="week_user_label">Week New User</h5>
                                                    </div>

                                                    <div class="col-auto">
                                                        <div class="stat text-primary">
                                                            <i class="align-middle" data-feather="user"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h1 class="mt-1 mb-3" id="all_week_user">${requestScope.all_week_user} </h1>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col mt-0">
                                                        <h5 class="card-title" id="week_user_label">Month New User</h5>
                                                    </div>

                                                    <div class="col-auto">
                                                        <div class="stat text-primary">
                                                            <i class="align-middle" data-feather="user"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h1 class="mt-1 mb-3" id="all_month_user" >${requestScope.all_month_user} </h1>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Week User statistics-->
                        <div class="col-xl-8 col-xxl-9" id="week_user">
                            <div class="card flex-fill w-100">
                                <div class="card-header">

                                    <h5 class="card-title mb-0">Recent Week User</h5>
                                </div>
                                <div class="card-body py-3">
                                    <div class="chart chart-sm">
                                        <canvas id="chartjs-dashboard-week-user"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Month User statistics-->
                        <div class="col-xl-8 col-xxl-9" id="month_user" style="display: none">
                            <div class="card flex-fill w-100">
                                <div class="card-header">

                                    <h5 class="card-title mb-0">Recent Month User</h5>
                                </div>
                                <div class="card-body py-3">
                                    <div class="chart chart-sm">
                                        <canvas id="chartjs-dashboard-month-user"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>


            </div>
        </main>
    </div>
</div>
<!--month info statistic-->
<div style="display: none" >    
    <%ArrayList<Integer> month_revenue=(ArrayList<Integer>)request.getAttribute("month_revenue");
        ArrayList<Integer> month_registrations=(ArrayList<Integer>)request.getAttribute("month_registration");
        ArrayList<Integer> month_registrations_status=(ArrayList<Integer>)request.getAttribute("month_registration_status"); 
        ArrayList<Integer> month_user=(ArrayList<Integer>)request.getAttribute("month_user");
        for(int i=0; i<month_revenue.size();i++){%>
    <p id="et<%=i%>"><%=month_revenue.get(i)%></p>
    <p id="re<%=i%>"><%=month_registrations.get(i)%></p>
    <p id="mu<%=i%>"><%=month_user.get(i)%></p>
    <%}%>
    <%for(int j=0;j<3;j++){%>
    <p id="rs<%=j%>"><%=month_registrations_status.get(j)%></p> 
    <%}%>
</div>
<!--week info statistic-->
<div  style="display: none">    
    <%ArrayList<Integer> week_revenue=(ArrayList<Integer>)request.getAttribute("week_revenue");
       ArrayList<Integer> week_registrations=(ArrayList<Integer>)request.getAttribute("week_registration");
       ArrayList<Integer> week_registrations_status=(ArrayList<Integer>)request.getAttribute("week_registration_status"); 
       ArrayList<Integer> week_user=(ArrayList<Integer>)request.getAttribute("week_user");
        for(int i=0; i<week_revenue.size();i++){%>
    <p id="wr<%=i%>"><%=week_revenue.get(i)%></p>
    <p id="wre<%=i%>"><%=week_registrations.get(i)%></p>     
    <p id="wu<%=i%>"><%=week_user.get(i)%></p>  
    <%}%>
    <%for(int j=0;j<3;j++){%>
    <p id="wrs<%=j%>"><%=week_registrations_status.get(j)%></p> 
    <%}%>
</div>

<script src="js/app.js"></script>
<%@include file="js.jsp" %>
</body>

</html>