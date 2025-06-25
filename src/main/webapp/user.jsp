<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="all_component/all_css.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Job Portal</title>
<style>
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        font-family: Arial, sans-serif;
    }

    .navbar {
        position: relative;
        z-index: 10;
        width: 100%;
    }

.back-img {
    background: url("img/19874.jpg") no-repeat center center;
    background-size: cover;
    height: 89vh;
    position: relative;
}

.heading {
    position: absolute;
    top: 20px; /* distance from top */
    left: 45%;
    transform: translateX(-50%);
    color: #3A90E5;
    font-size: 2.2rem;
    font-weight: bold;
}

</style>
</head>
<body>

<%@ include file="all_component/navbar.jsp" %>

<div class="back-img">
    <div class="heading">
        <h2><i class="fa fa-book"></i> Online Job Portal</h2>
    </div>
</div>

</body>
</html>
