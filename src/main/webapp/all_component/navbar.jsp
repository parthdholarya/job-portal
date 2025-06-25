    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<nav class="navbar navbar-expand-lg" style="background-color:#3A90E5;">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="#">Job Portal</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link text-white" href="#"></a></li>
        <c:if test="${user.role eq 'Admin' }">
        <li class="nav-item"><a class="nav-link text-white" href="postjob.jsp"><i class="fa-solid fa-plus"></i> Post Job</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="viewjob.jsp"><i class="fa-solid fa-eye"></i> View Jobs</a></li>     
         </ul>
         <a href="logout.jsp" class="btn btn-light ms-2"><i class="fa-solid fa-right-from-bracket"></i> logout</a>
         <a href="profile.jsp" class="btn btn-light ms-2"><i class="fa-solid fa-user"></i></i> Profile </a>
        </c:if>
        <c:if test="${user.role eq 'User' }">
         <li class="nav-item"><a class="nav-link text-white" href="viewjob.jsp"><i class="fa-solid fa-eye"></i> View Jobs</a></li>     
         </ul>
         <a href="logout.jsp" class="btn btn-light ms-2"><i class="fa-solid fa-right-from-bracket"></i> logout </a>
         <a href="profile.jsp" class="btn btn-light ms-2"><i class="fa-solid fa-user"></i></i> Profile</a>
        </c:if>
        
      </ul>
      <c:if test="${user.role ne 'Admin' && user.role ne 'User'}">
      <a href="login.jsp" class="btn btn-light ms-2"><i class="fa-solid fa-right-from-bracket"></i> login</a>
      <a href="registration.jsp" class="btn btn-light ms-2"><i class="fa-solid fa-right-from-bracket"></i> Signup</a>
    </c:if>
    </div>
  </div>
</nav>


