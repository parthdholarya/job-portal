<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Post a Job</title>
  <%@ include file="all_component/all_css.jsp" %>
  <style>
    body {
      background-color: #f4f7f9;
    }
    .job-post-card {
      max-width: 700px;
      margin: auto;
      margin-top: 30px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      border-radius: 15px;
    }
  </style>
</head>
<body>

<%@ include file="all_component/navbar.jsp" %>

<div class="container">
  <div class="card job-post-card">
    <div class="card-body">	
        <c:if test="${not empty success}">
    <p class="text-center text-success">${success}</p>
    <c:remove var="success"/>
	</c:if>

	<c:if test="${not empty error}">
    <p class="text-center text-danger">${error}</p>
    <c:remove var="error"/>
	</c:if>
      <h3 class="text-center mb-4 text-primary"><i class="fa-solid fa-square-plus"></i>&nbsp; Post a New Job</h3>

      <form action="addjob" method="post">
        <!-- Job Title -->
        <div class="form-outline mb-3">
          <input type="text" name="jobTitle" class="form-control" placeholder="Job Title" required />
        </div>

        <!-- Company Name -->
        <div class="form-outline mb-3">
          <input type="text" name="companyName" class="form-control" placeholder="Company Name" required />
        </div>

        <!-- Location -->
        <div class="form-outline mb-3">
          <input type="text" name="location" class="form-control" placeholder="Job Location" required />
        </div>

        <!-- Salary -->
        <div class="form-outline mb-3">
          <input type="number" name="salary" class="form-control" placeholder="Salary (Monthly)" />
        </div>
        <!-- Experiance -->
        <div class="form-outline mb-3">
          <input type="text" name="experiance" class="form-control" placeholder="Experiance" required />
        </div>
         <!-- Qualification -->
        <div class="form-outline mb-3">
          <input type="text" name="qualification" class="form-control" placeholder="Qualification" required />
        </div>
        <!-- Category -->
        <div class="form-outline mb-3">
          <select class="form-select" name="category" required>
            <option selected disabled>Choose Job Category</option>
            <option>Software Development</option>
            <option>Design</option>
            <option>Marketing</option>
            <option>Sales</option>
            <option>HR</option>
            <option>Other</option>
          </select>
        </div>

        <!-- Job Type -->
        <div class="form-outline mb-3">
          <select class="form-select" name="jobType" required>
            <option selected disabled>Job Type</option>
            <option>Full-Time</option>
            <option>Part-Time</option>
            <option>Internship</option>
            <option>Contract</option>
          </select>
        </div>

        <!-- Description -->
        <div class="form-outline mb-4">
          <textarea name="description" rows="4" class="form-control" placeholder="Job Description" required></textarea>
        </div>

        <!-- Submit button -->
        <div class="d-grid">
          <button type="submit" class="btn btn-primary">Post Job</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>
