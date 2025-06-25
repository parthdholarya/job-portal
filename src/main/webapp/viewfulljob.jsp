<!DOCTYPE html>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.Entity.addJob"%>
<%@page import="com.DAO.jobDAO"%>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Full Job View</title>
    <%@ include file="all_component/all_css.jsp" %>
  <style>
    body {
      background-color: #f8f9fa;
    }
    .job-card {
      background-color: white;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 0 15px rgba(0,0,0,0.05);
    }
    .job-header {
      border-bottom: 1px solid #dee2e6;
      margin-bottom: 20px;
      padding-bottom: 15px;
    }
    .apply-btn {
      background-color: #0d6efd;
      color: white;
    }
    .apply-btn:hover {
      background-color: #0b5ed7;
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
  <div class="container my-5">
    <div class="job-card">
      <div class="job-header d-flex justify-content-between align-items-center">
        <div>
          <h3 class="mb-1"><%= j.getJobtitle()%></h3>
          <p class="text-muted mb-0"><%= j.getCompanyname() %></p>
        </div>
        <span class="badge bg-success"><%= j.getJobtype() %></span>
       
      </div>

      <div class="row mb-3">
              <div class="col-md-4 mb-2">
          <strong>Location:</strong><%= j.getLocation()%>
        </div>
        <div class="col-md-4 mb-2">
          <strong>Salary:</strong><%= j.getSalary()%>
        </div>
        <div class="col-md-4 mb-2">
          <strong>Experience:</strong> <%= j.getExperiance() %>
        </div>

      </div>

      <div class="mb-4">
        <h5>Job Description</h5>
        <p>
          <%= j.getDescription() %>
        </p>
      </div>


      <div class="mb-4">
        <h5>Qualifications</h5>
        <ul>
          <li><%= j.getQualification() %></li>

        </ul>
      </div>
        <div class="col-md-4 mb-2">
          <strong>Posted On:</strong> <%= j.getPublishdate() %>
        </div>

      <div class="text-end">
        <a href="apply.jsp" class="btn apply-btn px-4">Apply Now</a>
      </div>
    </div>
  </div>
  
<%@ include file="all_component/footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
