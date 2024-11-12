<%-- 
    Document   : sidebar
    Created on : Sep 18, 2024, 11:58:01 AM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dal.RegistrationDAO" %>
<%@ page import="model.Registration_Status" %>
<!DOCTYPE html>
<nav id="sidebar" class="sidebar js-sidebar" >
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="index.html">
            <span class="sidebar-brand-text align-middle">
                Professional Expert
                <sup><small class="badge bg-primary text-uppercase">Pro</small></sup>
            </span>
            <svg class="sidebar-brand-icon align-middle" width="32px" height="32px" viewBox="0 0 24 24" fill="none" stroke="#FFFFFF" stroke-width="1.5"
                 stroke-linecap="square" stroke-linejoin="miter" color="#FFFFFF" style="margin-left: -3px">
            <path d="M12 4L20 8.00004L12 12L4 8.00004L12 4Z"></path>
            <path d="M20 12L12 16L4 12"></path>
            <path d="M20 16L12 20L4 16"></path>
            </svg>
        </a>

        <ul class="sidebar-nav">
            <li class="sidebar-item">
                <a class="sidebar-link" href="salerdashboard">
                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">DashBoard</span>
                </a>
            </li>
            <li class="sidebar-item " >
                <a class="sidebar-link" href="salerregistrationlist"  onclick="showOption()">
                    <i class="fa-solid fa-sort"></i> <span class="align-middle">Registration List</span>
                </a>
                <a class="sidebar-header" href="#" id="sort"onclick="showSortOption()" style="margin-left: 20px; text-decoration: none">
                    <i class="fa-solid fa-sort"></i> <span class="align-middle">Sort</span>
                </a>
                
                <a class="sidebar-header" href="#" id="fiter" onclick="showFilterOption()" style="margin-left: 20px; text-decoration: none">
                    <i class="fa-solid fa-sort"></i> <span class="align-middle">Filter</span>
                </a>

                <div  id="sortOption" style="display: none" >
                    <form action="sortregistration">
                        <p class="sidebar-header">Type</p>
                        <input  type="radio" name="type" value="desc" ${requestScope.type eq 'desc'?'checked':''} style="margin-left: 20px" required> Descending <br>
                        <input type="radio" name="type" value="asc" ${requestScope.type eq 'asc'?'checked':''} style="margin-left: 20px" required>  Ascending
                        <p class="sidebar-header">Field</p>
                        <input  type="radio" name="field" id="field_cost" value="cost" ${requestScope.field eq 'cost'?'checked':''} style="margin-left: 20px" required> Cost <br>
                        <input type="radio" name="field" id="field_date" value="date" ${requestScope.field eq 'date'?'checked':''} style="margin-left: 20px" required>  Registration Date <br><br>
                        <input type="submit" name="sort" value="Sort" style="margin-left: 20px">
                    </form>
                </div>
                        <div id="filterOption" style="display: none">
                    <form action="filterregistration" method="post">
                        <span class="sidebar-header">Subject Name</span>
                        <input type="text" name="subject_name"  value="${requestScope.subject_name}" style="margin-left: 20px"><br>
                        <span class="sidebar-header">Registration Time</span>
                        <input type="date" name="date"  ${requestScope.date } value="${requestScope.registration_date}" style="margin-left: 20px"><br>
                        <span class="sidebar-header">Status</span><br>
                        <select name="status" style="margin-left: 20px">
                            <% 
                                RegistrationDAO myRegistrationDAO = new RegistrationDAO();
                                ArrayList<Registration_Status> status_list = myRegistrationDAO.getRegistrationStatus();
                                String status = (String) request.getAttribute("status");
                                for (int i = 0; i < status_list.size(); i++) {
                            %>
                            <option value="<%= status_list.get(i).getStatus_name() %>" 
                                    <%= status != null && status.equals(status_list.get(i).getStatus_name()) ? "selected" : "" %> >
                                <%= status_list.get(i).getStatus_name() %>
                            </option>
                            <% } %>
                        </select><br><br>
                        <input type="submit" name="sort" value="Filter" style="margin-left: 20px">
                    </form>
                </div>
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="logout" >
                    <i class="fa-solid fa-filter"></i><span class="align-middle">Logout</span>
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

    function showSortOption() {
        var sort_option = document.getElementById('sortOption');
        if (sort_option.style.display === 'none') {
            sort_option.style.display = '';
        } else {
            sort_option.style.display = 'none';
        }
    }

    function showFilterOption() {
        var filter_option = document.getElementById('filterOption');
        if (filter_option.style.display === 'none') {
            filter_option.style.display = '';
        } else {
            filter_option.style.display = 'none';
        }
    }
    function saveStatus() {
        var sort_option = document.getElementById('sortOption');

        sort_option.style.display = 'none';
    }
    
    function showOption(){
         var sort_option = document.getElementById('sort');
         var filter_option = document.getElementById('filter');
         filter_option.style.display='';
         sort_option.style.display='';
    }
</script>