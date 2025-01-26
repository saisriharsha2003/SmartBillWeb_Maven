<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
    <title>View Bills</title>
</head>
<body>
    <div class="hero">
        <nav>
            <a href="${pageContext.request.contextPath}/source/home.jsp">
                <img class="logo" src="${pageContext.request.contextPath}/assets/logo.png">
            </a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/source/home.jsp">Home</a></li>
                <li class="dropdown"><a href="#" class="dropbtn">Bill</a>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/PayBills">Pay Bills</a>
                        <a href="${pageContext.request.contextPath}/ViewBills">View Bills</a>
                        <a href="${pageContext.request.contextPath}/source/search_bill.jsp">Search Bill</a>
                    </div>
                </li>
                <li class="dropdown"><a href="#" class="dropbtn">Complaint</a>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/source/register_complaint.jsp">Register Complaint</a>
                        <a href="${pageContext.request.contextPath}/source/search_complaint.jsp">Search Complaint</a>
                        <a href="${pageContext.request.contextPath}/ComplaintStatus">Complaint Status</a>
                    </div>
                </li>
                <li class="dropdown"><a href="#" class="dropbtn">Payments</a>
                    <div class="dropdown-content">
                        <a href="${pageContext.request.contextPath}/PaymentHistory">Payments History</a>
                        <a href="${pageContext.request.contextPath}/source/search_payment.jsp">Search Payment Details</a>
                    </div>
                </li>
            </ul>
        </nav>
    </div>

    <div class="signup">
        <%
            List<HashMap<String, String>> billList = (List<HashMap<String, String>>) session.getAttribute("view_all_bills");
            if (billList != null && !billList.isEmpty()) {
        %>
        <div class="container1">
            <div class="title" style="margin-bottom: 20px;">View All Bills</div>
            <div style="display: flex; justify-content: center;">
                <table class="paybill" style="width: 90%">
                    <thead>
                        <tr>
                            <th>Bill ID</th>
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
                            int totalRecords = billList.size();

                            if (request.getParameter("page") != null) {
                                currentPage = Integer.parseInt(request.getParameter("page"));
                            }

                            int start = (currentPage - 1) * recordsPerPage;
                            int end = Math.min(start + recordsPerPage, totalRecords);
                            List<HashMap<String, String>> paginatedBills = billList.subList(start, end);

                            for (HashMap<String, String> bill : paginatedBills) {
                                String status = bill.get("status") != null ? bill.get("status").toLowerCase() : "unknown";
                                String statusClass;
                                if ("unpaid".equals(status)) {
                                    statusClass = "status-unpaid";
                                } else if ("partially paid".equals(status)) {
                                    statusClass = "status-partially-paid";
                                } else if ("overdue".equals(status)) {
                                    statusClass = "status-overdue";
                                } else {
                                    statusClass = "status-paid";
                                }
                        %>
                        <tr>
                            <td><%= bill.get("bill_id") %></td>
                            <td><%= bill.get("due_amt") %></td>
                            <td><%= bill.get("pay_amt") %></td>
                            <td><%= bill.get("date") %></td>
                            <td><%= bill.get("penalty") %></td>
                            <td class="<%= statusClass %>"><%= bill.get("status") %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <%
                int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            %>
            <div class="pagination" style="margin-right: 50px;">
                <% if (currentPage > 1) { %>
                    <a href="view_bills.jsp?page=<%= currentPage - 1 %>">&laquo; Previous</a>
                <% }
                for (int i = 1; i <= totalPages; i++) {
                    if (i == currentPage) {
                %>
                    <span><%= i %></span>
                <% } else { %>
                    <a href="view_bills.jsp?page=<%= i %>"><%= i %></a>
                <% }
                }
                if (currentPage < totalPages) { %>
                    <a href="view_bills.jsp?page=<%= currentPage + 1 %>">Next &raquo;</a>
                <% } %>
            </div>
        </div>
        <% } else { %>
        <div class="container">
            <div class="flexcenter" style="text-align: center; align-items: center; gap: 20px;">
                <img src="<%=request.getContextPath()%>/assets/smile.webp" alt="No Bills" style="height: 70px; width: 70px; border-radius: 100%">
                <p class="title1" style="font-size: 30px;">No Bills Found!</p>
            </div>
            <div class="flexcenter">
                <p style="font-size: 20px; font-weight: 600; margin-top: 20px;">Currently, no bills found. Please check back later.</p>
            </div>
            <div class="flexcenter">
            	<div class="sbutton" style="width: 100%; padding: 20px; ">
					<button id="aButton" style="cursor: pointer; " onclick="window.location.href='home.jsp'">Back to Home</button>
				</div>
            </div>
        </div>
        <% } %>
    </div>

    <script src="<%=request.getContextPath()%>/scripts/script.js"></script>
    <script>
        if (document.getElementById("cu_name")) {
            var name = '<%=(session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : ""%>';
            var c1 = document.getElementById("cu_name");
            if (c1)
                c1.textContent = name;
        }
    </script>
</body>
</html>
