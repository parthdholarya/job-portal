<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
  
  <title>Login</title>
  <%@ include file="all_component/all_css.jsp" %>
  <style>
    body {
      background-color: #f4f7f9;
    }
    .login-card {
      max-width: 400px;
      margin: auto;
      margin-top: 50px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      border-radius: 12px;
    }
  </style>
</head>
<body>
<%@ include file="all_component/navbar.jsp" %>
<div class="container">
  <div class="card login-card">
    <div class="card-body">
      <h3 class="text-center mb-4 text-primary">Log In</h3>

      <form action="login" method="post">
        <!-- Email input -->
        <div class="form-outline mb-4">
          <input type="email" id="form2Example1" class="form-control" placeholder="Email address" name="email"/>
        </div>

        <!-- Password input -->
        <div class="form-outline mb-4">
          <input type="password" id="form2Example2" class="form-control" placeholder="Password" name="password"/>
        </div>

        <!-- 2 column layout -->
        <div class="row mb-4">
          <div class="col d-flex align-items-center">
            <input class="form-check-input me-2" type="checkbox" value="" id="form2Example31" checked />
            <label class="form-check-label" for="form2Example31">Remember me</label>
          </div>

          <div class="col text-end">
            <a href="#!">Forgot password?</a>
          </div>
        </div>

        <!-- Submit button -->
        <div class="d-grid mb-4">
          <button type="submit" class="btn btn-primary">Sign in</button>
        </div>

        <!-- Register & social -->
        <div class="text-center">
          <p>Not a member? <a href="registration.jsp">Register</a></p>
          <p>Or sign in with:</p>
          <button type="button" class="btn btn-link btn-floating mx-1"><i class="fab fa-facebook-f"></i></button>
          <button type="button" class="btn btn-link btn-floating mx-1"><i class="fab fa-google"></i></button>
          <button type="button" class="btn btn-link btn-floating mx-1"><i class="fab fa-twitter"></i></button>
          <button type="button" class="btn btn-link btn-floating mx-1"><i class="fab fa-github"></i></button>
        </div>
      </form>
    </div>
  </div>
</div>
<%@ include file="all_component/footer.jsp" %>
</body>
</html>
