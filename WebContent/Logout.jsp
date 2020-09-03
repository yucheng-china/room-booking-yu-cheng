<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(session.getAttribute("username")==null)
		response.sendRedirect("login.html");
%>



<h1>Details submitted!</h1>


<form action="logout">
	<button type="submit" class="btn btn-outline-success btn-lg" name="logout">Logout</button>
</form>


</body>
</html>