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
		<div class="container">
          <div class="title" style="margin-bottom: 20px;">Payment Screen</div>
          <div style="display: flex; align-items: center;">
          <img src="<%=request.getContextPath()%>/assets/visa-img.jpg" style="height: 10%; width: 50%;">
          <div>
          <% String pmt = (String)session.getAttribute("billdet_pamount"); %>
          <p><span style="font-size: 20px; font-weight: 700;">Payment Amount:</span> <span id = "ps_pamt" style="font-size: 20px; font-weight: 700; color: red;"></span></p>
          <%
	          	String pmd = (String)session.getAttribute("billdet_paymode"); 
	          	if(pmd.equalsIgnoreCase("Debit Card"))
	          	{
          %>
          <p><span style="font-size: 20px; font-weight: 700;">Payment Mode:</span> <span id = "ps_pamt" style="font-size: 20px; font-weight: 700; color: red;">Debit Card</span></p>
          <% 
          		} 
	          	else { 
	      %>
          <p><span style="font-size: 20px; font-weight: 700;">Payment Mode:</span> <span id = "ps_pamt" style="font-size: 20px; font-weight: 700; color: red;"> Credit Card</span></p>
          <%
          		} 
          %>
          </div>
          </div>
          <form action="<%= request.getContextPath() %>/PaymentSuccess" method="post" >
            
          
            <div class="user-details">
              <div class="input-box" style="width:100%">
              <span class="details" >Card Number</span>
	              <div style="display: flex; align-items: center;">
	              	<input type="text" 
	                  placeholder="Enter your Card Number" required
	                  oninvalid="this.setCustomValidity('Please Enter Card Number')"
	                  onchange="this.setCustomValidity('')">
	                 <img src="<%=request.getContextPath()%>/assets/visa.jpg" style="width: 60px; height: 38px; border-radius: 3px;">
	              </div>
              </div>
              <div style="display: flex; align-items: center; width: 100%;">
	              <div class="input-box" style="padding-right:30px; width: 100%;">
	                <span class="details">Expiration Date</span>
	                <input type="text" placeholder="Enter Expiration Date"
	                  required
	                  oninvalid="this.setCustomValidity('Please Enter Expiration Date')"
	                  onchange="this.setCustomValidity('')">
	              </div>
	              
	              
	              <div class="input-box" style="padding-right:30px; width: 100%;">
	                <span class="details">Year</span>
	                <input type="text" id='phno'
	                  placeholder="Enter Year" required
	                  oninvalid="this.setCustomValidity('Please Enter Year')"
	                  onchange="this.setCustomValidity('')">
	              </div>
	              <div class="input-box" style="width: 100%; ">
	
	                <span class="details">CVV/ CVC</span>
	                <input type="text" 
	                  placeholder="CVV/ CVC" required
	                  oninvalid="this.setCustomValidity('Please Enter CVV/ CVC')"
	                  onchange="this.setCustomValidity('')">
	              </div>
              </div>
             <div class="input-box" style="width: 100%;">

                <span class="details">Card Holder Name</span>
                <input type="text"
                  placeholder="Enter Card Holder Name" required
                  oninvalid="this.setCustomValidity('Please Enter Card Holder Name')"
                  onchange="this.setCustomValidity('')">
              </div>
            
            </div>
            
            <div style="display: flex; justify-content:center; margin-top: 10px;">
	       		<div class="sbutton" style="width:50%; padding-right:10px;">
	             		<button id="aButton" style="cursor: pointer" onclick="window.location.href='bill_details.jsp'">Back to BillDetails</button>
	             </div>
	        	<div class="sbutton" style="width:50%;">
	             		<button type="submit" id="aButton" class="sbutton" style="cursor: pointer" >Make Payment</button>
	            </div>	
            </div>
            
          </form>
        </div>
	</div>
</body>
<script src="<%=request.getContextPath()%>/scripts/script.js"></script>
<script>
	var n1 = document.getElementById("ps_pamt");
	n1.textContent = <%= pmt %>;
	if(document.getElementById("cu_name"))
	{
		var name = '<%=(session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : ""%>';
		var c1 = document.getElementById("cu_name");
		if (c1)
			c1.textContent = name;
	}
</script>

</html>