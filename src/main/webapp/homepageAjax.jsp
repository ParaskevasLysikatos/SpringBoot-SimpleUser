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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Homepage Ajax</title>
</head>
<body>
<%@ include file = "/navbar.jsp" %>
<h1 style="padding: 5%; margin: 3%; text-align: center;">Welcome to Homepage Ajax</h1>
<div style="padding: 5%; margin: 2%; text-align: center; display: flex;justify-content: center;">
<h2  style="padding: 5%; margin: 2%; text-align: center; color:DodgerBlue; cursor:pointer;"id="display" >Display users</h2>
<h2 style="padding: 5% ; margin: 2%; text-align: center; color:DodgerBlue; cursor:pointer;" id="register">Register user</h2>
</div>
<div style="bottom:0;position:fixed;width:100%;">
<%@ include file = "/footer.jsp" %>
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