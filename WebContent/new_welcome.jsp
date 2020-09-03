<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

        <style>
            body{
                background: url(room_img/background1.jpg) no-repeat center center fixed;
                background-size: cover;
                font-family: 'Montserrat', sans-serif;
                font-weight: 600;
            }
            h1{
                text-align: center;
                margin-top: 1em;
                font-size: 60px;
            }
            .btn-book{
                position: absolute;
                top: 42%;
                left: 50%;
                transform: translate(-50%,-50%);
            }
            button{
                text-align: center;
            }
            
            a.button {
                cursor: pointer;
                font-size: 30px;
                font-weight: 600;
                color: white;
                padding: 6px 25px 6px 25px;
                margin: 10px 8px 20px 10px;
                display: inline-block;
                text-decoration: none;
                border-radius: 20px; 
                background-color: #3a57af;  
                box-shadow: 0 3px rgba(58,87,175,.75);
                transition: all 0.1s linear 0s; 
                top: 0px;
                position: relative;
            }
            
            a.button:hover {
                top: 3px;
                background-color:#2e458b;
                box-shadow: none;
                
            }
            a,i{
                font-size: 20px;
                text-decoration: none;
                color:black; 
            }
            .menu{ 
           		margin-top:50px;
                position: absolute;
                top: 65%;
                left: 50%;
                transform: translate(-50%,-50%);
                text-align: center;
                display: inline-block;               
            }
            #btn{
                border: 1px solid black;
                border-radius: 15px;
                padding: 6px 5px 6px 5px;
                margin-top: 10px;
            }
            a{
                margin-right: 10px; 
            }
            .logout{
            	margin-top:60px !important;
            	pointer:cursor;
            }
        </style>
</head>
<body>
 <%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
	%>
	<%
	if(session.getAttribute("username")==null)
		response.sendRedirect("login.html");
%>
        <h1>Room Booking System</h1>

        <div class="menu">
            <div id="btn">
                <a href="contact.html">Contact us</a>
            </div>  
            <div id="btn">
        		<a href="ViewMyBooking.jsp">View My Booking</a>
        	</div>
            <div id="btn" class="logout">
            	<a href="logout">Logout</a>
        	</div>  
        </div>    
        <div class="btn-book">
            <a class="button" href="Welcome.jsp">Book rooms</a>
        </div>
</body>
</html>