<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
    <title>View All Complaints</title>
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
        
            
            <%
            	List<HashMap<String, String>> complaintsList = (List<HashMap<String, String>>) session.getAttribute("view_all_comp");
            	if(complaintsList.size()!=0)
            	{

            %>
            <div class="container1">
            <div class="title" style="margin-bottom: 20px;">View All Complaints</div>
            <div class="flexcenter">
            <table class="paybill">
                <thead>
                    <tr>
                        <th>Complaint ID</th>
                        <th>Contact Person</th>
                        <th>Mobile</th>
                        <th>Problem</th>
                        <th>Address</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%

                    int currentPage = 1;
                    int recordsPerPage = 5;
                    int totalRecords = 0;

                    if (complaintsList != null) {
                        totalRecords = complaintsList.size();

                        if (totalRecords > recordsPerPage) {
                            // Apply pagination logic only if there are more than 5 records
                            if (request.getParameter("page") != null) {
                                currentPage = Integer.parseInt(request.getParameter("page"));
                            }

                            int start = (currentPage - 1) * recordsPerPage;
                            int end = Math.min(start + recordsPerPage, totalRecords);
                            List<HashMap<String, String>> paginatedComplaints = complaintsList.subList(start, end);

                            for (HashMap<String, String> complaint : paginatedComplaints) {
                                if (complaint.get("status").equalsIgnoreCase("Not Solved")) {
                    %>
                    <tr>
                        <td><%= complaint.get("complaint_id") %></td>
                        <td><%= complaint.get("contact_person") %></td>
                        <td><%= complaint.get("mobile") %></td>
                        <td><%= complaint.get("problem") %></td>
                        <td><%= complaint.get("address") %></td>
                        <td style="color:red; font-weight:500;"><%= complaint.get("status") %></td>
                    </tr>
                    <%
                                } else {
                    %>
                    <tr>
                        <td><%= complaint.get("complaint_id") %></td>
                        <td><%= complaint.get("contact_person") %></td>
                        <td><%= complaint.get("mobile") %></td>
                        <td><%= complaint.get("problem") %></td>
                        <td><%= complaint.get("address") %></td>
                        <td style="color:green; font-weight:500;"><%= complaint.get("status") %></td>
                    </tr>
                    <%
                                }
                            }
                        } else {
                            // If 5 or fewer complaints, display all without pagination
                            for (HashMap<String, String> complaint : complaintsList) {
                                if (complaint.get("status").equalsIgnoreCase("Not Solved")) {
                    %>
                    <tr>
                        <td><%= complaint.get("complaint_id") %></td>
                        <td><%= complaint.get("contact_person") %></td>
                        <td><%= complaint.get("mobile") %></td>
                        <td><%= complaint.get("problem") %></td>
                        <td><%= complaint.get("address") %></td>
                        <td style="color:red; font-weight:500;"><%= complaint.get("status") %></td>
                    </tr>
                    <%
                                } else {
                    %>
                    <tr>
                        <td><%= complaint.get("complaint_id") %></td>
                        <td><%= complaint.get("contact_person") %></td>
                        <td><%= complaint.get("mobile") %></td>
                        <td><%= complaint.get("problem") %></td>
                        <td><%= complaint.get("address") %></td>
                        <td style="color:green; font-weight:500;"><%= complaint.get("status") %></td>
                    </tr>
                    <%
                                }
                            }
                        }
                    }
                    %>
                </tbody>
            </table>
			</div>
            <%
            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            if (totalRecords > recordsPerPage) { // Only show pagination if more than 5 records
            %>
            <div class="pagination">
                <%
                if (currentPage > 1) {
                %>
                    <a href="view_all_complaints.jsp?page=<%= currentPage - 1 %>">&laquo; Previous</a>
                <%
                }
                for (int i = 1; i <= totalPages; i++) {
                    if (i == currentPage) {
                %>
                    <span><%= i %></span>
                <%
                    } else {
                %>
                    <a href="view_all_complaints.jsp?page=<%= i %>"><%= i %></a>
                <%
                    }
                }
                if (currentPage < totalPages) {
                %>
                    <a href="view_all_complaints.jsp?page=<%= currentPage + 1 %>">Next &raquo;</a>
                <%
                }
                %>
            </div>
            </div>
            <%
            }
            	}else{
            %>
            <div class = "container">
            <div class="flexcenter" style="text-align: center; align-items: center; gap: 20px;">
                <img src="<%=request.getContextPath()%>/assets/smile.webp" alt="Delete Emoji" style="height: 70px; width: 70px; border-radius: 100%">
                <p class="title1" style="font-size: 30px;">No Complaints Found!</p>
            </div>
            <div class="flexcenter">
            	<p style="font-size: 20px; font-weight: 600; margin-top: 20px; maring-bottom:10px;">Kindly click below to register a new complaint.</p>
            </div>
            
            <div class="flexcenter">
            	<div class="sbutton" style="width: 100%; padding: 20px; ">
					<button id="aButton" style="cursor: pointer; " onclick="window.location.href='home.jsp'">Back to Home</button>
				</div>
				<div class="sbutton" style="width: 100% ; padding: 20px;">
					<button type="submit" id="aButton" style="cursor: pointer; " onclick="window.location.href='register_complaint.jsp'">Register Complaint</button>
				</div>
            </div>
            <%} %>
            
        </div>

</body>
<script src="<%=request.getContextPath()%>/scripts/script.js"></script>
<script>
    if(document.getElementById("cu_name")) {
        var name = '<%= (session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : "" %>';
        var c1 = document.getElementById("cu_name");
        if (c1) c1.textContent = name;
    }
</script>

</html>
