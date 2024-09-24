<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
    <title>View All Bills</title>
</head>
<body>
    <div class="hero">
        <nav>
            <a href="${pageContext.request.contextPath}/source/admin_home.jsp"><img class="logo" src="<%=request.getContextPath()%>/assets/logo.png"></a>
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
    	<% 
	      		int count = (int)session.getAttribute("cons_count");
        		List<HashMap<String, String>> billList = (List<HashMap<String, String>>) session.getAttribute("admin_bills");

	      		if(count>0)
	      		{
	      			if(billList.size()>0)
	      			{
 		
	      %>
        <div class="container1" style="width: 900px">
            <div class="title" style="margin-bottom: 20px;">View Bills</div>
            <div style="display: flex; justify-content: center;">
                <table class="paybill">
                    <thead>
                        <tr>
                            <th>Bill ID</th>
                            <th>Meter Number</th>
                            <th>Due Amount</th>
                            <th>Bill Amount</th>
                            <th>Due Date</th>
                            <th>Penalty</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                        int currentPage = 1;
                        int recordsPerPage = 5;
                        int totalRecords = 0;

                        if (billList != null) {
                            totalRecords = billList.size();
                            if(totalRecords > 5) {
                                if (request.getParameter("page") != null) {
                                    currentPage = Integer.parseInt(request.getParameter("page"));
                                }

                                int start = (currentPage - 1) * recordsPerPage;
                                int end = Math.min(start + recordsPerPage, totalRecords);
                                List<HashMap<String, String>> paginatedBills = billList.subList(start, end);

                                for (HashMap<String, String> bill : paginatedBills) {
                                    String status = bill.get("status");
                                    String statusClass;

                                    if (status.equalsIgnoreCase("unpaid")) {
                                        statusClass = "status-unpaid";
                                    } else if (status.equalsIgnoreCase("partially paid")) {
                                        statusClass = "status-partially-paid";
                                    } else if (status.equalsIgnoreCase("overdue")) {
                                        statusClass = "status-overdue";
                                    } else {
                                        statusClass = "status-paid";
                                    }
                        %>
                        <tr>
                            <td><%= bill.get("bill_id") %></td>
                            <td><%= bill.get("meter_number") %></td>
                            <td><%= bill.get("due_amount") %></td>
                            <td><%= bill.get("pay_amount") %></td>
                            <td><%= bill.get("due_date") %></td>
                            <td><%= bill.get("penalty") %></td>
                            <td class="<%= statusClass %>"><%= bill.get("status") %></td>
                        </tr>
                        <%
                                }
                            } else {
                                for (HashMap<String, String> bill : billList) {
                                    String status = bill.get("status");
                                    String statusClass;

                                    if (status.equalsIgnoreCase("unpaid")) {
                                        statusClass = "status-unpaid";
                                    } else if (status.equalsIgnoreCase("partially paid")) {
                                        statusClass = "status-partially-paid";
                                    } else if (status.equalsIgnoreCase("overdue")) {
                                        statusClass = "status-overdue";
                                    } else {
                                        statusClass = "status-paid";
                                    }
                        %>
                        <tr>
                            <td><%= bill.get("bill_id") %></td>
                            <td><%= bill.get("meter_number") %></td>
                            <td><%= bill.get("due_amount") %></td>
                            <td><%= bill.get("pay_amount") %></td>
                            <td><%= bill.get("due_date") %></td>
                            <td><%= bill.get("penalty") %></td>
                            <td class="<%= statusClass %>"><%= bill.get("status") %></td>
                        </tr>
                        <%
                                }
                            }
                        }
                        %>
                    </tbody>
                </table>
            </div>

            <%
            if(totalRecords > 5) {
                int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            %>
            <div style="margin-right: 30px;" class="pagination">
                <%
                if (currentPage > 1) {
                %>
                    <a href="admin_view_bills.jsp?page=<%= currentPage - 1 %>">&laquo; Previous</a>
                <%
                }
                for (int i = 1; i <= totalPages; i++) {
                    if (i == currentPage) {
                %>
                    <span><%= i %></span>
                <%
                    } else {
                %>
                    <a href="admin_view_bills.jsp?page=<%= i %>"><%= i %></a>
                <%
                    }
                }
                if (currentPage < totalPages) {
                %>
                    <a href="admin_view_bills.jsp?page=<%= currentPage + 1 %>">Next &raquo;</a>
                <%
                }
                %>
            </div>
            <%
            }
            %>
        </div>
        <% } else { %>
        <div class="container" style="width: 800px;">
        	<div class="flexcenter" style="text-align: center; align-items: center; gap: 20px;">
                <img src="<%=request.getContextPath()%>/assets/smile.webp" alt="Delete Emoji" style="height: 70px; width: 70px; border-radius: 100%">
                <p class="title1" style="font-size: 30px;">No Bills Found</p>
            </div>
            <div class="flexcenter">
            	<p style="font-size: 20px; font-weight: 600; margin-top: 20px;">Current no bills found. Kindly click below to add bills.</p>
            </div>
            
            <div class="flexcenter">
            	<div class="sbutton" style="width: 100%; padding: 20px; ">
					<button id="aButton" style="cursor: pointer; " onclick="window.location.href='home.jsp'">Back to Home</button>
				</div>
				<div class="sbutton" style="width: 100% ; padding: 20px;">
					<button type="submit" id="aButton" style="cursor: pointer; " onclick="window.location.href='admin_addbill.jsp'">Add Bill</button>
				</div>
            </div>
            
        </div>
        <%} } else { %>
	        <div class="container" style="width: 800px;">
				<div class="flexcenter"
					style="text-align: center; align-items: center; gap: 20px;">
					<img src="<%=request.getContextPath()%>/assets/smile.webp" style="height: 70px; width: 70px; border-radius: 100%">
					<p class="title1" style="font-size: 30px;">No Consumers Found</p>
				</div>
				<div class="flexcenter" style="text-align: center; margin-top:20px;">
					<p style="font-size: 20px; font-weight: 600; color: black;">Currently no consumers registered to SmartBill. Kindly comeback later.</p>
				</div>
				<div class="flexcenter">
					<div class="sbutton" style="width: 100%; padding: 20px;">
						<button id="aButton" style="cursor: pointer; " onclick="window.location.href='admin_home.jsp'">Back to Home</button>
					</div>
				</div>
			
			</div>
		<%} %>
    </div>

    <script src="<%=request.getContextPath()%>/scripts/script.js"></script>
    <script>
        var name = '<%= (session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : "" %>';
        var c1 = document.getElementById("acu_name");

        if (c1) c1.textContent = name;
    </script>
</body>
</html>
