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
<h1>Insert New Flight Details</h1>



<form action=InsertFlight method=post>

	 Enter Name : <input type="text" name=name id=name /><br><br>
     From :<input type="text" name=from id=from /><br><br>
	 To : <input type="text" name=to id=to /><br><br>
	Date : <input type="date" name=departure id=departure /><br><br>
	Time : <input type="time" name=time id=time /><br><br>
	Price : <input type="text" name=price id=price /><br><br>
	<input type=submit value=submit /> <input type=reset />
</form>

</center>
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