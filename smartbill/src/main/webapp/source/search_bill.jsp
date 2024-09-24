<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Search Bill</title>

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
		<div class="container">
			<div class="title" style="margin-bottom: 20px;">Search
				Bill</div>
			<form class="search_bill_form" action="<%=request.getContextPath()%>/SearchBills" method = "post">
				<span class="details" style="font-weight: 600">Bill Number</span>
				<div class="user-details">

					<div class="input-box" style="width: 100%">
						<input type="text" class="searchi" name="search_billid"
						    placeholder="Enter your Bill ID" required
						    value="<%= request.getAttribute("er_bill_id") != null ? request.getAttribute("er_bill_id") : "" %>"
						    oninput="validateBillId(this)"
						    pattern="\d{7}" maxlength="7"
						    oninvalid="this.setCustomValidity('Please Enter a Valid Integer Bill ID')"
						    onchange="this.setCustomValidity('')">

						<button class="searchb">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
				<div class="sbutton">
					<button type="submit" id="aButton" style="cursor: pointer">Get Bill Status</button>
					<span class="lmessage1" id='llogin_message'><%= request.getAttribute("error_msg") != null ? request.getAttribute("error_msg") : "" %></span>
					
				</div>
			</form>
			
		</div>
		<script src="<%=request.getContextPath()%>/scripts/script.js"></script>
		<script>
	    function validateBillId(input) {
	        input.setCustomValidity('');
	        
	        var value = input.value.trim();
	        var isValid = /^\d{7}$/.test(value);
	        
	        if (!isValid) {
	            input.setCustomValidity('Above mentioned bill id is invalid.');
	        }
	    }
	    
	    document.querySelector('form').addEventListener('submit', function(event) {
	        var billIdInput = document.querySelector('input[name="search_billid"]');
	        validateBillId(billIdInput);
	        if (billIdInput.validationMessage) {
	            event.preventDefault(); 
	        }
	    });

		if(document.getElementById("cu_name"))
		{
			var name = '<%=(session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : ""%>';
			var c1 = document.getElementById("cu_name");
			if (c1)
				c1.textContent = name;
		}
		</script>
	</div>
</body>
</html>