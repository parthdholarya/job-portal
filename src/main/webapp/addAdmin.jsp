<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register</title>
  <%@ include file="all_component/all_css.jsp" %>
  <style>
    body {
      background-color: #f4f7f9;
    }
    .register-card {
      max-width: 500px;
      margin: auto;
      margin-top: 50px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      border-radius: 15px;
    }
  </style>
</head>
<body>

<%@ include file="all_component/navbar.jsp" %>

<div class="container">
  <div class="card register-card">
    <div class="card-body">
      <h3 class="text-center mb-4 text-primary">Add Admin Account</h3>

      <form action="register" method="post">
        <!-- Name input -->
        <div class="form-outline mb-3">
          <input type="text" name="fullname" class="form-control" placeholder="Full Name" required />
        </div>

        <!-- Email input -->
        <div class="form-outline mb-3">
          <input type="email" name="email" class="form-control" placeholder="Email address" required />
        </div>

        <!-- Phone input -->
        <div class="form-outline mb-3">
          <input type="tel" name="phone" class="form-control" placeholder="Phone Number" required />
        </div>

        <!-- Qualification input -->
        <div class="form-outline mb-3">
          <input type="text" name="Qualification" class="form-control" placeholder="Qualification" required />
        </div>

        <!-- Confirm Password -->
        <div class="form-outline mb-4">
          <input type="password" name="password" class="form-control" placeholder="Password" required />
        </div>
		<input type="hidden" value="Admin" name="role">
        <!-- Terms & Conditions -->
        <div class="form-check mb-3">
          <input class="form-check-input" type="checkbox" id="terms" required />
          <label class="form-check-label" for="terms">
            I agree to the <a href="#">terms & conditions</a>
          </label>
        </div>

        <!-- Submit button -->
        <div class="d-grid mb-3">
          <button type="submit" class="btn btn-primary">Register</button>
        </div>

        <!-- Already have account -->
        <div class="text-center">
          <p>Already a member? <a href="login.jsp">Login here</a></p>
        </div>
      </form>
    </div>
  </div>
</div>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>
