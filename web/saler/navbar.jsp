<%-- 
    Document   : navbar
    Created on : Sep 18, 2024, 12:24:51 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand navbar-light navbar-bg">

    <form class="d-none d-sm-inline-block" action="searchregistration">
        <div class="input-group input-group-navbar">
            <input type="text" class="form-control" name="email" placeholder="Search by email…" aria-label="Search" >
            <button class="btn"  type="submit">
                <i class="align-middle" data-feather="search"></i>
            </button>
        </div>
    </form>
    <div style="margin-left: 20px">
        <a href="searchregistration" target="_self">All Registration</a>
        </div>
    <div class="navbar-collapse collapse">
        <ul class="navbar-nav navbar-align">

            <li class="nav-item">
                <a class="nav-icon js-fullscreen d-none d-lg-block" href="#">
                    <div class="position-relative">
                        <i class="align-middle" data-feather="maximize"></i>
                    </div>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-icon pe-md-0 dropdown-toggle" href="#" data-bs-toggle="dropdown">
                    <img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded" alt="Charles Hall" />
                </a>
                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="pages-profile.html"><i class="align-middle me-1" data-feather="user"></i> Profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="logout">Log out</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
