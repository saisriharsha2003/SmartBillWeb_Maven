<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
    <title>View Complaints</title>
</head>
<body>
    <div class="hero">
        <nav>
	          <a href="${pageContext.request.contextPath}/source/Admin/admin_home.jsp"><img class="logo"
	                src="<%=request.getContextPath()%>/assets/logo.png"></a>
	          <ul>
	            <li><a href="${pageContext.request.contextPath}/source/Admin/admin_home.jsp">Home</a></li>
	            <li><a href="${pageContext.request.contextPath}/AdminViewConsumers">View Consumers</a></li>
	            <li><a href="${pageContext.request.contextPath}/source/Admin/Bills/admin_addbill.jsp">Add Bills</a></li>
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
	        	<a href="${pageContext.request.contextPath}/source/Admin/Profile/admin_edit_profile.jsp" class="sub-menu-link">
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
    	<% 
	      		int count = (Integer)session.getAttribute("cons_count");
       			List<HashMap<String, String>> complaintList = (List<HashMap<String, String>>) session.getAttribute("admin_complaints");

	      		if(count>0)
	      		{
	      			if(complaintList != null && complaintList.size() > 0)
	      			{
 		
	      %>
        <div class="container1">
            <div class="title" style="margin-bottom: 20px;">View Complaints</div>
            <div style="display: flex; justify-content: center;">
                <table class="paybill">
                    <thead>
                        <tr>
                            <th>Complaint ID</th>
                            <th>Consumer ID</th>
                            <th>Mobile</th>
                            <th>Contact</th>
                            <th>Problem</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        int currentPage = 1;
                        int recordsPerPage = 4;
                        int totalRecords = complaintList.size();

                        if (totalRecords > 0) {
                            if (request.getParameter("page") != null) {
                                currentPage = Integer.parseInt(request.getParameter("page"));
                            }

                            int start = (currentPage - 1) * recordsPerPage;
                            int end = Math.min(start + recordsPerPage, totalRecords);
                            List<HashMap<String, String>> paginatedComplaints = complaintList.subList(start, end);

                            for (HashMap<String, String> complaint : paginatedComplaints) {
                                String status = complaint.get("status");
                                String statusColor = status.equalsIgnoreCase("Solved") ? "green" : "red";
                        %>
                        <form action="<%= request.getContextPath() %>/UpdateComplaint" method="post">
                            <tr>
                                <td><%= complaint.get("comp_no") %></td>
                                <td><%= complaint.get("cons_no") %></td>
                                <td><%= complaint.get("mobile") %></td>
                                <td><%= complaint.get("contact_per") %></td>
                                <td><%= complaint.get("problem") %></td>
                                <td style="color:<%= statusColor %>; font-weight: 700"><%= status %></td>
                                <td>
                                    <div class="button">
                                        <input type="submit" class="upcmp" id="adstcmp" value="Update" style="cursor: pointer">
                                    </div>
                                </td>
                                <input type="hidden" id="incomp" name="up_comp" value="<%= complaint.get("comp_no") %>">
                            </tr>
                        </form>
                        <% 
                            }
                        } 
                        %>
                    </tbody>
                </table>
            </div>

            <% 
            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            if (totalPages > 1) { 
            %>
            <div class="pagination">
                <% if (currentPage > 1) { %>
                    <a href="${pageContext.request.contextPath}/source/Admin/Complaints/admin_view_complaints.jsp?page=<%= currentPage - 1 %>">&laquo; Previous</a>
                <% } %>
                <% for (int i = 1; i <= totalPages; i++) {
                    if (i == currentPage) { %>
                    <span><%= i %></span>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/source/Admin/Complaints/admin_view_complaints.jsp?page=<%= i %>"><%= i %></a>
                <% }
                } 
                if (currentPage < totalPages) { %>
                    <a href="${pageContext.request.contextPath}/source/Admin/Complaints/admin_view_complaints.jsp?page=<%= currentPage + 1 %>">Next &raquo;</a>
                <% } %>
            </div>
            <% } %>

        </div>
        <% 
            } else { // No complaints found
        %>
        <div class="container" style="width: 800px;">
        	<div class="flexcenter" style="text-align: center; align-items: center; gap: 20px;">
                <img src="<%=request.getContextPath()%>/assets/smile.webp" alt="No Complaints" style="height: 70px; width: 70px; border-radius: 100%">
                <p class="title1" style="font-size: 30px;">No Complaints Found</p>
            </div>
            <div class="flexcenter" style="text-align: center;">
            	<p style="font-size: 20px; font-weight: 600; margin-top: 20px;">Currently, no complaints found to resolve. Please try again later.</p>
            </div>
            
            <div class="flexcenter">
	           	<div class="sbutton" style="width: 100%; padding: 20px; ">
					<button id="aButton" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/source/Admin/admin_home.jsp'">Back to Home</button>
				</div>		
            </div>
            
        </div>
        <% } 
        } else { // No consumers found
        %>
        <div class="container" style="width: 800px;">
			<div class="flexcenter" style="text-align: center; align-items: center; gap: 20px;">
				<img src="<%=request.getContextPath()%>/assets/smile.webp" style="height: 70px; width: 70px; border-radius: 100%">
				<p class="title1" style="font-size: 30px;">No Consumers Found</p>
			</div>
			<div class="flexcenter" style="text-align: center; margin-top: 20px;">
				<p style="font-size: 20px; font-weight: 600;">No consumers are currently registered with SmartBill. Please try again later.</p>
			</div>
			<div class="flexcenter">
				<div class="sbutton" style="width: 100%; padding: 20px;">
					<button id="aButton" style="cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/source/Admin/admin_home.jsp'">Back to Home</button>
				</div>
			</div>
		</div>
        <% } %>
    </div>
</body>
</html>
