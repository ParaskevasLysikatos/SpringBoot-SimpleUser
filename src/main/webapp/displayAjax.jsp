<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="ISO-8859-1">
<title>Display users Ajax</title>
<style>
.td{
display:flex;
justify-content: space-around;
}
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
<h1 style="padding: 5%; margin: 2%; text-align: center;">Display all users Ajax</h1>
<a style=" margin: 2%; display: flex;  width:5%; margin-left: 50%;" class="btn btn-secondary" href="/homepageAjax">Back</a>
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
  
    <tr id="${listValue.userId}">
      <th scope="row">${status.count} </th>
      <td>${listValue.name}</td>
      <td>${listValue.surname}</td>
      
      <td style="display:flex;justify-content: space-around;">
     <form action="/displayUserAjax">
      <input  type="hidden" name="id" id="Einput"  value="${listValue.userId}" >
      <button class="btn btn-primary" id="Ebutton"  type="submit" >display</button>
      </form>
      <input  type="hidden" name="id" id="Dinput" value="${listValue.userId}" >
      <button class="btn btn-danger" id="Dbutton"  type="submit">delete</button>
      
      </td>
    </tr>
</c:forEach>
    

   
  </tbody>
</table>

</div>

<div  style="margin-left:20%;margin:40%; width:30%;  display: flex; justify-content: space-around;" >


<p id="success" >
 
</p>
 
 
<p id="danger"  >
  
</p>

</div>

<script type="text/javascript">
/*
$(document).ready(function(){
	  $("tbody").empty();
      $.ajax({    
        type:"GET",
        contentType: "application/json",
        url:"/displayAjaxData",
        success: function(data) {
          var users = data;
          for (var i in users) {
              $("tbody").append("<tr><th scope=\'row\'>\' +  i+1 + \'</th> <td>\' +  users[i].name + \'</td> <td>\' +  users[i].surname + \'</td>  <td> <form action=\'/displayUserAjax\'><input  type=\'hidden\' name=\'id\' value=\'users[i].userId\' > <input class=\'btn btn-primary\'  type=\'submit\' value=\'display\'></form>  <form action=\'/deleteUserAjax\'><input  type=\'hidden\' name=\'id\' value=\'users[i].userId\' ><input class=\'btn btn-danger\' type=\'submit\' value=\'delete\'> </form></td>   </tr>");
          }
        },
        error: function(data) { 
          console.log(data);
          }
      });
     
  });*/
  $(document).ready(function(){
	  $('table').on('click', 'button[id="Dbutton"]', function(e){
	       var id = $(this).closest('tr').children('td:last').find('#Dinput').val();
	       var name = $(this).closest('tr').children('td:first').text();
	       $.ajax({
	            type:"DELETE",
	            url:"/deleteUserAjax/"+id,
	            success: function(data){
	                alert("success"+name);
	             $( "#success" ).addClass( "alert alert-success" );
               	 $('#success').html('Deleted with success '+name);
               	$('#'+id).remove();//row delete front end
               	 //remove errors
               	$('#danger').removeClass("alert alert-danger");
           		 $('#danger').html('');
	            },
	            error: function(err) {  
	                console.log(err);
	                alert(err+name);
	                $( "#danger" ).addClass( "alert alert-danger" );
                    $('#danger').html('Delete failed');
                    //remove success
                    $('#success').html('');
                    $('#success').removeClass("alert alert-success");
	                
	            }
	        });

	    })
  });
  

</script>
</body>
</html>