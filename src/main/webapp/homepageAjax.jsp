<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
h2:hover {
  text-decoration: underline;
  
}
</style>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Homepage Ajax</title>
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

<h1 style="padding: 5%; margin: 3%; text-align: center;">Welcome to Homepage Ajax</h1>
<div style="padding: 5%; margin: 2%; text-align: center; display: flex;justify-content: center;">
<h2  style="padding: 5%; margin: 2%; text-align: center; color:DodgerBlue; cursor:pointer;"id="display" >Display users</h2>
<h2 style="padding: 5% ; margin: 2%; text-align: center; color:DodgerBlue; cursor:pointer;" id="register">Register user</h2>
</div>
<div style="bottom:0;position:fixed;width:100%;">


<footer class="footer py-3">
  <div>
    <span style="color:white;" >Found in github.com/ParaskevasLysikatos/SpringBootSimpleApp</span>
  </div>
</footer>

</div>
</body>
<script>
   // function displayPage() {
   //   window.location.href = "/display";
   // }      with  onclick="displayPage()" in html
   $(document).ready(function(){
	  $("#display").click(function(){
		 $(location).attr('href',"/displayAjax");
	  });
	});
</script> 
<script>
$(document).ready(function(){
	  $("#register").click(function(){
		 $(location).attr('href',"/RegisterAjax");
	  });
	});
       
</script> 
</html>