<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon">
    <style>
        
    </style>
</head>
<body>
    <div class="hero">
        <nav>
            <a href="<%= request.getContextPath() %>/index.jsp"><img class="logo" src="<%= request.getContextPath() %>/assets/logo.png" alt="Logo"></a>
            <ul>
                <li><a href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                <li><button class="ind_button"><a class="b1" href="<%= request.getContextPath() %>/register.jsp">Register</a></button></li>
                <li><button class="ind_button"><a class="b1" href="<%= request.getContextPath() %>/login.jsp">Login</a></button></li>
            </ul>
        </nav>
    </div>
    
    <div class="signup">
        <div class="container">
            <div class="flexcenter" style="text-align: center; align-items: center; gap: 30px;">
                <img src="<%=request.getContextPath()%>/assets/delete_emoji.webp" alt="Delete Emoji" style="height: 70px; width: 70px;">
                <p style="font-size: 30px; font-weight: 600; color: #CCBA78;">Account Deletion Successful</p>
            </div>
            <div class="flexcenter" style="padding-top:30px; padding-bottom: 30px;">
            	<p style="font-size: 20px; font-weight: 600;"> Your Account has been successfully deleted.</p>
            </div>
            <div class="flexcenter">
            <div class="sbutton" class="flexcenter" style="display: flex; justify-content: center; gap:10px;margin-bottom: 30px; width: 90%;">
                <button id="bButton" style="cursor: pointer;" onclick="window.location='<%=request.getContextPath()%>/index.jsp';">Back to Home</button>
            </div>
            </div>
        </div>
    </div>

    <script src="<%=request.getContextPath()%>/scripts/script.js"></script>
</body>
</html>
