<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/roombooking.css">
<style type="text/css">
	body{
                background: url(room_img/background2.jpg) no-repeat center center fixed;
                background-size: cover;
                font-family: 'Montserrat', sans-serif;
                font-weight: 600;
            }
            table{
            	text-align:center;
            	background-color:rgba(255,255,255,0.65);
            }
            .container{
            	width:900px !important;
            }
            h1{
                font-weight: 600;
                text-align:center;
                padding-top:30px;
            }
            .container{
                margin-top: 70px;
                border-radius: 10px;
            }
            p{
            	text-align:center;
            }
            .btn{
            	margin-top:30px !important; 
            	margin-bottom:10px;
            }
</style>


</head>
<body>
<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<%
	if(session.getAttribute("username")==null)
		response.sendRedirect("login.html");
%>
	<h1>Welcome ${username}</h1>
	<div class="container">
	<table class="table table-bordered">
		<tr>
			<th>Room No</th>
			<th>Room Category</th>
			<th>Capacity</th>
			<th>Status</th>
			<th>Operation</th>
		</tr>
		<% 
			try{
			String ID= (String)session.getAttribute("ID");
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:EE417","ee_user","ee_pass");
			Statement st = con.createStatement();
			String sql="select * from Room where Status='Available'";
			ResultSet rs = st.executeQuery(sql);
			while(rs.next())
			{   
		%>
				<tr>
					<td> <%= rs.getString(1) %> </td>
					<td> <%= rs.getString(2) %> </td>
					<td> <%= rs.getString(3) %> </td>
					<td> <%= rs.getString(5) %> </td>
					<td><a href="BookRoom.jsp?Room_no=<%= rs.getString(1) %>&ID=<%= ID %> ">Book</a></td>
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