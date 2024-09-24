<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("consumer_lgname") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
    <title>Complaint Registered</title>
  </head>
  <body>
    <div>
      <div class="hero">
        <nav> <a href="${pageContext.request.contextPath}/source/home.jsp"><img class="logo"
			src="${pageContext.request.contextPath}/assets/logo.png"></a>
		<ul>
			<li><a href="${pageContext.request.contextPath}/source/home.jsp">Home</a></li>

			<li class="dropdown"><a href="#" class="dropbtn">Bill</a>
				<div class="dropdown-content">
					<a href="${pageContext.request.contextPath}/PayBills">Pay Bills</a> 
					<a href="${pageContext.request.contextPath}/ViewBills">View Bills</a>
					<a href="${pageContext.request.contextPath}/source/search_bill.jsp">Search
						Bill</a>
				</div></li>

			<li class="dropdown"><a href="#" class="dropbtn">Complaint</a>
				<div class="dropdown-content">
					<a href="${pageContext.request.contextPath}/source/register_complaint.jsp">Register Complaint</a> <a
						href="${pageContext.request.contextPath}/source/search_complaint.jsp">Search Complaint</a> <a
						href="${pageContext.request.contextPath}/ComplaintStatus">Complaint
						Status</a>
				</div></li>

			<li class="dropdown"><a href="#" class="dropbtn">Payments</a>
				<div class="dropdown-content">
					<a href="${pageContext.request.contextPath}/PaymentHistory">Payments History</a> 

					<a href="${pageContext.request.contextPath}/source/search_payment.jsp">Search Payment Details</a>
				</div>
			</li>

		</ul>

		<img src="<%=request.getContextPath()%>/assets/user.png" class="user-pic" onclick="toggleMenu()">
		<div class="sub-menu-wrap" id="subMenu">
			<div class="sub-menu">
				<div class="user-info">
					<img src="<%=request.getContextPath()%>/assets/user.png" style="width: 80px; height: 80px">
					<h2 id="cu_name" style="color: #CCBA78;"></h2>
				</div>
				<hr>
				<a href="edit_profile.jsp" class="sub-menu-link"> 
					<img src="<%=request.getContextPath()%>/assets/edit.png" style="width: 50px; height: 50px">
					<p>Edit Profile</p> <span class="ext">></span>
				</a> 
				<a href="delete_profile.jsp" class="sub-menu-link"> 
					<img src="<%=request.getContextPath()%>/assets/delete.png" style="width: 50px; height: 50px">
					<p>Delete Account</p> <span class="ext">></span>
				</a> 
				<a href="<%=request.getContextPath()%>/LogoutServlet" class="sub-menu-link">  
				<img src="<%=request.getContextPath()%>/assets/logout.png" style="width: 50px; height: 50px">
					<p>Logout</p> <span class="ext">></span>
				</a>
			</div>
		</div>
	</nav>
        
      </div>
      <div class="signup">
        <div class="container">
          <div class='title' style="font-size: 25px; color: #008000">Complaint Registered Successfully!</div>
          <div class='details-cont'>
            <table>
              <tbody>
                <tr>
                  <td><span class='cust'>Complaint Number</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='cocno'></span></td>
                </tr>
                <tr>
                  <td><span class='cust'>Contact Person</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='cocnp'></span></td>
                </tr>
                <tr>
                  <td><span class='cust'> Mobile Number</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='com'></span></td>
                </tr>
                <tr>
                  <td><span class='cust'>Problem</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='cop'></span></td>
                </tr>
                
                <tr>
                  <td><span class='cust'> Address</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='addr'></span></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="sbutton">
            <button type="submit" id="bButton" value="" style="cursor: pointer;" onclick="window.location='home.jsp';">Back to Home</button>
          </div>
        </div>
      </div>
      <script src="<%=request.getContextPath()%>/scripts/script.js"></script>
      <%
	      	HashMap<String, String> mp =(HashMap<String, String>)session.getAttribute("complaint-details");
		  	String comp_id = mp.get("comp_id");
		  	String comp_per = mp.get("comp_per");
		  	String comp_mob = mp.get("comp_mobile");
		  	String comp_prob = mp.get("comp_problem");
		  	String comp_add = mp.get("comp_address");

      %>
		<script>
			
			var name = '<%= (session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : "" %>';
	  		var c6 = document.getElementById("cu_name");
	  		if(c6) c6.textContent = name;
	  		
	  		console.log('<%= comp_id %>')
			var cn1 = document.getElementById("cocno");
			var cn2 = document.getElementById("cocnp");
			var cn3 = document.getElementById("com");
			var cn4 = document.getElementById("cop");
			var cn5 = document.getElementById("addr");
			
			if (cn1) cn1.textContent = '<%= comp_id %>';
	        if (cn2) cn2.textContent = '<%= comp_per %>';
	        if (cn3) cn3.textContent = '<%= comp_mob %>';
	        if (cn4) cn4.textContent = '<%= comp_prob %>';
	        if (cn5) cn5.textContent = '<%= comp_add %>';
		
		</script>
    </div>
  </body>
</html>