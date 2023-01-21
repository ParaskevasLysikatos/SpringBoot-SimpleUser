<%@ include file="header.jsp" %>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
<title>User info</title>
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

<h1 style="padding: 1%; margin: 1%; text-align: center;">User info</h1>
<div class="container con">
  <form action="/editUser" method="post"  autocomplete="off" enctype="multipart/form-data">
  <div class="row">
    <div class="col-25">
      <label for="name"> Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="name" name="name" value="${u.name}" placeholder="Your name..">
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
      <input type="text" id="surname" name="surname" value="${u.surname}" placeholder="Your surname..">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="gender">Gender</label>
    </div>
    <div class="col-75">
      <select id="gender" name="gender">
       <option value="${u.gender}" selected>${u.gender}</option>
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
      <input type="text" id="datepicker" name="birthdate" value="${d}" >
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="HomeAddress">HomeAddress</label>
    </div>
    <div class="col-75">
      <textarea id="HomeAddress" name="homeAddress" placeholder="Write HomeAddress.." style="height:100px">${a.homeAddress}</textarea>
    </div>
    <div class="col-25">
      <label for="WorkAddress">WorkAddress</label>
    </div>
    <div class="col-75">
      <textarea id="WorkAddress" name="workAddress" placeholder="Write WorkAddress.." style="height:100px">${a.workAddress}</textarea>
    </div>
  </div>
  <div class="row" style="margin-left:50%;margin-top:5%;  display: flex;justify-content: space-between;align-items: center;">
    <input type="submit"  value="Submit">
  </div>
  <input  type="hidden" name="id" value="${id}" >
  
  </form>
</div>
<div >

<c:if test = "${Hstatus==1}">
<div  class="alert alert-success" style="margin:1%; padding:1%; display: flex;justify-content:center;" >
  Edit success of user...${name}
</div>
 </c:if>
 <c:if test = "${Hstatus==0}">
<div class="alert alert-danger" style="margin:1%; padding:1%; display: flex;justify-content:center;" >
  Failed edit
</div>
</c:if>
</div>

<div style="bottom:0;position:fixed;width:100%;">


<%@ include file="footer.jsp" %>
</div>
</body>

</html>