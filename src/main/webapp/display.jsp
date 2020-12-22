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
<style>
.container {
  
  padding: 20px;
  margin:5%;
  width: 70%;
  display:flex;
  justify-content: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  
}
</style>
</head>
<body>
<div>
<h1 style="padding: 5%; margin: 2%; text-align: center;">Display all users</h1>
<a style=" margin: 2%; display: flex;  width:5%; margin-left: 50%;" class="btn btn-secondary" href="/homepage">Back</a>
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

<div  style="margin-left:20%;margin:40%; width:30%;  display: flex; justify-content: space-around;" >

<c:if test = "${Hstatus==1}">
<div class="alert alert-success" >
  Delete has been completed of user...${name}
</div>
 </c:if>
 <c:if test = "${Hstatus==0}">
<div class="alert alert-danger" >
  Failed delete
</div>
</c:if>
</div>


</body>
</html>