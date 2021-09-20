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
<h2>User Login</h2>

<form action=UserLogin method=post >
    <table >
    <tr>
    <td> Enter Email:<br></td>
    <td><input type="email" name=email id=email /></td>
    </tr>
    <tr>
    <td> Enter Password:</label><br></td>
    <td><input type="password" name=password id=pass /></td>
    </tr>
    
    <tr>
    <td><input type=submit value=submit /></td>
    <td><input type=reset /></td>
    </tr>
    </table>
	
</form>

</center>
<br><br>
<i>New User-Create account</i>
<h4><a href=UserRegistration.jsp style="font-size:25;color:red;">Create Account</a></h4>

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