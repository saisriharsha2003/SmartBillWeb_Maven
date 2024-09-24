<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
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
        <nav>
	          <a href="${pageContext.request.contextPath}/source/admin_home.jsp"><img class="logo"
	                src="<%=request.getContextPath()%>/assets/logo.png"></a>
	          <ul>
	            <li><a href="${pageContext.request.contextPath}/source/admin_home.jsp">Home</a></li>
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
        <div class="container">
          <div class='title' style="font-size: 25px; color: #008000">Complaint Updated Successfully!</div>
          <div class='details-cont'>
            <table>
              <tbody>
                <tr>
                  <td><span class='cust'>Complaint Number</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='ucocno'></span></td>
                </tr>
                <tr>
                  <td><span class='cust'> Consumer Number</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='ucons'></span></td>
                </tr>
                <tr>
                  <td><span class='cust'>Contact Person</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='ucocnp'></span></td>
                </tr>
                
                <tr>
                  <td><span class='cust'>Problem</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='ucop'></span></td>
                </tr>
                
                <tr>
                  <td><span class='cust'> Address</span></td>
                  <td><span class='col'>:</span><span class='cust1'
                      id='uaddr'></span></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="sbutton">
            <button type="submit" id="bButton"  style="cursor: pointer;"
              onclick="window.location='admin_home.jsp';">Back to Home</button>
          </div>
        </div>
      </div>
      <script src="<%=request.getContextPath()%>/scripts/script.js"></script>
      <%
	      	HashMap<String, String> mp =(HashMap<String, String>)session.getAttribute("upd_comp_det");
		  	String comp_id = mp.get("comp_no");
		  	String cons_no = mp.get("cons_no");
		  	String comp_per = mp.get("contact_per");
		  	String comp_prob = mp.get("problem");
		  	String comp_add = mp.get("address");

      %>
		<script>
			
			var name = '<%= (session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : "" %>';
	  		var c6 = document.getElementById("cu_name");
	  		if(c6) c6.textContent = name;
	  		
	  		console.log('<%= comp_id %>')
			var cn1 = document.getElementById("ucocno");
	  		var cn2 = document.getElementById("ucons")
			var cn3 = document.getElementById("ucocnp");
			var cn4 = document.getElementById("ucop");
			var cn5 = document.getElementById("uaddr");
			
			if (cn1) cn1.textContent = '<%= comp_id %>';
	        if (cn2) cn2.textContent = '<%= comp_per %>';
	        if (cn3) cn3.textContent = '<%= cons_no %>';
	        if (cn4) cn4.textContent = '<%= comp_prob %>';
	        if (cn5) cn5.textContent = '<%= comp_add %>';
		
		</script>
    </div>
  </body>
</html>