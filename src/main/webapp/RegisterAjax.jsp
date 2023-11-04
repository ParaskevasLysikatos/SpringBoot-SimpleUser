<%@ include file="header.jsp" %>
  <script>
  $( function() {
	  $("#datepicker").datepicker({
    	  dateFormat: "dd/mm/yy"
      });
  } );
  </script>
<title>Register Ajax</title>
<style>
.footer {
  left: 0;
  bottom: 0;
  width: 100%;
  text-align: center;
  background-color:DodgerBlue;
  border: none;
  border-bottom: none !important;
  position:fixed;
}
</style>
<style>
* {
  box-sizing: border-box;
}

.con {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding:2%;
  
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


<h1 style="padding: 1%; margin: 0.5%; text-align: center;">Register a user Ajax</h1>
<div class="container con">
  <form  autocomplete="off">
  <div class="row">
    <div class="col-25">
      <label for="name"> Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="name" name="name" placeholder="Your name..">
    
       <p class="text-danger" id="reqName"></p>
       
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
      <textarea id="homeAddress" name="homeAddress" placeholder="Write HomeAddress.." style="height:100px"></textarea>
    </div>
    <div class="col-25">
      <label for="workAddress">WorkAddress</label>
    </div>
    <div class="col-75">
      <textarea id="workAddress" name="workAddress" placeholder="Write WorkAddress.." style="height:100px"></textarea>
    </div>
  </div>
  <div class="row" style="margin-left:50%;margin-top:5%;  display: flex;justify-content: space-between;align-items: center;">
    <input type="submit" id="submit"  value="Submit">
  </div>
  
  </form>
</div>
<div>


<p  id="success" style="margin:0.5%; padding:1%; display: flex;justify-content:center;">
</p>

 
<p  id="danger" style="margin:0.5%; padding:1%; display: flex;justify-content:center;" >
</p>

</div>


<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
	  $("#home").click(function(){
		 $(location).attr('href',"/homepageAjax");
	  });
	});
	

//request
	 
        // click on button submit
        $("#submit").on('click', function(event){
        	event.preventDefault();
       		var name=$('#name').val();
       		var surname=$('#surname').val();
          var birthdate=$('#datepicker').val();
       		console.log(birthdate);
       		if(birthdate!=''){
       			 birthdate=new Date(birthdate).toISOString();
           		 }else birthdate='';
       		
       		var gender=$('#gender').val();
       		var homeAddress=$('#homeAddress').val();
       		var workAddress=$('#workAddress').val();
			var xhr;
       		console.log(name);
       		console.log(birthdate);
       		
            // send ajax
         xhr=$.ajax({
                url: '/registerUserAjax', // url where to submit the request
                type : "post", // type of action POST || GET
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
			       "workAddress":workAddress}), // post data || get data
                success : function(data) {
                    // you can see the result from the console
                    // tab of the developer tools
            
                	 $( "#success" ).addClass( "alert alert-success" );
                	 $('#success').html('Register success '+data.name);
                	 //clear error messages
                	 $('#reqName').html('');
                	 $('#danger').removeClass("alert alert-danger");
                	 $('#danger').html('');
                	 //clear form data
                	 $('#name').val('');
                	 $('#surname').val('');
                	 $('#gender').val('');
                	 $('#datepicker').val('');
                	 $('#homeAddress').val('');
                	 $('#workAddress').val('');
                	
                	 
                },
                error: function(xhr, resp, text) {
                    console.log(xhr, resp, text);
                    $( "#danger" ).addClass( "alert alert-danger" );
                    $('#danger').html('Register failed');
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