<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
	    <title>Admin Home</title>
	   
	</head>
	<body>
	    <div class="hero">
	      <nav>
	          <a href="<%=request.getContextPath()%>/admin_home.jsp"><img class="logo"
	                src="<%=request.getContextPath()%>/assets/logo.png"></a>
	          <ul>
	            <li><a href="admin_home.jsp">Home</a></li>
	            <li><a href="${pageContext.request.contextPath}/AdminViewConsumers">View Consumers</a></li>
				<li><a href="${pageContext.request.contextPath}/source/admin_addbill.jsp"
>Add Bills</a></li>
	            <li><a href="${pageContext.request.contextPath}/AdminViewBills">View Bills</a></li>	            
	            <li><a href="${pageContext.request.contextPath}/AdminViewComplaints">View Complaints</a></li>
	          </ul>
	          <img src="<%=request.getContextPath()%>/assets/user.png" class="user-pic" onclick="toggleMenu()">
	          <div class="sub-menu-wrap" id="subMenu">
	       	<div class="sub-menu">
	        	<div class="user-info">
	        		<img src="<%=request.getContextPath()%>/assets/user.png" style="width: 80px; height: 80px">
	        		<h2 id="acu_name" style="color:#CCBA78;"></h2>
	        	</div>
	        	<hr>
	        	<a href="${pageContext.request.contextPath}/source/admin_edit_profile.jsp" class="sub-menu-link">
	        		<img src="<%=request.getContextPath()%>/assets/edit.png" style="width: 50px; height: 50px">
	        		<p>Edit Profile</p>
	        		<span class="ext">></span>
	        	</a>
	        	<a href="<%=request.getContextPath()%>/LogoutServlet" class="sub-menu-link"> 
	        		<img src="<%=request.getContextPath()%>/assets/logout.png" style="width: 50px; height: 50px">
	        		<p>Logout</p>
	        		<span class="ext">></span>
	        	</a>
	       	</div>
	      	</div>  
	      </nav>
	      
	    </div>
	    <div class="signup">
	     <div class="container" style="background-color: black; opacity: 0.8;">
	     	<p style="font-size: 40px; font-weight: 600; color: #CCBA78; display:flex; justify-content: center; align-items: center">Welcome to <span class="homep" >SmartBill</span></p>
	     </div>
	    </div>
	    <script>
	    let subm = document.getElementById("subMenu");
	    function toggleMenu() {
	    	subm.classList.toggle("open-menu");
	    }
	
	    	var aname = document.getElementById("acu_name");
	    	aname.textContent = "Admin"
	    </script>
	</body>
</html>