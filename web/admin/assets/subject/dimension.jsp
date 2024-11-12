<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
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
                                        <button class="btn btn-outline-success">Price Package</button>

                                    </a>   
                                    <a href="dimension">
                                        <button class="btn btn-outline-success active">Dimension</button>
                                    </a>  
                                </h5>
                                <h6 class="card-subtitle text-muted"></h6>
                            </div>




                            <c:if test="${action == 'edit'}">
                                <c:if test="${empty mess && empty error}">




                                    <form action="dimension" method="post" class="row g-3">

                                        <input value="${dimension.dimension_id}" hidden="" name="id">
                                        <input value="${action}" hidden="" name="action">
                                        <div class="col-md-4">
                                            <label for="validationDefault01" class="form-label">Dimension Name</label>
                                            <input name="dimension_name" type="text" class="form-control" id="validationDefault01" value="${dimension.dimension_name}" required="">
                                        </div>



                                        <div class="col-md-3">
                                            <label for="validationDefault04" class="form-label">State</label>
                                            <select name="dimension_type_id" class="form-select" id="validationDefault04" required="">
                                                <option  value="${dimension.dimension_type_id.dimension_type_id}">${dimension.dimension_type_id.dimension_type_name}</option>
                                                <c:forEach items="${listDimensionType}" var="listType">
                                                    <option value="${listType.dimension_type_id}">${listType.dimension_type_name}</option>
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



                            <div id="create" style="display: none;"> <!-- Initially hidden -->

                                <form action="dimension" method="post" class="row g-3">
                                    <input value="create" hidden="" name="action">
                                    <div class="col-md-4">
                                        <label for="validationDefault01" class="form-label">Dimension Name</label>
                                        <input name="dimension_name" type="text" class="form-control" id="validationDefault01"  required="">
                                    </div>



                                    <div class="col-md-3">
                                        <label for="validationDefault04" class="form-label">State</label>
                                        <select name="dimension_type_id" class="form-select" id="validationDefault04" required="">
                                            <c:forEach items="${listDimensionType}" var="listType">
                                                <option value="${listType.dimension_type_id}">${listType.dimension_type_name}</option>
                                            </c:forEach>


                                        </select>
                                    </div>


                                    <div class="col-md-3">
                                        <label for="validationDefault05" class="form-label">State</label>
                                        <select name="subject_id" class="form-select" id="validationDefault05" required="">
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
                                        <div>
                                            <h5 class="card-title">Contextual Classes</h5>
                                            <h6 class="card-subtitle text-muted">Use contextual classes to color table rows or individual cells.</h6>
                                        </div>
                                        <button class="btn btn-outline-success active" onclick="toggleForm()">Create new Dimension</button>
                                    </div>


                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th style="width:20%;">#</th>
                                                <th style="width:30%">Type</th>
                                                <th class="d-none d-md-table-cell" style="width:25%">Dimension</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listD}" var="list">
                                                <tr>
                                                    <td>${list.dimension_id}</td>
                                                    <td>${list.dimension_type_id.dimension_type_name}</td>
                                                    <td class="d-none d-md-table-cell">${list.dimension_name}</td>
                                                    <td class="table-action">

                                                        <!-- Edit Button -->
                                                        <a href="dimension?id=${list.dimension_id}&&action=edit" class="btn btn-outline-primary btn-sm">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle">
                                                            <path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
                                                            </svg>
                                                        </a>

                                                        <!-- Delete Button (with form) -->
                                                        <form method="post" action="dimension" class="d-inline" onsubmit="return confirmDelete()">
                                                            <input type="hidden" name="id" value="${list.dimension_id}">
                                                            <input type="hidden" name="action" value="delete">
                                                            <button type="submit" class="btn btn-outline-danger btn-sm">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle">
                                                                <polyline points="3 6 5 6 21 6"></polyline>
                                                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                                                </svg>
                                                            </button>
                                                            <script type="text/javascript">
                                                                function confirmDelete() {
                                                                    return confirm("Are you sure you want to delete this dimension?");
                                                                }
                                                            </script>

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
