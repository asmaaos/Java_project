<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to our Company </title>
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
   <h2>Company</h2>
    </div>

</nav>

<h1>Login as Employee</h1>

<form:form action="/loginemloyee" method="post" modelAttribute="newLogin">
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


</body>
</html>