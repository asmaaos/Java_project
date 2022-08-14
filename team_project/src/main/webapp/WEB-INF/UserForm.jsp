<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="/css/style.css">
<meta charset="ISO-8859-1">
<title>New Emloyee</title>
</head>
<body>


<nav class=" navbar navbar-expand-lg bg-light ">
   <div class="container-fluid">
 <a class="navbar"  href="/home"  >  <img src="/img/Screen.png"  alt="" width="70" height="54"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" >
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link"  style="color: #FFFFFF;" href="/employee">Add User</a>
        </li>
        
          <li class="nav-item">
          <a class="nav-link"  style="color: #FFFFFF;" href="/newproject"> Create Project</a>
        </li>
           <li class="nav-item">
          <a class="nav-link"  style="color: #FFFFFF;" href="/logout">Logout</a>
        </li>
      </ul>
      <form action="/lookingfor" class="d-flex searchclass" role="search">
        <input class="form-control me-2" type="search" name = "help" placeholder="Search" aria-label="Search" >
        <button class="btn btn-outline-success"  type="submit">Go</button>
      </form>

    </div>
  </div>
</nav>



<form:form action="/addemployee" method="post" modelAttribute="newEmployee">
  <form:errors path="userName"/>
        <form:errors path="email"/>
        <form:errors path="password"/>
        <form:errors path="confirm"/>
  <div class="mb-3">
    <label  class="form-label">Email</label>
    <form:input path="email" type="email" class="form-control"/>
     <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  
  <div class="mb-3">
    <label  class="form-label">Username</label>
    <form:input path="userName" type="text" class="form-control"/>
     
  </div>

      <div class="mb-3">
    <label  class="form-label">Password</label>
     <form:password path="password" class="form-control" />
 
   

</div>
 <div class="mb-3">
    <label  class="form-label">Password</label>
     <form:password path="confirm" class="form-control" />
    
   

</div>
<div class="mb-3">
 <p>
    <form:select  class="form-select" path="level">
    <form:option value="2">Manager</form:option>
    <form:option value="3">Member</form:option>
    </form:select>
    </p>


</div>
    <button type="submit" class="btn btn-primary sub">Submit</button>




   </form:form>
   
   
   
   
   
   
   
   
   
   
   
   
   


   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   






</body>
</html>