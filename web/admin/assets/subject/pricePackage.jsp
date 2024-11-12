<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Price Package Manager </title>

        <jsp:include page="../head.jsp" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body data-theme="default" data-layout="fluid" data-sidebar-position="left" data-sidebar-layout="default">
        <div class="wrapper">
            <jsp:include page="../sidebar.jsp" />

            <div class="main">
                <jsp:include page="../navbar.jsp" />

                <main class="content">
                    <div class="container-fluid p-0">
                        <h1 class="h3 mb-3">Subject Detail 
                            <button class="btn btn-outline-primary">View Lesson</button>
                        </h1>

                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">
                                    <a href="subject-details">
                                        <button class="btn btn-outline-success ">Overview</button>
                                    </a>  
                                    <a href="price-package">
                                        <button class="btn btn-outline-success active">Price Package</button>

                                    </a>                                    <a href="dimension">
                                        <button class="btn btn-outline-success ">Dimension</button>
                                    </a>  
                                </h5>
                                <h6 class="card-subtitle text-muted"></h6>
                            </div>
                            <div class="container mt-3">
                                <!-- Success message -->
                                <c:if test="${not empty mess}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        ${mess}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>

                                <!-- Error message -->
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        ${error}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>
                            </div>




                            <!-- edit  -->


                            <c:if test="${action == 'edit'}">
                                <c:if test="${empty mess && empty error}">




                                    <form action="price-package" method="post" class="row g-3">

                                        <input value="${pricePackage.package_id}" hidden="" name="id">
                                        <input value="${action}" hidden="" name="action">
                                        <div class="col-md-4">
                                            <label for="validationDefault01" class="form-label">Package Name</label>
                                            <input value="${pricePackage.package_name}" name="package_name" type="text" class="form-control" id="validationDefault01" required="">
                                        </div>
                                        <div class="col-md-4">
                                            <label for="validationDefault02" class="form-label">Duration</label>
                                            <input value="${pricePackage.duration}" min="1" step="1" name="duration" type="number" class="form-control" id="validationDefault02" required>
                                        </div>

                                        <div class="col-md-4">
                                            <label for="validationDefault03" class="form-label">Price</label>
                                            <input value="${pricePackage.listPrice}" min="1" name="listPrice" type="number" class="form-control" id="validationDefault03" required="">
                                        </div>
                                        <div class="col-md-4">
                                            <label for="validationDefault04" class="form-label">Sale Price</label>
                                            <input value="${pricePackage.salePrice}" min="1" name="salePrice" type="number" class="form-control" id="validationDefault04" required="">
                                        </div>



                                        <div class="col-md-3">
                                            <label for="validationDefault04" class="form-label">Status</label>
                                            <select name="status" class="form-select" id="validationDefault04" required>
                                                <option value="1" ${pricePackage.status == 1 ? 'selected' : ''}>Active</option>
                                                <option value="0" ${pricePackage.status == 0 ? 'selected' : ''}>Inactive</option>
                                            </select>
                                        </div>


                                        <div class="col-md-3">
                                            <label for="validationDefault05" class="form-label">Subject</label>
                                            <select name="dimension_type_id" class="form-select" id="validationDefault05" required="">
                                                <option value="${pricePackage.subject_id.subject_id}">${pricePackage.subject_id.subject_name}</option>

                                                <c:forEach items="${listSubject}" var="listType">
                                                    <option value="${listType.subject_id}">${listType.subject_name}</option>
                                                </c:forEach>


                                            </select>
                                        </div>


                                        <div class="col-12">
                                            <button class="btn btn-primary" type="submit">Submit form</button>
                                        </div>
                                    </form>
                                </c:if>

                                <!--                            </div>-->
                            </c:if>





                            <!-- comment create  -->
                            <div id="create" style="display: none;"> <!-- Initially hidden -->

                                <form action="price-package" method="post" class="row g-3">
                                    <input value="create" hidden="" name="action">
                                    <div class="col-md-4">
                                        <label for="validationDefault01" class="form-label">Package Name</label>
                                        <input  name="package_name" type="text" class="form-control" id="validationDefault01" required="">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="validationDefault02" class="form-label">Duration</label>
                                        <input min="1" step="1" name="duration" type="number" class="form-control" id="validationDefault02" required>
                                    </div>

                                    <div class="col-md-4">
                                        <label for="validationDefault03" class="form-label">Price</label>
                                        <input min="1" name="listPrice" type="number" class="form-control" id="validationDefault03" required="">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="validationDefault04" class="form-label">Sale Price</label>
                                        <input min="1" name="salePrice" type="number" class="form-control" id="validationDefault04" required="">
                                    </div>



                                    <div class="col-md-3">
                                        <label for="validationDefault04" class="form-label">Status</label>
                                        <select name="status" class="form-select" id="validationDefault04" required="">
                                            <option value="1">activate</option>
                                            <option value="0">un activate</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <label for="validationDefault05" class="form-label">Subject</label>
                                        <select name="dimension_type_id" class="form-select" id="validationDefault05" required="">
                                            <c:forEach items="${listSubject}" var="listType">
                                                <option value="${listType.subject_id}">${listType.subject_name}</option>
                                            </c:forEach>


                                        </select>
                                    </div>




                                    <div class="col-12">
                                        <button class="btn btn-primary" type="submit">Submit form</button>
                                    </div>
                                </form>
                            </div>

                            <script>
                                function toggleForm() {
                                    var formDiv = document.getElementById("create");
                                    if (formDiv.style.display === "none") {
                                        formDiv.style.display = "block"; // Show the form
                                    } else {
                                        formDiv.style.display = "none"; // Hide the form
                                    }
                                }
                            </script>







                            <div>
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h5 class="card-title">Price Package</h5>
                                        <button class="btn btn-outline-success active" onclick="toggleForm()">Create new</button>

                                    </div>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th style="width: 5%;">#</th>
                                                <th style="width: 20%;">Name</th>
                                                <th style="width: 10%;">Duration</th>
                                                <th style="width: 15%;">List Price</th>
                                                <th style="width: 15%;">Sale Price</th>
                                                <th style="width: 15%;">Subject Name</th>
                                                <th class="d-none d-md-table-cell" style="width: 10%;">Status</th>
                                                <th style="width: 10%;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listAllPackage}" var="list">
                                                <tr>
                                                    <td>${list.getPackage_id()}</td>
                                                    <td>${list.getPackage_name()}</td>
                                                    <td>${list.getDuration()}</td>
                                                    <td>${list.getListPrice()}</td>
                                                    <td>${list.getSalePrice()}</td> <!-- Changed from listPrice to salePrice -->
                                                    <td>${list.getSubject_id().getSubject_name()}</td>
                                                    <td class="d-none d-md-table-cell">${list.getStatus()}</td>
                                                    <td class="table-action">
                                                        <!-- Edit Button -->
                                                        <a href="price-package?id=${list.getPackage_id()}&&action=edit" class="btn btn-outline-primary" title="Edit">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle">
                                                            <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                                            </svg>
                                                        </a>

                                                        <!-- Delete Form -->
                                                        <form action="price-package" method="post" class="d-inline">
                                                            <input type="hidden" value="${list.getPackage_id()}" name="id">
                                                            <input type="hidden" value="delete" name="action">
                                                            <button type="submit" class="btn btn-outline-danger" title="Delete" onclick="return confirm('Are you sure you want to delete this package?');">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle">
                                                                <polyline points="3 6 5 6 21 6"></polyline>
                                                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </div>



                        </div>
                    </div>
                </main>



                <jsp:include page="../footer.jsp"/>  
            </div>
        </div>

        <jsp:include page="../script.jsp"/>
    </body>

</html>
