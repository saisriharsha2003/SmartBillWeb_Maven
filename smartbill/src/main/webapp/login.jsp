<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
    <link rel="icon" href="<%= request.getContextPath() %>/assets/icon.png" type="image/icon type">
    <title>Login</title>
</head>
<body>
    <div>
        <div class="hero">
            <nav>
                <a href="<%= request.getContextPath() %>/index.jsp"><img class="logo" src="<%= request.getContextPath() %>/assets/logo.png"></a>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <button class="ind_button"><a class="b1" href="<%= request.getContextPath() %>/register.jsp">Register</a></button>
                    <button class="ind_button"><a class="b1" href="<%= request.getContextPath() %>/login.jsp">Login</a></button>
                </ul>
            </nav>
        </div>
        <div class="signup">
            <div class="container">
                <div class="title">Login to SmartBill</div>
                <form id="my_login_form" action="<%= request.getContextPath() %>/Login" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">User Name</span>
                            <input type="text" id="lname" placeholder="Enter your User Name"
                                   name="lname" value="<%= request.getAttribute("en_username") != null ? request.getAttribute("en_username") : "" %>" required
                                   oninvalid="this.setCustomValidity('Please Enter Username')"
                                   onchange="this.setCustomValidity('')">
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" id="lpwd" name="lpwd"
                            	   value="<%= request.getAttribute("en_password") != null ? request.getAttribute("en_password") : "" %>" 
                                   placeholder="Enter your Password" required
                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                   title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                                   onkeyup='login_check();'>
                        </div>
                        <div class="input-box">
                            <span class="details">Confirm Password</span>
                            <input type="password" id="lcpwd"
                            	   value="<%= request.getAttribute("en_password") != null ? request.getAttribute("en_password") : "" %>" 
                                   placeholder="Confirm your Password" required
                                   oninvalid="this.setCustomValidity('Please Enter Password Again')"
                                   onchange="this.setCustomValidity('')"
                                   onkeyup='login_check();'>
                            <span class="message" id='login_message'></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Login As</span>
                            <select class="drtitle" name="userType">
                                <option value="Default" <%= "Default".equals(request.getAttribute("user_type")) ? "selected" : "" %>>Select User Type</option>
                                <option value="Admin" <%= "Admin".equals(request.getAttribute("user_type")) ? "selected" : "" %>>Admin</option>
                                <option value="Consumer" <%= "Consumer".equals(request.getAttribute("user_type")) ? "selected" : "" %>>Consumer</option>
                            </select>
                        </div>
                    </div>
                    <div class="sbutton">
                        <button type="submit" id="aButton" style="cursor: pointer">Login</button>
                        <span class="lmessage1" id='llogin_message'><%= request.getAttribute("error_msg") != null ? request.getAttribute("error_msg") : "" %></span>
                    </div>
                    <div class="asignup">Don't have an account? <a href="<%= request.getContextPath() %>/register.jsp" class='bsignup'> <u>Register</u></a> here</div>
                </form>
                <script src="<%= request.getContextPath() %>/scripts/script.js"></script>
            </div>
        </div>
    </div>
</body>
</html>
