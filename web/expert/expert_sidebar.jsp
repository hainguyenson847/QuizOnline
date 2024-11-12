<%-- 
    Document   : sidebar
    Created on : Sep 18, 2024, 11:58:01 AM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav id="sidebar" class="sidebar js-sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand">
            <span class="sidebar-brand-text align-middle">
                Professional Expert
                
            </span>
            <svg class="sidebar-brand-icon align-middle" width="32px" height="32px" viewBox="0 0 24 24" fill="none" stroke="#FFFFFF" stroke-width="1.5"
                 stroke-linecap="square" stroke-linejoin="miter" color="#FFFFFF" style="margin-left: -3px">
            <path d="M12 4L20 8.00004L12 12L4 8.00004L12 4Z"></path>
            <path d="M20 12L12 16L4 12"></path>
            <path d="M20 16L12 20L4 16"></path>
            </svg>
        </a>

        <div class="sidebar-user">
            <div class="d-flex justify-content-center">
                <div class="flex-shrink-0">
                    <img src="${sessionScope.user.avatar}" class="avatar img-fluid rounded me-1" alt="" />
                </div>
                <div class="flex-grow-1 ps-2">
                    <a class="sidebar-user-title dropdown-toggle" href="#" data-bs-toggle="dropdown">
                        ${sessionScope.user.first_name}
                    </a>
                    <div class="dropdown-menu dropdown-menu-start">
                        <a class="dropdown-item" href="pages-profile.html"><i class="align-middle me-1" data-feather="user"></i> Profile</a>
                        <a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="pie-chart"></i> Statistic</a>
                        <div class="dropdown-divider"></div>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Log out</a>
                    </div>

                    <div class="sidebar-user-subtitle">Expert</div>
                    <!--day la phan comment-->
                    <!-- commentgg -->
                </div>
            </div>
        </div>

        <ul class="sidebar-nav">
            <li class="sidebar-header">
                Common
            </li>
            <li class="sidebar-item">
                <a class="sidebar-link" href="pages-profile.html">
                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">DashBoard</span>
                </a>
            </li>

            <li class="sidebar-header">
                Feature
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="exsubjectlist">
                    <i class="align-middle" data-feather="briefcase"></i> <span class="align-middle">Subject List</span>
                </a>
            </li>
            
            <li class="sidebar-item">
                <a class="sidebar-link" href="quizlist">
                    <i class="align-middle" data-feather="check-circle"></i> <span class="align-middle">Quiz List</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a class="sidebar-link" href="addnewquizvalidation">
                    <i class="align-middle" data-feather="check-circle"></i> <span class="align-middle">New Quiz</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a class="sidebar-link" href="questionlist">
                    <i class="align-middle" data-feather="list"></i> <span class="align-middle">Question List</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a class="sidebar-link" href="question_detail_validation">
                    <i class="align-middle" data-feather="check-circle"></i> <span class="align-middle">New Question</span>
                </a>
            </li>


        </ul>

    </div>
</nav>
<script>
    // Function to add 'active' class to the currently clicked sidebar item
    window.onload = function () {
        // Get the current URL path
        var currentPath = window.location.pathname;

        // Select all sidebar links (the <a> tags within sidebar-item <li>)
        var sidebarLinks = document.querySelectorAll('.sidebar-item a');

        // Loop through each link
        sidebarLinks.forEach(function (link) {
            // Get the href attribute of each link
            var linkPath = link.getAttribute('href');

            // Compare the current path with the link's href value
            if (currentPath.includes(linkPath)) {
                // Add 'active' class to the parent <li> element
                link.parentElement.classList.add('active');
            }
        });
    };
</script>