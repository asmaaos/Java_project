<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">


<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">

</head>
<body>


<nav class=" navbar navbar-expand-lg bg-light ">
  <div class="container-fluid">
  <a class="navbar"  href="#"  >  <img src="img/Screen.png"  alt="" width="70" height="54"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" >
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="/home">Home</a>
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
<h1>Welcome, Member : <c:out value = "${user.userName}"></c:out></h1>

<h1>Pedding Tasks :</h1>
    <table class="table">
        <tr>
            <th>Project</th>
            <th>Task</th>
            <th>Budget</th>
            <th>Status</th>
        </tr>
         <c:forEach var="task" items="${tasks}">
        <tr>
           <td><a href="showproject/${task.project.id}"><c:out value="${task.project.title}"/></a></td> 
           <td><c:out value="${task.description}"/></td> 
           <td>$ <c:out value="${task.project.budget}"/></td> 
           <c:if test="${task.status != false}">
            <td><a href="taskundone/${task.id}">Susccess</a></td>
            </c:if>
            <c:if test="${task.status == false}">
            <td><a href="task/${task.id}">done ?</a></td>
            </c:if>
        </tr>
        </c:forEach>
    </table>
</body>
</html>