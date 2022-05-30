<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Admin</title>
</head>
<body>
	<div align="center" style="margin-top: 10%">
	<h1>Login Admin</h1>
		<form action="C_AdminLoginServlet" method="POST">
			<table border="1" style="width: 30%">
				<tr>
					<td>Admin Name</td>
					<td><input type="text" name="adminname"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="a_password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center" width="100%"><input type="submit" value="Submit"></td>
				</tr>
			</table>
			<br>
			<a href="./LoginUser.jsp">Login as a User</a>		
		</form>
	</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>