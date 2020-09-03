<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            table{
            	text-align:center;
            	background-color:rgba(255,255,255,0.65);
            }
            .container{
            	width:1300px !important;
            }
            
            h1{
                font-weight: 600;
                text-align:center;
                padding-top:30px;
            }
            .container{
            	width:700px;
                margin-top: 70px;
                border-radius: 10px;
            }
            p{
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
  
 <h1>Customer Details</h1>
<div class="container" >
<table class="table table-bordered">
		<tr style="background-color:black; color:white;">

			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Phone no.</th>
			<th>Room no.</th>
			<th>ID</th>
			<th width="11%">Check-In Date</th>
			<th width="11%">Check-Out Date</th>
		
		</tr>
		<% 
			try{
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:EE417","ee_user","ee_pass");
			Statement st = con.createStatement();
			String sql="select * from customer";
			ResultSet rs = st.executeQuery(sql);
			while(rs.next())
			{   
		%>
				<tr>
					<td> <%= rs.getString(1) %> </td>
					<td> <%= rs.getString(2) %> </td>
					<td> <%= rs.getString(3) %> </td>
					<td> <%= rs.getString(4) %> </td>
					<td> <%= rs.getString(5) %> </td>
					<td> <%= rs.getString(6) %> </td>
					<td> <%= rs.getString(7) %> </td>
					<td> <%= rs.getString(8) %> </td>
					
				</tr>
		<% }
		con.close();
		} catch(Exception e){
			e.printStackTrace();
		}%>
		</table>
	</div>	
</body>
</html>