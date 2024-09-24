<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
        <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
        <title>Contact Us</title>
    </head>
    <body>
        <div class="hero">
            <nav>
                <a href="<%=request.getContextPath()%>/index.jsp"><img class="logo" src="<%=request.getContextPath()%>/assets/logo.png"></a>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <button class="ind_button"><a class="b1" href="register.jsp">Register</a></button>
                    <button class="ind_button"><a class="b1" href="<%=request.getContextPath()%>/login.jsp">Login</a></button>
                </ul>
            </nav>
        </div>


		<div class="bg1" style="padding: 50px; background-color: #e6e6e6;">
		    <div class="container" style="max-width: 700px; ">
				<div class="title" style="margin-bottom: 30px;">Contact Us</div>
				
				<form name='complaint-form' action="<%=request.getContextPath()%>/Contact" method="post">
					<div class="user-details">
						<div class="input-box">
	
							<span class="details">Your Name</span> <input type="text"
								id="fcno" name="fcno" placeholder="Enter your Name"
								required
								oninvalid="this.setCustomValidity('Please Enter Name')"
								onchange="this.setCustomValidity('')">
						</div>
						<div class="input-box">
							<span class="details">Your Email</span> <input type="text"
								placeholder="Enter your Email" required name="land"
								oninvalid="this.setCustomValidity('Please Enter Email')"
								onchange="this.setCustomValidity('')">
						</div>
						<div class="input-box" style="width: 100%">
							<span class="details">Address</span>
							<textarea id="faddr" name="faddr" rows="2" style="width: 100%"></textarea>
						</div>
					</div>
					<div class="flexcenter">
						<div class="sbutton" style="width: 100%; ">
							<button id="aButton" style="cursor: pointer; " onclick="window.location.href='admin_home.jsp'">Contact</button>
						</div>
					</div>
				</form>        
		    </div>
		</div>
    </body>
</html>
