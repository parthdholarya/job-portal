<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<%@page import="com.Entity.addJob"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.DAO.jobDAO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit a Job</title>
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
<%
int id=Integer.parseInt(request.getParameter("id"));
jobDAO dao=new jobDAO(DBConnection.getConnection());
addJob j=dao.getJobById(id);

%>
<div class="container">
  <div class="card job-post-card">
    <div class="card-body">	
      <h3 class="text-center mb-4 text-primary"><i class="fa-solid fa-square-plus"></i>&nbsp; Edit Job</h3>

      <form action="editjob" method="post">

        <!-- Job Title -->
        <div class="form-outline mb-3">
          <input type="text" name="jobTitle" class="form-control" placeholder="Job Title" value="<%= j.getJobtitle()%>" required />
        </div>

        <!-- Company Name -->
        <div class="form-outline mb-3">
          <input type="text" name="companyName" class="form-control" placeholder="Company Name" value="<%=j.getCompanyname() %>" required />
        </div>

        <!-- Location -->
        <div class="form-outline mb-3">
          <input type="text" name="location" class="form-control" placeholder="Job Location" value="<%= j.getLocation() %>" required />
        </div>

        <!-- Salary -->
        <div class="form-outline mb-3">
          <input type="number" name="salary" class="form-control" placeholder="Salary (Monthly)" value="<%= String.format("%.2f", j.getSalary()) %>" />
        </div>
        
       <!-- Experiance -->
        <div class="form-outline mb-3">
          <input type="text" name="experiance" class="form-control" placeholder="Experiance" value="<%= j.getExperiance() %>" required />
        </div>
         <!-- Qualification -->
        <div class="form-outline mb-3">
          <input type="text" name="qualification" class="form-control" placeholder="Qualification" value="<%= j.getQualification() %>" required />
        </div>
        <!-- Category -->
        <div class="form-outline mb-3">
		<select class="form-select" name="category" required>
  			<option disabled>Choose Job Category</option>
  			<option <%= "Software Development".equals(j.getCategory()) ? "selected" : "" %>>Software Development</option>
  			<option <%= "Design".equals(j.getCategory()) ? "selected" : "" %>>Design</option>
  			<option <%= "Marketing".equals(j.getCategory()) ? "selected" : "" %>>Marketing</option>
  			<option <%= "Sales".equals(j.getCategory()) ? "selected" : "" %>>Sales</option>
  			<option <%= "HR".equals(j.getCategory()) ? "selected" : "" %>>HR</option>
  			<option <%= "Other".equals(j.getCategory()) ? "selected" : "" %>>Other</option>
		</select>

        </div>

        <!-- Job Type -->
        <div class="form-outline mb-3">
		<select class="form-select" name="jobType" required>
  			<option disabled>Job Type</option>
  			<option <%= "Full-Time".equals(j.getJobtype()) ? "selected" : "" %>>Full-Time</option>
  			<option <%= "Part-Time".equals(j.getJobtype()) ? "selected" : "" %>>Part-Time</option>
  			<option <%= "Internship".equals(j.getJobtype()) ? "selected" : "" %>>Internship</option>
  			<option <%= "Contract".equals(j.getJobtype()) ? "selected" : "" %>>Contract</option>
		</select>

        </div>

        <!-- Description -->
        <div class="form-outline mb-4">
          <textarea name="description" rows="4" class="form-control" placeholder="Job Description"  required><%= j.getDescription() %></textarea>
        </div>
      <!-- Id send URL -->
      <input type="hidden" value="<%= j.getId()%>" name="id">
        <!-- Submit button -->
        <div class="d-grid">
          <button type="submit" class="btn btn-primary">Post Job</button>
        </div>
      </form>
    </div>
  </div>
</div>
    <c:if test="${not empty success}">
    <p class="text-center text-success">${success}</p>
    <c:remove var="success"/>
	</c:if>

	<c:if test="${not empty error}">
    <p class="text-center text-danger">${error}</p>
    <c:remove var="error"/>
	</c:if>
</body>
</html>
