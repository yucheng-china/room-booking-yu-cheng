<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="css/roombooking.css">
 <style>
        body{
                background: url(room_img/background3.jpg) no-repeat center center fixed;
                background-size: cover;
                font-family: 'Montserrat', sans-serif;
                font-weight: 600;
            }
            h1{
                font-weight: 600;
            }
            .container{
                margin-top: 50px;
                width: 700px;
                height: 670px;
                background: rgba(255, 255, 255, 0.65);
                border-radius: 10px;
            }
            .form-group{
            	margin-bottom:-3px;
            	margin-top:3px;
            }
             .container1{
                margin-top: 20px;
                width: 100 !important;
                height: 50px;
                background: rgba(50, 50, 50, 1.0);
                border-radius: 10px;
                text-align:center;
            }          
            
     .h11{
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
     			left: 1200px;
     			font-size: 30px;
     			background-color: #33FFFF;
     }
     .insert{
          		position: absolute;
     			top: 500px;
     			left: 640px;
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
%>
<div class="container1">
    <a class="h11" href="crud.jsp">Room Booking System</a>
          <a class="h2" href="rooms.jsp">Room Details</a>
          <a class="h3" href="insert.jsp">Insert Room</a>
          <a class="h4" href="delete.jsp">Delete</a>
          <a class="h5" href="customer_details.jsp">View Customer Details</a>
 
      <button id="login" class="logout" type="submit" onclick="location.href ='logout'">Logout</button>
  
    </div>

		<div class="container">
        <br>
        <h1 class="h1 text-center">Insert Room and Details</h1>
        <br>
        <div class="row">
            <div class="col-md-6 m-auto">
                <form class="" action="Insert" method="get">
                  
                    <div class="form-group">
                        <label>Room No :</label>
                                <input class="form-control" type="text" name="room_no" placeholder="Room No">      
                    </div>
                    <div class="form-group">
                        <label>Room Category :</label>
                        <input class="form-control" type="text" name="category" value="" placeholder="Room Category">
                    </div>
                    <div class="form-group">
                        <label>Capacity :</label>
                        <input class="form-control" type="text" name="capacity" value="" placeholder="Capacity">
                    </div>
               
                    <input class="insert" type="submit" name="Insert" value="Insert">
                </form>
            </div>
        </div>
    </div>
		
</body>
</html>