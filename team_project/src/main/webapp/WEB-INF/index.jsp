<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<title>Login & Registration</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">

</head>
<body>
<nav class=" navbar navbar-expand-lg bg-light ">
<div class="container-fluid">
  <a class="navbar"  href="#"  >  <img src="img/Screen.png"  alt="" width="70" height="54"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
   <h2>Welcome to our Company</h2>
    </div>
</nav>



<div class="Form">
<h1>Registrtion</h1>

</div>

    <div class="main">
    
    
    <form:form action="/register" method="post" modelAttribute="newUser">
      <form:errors path="userName" class="text-danger" />
     <form:errors path="email" class="text-danger" />
     <form:errors path="password" class="text-danger" />
     <form:errors path="confirm" class="text-danger" />
  <div class="mb-3">
    <label  class="form-label">User Name:</label>
    <form:input path="userName" type="text" class="form-control"/>
     <div class="form-text">We'll never share your email with anyone else.</div>
  </div>
    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email</label>
    <form:input path="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
     <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
     </div>
     
      <div class="mb-3">
    <label  class="form-label">Password</label>
     <form:password path="password" class="form-control" />
</div>

      <div class="mb-3">
    <label  class="form-label">Confirm Password:</label>
     <form:password path="confirm" class="form-control" />
</div>
        <input type="submit" value="Register"  class="btn btn-primary sub"/>
           </form:form>
    
    
    
    
    
    
    
    
    
    
    
    <div class="em">
    <h1>Login as Admin</h1>
    
    
    <form:form action="/login" method="post" modelAttribute="newLogin">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email</label>
    <form:input path="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
     <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            <form:errors path="email" class="text-danger" />

  </div>
      <div class="mb-3">
    <label  class="form-label">Password</label>
     <form:password path="password" class="form-control" />
      <form:errors path="password" class="text-danger" />
 

</div>
    <button type="submit" class="btn btn-primary sub">Submit</button>
   </form:form>
    
    
    
    </div>
    

    </div>
    
</body>
</html>