<%@ include file="header.jsp" %>
  <title>Homepage</title>
  </head>
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

  <body>

    <%@ include file="navbar.jsp" %>


      <h1 style="padding: 5%; margin: 3%; text-align: center;">Welcome to Homepage</h1>
      <div style="padding: 5%; margin: 2%; text-align: center; display: flex;justify-content: center;">
        <h2 style="padding: 5%; margin: 2%; text-align: center;"><a href="/display">Display users</a></h2>
        <h2 style="padding: 5% ; margin: 2%; text-align: center;"><a href="/Register">Register user</a></h2>
      </div>
  </body>
  <div style="bottom:0;position:fixed;width:100%;">

    <%@ include file="footer.jsp" %>

  </div>

  </html>