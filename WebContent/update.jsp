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
            .btn{
            	margin-top:20px !important;
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
<%String no = request.getParameter("Room_no"); 
	session.setAttribute("admin_room_no", no);
	%>
	
	<%

	
	//HttpSession session2= request.getSession();
	//int admin_roomNo= (int)session2.getAttribute("admin_room_no");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:EE417","ee_user","ee_pass");
		Statement st = con.createStatement();
		String sql="select * from room where Room_No='"+no+"'";
		ResultSet rs = st.executeQuery(sql);
		while(rs.next())
		{   
	%>
		<div class="container">
        <br>
        <h1 class="h1 text-center">Registration Form</h1>
        <br>
        <div class="row">
            <div class="col-md-6 m-auto">
                <form class="" action="update" method="get">
                  
                    <div class="form-group">
                        <label>Room No :</label>
                                <input class="form-control" type="text" name="room_no" value="<%=no%>" disabled>      
                    </div>
                    <div class="form-group">
                        <label>Room Category :</label>
                        <input class="form-control" type="text" name="category" value="<%=rs.getString("Room_Category")%>">
                    </div>
                    <div class="form-group">
                        <label>Capacity :</label>
                        <input class="form-control" type="text" name="capacity" value="<%=rs.getString("Capacity")%>">
                    </div>
                    <div class="form-group">
                        <label>Booked by :</label>
                        <input class="form-control" type="text" name="booked_by" value="<%=rs.getString("Booked_By")%>">
                    </div>
                    <div class="form-group">
                        <label>Status :</label>
                        <input type="text" class="form-control" name="status" value="<%=rs.getString("Status")%>" required>
                    </div>
                   

                    <input class="btn btn-dark btn-block mt-5" type="submit" name="update" value="Update">
                </form>
            </div>
        </div>
    </div>
	<% }
		con.close();
		} catch(Exception e){
			e.printStackTrace();
		}%>
		
</body>
</html>