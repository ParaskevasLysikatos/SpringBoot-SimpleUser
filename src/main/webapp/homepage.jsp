<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Homepage</title>
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


<h1 style="padding: 5%; margin: 3%; text-align: center;">Welcome to Homepage</h1>
<div style="padding: 5%; margin: 2%; text-align: center; display: flex;justify-content: center;">
<h2 style="padding: 5%; margin: 2%; text-align: center;"><a href="/display">Display users</a></h2>
<h2 style="padding: 5% ; margin: 2%; text-align: center;"><a href="/Register">Register user</a></h2>
</div>
</body>
<div style="bottom:0;position:fixed;width:100%;">




<footer class="footer py-3">
  <div>
    <span style="color:white;" >Found in github.com/ParaskevasLysikatos/SpringBootSimpleApp</span>
  </div>
</footer>
</div>
</html>