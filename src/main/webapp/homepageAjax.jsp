<%@ include file="header.jsp" %>

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
      background-color: DodgerBlue;
      border: none;
      border-bottom: none !important;
    }
  </style>
  <title>Homepage Ajax</title>
  </head>

  <body>


    <%@ include file="navbar.jsp" %>

      <h1 style="padding: 5%; margin: 3%; text-align: center;">Welcome to Homepage Ajax</h1>
      <div style="padding: 5%; margin: 2%; text-align: center; display: flex;justify-content: center;">
        <h2 style="padding: 5%; margin: 2%; text-align: center; color:DodgerBlue; cursor:pointer;" id="display">Display
          users</h2>
        <h2 style="padding: 5% ; margin: 2%; text-align: center; color:DodgerBlue; cursor:pointer;" id="register">
          Register user</h2>
      </div>
      <div style="bottom:0;position:fixed;width:100%;">


        <%@ include file="footer.jsp" %>

      </div>
  </body>
  <script>
    // function displayPage() {
    //   window.location.href = "/display";
    // }      with  onclick="displayPage()" in html
    $(document).ready(function () {
      $("#display").click(function () {
        $(location).attr('href', "/displayAjax");
      });
    });
  </script>
  <script>
    $(document).ready(function () {
      $("#register").click(function () {
        $(location).attr('href', "/RegisterAjax");
      });
    });

  </script>

  </html>