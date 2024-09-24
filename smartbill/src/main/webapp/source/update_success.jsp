<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
<title>Updated Profile</title>

</head>
<body>
	<div>
		<div class="hero">
			<nav> <a href="${pageContext.request.contextPath}/source/home.jsp"><img class="logo"
			src="${pageContext.request.contextPath}/assets/logo.png"></a>
		<ul>
			<li><a href="home.jsp">Home</a></li>

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
				<div class='title' style="font-size: 25px; color: #008000">Thank
					You for Registering to SmartBill</div>
				<div class='details-cont'>
					<table>
						<tbody>
							<tr>
								<td><span class='cust'>Your updated Name</span></td>
								<td><span class='col'>:</span><span class='cust1'
									id='up_name'></span></td>
							</tr>
							<tr>
								<td><span class='cust'> Your updated Email</span></td>
								<td><span class='col'>:</span><span class='cust1'
									id='up_email'></span></td>
							</tr>
							<tr>
								<td><span class='cust'>Your updated Mobile</span></td>
								<td><span class='col'>:</span><span class='cust1'
									id='up_mobile'></span></td>
							</tr>
							<tr>
								<td><span class='cust'>Your updated Username</span></td>
								<td><span class='col'>:</span><span class='cust1'
									id='up_uname'></span></td>
							</tr>


						</tbody>
					</table>
				</div>

				<div class="sbutton" style="width: 100%;">
					<button type="submit" id="bButton"
						style="cursor: pointer" onclick="window.location='home.jsp';">Back to Home</button>
				</div>


			</div>
		</div>
		<script src="<%=request.getContextPath()%>/scripts/script.js"></script>
		
	</div>
	<%
		HashMap<String, String> m1 = (HashMap<String, String>)session.getAttribute("updated_user_details");
		String p1 = m1.get("up-cname");
		String p2 = m1.get("up-email");
		String p3 = m1.get("up-mob");
		String p4 = m1.get("up-uname");
	%>
	<script type="text/javascript">
	if(document.getElementById("cu_name"))
	{
		var name = '<%=(session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : ""%>';
		var c1 = document.getElementById("cu_name");
		if (c1)
			c1.textContent = name;
	}
        var cn1 = document.getElementById("up_name");
        var cn2 = document.getElementById("up_email");
        var cn3 = document.getElementById("up_mobile");
        var cn4 = document.getElementById("up_uname");

		if (cn1) cn1.textContent = '<%= p1 %>';
		if (cn2) cn2.textContent = '<%= p2 %>';
		if (cn3) cn3.textContent = '<%= p3 %>';
		if (cn4) cn4.textContent = '<%= p4 %>';
	</script>
</body>
</html>