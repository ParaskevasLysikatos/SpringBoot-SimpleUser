<%@ include file="header.jsp" %>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
<title>User info Ajax</title>
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

<%@ include file="navbar.jsp" %>


<h1 style="padding: 2%; margin: 2%; text-align: center;">User info Ajax</h1>
<div class="container con">
  <form action="/editUser" method="post"  autocomplete="off" enctype="multipart/form-data">
  <div class="row">
    <div class="col-25">
      <label for="name"> Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="name" name="name"  placeholder="Your name..">
     
       <p class="text-danger" id="reqName"></p>
      
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="surname">Surname</label>
    </div>
    <div class="col-75">
      <input type="text" id="surname" name="surname"  placeholder="Your surname..">
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
      <input type="text" id="datepicker" name="birthdate"  >
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="HomeAddress">HomeAddress</label>
    </div>
    <div class="col-75">
      <textarea id="homeAddress" name="homeAddress" placeholder="Write HomeAddress.." style="height:100px"></textarea>
    </div>
    <div class="col-25">
      <label for="WorkAddress">WorkAddress</label>
    </div>
    <div class="col-75">
      <textarea id="workAddress" name="workAddress" placeholder="Write WorkAddress.." style="height:100px"></textarea>
    </div>
  </div>
  <div class="row" style="margin-left:50%;margin-top:5%;  display: flex;justify-content: space-between;align-items: center;">
    <input type="submit" id="submit"  value="Submit">
  </div>
  <input  type="hidden" id="id" name="id" value="${id}" >
  
  </form>
</div>


<div style="margin:1%; padding:2%; display: flex;justify-content:center;">


<p id="success"  >
 
</p>
 
 
<p id="danger"  >
  
</p>

</div>
<script type="text/javascript">

$(document).ready(function(){
	  
	  var id = $('#id').val();
	  
	       $.ajax({
	            type:"GET",
	            url:"/GetUserAjax/"+id,
	            contentType: "application/json",
	            
	            success: function(data){
	          
	                console.log(data.name);
	                $('#name').val(data.name);
               	 $('#surname').val(data.surname);
               	 $('#gender').val(data.gender);
               	
           		$('#datepicker').val(data.formatDate);
               		 
               	 $('#homeAddress').val(data.homeAddress);
               	 $('#workAddress').val(data.workAddress);
	            
	            },
	            error: function(err) {  
	                console.log(err);
	                alert(err);  
	                
	            }
	        });

});
//-------------------------------------------------------------------------------------------//

        // click on button submit
        $("#submit").on('click', function(event){
        	event.preventDefault();
       		var name=$('#name').val();
       		var surname=$('#surname').val();
       		if($('#datepicker').val()!=''){
       			var birthdate=new Date($('#datepicker').val()).toISOString();
           		 }else birthdate='';
       		
       		var gender=$('#gender').val();
       		var homeAddress=$('#homeAddress').val();
       		var workAddress=$('#workAddress').val();
			var xhr;
       		console.log(name);
       		console.log(birthdate);
       	 var id = $('#id').val();
            // send ajax
         xhr=$.ajax({
                url: '/editUserAjax', // url where to submit the request
                type : "PUT", // type of action POST || GET
                contentType: 'application/json',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                  },
                dataType : 'json', // data type
                data :  JSON.stringify({ "name" : name,
			       "surname":surname,
			       "birthdate":birthdate,
			       "gender":gender,
			       "homeAddress":homeAddress,
			       "workAddress":workAddress,"userId":id}), // post data || get data
                success : function(data) {
                    // you can see the result from the console
                    // tab of the developer tools
            
                	 $( "#success" ).addClass( "alert alert-success" );
                	 $('#success').html('Edit success '+data.name);
                	 //clear error messages
                	 $('#reqName').html('');
                	 $('#danger').removeClass("alert alert-danger");
                	 $('#danger').html('');
                	 
                	
                	 
                },
                error: function(xhr, resp, text) {
                    console.log(xhr, resp, text);
                    $( "#danger" ).addClass( "alert alert-danger" );
                    $('#danger').html('Edit failed');
                    //clear success
                    $('#success').html('');
                    $('#success').removeClass("alert alert-success");
                    
                }
            })
					//abort ajax request if name not filled
            if($('#name').val()==''){
             	$('#reqName').html('Name is required, please fill one');
         		xhr.abort();
           		 }
        });

</script>
<div style="bottom:0;position:fixed;width:100%;">

<%@ include file="footer.jsp" %>
</div>
</body>

</html>