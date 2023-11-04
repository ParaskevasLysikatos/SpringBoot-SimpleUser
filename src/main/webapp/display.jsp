<%@ include file="header.jsp" %>
  <title>Display users</title>
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
        <h1 style="padding: 1%; margin: 1%; text-align: center;">Display all users</h1>
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

              <tr>
                <th scope="row">${status.count} </th>
                <td>${listValue.name}</td>
                <td>${listValue.surname}</td>

                <td style="display:flex;justify-content: space-around;">
                  <form action="/displayUser">
                    <input type="hidden" name="id" value="${listValue.userId}">
                    <input class="btn btn-primary" type="submit" value="display">
                  </form>
                  <form action="/deleteUser">
                    <input type="hidden" name="id" value="${listValue.userId}">
                    <input class="btn btn-danger" type="submit" value="delete">
                  </form>
                </td>
              </tr>
            </c:forEach>

          </tbody>
        </table>

      </div>


      <div class="container">
        <c:if test="${Hstatus==1}">
          <p class="alert alert-success">
            Delete has been completed of user...${name}
          </p>
        </c:if>
        <c:if test="${Hstatus==0}">
          <p class="alert alert-danger">
            Failed delete
          </p>
        </c:if>
      </div>

      <div style="bottom:0;position:fixed;width:100%;">



        <%@ include file="footer.jsp" %>

      </div>
  </body>

  </html>