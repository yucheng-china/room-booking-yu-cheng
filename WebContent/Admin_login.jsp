<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/roombooking.css" >
<style>
	body{
                background: url(room_img/background5.jpg) no-repeat center center fixed;
                background-size: cover;
                font-family: 'Montserrat', sans-serif;
                font-weight: 600;
            }
            h1{
                font-weight: 600;
            }
            .container{
                margin-top: 70px;
                width: 500px;
                height: 500px;
                background: rgba(255, 255, 255, 0.65);
                border-radius: 10px;
            }
            p{
            	text-align:center;
            }
            .btn{
            	margin-top:30px !important; 
            	margin-bottom:10px;
            }</style>
</head>
<body>
	 <div class="container">
        <br>
        <h1 class="h1 text-center">Login as Admin</h1>
        <br>
        <div class="row">
            <div class="m-auto">
                <form class="login" action="admin_login">
                  
                    <div class="form-group">
                        <label>Username :</label>
                        <input class="form-control" type="text" name="uname" placeholder="Username" required>
                    </div>
                    <div class="form-group">
                        <label>Password :</label>
                        <input class="form-control" type="password" name="pwd" placeholder="Password" required>
                    </div>
                    <input class="btn btn-dark btn-block mt-5" type="submit" name="submit" value="Login">

                    <p><a href="login.html">Login as User?</a></p>
                </form>
            </div>
        </div>
    </div>
</body>
</html>