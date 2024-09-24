<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
    <title>View All Consumers</title>
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
				if(count>0)
				{
				
		%>
        <div class="container1">
            <div class="title" style="margin-bottom: 20px;">View Consumers</div>
            <div style="display: flex; justify-content: center;">
                <table class="paybill">
                    <thead>
                        <tr>
                            <th>Consumer ID</th>
                            <th>Name</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Username</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        List<HashMap<String, String>> consumersList = (List<HashMap<String, String>>) session.getAttribute("admin_consumers");

                        int currentPage = 1;
                        int recordsPerPage = 5;
                        int totalRecords = 0;

                        if (consumersList != null) {
                            totalRecords = consumersList.size();
                            if (totalRecords > 5) {
                                if (request.getParameter("page") != null) {
                                    currentPage = Integer.parseInt(request.getParameter("page"));
                                }

                                int start = (currentPage - 1) * recordsPerPage;
                                int end = Math.min(start + recordsPerPage, totalRecords);
                                List<HashMap<String, String>> paginatedConsumers = consumersList.subList(start, end);

                                for (HashMap<String, String> consumer : paginatedConsumers) {
                        %>
                        <tr>
                            <td><%= consumer.get("consumer_id") %></td>
                            <td><%= consumer.get("consumer_name") %></td>
                            <td><%= consumer.get("mobile") %></td>
                            <td><%= consumer.get("email") %></td>
                            <td><%= consumer.get("user_name") %></td>
                        </tr>
                        <%
                                }
                            } else {
                                // Display all consumers without pagination
                                for (HashMap<String, String> consumer : consumersList) {
                        %>
                        <tr>
                            <td><%= consumer.get("consumer_id") %></td>
                            <td><%= consumer.get("consumer_name") %></td>
                            <td><%= consumer.get("mobile") %></td>
                            <td><%= consumer.get("email") %></td>
                            <td><%= consumer.get("user_name") %></td>
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
            if (totalRecords > 5) {
                int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            %>
            <div class="pagination">
                <%
                if (currentPage > 1) {
                %>
                    <a href="admin_view_consumers.jsp?page=<%= currentPage - 1 %>">&laquo; Previous</a>
                <%
                }
                for (int i = 1; i <= totalPages; i++) {
                    if (i == currentPage) {
                %>
                    <span><%= i %></span>
                <%
                    } else {
                %>
                    <a href="admin_view_consumers.jsp?page=<%= i %>"><%= i %></a>
                <%
                    }
                }
                if (currentPage < totalPages) {
                %>
                    <a href="admin_view_consumers.jsp?page=<%= currentPage + 1 %>">Next &raquo;</a>
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
