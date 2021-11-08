<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Display users</title>
</head>
<style>
.footer {
  left: 0;
  bottom: 0;
  width: 100%;
  text-align: center;
  background-color:DodgerBlue;
  border: none;
  border-bottom: none !important;
}
</style>
<body>


<nav class="navbar navbar-light navbar-expand-lg" style="background-color:DodgerBlue;">
  <div class="collapse navbar-collapse">
  <ul class="navbar-nav d-flex justify-content-around">
  <li class="nav-item">
   <a class="navbar-brand" style="color:white;" href="/">Homepage</a>
   </li>
   &nbsp; &nbsp; &nbsp; &nbsp;
     <li class="nav-item">
   <a class="navbar-brand" style="color:white;" href="homepageAjax">HomepageAjax</a>
     </li>
      &nbsp; &nbsp; &nbsp; &nbsp;
      <li class="nav-item">
   <a class="navbar-brand" style="color:white;" href="Register">Register</a>
     </li>
      &nbsp; &nbsp; &nbsp; &nbsp;
      <li class="nav-item">
   <a class="navbar-brand" style="color:white;" href="RegisterAjax">RegisterAjax</a>
     </li>
      &nbsp; &nbsp; &nbsp; &nbsp;
      <li class="nav-item">
   <a class="navbar-brand" style="color:white;" href="display">Display users</a>
     </li>
      &nbsp; &nbsp; &nbsp; &nbsp;
      <li class="nav-item">
   <a class="navbar-brand" style="color:white;" href="displayAjax">Display users ajax</a>
     </li>
     
   </ul>
  </div>
</nav>


<div>
<h1 style="padding: 2%; margin: 2%; text-align: center;">Display all users</h1>
</div>
<div class="container">
<table class="table table-striped  table-bordered table-hover">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Surname</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="listValue" items="${ListUser}" varStatus="status">
  
    <tr>
      <th scope="row">${status.count} </th>
      <td>${listValue.name}</td>
      <td>${listValue.surname}</td>
      
      <td style="display:flex;justify-content: space-around;">
      <form action="/displayUser">
      <input  type="hidden" name="id" value="${listValue.userId}" >
      <input class="btn btn-primary"  type="submit" value="display">
      </form>
      <form action="/deleteUser">
      <input  type="hidden" name="id" value="${listValue.userId}" >
      <input class="btn btn-danger" type="submit" value="delete">
      </form>
      </td>
    </tr>
</c:forEach>
   
  </tbody>
</table>

</div>


<div class="container">
<c:if test = "${Hstatus==1}">
<p class="alert alert-success"  >
  Delete has been completed of user...${name}
</p>
 </c:if>
 <c:if test = "${Hstatus==0}">
<p class="alert alert-danger" >
  Failed delete
</p>
</c:if>
</div>

<div style="bottom:0;position:fixed;width:100%;">



<footer class="footer py-3">
  <div>
    <span style="color:white;" >Found in github.com/ParaskevasLysikatos/SpringBootSimpleApp</span>
  </div>
</footer>

</div>
</body>
</html>