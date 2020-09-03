<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                height: 800px;
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
	if(session.getAttribute("username")==null)
		response.sendRedirect("login.html");
	%>

	<%String no = request.getParameter("Room_no"); 
	session.setAttribute("room_no", no);
	%>
	
	<%String ID = request.getParameter("ID"); 
	session.setAttribute("ID1", ID);
	%>

	 <div class="container">
        <br>
        <h1 class="h1 text-center">Registration Form</h1>
        <br>
        <div class="row">
            <div class="m-auto">
                <form name="form" action="UserDetails" method="get">
                  
                    <div class="form-group">
                        <label>Name :</label>
                        <div class="form-inline" >
                                <input style="width:50%;" class="form-control" type="text" name="fname" placeholder="First Name" required>
                                <input style="width:50%;" class="form-control" type="text" name="sname" placeholder="Last Name" required>       
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email :</label>
                        <input class="form-control" type="text" name="email" placeholder="Email" required>
                    </div>
                    <div class="form-group">
                        <label>Mobile Number :</label>
                        <input class="form-control" type="text" name="ph_no" placeholder="Mobile Number" required>
                    </div>
                    <div class="form-group">
                        <label>Room no :</label>
                        <input class="form-control" type="text" name="room_no" placeholder="Room Number" value="<%= no%>" disabled>
                    </div>
                    <div class="form-group">
                        <label>ID/Proof no :</label>
                        <input type="text" class="form-control" name="ID" placeholder="ID Number" value="<%= ID%>" disabled>
                    </div>
                    <div class="form-group">
                        <label>Check-In Date</label>
                        <input type="date" class="form-control" name="cin" min="2020-04-10" required/> 
                    </div>
                    <div class="form-group">
                        <label>Check-Out Date</label>
                        <input type="date" class="form-control" name="cout" min="2020-04-10" required/> 
                    </div>

                    <input class="btn btn-dark btn-block mt-5" type="submit" name="submit" value="Submit">
                </form>
            </div>
        </div>
    </div>
</body>
</html>