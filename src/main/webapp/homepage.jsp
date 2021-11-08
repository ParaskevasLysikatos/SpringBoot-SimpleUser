<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Homepage</title>
</head>
<body>
	
<%@ include file="webapp/navbar.jsp" >
<h1 style="padding: 5%; margin: 3%; text-align: center;">Welcome to Homepage</h1>
<div style="padding: 5%; margin: 2%; text-align: center; display: flex;justify-content: center;">
<h2 style="padding: 5%; margin: 2%; text-align: center;"><a href="/display">Display users</a></h2>
<h2 style="padding: 5% ; margin: 2%; text-align: center;"><a href="/Register">Register user</a></h2>
</div>
</body>
<div style="bottom:0;position:fixed;width:100%;">
<%@ include file="webapp/footer.jsp">
</div>
</html>