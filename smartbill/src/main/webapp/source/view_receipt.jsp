<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.js"></script>
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
		<div class="container" >
	        <div id="receipt">
		         <div class='title' style="font-size: 30px">View Transaction Details</div>
	        	<table class="paybill" id="receipt table" style="width: 100%;" >
	        		<thead >
	        			<tr >
	        			<th colspan = 2>Online Payment - Transaction Details</th>
	        				
	        			</tr>
	        		</thead>
	        		<tbody>
	        			<tr>
	        				<td style="text-align: left;">Receipt Number</td>
	        				<td id="success_77"></td>	        				
	        			</tr>
	        			<tr>
	        				<td style="text-align: left;">Consumer Number</td>
	        				<td id="success_66"></td>	        				
	        			</tr>
	        			<tr>
	        				<td style="text-align: left;">Transaction Number</td>
	        				<td id ="success_11"></td>	        				
	        			</tr>
	        			<tr>
	        				<td style="text-align: left;">Bill Number</td>
	        				<td id="success_22"></td>	        				
	        			</tr>
	        			<tr>
	        				<td style="text-align: left;">Paid Amount</td>
	        				<td id="success_33"></td>	        					        				
	        			</tr>
	        			<tr>
	        				<td style="text-align: left;">Payment Mode</td>
	        				<td id="success_44"></td>        					        				
	        			</tr>
	        			<tr>
	        				<td style="text-align: left;">Transaction Date</td>
	        				<td id="success_55"></td>        				        				
	        			</tr>
	        			
	        			
	        		</tbody>
	        	</table>
	        	</div>
	        	<div style="display: flex; justify-content:center; margin-top: 10px;">
		       		<div class="sbutton" style="width:50%; padding-right:10px;">
		             	<button id="aButton" style="cursor: pointer" onclick="window.location.href='home.jsp'">Back to Home</button>
		             </div>
		        	<div class="sbutton" style="width:50%;">
	              		<button type="submit" id="download-receipt" style="cursor: pointer; " >Download Receipt</button>
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
		String rec_no = String.valueOf((long)session.getAttribute("receipt_number"));
	%>
	
	<script>
    // Get the elements by their IDs
    var n11 = document.getElementById("success_11");
    var n22 = document.getElementById("success_22");
    var n33 = document.getElementById("success_33");
    var n44 = document.getElementById("success_44");
    var n55 = document.getElementById("success_55");
    var n66 = document.getElementById("success_66");
    var n77 = document.getElementById("success_77");

    n11.textContent = '<%= c1 %>';
    n22.textContent = '<%= c2 %>';
    n33.textContent = '<%= c3 %>';
    n44.textContent = '<%= c4 %>';
    n55.textContent = '<%= c5 %>';
    n66.textContent = '<%= cid %>';
    n77.textContent = '<%= rec_no %>'; 
    
    if(sessionStorage.getItem("recp_no")==null)
    {
		sessionStorage.setItem("recp_no", '<%= rec_no %>');
	}
    else
    {
    	sessionStorage.removeItem("recp_no");
    	sessionStorage.setItem("recp_no", '<%= rec_no %>');
	}

    if (document.getElementById("cu_name")) {
        var name = '<%= (session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : "" %>';
        var cuNameElement = document.getElementById("cu_name");
        if (cuNameElement) {
            cuNameElement.textContent = name;
        }
    }
</script>
<script src="<%=request.getContextPath()%>/scripts/script.js"></script>


</html>