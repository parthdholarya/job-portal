<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<%@page import="com.Entity.addJob"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.jobDAO"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Jobs</title>
  <%@ include file="all_component/all_css.jsp" %>
  <style>
    body {
      background-color: #f8f9fa;
    }

    .job-card {
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      border-radius: 15px;
      margin-bottom: 20px;
      padding: 20px;
    }

    .job-title {
      color: #3A90E5;
      font-size: 1.3rem;
      font-weight: 600;
    }

    .btn-action {
      margin-right: 10px;
    }
  </style>
</head>
<body>

<%@ include file="all_component/navbar.jsp" %>

<div class="container mt-5">
  <!-- Page Header -->
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h3>All Posted Jobs</h3>
     <c:if test="${user.role eq 'Admin' }">
    <a href="postjob.jsp" class="btn btn-success">
      <i class="fa-solid fa-plus"></i> Add Job
     </c:if>
    </a>
  </div>

  <!-- Filters -->
  <form method="get" action="viewjob.jsp" class="row g-3 mb-4">
  <!-- Job Title -->
  <div class="col-md-3">
    <input type="text" name="ftitle" class="form-control" placeholder="Job Title">
  </div>

  <!-- Job Type -->
  <div class="col-md-3">
    <select name="ftype" class="form-select">
      <option value="">All Types</option>
      <option value="Full-Time">Full-Time</option>
      <option value="Part-Time">Part-Time</option>
      <option value="Internship">Internship</option>
    </select>
  </div>

  <!-- Job Category -->
  <div class="col-md-3">
    <select name="fcategory" class="form-select">
      <option value="">All Categories</option>
            <option value="Software Development">Software Development</option>
            <option value="Design">Design</option>
            <option value="Marketing">Marketing</option>
            <option value="Sales">Sales</option>
            <option value="HR">HR</option>
            <option value="Other">Other</option>
      <!-- Add more -->
    </select>
  </div>

  <!-- Active/Inactive Filter -->
  <div class="col-md-2">
    <select name="fstatus" class="form-select">
      <option value="">All Status</option>
      <option value="Active">Active</option>
      <option value="Inactive">Inactive</option>
    </select>
  </div>

  <!-- Submit -->
  <div class="col-md-1">
    <button type="submit" class="btn btn-primary w-100">Filter</button>
  </div>
</form>
<%
	String jobtitle=request.getParameter("ftitle");
	String types=request.getParameter("ftype");
	String category=request.getParameter("fcategory");
	String active=request.getParameter("fstatus");
	
	jobDAO dao=new jobDAO(DBConnection.getConnection());
	List<addJob> flist=dao.getFilteredjob(jobtitle,types,category,active);
	
%>

  <!-- Job Cards -->
  <%-- Example static job card. Replace with dynamic content using JSTL or scriptlets --%>
  <%
  //List<addJob> list=dao.getAlljobs();
  for(addJob s : flist){ 
  %>
  <div class="job-card bg-white">
    <div class="d-flex justify-content-between">
      <div>
        <div class="job-title"><a href="viewfulljob.jsp?id=<%=s.getId() %>"><%= s.getJobtitle() %></a></div>
        <p class="mb-1 text-muted">Company:<%= s.getCompanyname() %></p>
        <p class="mb-1 text-muted">Location:<%= s.getLocation() %></p>
        <p class="mb-1 text-muted">Salary: ₹<%= String.format("%.2f", s.getSalary()) %></p>
        <p class="mb-1 text-muted">Type:<%= s.getCategory() %></p>
        <p class="mb-0"><%= s.getJobtype() %></p>
        <p class="mb-1 text-muted"><%= s.getPublishdate() %></p>
        <p class="mb-1 text-muted"><%= s.getisIsactive() %></p>
      </div>
      <c:if test="${user.role eq 'Admin' }">
      <div class="text-end">
        <a href="edit_job.jsp?id=<%=s.getId() %>" class="btn btn-primary btn-sm btn-action">
          <i class="fa-solid fa-pen-to-square"></i> Edit
        </a>
        <a href="deletejob?id=<%=s.getId() %>" class="btn btn-danger btn-sm btn-action"
           onclick="return confirm('Are you sure you want to delete this job?');">
          <i class="fa-solid fa-trash"></i> Delete
        </a>
      </div>
      </c:if>
    </div>
  </div>
<%
  }
%>
<%
if(flist.isEmpty()){
%>
<tr>
    <td colspan="7"><h5 class="text-center">No data found!!</h5></td>
</tr>
<%
}
%>

<!--  
  <div class="job-card bg-white">
    <div class="d-flex justify-content-between">
      <div>
        <div class="job-title">UI/UX Designer</div>
        <p class="mb-1 text-muted">Company: Adobe</p>
        <p class="mb-1 text-muted">Location: Remote</p>
        <p class="mb-1 text-muted">Salary: ₹60,000/month</p>
        <p class="mb-1 text-muted">Type: Freelance | Category: Design</p>
        <p class="mb-0">Design intuitive user interfaces for web apps...</p>
      </div>
      <div class="text-end">
        <a href="edit_job.jsp?id=2" class="btn btn-primary btn-sm btn-action">
          <i class="fa-solid fa-pen-to-square"></i> Edit
        </a>
        <a href="delete_job?id=2" class="btn btn-danger btn-sm btn-action"
           onclick="return confirm('Are you sure you want to delete this job?');">
          <i class="fa-solid fa-trash"></i> Delete
        </a>
      </div>
    </div>
  </div>

</div>
-->
  </div>
</div>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>
