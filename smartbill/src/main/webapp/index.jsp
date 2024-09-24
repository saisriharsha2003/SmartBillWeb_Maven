<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="style.css">
	    <link rel="icon" href="assets/icon.png" type="image/icon type">
	    <title>Smart Bill</title>
	</head>
	<body>
      <div class="hero">
        <nav>
            <a href="index.jsp"><img class="logo"
                  src="assets/logo.png"></a>
            <ul>
              <li><a href="index.jsp">Home</a></li>
              <li><a href="about.jsp">About</a></li>
              <li><a href="contact.jsp">Contact</a></li>
              <button class="ind_button"><a class="b1" href="register.jsp">Register</a></button>
              <button class="ind_button"><a class="b1" href="<%=request.getContextPath()%>/login.jsp">Login</a></button>
            </ul>
        </nav>
      </div>
      <div class="bg1">
        <div class="container" style="background-color: black; opacity: 0.8;">
	      	<p style="font-size: 40px; font-weight: 600; color: #CCBA78; display:flex; justify-content: center; align-items: center">Welcome to <span class="homep" >SmartBill</span></p>
	      </div>
      </div>
  </body>
</html>