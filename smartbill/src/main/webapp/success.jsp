<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <link rel="icon" href="assets/icon.png" type="image/icon type">
	<title>Registration Success</title>
    
  </head>
  <body>
    <div>
      <div class="hero">
        <nav>
            <a href="<%=request.getContextPath()%>/index.jsp"><img class="logo"
                  src="<%=request.getContextPath()%>/assets/logo.png"></a>
            <ul>
              <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
              <li><a href="about.jsp">About</a></li>
              <li><a href="contact.jsp">Contact</a></li>
              <button class="ind_button"><a class="b1" href="register.jsp">Register</a></button>
              <button class="ind_button"><a class="b1" href="${pageContext.request.contextPath}/login.jsp">Login</a></button>
            </ul>
        </nav>
      </div>
      <div class="signup">
        <div class="container">
          <div class='title' style="font-size: 25px; color: #008000">Thank You for Registering
            to SmartBill</div>
          <div class='details-cont'>
            <table>
              <tbody>
                <tr>
                  <td><span class='cust'>Consumer Number</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='custcn'></span></td>
                </tr>
                <tr>
                  <td><span class='cust'> User Name</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='custun'></span></td>
                </tr>
                <tr>
                  <td><span class='cust'>Consumer Name</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='custcnm'></span></td>
                </tr>
                <tr>
                  <td><span class='cust'>Meter Number</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='custmno'></span></td>
                </tr>
                
              </tbody>
            </table>
          </div>
          <div class="sbutton">
            <button type="submit" id="bButton" style="cursor:pointer" onclick="window.location='login.jsp';">Login to SmartBill</button>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
        var cn1 = document.getElementById("custcn");
        var cn2 = document.getElementById("custcnm");
        var cn3 = document.getElementById("custun");
        var cn4 = document.getElementById("custmno");

        
        var consumerNumber = '<%= (session.getAttribute("consumer_number") != null) ? session.getAttribute("consumer_number").toString() : "" %>';
        var name = '<%= (session.getAttribute("name") != null) ? session.getAttribute("name") : "" %>';
        var username = '<%= (session.getAttribute("username") != null) ? session.getAttribute("username") : "" %>';
        var meterno = '<%= (session.getAttribute("reg_meter_number") != null) ? session.getAttribute("reg_meter_number") : "" %>';
        if (cn1) cn1.textContent = consumerNumber;
        if (cn2) cn2.textContent = name;
        if (cn3) cn3.textContent = username;
        if(cn4) cn4.textContent = meterno;
    </script>
  </body>
</html>