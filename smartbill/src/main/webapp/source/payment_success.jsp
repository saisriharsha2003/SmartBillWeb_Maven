<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
<title>View Bills</title>

</head>
<body>

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
		<div class="container" style="max-width: 1000px">
		         <div class='title' style="font-size: 25px; color: #70e300" >Payment Done Successfully!</div>
		         <div style="display: flex; justify-content: left; align-items: center;">
		        	<img src="<%=request.getContextPath()%>/assets/paid.jpg" style="width: 50px; height: 50px;">
		        	<p style="font-size: 20px; font-weight: 550; padding-left: 10px;color:  #CCBA78;">Transaction Details of Paid Bill</p>
	        	</div>
	        	<div style="padding-left: 60px; padding-bottom: 20px;"><hr style="border: 1px solid black; width: 40%; "></div>
	        	<table class="paybill">
	        		<thead >
	        			<tr>
	        				<th style="margin:10px;" class="ps">Consumer Number</th>        			
	        				<th style="margin:10px;" class="ps">Transaction Number</th>
	        				<th style="margin:10px;" class="ps">Bill Number</th>
	        				<th style="margin:10px;" class="ps">Paid Amount</th>	        				
	        				<th style="margin:10px;" class="ps">Payment Mode</th>
	        				<th style="margin:10px;" class="ps">Transaction Date</th>
	        			</tr>
	        		</thead>
	        		<tbody>
	        			<tr>
	        				<td class="ps" id="success_6"></td>
	        				<td class="ps" id="success_1"></td>
	        				<td class="ps" id="success_2"></td>
	        				<td class="ps" id="success_3"></td>
	        				<td class="ps" id="success_4"></td>
	        				<td class="ps" id="success_5"></td>
	        			</tr>
	        		</tbody>
	        	</table>
	        	<div style="display: flex; justify-content:center; margin-top: 10px;">
	       		<div class="sbutton" style="width:50%; padding-right:10px;">
	             	<button type="submit" id="aButton" style="cursor: pointer" onclick = "window.location.href = 'home.jsp'" >Back to Home</button>
	             </div>
	        	<div class="sbutton" style="width:50%;">
	        		<form action="<%=request.getContextPath()%>/ReceiptController" method = "post">
	             		<button type="submit" id="aButton" style="cursor: pointer" onclick="${pageContext.request.contextPath}/ReceiptController">View Receipt</button>
	            	</form>
	            </div>	
            </div>
	        </div>
        </div>	      
	</body>
	<script src="<%=request.getContextPath()%>/scripts/script.js"></script>
	<%
		HashMap<String, String> mp1= (HashMap<String, String>) session.getAttribute("payment_details");
		String c1 = mp1.get("payment_id");
		String c2 = mp1.get("payment_billid");
		String c3 = mp1.get("payment_paidamt");
		String c4 = mp1.get("payment_mode");
		String c5 = mp1.get("payment_date");	
		String cid = String.valueOf((long) session.getAttribute("consumer_lgid"));
	%>
	<script>

		var n1 = document.getElementById("success_1");
		var n2 = document.getElementById("success_2");
		var n3 = document.getElementById("success_3");
		var n4 = document.getElementById("success_4");
		var n5 = document.getElementById("success_5");
		var n6 = document.getElementById("success_6");

		
		n1.textContent = '<%= c1 %>';
		n2.textContent = '<%= c2 %>';
		n3.textContent = '<%= c3 %>';
		n4.textContent = '<%= c4 %>';
		n5.textContent = '<%= c5 %>';	
		n6.textContent = '<%= cid %>';	

		
		if(document.getElementById("cu_name"))
		{
			var name = '<%=(session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : ""%>';
			var c1 = document.getElementById("cu_name");
			if (c1)
				c1.textContent = name;
		}

	</script>

</html>