<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>FlyAway</h1>

<div align="right">
<a href="AdminPage.jsp">Admin Login</a>
</div>

<%
	@SuppressWarnings("unchecked")
	HashMap<String,String> user=(HashMap<String,String>)session.getAttribute("user");
	if(user!=null){
%>
<p>Welcome <%=user.get("name") %></p>
<a href="Logout">Logout</a>
<%
	}else{
%>
<a href=UserPage.jsp>User Login</a>
<%
	}
%>
<br><br>
<center>

<form action=FlightList method=post>
	From : <input type=text name=from id=from/><br><br>
	To : <input type=text name=to id=to/><br><br>
	Date : <input type=date name=departure id=departure/><br><br>
	Travellers : <input type=number name=travellers id=travellers/><br><br>
	<input type=submit value=Search /> <input type=reset />
</form>
</center>
</body>
</html>