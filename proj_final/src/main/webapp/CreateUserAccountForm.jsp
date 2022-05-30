<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create User Account</title>
</head>
<body>
<div align="center" style="margin-top: 10%">
	<form action="C_UserAccountServlet" method="POST">
	<h2>Register User Account</h2>
		<table border="1" style="width: 30%">
			<tr>
				<td>Username</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="u_password"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="tel" name="u_phone" maxlength="10"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="email" name="u_email"></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="u_address"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" width="100%"><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
	<br>
	<a href="./LoginUser.jsp">Go Back</a>		
</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>