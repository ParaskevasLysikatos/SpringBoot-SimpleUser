<%@ include file="header.jsp" %>
  <title>Display users Ajax</title>
  <style>
    .td {
      display: flex;
      justify-content: space-around;
    }
  </style>
  <style>
    .footer {
      left: 0;
      bottom: 0;
      width: 100%;
      text-align: center;
      background-color: DodgerBlue;
      border: none;
      border-bottom: none !important;
    }
  </style>
  </head>

  <body>


    <%@ include file="navbar.jsp" %>


      <div>
        <h1 style="padding: 2%; margin: 2%; text-align: center;">Display all users Ajax</h1>
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
                    <input type="hidden" name="id" id="Einput" value="${listValue.userId}">
                    <button class="btn btn-primary" id="Ebutton" type="submit">display</button>
                  </form>
                  <input type="hidden" name="id" id="Dinput" value="${listValue.userId}">
                  <button class="btn btn-danger" id="Dbutton" type="submit">delete</button>

                </td>
              </tr>
            </c:forEach>



          </tbody>
        </table>

      </div>

      <div class="container">


        <p id="success">

        </p>


        <p id="danger">

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
        $(document).ready(function () {
          $('table').on('click', 'button[id="Dbutton"]', function (e) {
            var id = $(this).closest('tr').children('td:last').find('#Dinput').val();
            var name = $(this).closest('tr').children('td:first').text();
            $.ajax({
              type: "DELETE",
              url: "/deleteUserAjax/" + id,
              success: function (data) {
                alert("success  " + name);
                $("#success").addClass("alert alert-success");
                $('#success').html('Deleted with success ' + name);
                $('#' + id).remove();//row delete front end
                //remove errors
                $('#danger').removeClass("alert alert-danger");
                $('#danger').html('');
              },
              error: function (err) {
                console.log(err);
                alert(err + " " + name);
                $("#danger").addClass("alert alert-danger");
                $('#danger').html('Delete failed');
                //remove success
                $('#success').html('');
                $('#success').removeClass("alert alert-success");

              }
            });

          })
        });


      </script>
      <div style="bottom:0;position:fixed;width:100%;">

        <%@ include file="footer.jsp" %>

      </div>
  </body>

  </html>