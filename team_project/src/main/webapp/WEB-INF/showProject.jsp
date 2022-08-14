<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>

<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/style.css">

<meta charset="ISO-8859-1">
<title>Show Project</title>
</head>

<body>



<nav class=" navbar navbar-expand-lg bg-light ">
   <div class="container-fluid">
 <a class="navbar"  href="#"  >  <img src="/img/Screen.png"  alt="" width="70" height="54"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" >
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="/home">Home</a>
        </li>
        <c:if test="${siguinUser.level == 1}">
        <li class="nav-item">
          <a class="nav-link"  style="color: #FFFFFF;" href="/employee">Add User</a>
        </li>
        
          <li class="nav-item">
          <a class="nav-link"  style="color: #FFFFFF;" href="/newproject"> Create Project</a>
        </li>
        </c:if>
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








	
	<h1>
		<c:out value="${project.title}" />
		<!-- name of project -->
		Competed Percent : % <c:out value="${String.format('%.2f',project.per)}"/>
	</h1>
	<div class="main">
		<table class="table">
			<thead>
				<tr>
					<th>Tasks</th>
					<th>Name of employee</th>
					<th>States</th>
					<c:if test="${siguinUser.level == 1}">
					<th>Action</th>
					</c:if>
				</tr>
				<c:forEach var="task" items="${tasks}">
				<tr>
				<td>${task.description}</td>
				<td>${task.user.userName}</td>
				<c:if test="${task.status == false}">
				<td>pedding</td>
				</c:if>
				<c:if test="${task.status != false}">
				<td>Susccess</td>
				</c:if>
				<c:if test="${siguinUser.level == 1}">
								<c:if test="${task.status != false}">
				<td>
				
				<a class="btn icon-btn btn-success1" href="${project.id}/taskundone/${task.id}"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Undone</a>
				
				
				
				
				</td>
				</c:if>
								<c:if test="${task.status == false}">
				<td>
				
				<a class="btn icon-btn btn-success" href="${project.id}/task/${task.id}"><span class="glyphicon btn-glyphicon glyphicon-plus img-circle text-success"></span>Done</a>
				
				
				
				</td>
				</c:if>
				</c:if>
				</tr>
				</c:forEach>
			</thead>
			<tbody>

			</tbody>
		</table>

	<div class="emp">
	<c:if test="${siguinUser.level == 1}">
	
<form:form action="/CreateTask/${project.id}" method="post" modelAttribute="newtask">
<div class="mb-4">
 <form:errors path="description"/>
    <form:label  path="description" class="form-label">Add Task</form:label>
     <form:input  path="description" class="form-control" />
    <div  class="form-text">We'll never share your email with anyone else.</div>
  </div>
  
    <p>
    <label>Assign to : </label>
        <select  class="form-select" aria-label="Default select example" name="user_id">
        <c:forEach var="user" items="${users}">
                <c:if test="${user.level > 1}">
        <option value="${user.id}"><c:out value="${user.userName}"></c:out></option>
  			</c:if>
  		</c:forEach>
        </select>
<button type="submit" class="btn btn-primary2">Add</button>

    </form:form>
    </c:if>
    
    </div>	</div>
    					<c:if test="${siguinUser.level == 1}">
    					 <c:if test="${project.status != false}">
    	  <form:form action="/done/${project.id}" method="get" modelAttribute="newEmployee">
          <button type="submit" class="btn btn-primary bton">Done Project</button>
          </form:form>
          </c:if>
          <c:if test="${project.status == false}">
          <form:form action="/undone/${project.id}" method="get" modelAttribute="newEmployee">
          <button type="submit" class="btn btn-primary bton">Undone Project</button>
          </form:form>
          </c:if>
          </c:if>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>