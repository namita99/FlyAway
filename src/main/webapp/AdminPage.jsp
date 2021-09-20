<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<br>
<a href=HomePage.jsp>FlyAway</a>
<br><br>
<center>
<h2>Admin Login</h2>

<form action=AdminLogin method=post>

	Enter Email : <input type="email" name=email id=email /><br><br>
	Enter Password : <input type="password" name=password id=pass /><br><br>
	<input type=submit value=submit /> <input type=reset />
</form>

</center><br>
<a href=ForgotPassword.jsp>Forgot Password</a>

<%
	String message=(String)session.getAttribute("message");
	if(message!=null){
%>
<p style="color:silver;"><%=message %></p>
<%
		session.setAttribute("message", null);
	}
%>
</body>
</html>