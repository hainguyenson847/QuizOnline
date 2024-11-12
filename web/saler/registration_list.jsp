
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <jsp:include page="sidebar.jsp" />

            <div class="main" >
                <jsp:include page="navbar.jsp"/>
                <div style="width: 1900px; margin-left: 1040px; margin-top: 10px">
                    <button onclick="$('#importModal').modal('show');" class="btn btn-success">Registration Import <i class="align-middle me-2 fas fa-fw fa-file-excel"></i></button>
                </div>
                <div class="modal fade" id="importModal" tabindex="-1" aria-labelledby="importModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="importModalLabel">Import Questions</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="importForm" method="post" action="salerimportregistration" enctype="multipart/form-data">
                                        <div class="mb-3">
                                            <label for="fileInput" class="form-label">Select Excel File</label>
                                            <input type="file" class="form-control" id="fileInput" name="file" accept=".xls,.xlsx" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Upload</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="messageModalLabel">Notification</h5>
                                </div>
                                <div class="modal-body">
                                    <!-- Success Message -->
                                    <c:if test="${not empty message}">
                                        <div class="alert alert-success" role="alert">
                                            ${message}
                                        </div>
                                    </c:if>
    
                                    <!-- Error Messages -->
                                    <c:if test="${not empty errors}">
                                        <div class="alert alert-danger" role="alert">
                                            <ul>
                                                <c:forEach var="error" items="${errors}">
                                                    <li>${error}</li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <main class="content">
                    <div class="container">
                    
                        <%int id=1;%>
                        <table  class="table table-striped" onload="saveStatus()">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Email</th>
                                    <th>Registration Time</th>
                                    <th>Subject</th>
                                    <th>Package</th>
                                    <th>Cost</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <c:forEach var="registration" items="${requestScope.registration_list}">
                                <tr>
                                    <td><%=id%></td>
                                    <td>${requestScope.accountDAO.getEmailById(registration.account_id)}</td>
                                    <td>${registration.registration_time}</td>
                                    <td>${requestScope.subjectDAO.getSubjectByID(registration.subject_id).getSubjectName()}</td>
                                    <td>${requestScope.packageDAO.getPricePackageById(registration.package_id).getPackage_name()}</td>
                                    <td>${registration.cost}</td>
                                    <c:if test="${registration.status_id == 3}">
                                        <td style="width: 120px"><span class="status status-published">${requestScope.registrationDAO.getRegistrationStatus(registration.status_id)}</span></td>
                                        </c:if>
                                        <c:if test="${registration.status_id == 2}">
                                        <td style="width: 120px"><span class="status status-unpublished">${requestScope.registrationDAO.getRegistrationStatus(registration.status_id)}</span></td>
                                        </c:if>
                                        <c:if test="${registration.status_id == 1}">
                                        <td style="width: 120px"><span class="status status-canceled">${requestScope.registrationDAO.getRegistrationStatus(registration.status_id)}</span></td>
                                        </c:if>
                                    <td style="width: 120px">
                                        <button type="button" class="btn btn-success" ><a href="registrationdetail?rid=${registration.registration_id}&aid=${registration.account_id}" style="color: white"><i class="align-middle fas fa-edit"></i></a></button>
                                        <button type="button" onclick="confirmDeletion(${registration.subject_id}, ${registration.account_id})" class="btn btn-danger">
                                            <i class="align-middle fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                                <%id++;%>
                            </c:forEach>
                            <%id=0;%>
                        </table>
                    </div>
                </main>   
            </div>
        </div>
        <script src="js/app.js"></script>
        <%@include file="js.jsp" %>
        <script>
                                            function saveStatus() {
                                                console.log("a");

                                            }
        </script>
        <script>
            function confirmDeletion(registrationId, accountId) {
                if (confirm("Are you sure you want to cancel this registration?")) {
                    window.location.href = "salerdeleteregistration?rid=" + registrationId + "&aid=" + accountId + "";
                }
            }
        </script>

<c:if test="${not empty message || not empty errors}">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var messageModal = new bootstrap.Modal(document.getElementById('messageModal'));
            messageModal.show();
        });
    </script>
</c:if>
    </body>

</html>