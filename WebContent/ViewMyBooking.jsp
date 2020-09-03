<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import= "javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/roombooking.css" >
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
            	width:920px !important;
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
            .home{
            	position: relative;
            	font-size: 40px;
            	margin-top: -200px;
                margin-left: 1200px;
            }
            
</style>
</head>
<body>

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
			String ID= (String)session.getAttribute("ID");
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:EE417","ee_user","ee_pass");
			Statement st = con.createStatement();
			String sql="select * from customer where ID='"+ID+"'";
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
	
	<div class="home">
		<a href="new_welcome.jsp">Home</a>
	</div>

</body>
</html>