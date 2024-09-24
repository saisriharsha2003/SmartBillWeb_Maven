<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.* "%>
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
<link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png"
	type="image/icon type">
<title>Edit Profile</title>

</head>
<body>

	<div class="hero">
		<nav> <a href="<%=request.getContextPath()%>/admin_home.jsp"><img
			class="logo" src="<%=request.getContextPath()%>/assets/logo.png"></a>
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/source/admin_home.jsp">Home</a></li>
			<li><a
				href="${pageContext.request.contextPath}/AdminViewConsumers">View
					Consumers</a></li>
			<li><a
				href="${pageContext.request.contextPath}/source/admin_addbill.jsp">Add
					Bills</a></li>

			<li><a href="${pageContext.request.contextPath}/AdminViewBills">View
					Bills</a></li>
			<li><a
				href="${pageContext.request.contextPath}/AdminViewComplaints">View
					Complaints</a></li>
		</ul>
		<img src="<%=request.getContextPath()%>/assets/user.png"
			class="user-pic" onclick="toggleMenu()">
		<div class="sub-menu-wrap" id="subMenu">
			<div class="sub-menu">
				<div class="user-info">
					<img src="<%=request.getContextPath()%>/assets/user.png"
						style="width: 80px; height: 80px">
					<h2 id="acu_name" style="color: #CCBA78;"></h2>
				</div>
				<hr>
				<a href="${pageContext.request.contextPath}/source/admin_edit_profile.jsp" class="sub-menu-link"> <img
					src="<%=request.getContextPath()%>/assets/edit.png"
					style="width: 50px; height: 50px">
					<p>Edit Profile</p> <span class="ext">></span>
				</a> <a href="<%=request.getContextPath()%>/LogoutServlet"
					class="sub-menu-link"> <img
					src="<%=request.getContextPath()%>/assets/logout.png"
					style="width: 50px; height: 50px">
					<p>Logout</p> <span class="ext">></span>
				</a>
			</div>
		</div>
	</nav>
	</div>
	<div class="signup">
		<div class="container">
			<div class="title" style="margin-bottom: 20px;">Edit Profile</div>
			<form name='myform'
				action="<%=request.getContextPath()%>/EditProfileAdmin" method="post">
				<div class="user-details">

					<div class="input-box">
						<span class="details">Username</span> <input type="text"
							name="edit-aname" id='edit-name' readonly>
					</div>
					
					<div class="input-box">
						<span class="details">Password</span> <input type="password"
							id="edit-password" name="edit-apassword"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
							onkeyup='edit_check();'>
					</div>
					<div class="input-box">
						<span class="details">Confirm Password</span> <input
							type="password" id="edit-cpassword" name="edit-acpassword"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
							onkeyup='edit_check();'> <span class="edit-message"
							id='edit-message'></span>
					</div>
					
				</div>
				<div style="display: flex; justify-content: center;">
					<div class="sbutton" style="width: 50%; padding-right: 10px;">
						<button type="button" style="cursor: pointer; text-align: center"
							onclick="window.location='admin_home.jsp'">Back to Home</button>
					</div>
					<div class="sbutton" style="width: 50%;">
						<button type="submit" style="cursor: pointer;">Update
							Profile</button>
					</div>
				</div>

			</form>
		</div>

	</div>
</body>
<script src="<%=request.getContextPath()%>/scripts/script.js"></script>
<%
	HashMap<String, String> mp = (HashMap<String, String>) session.getAttribute("admin_details");
	String pwd = mp.get("password");
	String uname = mp.get("username");
	System.out.println(uname);
%>
<script>
	var name = ' <%=(session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : ""%> ' ;
	var c1 = document.getElementById("cu_name");
	if (c1) c1.textContent = name;
	
	var c = document.getElementById("edit-name");
    var c2 = document.getElementById("edit-password");
    var c3 = document.getElementById("edit-cpassword");

    if(c) c.value = '<%= uname%>'
	if(c2) c2.value = '<%= pwd %>';
    if(c3) c3.value = '<%= pwd %>';
   	
</script>
</html>