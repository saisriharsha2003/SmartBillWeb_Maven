<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
<title>Search Complaint</title>
</head>
<body>
    <div class="hero">
        <nav> 
            <a href="${pageContext.request.contextPath}/source/home.jsp"><img class="logo" src="${pageContext.request.contextPath}/assets/logo.png"></a>
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
        <div class="container">
            <div class="title" style="margin-bottom: 20px;">Search Complaint</div>
            <form class="complaint_status_form" action="<%=request.getContextPath()%>/SearchComplaint" method="post">
                <span class="details" style="font-weight: 600">Complaint Number</span>
                <div class="user-details">
                    <div class="input-box" style="width: 100%">
                        <input type="text" class="searchi" name="search_compid"
                            placeholder="Enter your Complaint Number" required
                            value="<%= request.getAttribute("er_comp_id") != null ? request.getAttribute("er_comp_id") : "" %>"
                            oninput="validateComplaintId(this)"
                            pattern="\d{8}" maxlength="8"
                            oninvalid="this.setCustomValidity('Please Enter a Valid Complaint Number')"
                            onchange="this.setCustomValidity('')">
                        <button class="searchb">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <div class="sbutton">
                    <button type="submit" id="aButton" style="cursor: pointer">Get Complaint Status</button>
                    <span class="lmessage1" id='llogin_message'><%= request.getAttribute("error_msg") != null ? request.getAttribute("error_msg") : "" %></span>
                </div>
            </form>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/scripts/script.js"></script>
    <script>
    function validateComplaintId(input) {
        input.setCustomValidity('');

        // Regular expression to check if the value is exactly 8 digits
        var value = input.value.trim();
        var isValid = /^\d{8}$/.test(value);

        if (!isValid) {
            input.setCustomValidity('Complaint Number must be exactly 8 digits long.');
        }
    }
    
    document.querySelector('form').addEventListener('submit', function(event) {
        var compIdInput = document.querySelector('input[name="search_compid"]');
        validateComplaintId(compIdInput);
        if (compIdInput.validationMessage) {
            event.preventDefault(); 
        }
    });

    if (document.getElementById("cu_name")) {
        var name = '<%=(session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : ""%>';
        var c1 = document.getElementById("cu_name");
        if (c1)
            c1.textContent = name;
    }
    </script>
</body>
</html>
