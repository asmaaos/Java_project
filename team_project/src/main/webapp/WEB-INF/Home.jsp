<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">

</head>
<body>




<nav class=" navbar navbar-expand-lg bg-light ">
  <div class="container-fluid">
  <a class="navbar"  href="home"  >  <img src="img/Screen.png"  alt="" width="70" height="54"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" >
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="home">Home</a>
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


<div class="heelo">
<h1>Welcome Admin : 
 <c:out value = "${user.userName}"></c:out></h1> 
<hr>
</div>




<h1>Pedding Projects</h1>
   <div class="main">
       <table class="table">

        <tr>
            <th>Project</th>
            <th>Budget</th>
            <th>Percent</th>
            <th>Deadline</th>
            <th>Actions</th>
        </tr>
        
        <c:forEach var="project" items="${projects}">
        <c:if test="${project.status != false}">
        <tr>
           <td><a href="showproject/${project.id}"><c:out value="${project.title}"/></a></td> 
           <td>$ <c:out value="${project.budget}"/></td> 
           <td>% <c:out value="${String.format('%.2f',project.per)}"/></td> 
            <td><fmt:formatDate value="${project.duedate}" pattern="hh:mm MMM dd" /></td>
            <td>
      <a class="btn icon-btn btn-success" href="done/${project.id}"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Completed</a>
            </td>
        </tr>
        </c:if>
        </c:forEach>
    </table>
    
    
     <div class="emp">
        <h3>All Employees</h3>
         <c:forEach var="user" items="${users}">
                <c:if test="${user.level > 1}">
         <ul class="list-group">

  <li class="list-group-item"><a href="user/${user.id}"><c:out value="${user.userName}"/></a></li>
  <c:if test="${user.level == 2}">
  <li class="list-group-item">Manager</li>
            </c:if>
             <c:if test="${user.level == 3}"> 
              <li class="list-group-item">Member</li>
           
            </c:if>   
 
</ul>
 </c:if>
        </c:forEach>
        
    </div>
    </div>

    <h1>Completed Projects</h1>
        <table class="table">
        <tr>
            <th>Project</th>
            <th>Budget</th>
            <th>Deadline</th>
            <th>Actions</th>
        </tr>
        
        <c:forEach var="project" items="${projects}">
                <c:if test="${project.status == false}">
        <tr>
           <td><a href="showproject/${project.id}"><c:out value="${project.title}"/></a></td> 
           <td>$ <c:out value="${project.budget}"/></td> 
            <td><fmt:formatDate value="${project.duedate}" pattern="hh:mm MMM dd" /></td>
            <td>
            
            
            <a class="btn icon-btn btn-success1" href="undone/${project.id}"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Uncompleted</a>
            
            
            
            </td>
        </tr>
          </c:if>
        </c:forEach>
    </table>
    
    
</body>
</html>