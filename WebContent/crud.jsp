<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 body{
                background: url(room_img/background2.jpg) no-repeat center center fixed;
                background-size: cover;
                font-family: 'Montserrat', sans-serif;
                font-weight: 600;
            }
     .container{
                margin-top: 20px;
                width: 100 !important;
                height: 50px;
                background: rgba(255, 255, 255, 0.65);
                border-radius: 10px;
                text-align:center;
            }    
      .container1{
                margin-top: 20px;
                width: 100 !important;
                height: 50px;
                background: rgba(50, 50, 50, 1.0);
                border-radius: 10px;
                text-align:center;
            }          
            
     .h1{
     			position: absolute;
     			top: 30px;
     			left: 20px;
     			font-size: 20px;
     			color: #33FFFF;
     }
      .h2{
     			position: absolute;
     			top: 30px;
     			left: 300px;
     			font-size: 20px;
     			color: #33FFFF;
     }
      .h3{
     			position: absolute;
     			top: 30px;
     			left: 500px;
     			font-size: 20px;
     			color: #33FFFF;
     }
      .h4{
     			position: absolute;
     			top: 30px;
     			left: 700px;
     			font-size: 20px;
     			color: #33FFFF;
     }
	 .h5{
     			position: absolute;
     			top: 30px;
     			left: 850px;
     			font-size: 20px;
     			color: #33FFFF;
     }
     .logout{
     			position: absolute;
     			top: 25px;
     			left: 1230px;
     			font-size: 30px;
     			background-color: #33FFFF;
     }
</style>
</head>
<body>
<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
<%
	if(session.getAttribute("ausername")==null)
		response.sendRedirect("login.html");
%><div class="container1">
    <a class="h1" href="#">Room Booking System</a>
    
          <a class="h2" href="rooms.jsp">Room Details</a>
      
  
        
          <a class="h3" href="insert.jsp">Insert Room</a>
        
         
          <a class="h4" href="delete.jsp">Delete</a>
   
      
          <a class="h5" href="customer_details.jsp">View Customer Details</a>
     
  
 
      <button class="logout" id="login" type="submit" onclick="location.href ='logout'">Logout</button>
  
</div>
<div class="container">
<h1>Welcome ${ausername}</h1>
</div>



</body>
</html>