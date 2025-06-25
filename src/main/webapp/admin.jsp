<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="all_component/all_css.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Job Portal</title>
<style>

    .back-img {
        background: url("img/admin.jpg");
        height: 85vh;
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        width: 54%;
        margin-left:20%;
        
    }
    .text-white {
        color: #3A90E5;
    }
    .text-center {
        text-align: center;
    }
</style>
</head>
<body>
<%@ include file="all_component/navbar.jsp" %>

   <div class="text-start m-2 ">
        <h2 style="color:#3A90E5;">
            <i class="fa fa-book" aria-hidden="true"></i>Admin
        </h2> 
    </div>
<div class="back-img">

</div>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>
