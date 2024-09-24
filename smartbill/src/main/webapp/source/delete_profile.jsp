<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
    <title>Delete Account</title>
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
        <div class="container" style="width: 800px;">
        	<div class="flexcenter" style="text-align: center; align-items: center; gap: 20px;">
                <img src="<%=request.getContextPath()%>/assets/sure.png" alt="Delete Emoji" style="height: 70px; width: 80px; border-radius: 100%">
                <p class="title1" style="font-size: 30px;">Account Deletion</p>
            </div>
            <div class="flexcenter">
            	<p style="font-size: 20px; font-weight: 600;">Are you sure you want to delete the account?</p>
            </div>
            <form action="<%=request.getContextPath()%>/DeleteAccount" method = "post">
	            <div class="flexcenter">
	            	<div class="nodelete-button" style="width: 100%; padding: 20px; ">
						<button id="aButton" style="cursor: pointer; background-color: green;" onclick="window.location.href='home.jsp'">Cancel</button>
					</div>
					<div class="delete-button" style="width: 100% ; padding: 20px;">
						<button type="submit" id="aButton" style="cursor: pointer; ">Proceed</button>
					</div>
	            </div>
            </form>
        </div>
        <script type="text/javascript" src = "${pageContext.request.contextPath}/scripts/script.js"></script>
        <script>
        if(document.getElementById("cu_name")) {
            var name = '<%=(session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : ""%>';
            var c1 = document.getElementById("cu_name");
            if (c1)
                c1.textContent = name;
        }
        </script>
    </div>