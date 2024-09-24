<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
    <title>Register Complaint</title>
</head>
<body>
    <div class="hero">
    <% long cid = (long)session.getAttribute("consumer_lgid");%>
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
            <div class="title" style="margin-bottom: 20px;">File a New Complaint</div>
            <form name='complaint-form' action="<%=request.getContextPath()%>/RegisterComplaintController" method="post">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">Consumer Number</span>
                        <input type="text" id="fcno" name="fcno"readonly>
                    </div>
                    <div class="input-box">
                        <span class="details">Landmark</span>
                        <input type="text" placeholder="Enter your Landmark" required name="land"
                            oninvalid="this.setCustomValidity('Please Enter Landmark')"
                            onchange="this.setCustomValidity('')">
                    </div>
                    <div class="input-box">
                        <span class="details">Complaint/Service Type</span>
                        <select class="drtitle" id="stype" name="stype" onchange="updateCategoryOptions()">
                            <option value="Default" selected>Select Service Type</option>
                            <option value="Billing related">Billing related</option>
                            <option value="Voltage related">Voltage related</option>
                            <option value="Frequent disruption">Frequent disruption</option>
                            <option value="Street light related">Street light related</option>
                            <option value="Pole related">Pole related</option>
                        </select>
                    </div>
                    <div class="input-box">
                        <span class="details">Category</span>
                        <select class="drtitle" id="ccat" name="ccat">
                            <option value="Default" selected>Select Category</option>
                        </select>
                    </div>
                    <div class="input-box">
                        <span class="details">Mobile Number</span>
                        <input type="text" id='fphno' name="fphno" placeholder="Enter your Mobile Number" required
                            oninvalid="this.setCustomValidity('Please Enter Mobile Number')"
                            onchange="this.setCustomValidity('')">
                    </div>
                    <div class="input-box">
                        <span class="details">Contact Person</span>
                        <input type="text" name="cpname" placeholder="Contact Person" required
                            oninvalid="this.setCustomValidity('Please Enter Contact Person')"
                            onchange="this.setCustomValidity('')">
                    </div>
                    <div class="input-box" style="width: 100%">
                        <span class="details">Problem Description</span>
                        <textarea name="fprob" rows="2" style="width: 100%" id="fprob"></textarea>
                    </div>
                    <div class="input-box" style="width: 100%">
                        <span class="details">Address</span>
                        <textarea id="faddr" name="faddr" rows="2" style="width: 100%"></textarea>
                    </div>
                </div>
                <div class="button">
                    <button type="submit" id="compButton" style="margin-bottom: 5px; cursor: pointer;">Submit Complaint</button>
                </div>
            </form>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/scripts/script.js"></script>
    <script>
        let subm = document.getElementById("subMenu");
        function toggleMenu() {
            subm.classList.toggle("open-menu");
        }
        
        var cnid = document.getElementById("fcno");
        cnid.value = <%= cid%>;

        var name = '<%=(session.getAttribute("consumer_lgname") != null) ? session.getAttribute("consumer_lgname") : ""%>';
        var c1 = document.getElementById("cu_name");
        if (c1) c1.textContent = name;

        function updateCategoryOptions() {
            var stype = document.getElementById("stype").value;
            var ccat = document.getElementById("ccat");
            var categories = {
                "Billing related": ["Billing issues", "Payment disputes", "Bill discrepancies"],
                "Voltage related": ["Low voltage", "High voltage", "Voltage fluctuations"],
                "Frequent disruption": ["Service interruptions", "Power outages", "Line repairs"],
                "Street light related": ["Street light not working", "Street light damaged", "Street light broken"],
                "Pole related": ["Pole damaged", "Pole leaning", "Pole replacement"]
            };
            var options = categories[stype] || [];
            ccat.innerHTML = '<option value="Default" selected>Select Category</option>'; 
            options.forEach(function (category) {
                var option = document.createElement("option");
                option.value = category;
                option.text = category;
                ccat.add(option);
            });
        }
    </script>
</body>
</html>
