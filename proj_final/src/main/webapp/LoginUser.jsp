<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login User</title>
</head>
<body>
	<div align="center" style="margin-top: 10%">
	<h1>Login User</h1>
		<form action="C_UserLoginServlet" method="POST">
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
					<td colspan="2" align="center" width="100%"><input type="submit" value="Submit"></td>
				</tr>
			</table>
			<br>
			<a href="./CreateUserAccountForm.jsp">Register new user</a>
			<br><br>
			<a href="./LoginAdmin.jsp">Login as an Admin</a>
		</form>
	</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>