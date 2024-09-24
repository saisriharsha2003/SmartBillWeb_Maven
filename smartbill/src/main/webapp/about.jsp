<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
        <link rel="icon" href="<%=request.getContextPath()%>/assets/icon.png" type="image/icon type">
        <title>About Smart Bill</title>
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

		<div id="about" class="bg1" style="padding: 50px; ">
            <div class="container" style="max-width: 1000px; margin: 0 auto; background-color: black; opacity: 0.9; ">
                <h2 style="color: #CCBA78; font-size: 36px; text-align: center; font-weight: 700;">About Smart Bill</h2>
                <p style="color: white; margin-bottom: 20px;text-align: center; font-size: 18px; text-align: justify; line-height: 1.6; margin-top: 20px;">
                    Smart Bill is an innovative platform designed to streamline the billing process for individuals and businesses alike. 
                    Our goal is to make bill payments easier, faster, and more secure. With Smart Bill, you can manage all your bills in 
                    one place, track your payment history, and receive timely reminders for upcoming due dates. Whether you're paying utility bills, 
                    handling business invoices, or managing household finances, Smart Bill is here to simplify your life.
                </p>
                <p style="color: white; font-size: 18px; text-align: justify; line-height: 1.6;">
                    Join us today and experience a smarter way to handle your bills. Our platform ensures secure transactions, real-time updates, 
                    and a user-friendly interface to keep your finances organized and up-to-date.
                </p>
                <div class="flexcenter">
					<div class="sbutton" style="width: 20%; padding: 20px;">
						<button id="aButton" style="cursor: pointer; " onclick="window.location.href='register.jsp'">Get Started</button>
					</div>
				</div>
            </div>
        </div>
    </body>
</html>
