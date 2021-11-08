<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
  
<meta charset="ISO-8859-1">
<title>Register</title>
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
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.con {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding:2%;
  
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
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


<h1 style="padding: 3%; margin: 2%; text-align: center;">Register a user</h1>
<div class="container con">
  <form action="/registerUser" method="post"  autocomplete="off" enctype="multipart/form-data">
  <div class="row">
    <div class="col-25">
      <label for="name"> Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="name" name="name" placeholder="Your name..">
      <c:if test = "${name==null}">
       <p class="text-danger">Name is required, please fill one</p>
       </c:if>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="surname">Surname</label>
    </div>
    <div class="col-75">
      <input type="text" id="surname" name="surname" placeholder="Your surname..">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="gender">Gender</label>
    </div>
    <div class="col-75">
      <select id="gender" name="gender">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
      </select>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="Birthdate">BirthDate</label>
    </div>
    <div class="col-75">
      <input type="text" id="datepicker" name="birthdate" >
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="HomeAddress">HomeAddress</label>
    </div>
    <div class="col-75">
      <textarea id="HomeAddress" name="homeAddress" placeholder="Write HomeAddress.." style="height:100px"></textarea>
    </div>
    <div class="col-25">
      <label for="WorkAddress">WorkAddress</label>
    </div>
    <div class="col-75">
      <textarea id="WorkAddress" name="workAddress" placeholder="Write WorkAddress.." style="height:100px"></textarea>
    </div>
  </div>
  <div class="row" style="margin:2%; padding:2%; display: flex;justify-content:center;">
    <input type="submit"  value="Submit">
  </div>
  
  </form>
</div>
<div>

<c:if test = "${Hstatus==1}">
<div class="alert alert-success" style="margin:1%; padding:1%; display: flex;justify-content:center;" >
  Register success of user...${name}
</div>
 </c:if>
 <c:if test = "${Hstatus==0}">
<div class="alert alert-danger" style="margin:1%; padding:1%; display: flex;justify-content:center;">
  Failed register
</div>
</c:if>
</div>


<footer class="footer py-3">
  <div>
    <span style="color:white;" >Found in github.com/ParaskevasLysikatos/SpringBootSimpleApp</span>
  </div>
</footer>
</body>

</html>