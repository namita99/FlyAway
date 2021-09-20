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
<form action=UserRegistration method=post>

	Enter Email : <input type="email" name=email id=email /><br><br>
    Enter Password : <input type="password" name=password id=pass /><br><br>
	Enter Name : <input type="text" name=name id=name /><br><br>
	Enter Phone No. : <input type="text" name=phno id=phno /><br><br>
	Enter Aadhaar No. : <input type="text" name=adno id=adno /><br><br>
	<input type=submit value=submit /> <input type=reset />
</form>

</center>
</body>
</html>