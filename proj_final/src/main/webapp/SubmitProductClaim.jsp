<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Submit Product Claim</title>
</head>
<body>

<% String uname = (String) request.getParameter("uname");%>
<% String prodSerialNum = (String) request.getParameter("prodSrNum");%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Hello <%= uname %></a>  
    </div>
    <ul class="nav navbar-nav">
     	<li class="active"><a href="UserHome.jsp?loggedInUser=<%=uname%>">Home</a></li>
        <li><a href='LoginUser.jsp'>Logout</a></li>      
    </ul>
  </div>
</nav>

<br>

<div align="center">
	<form action="C_SubmitProductClaimServlet" method="POST">
		<h2>Submit Product Claim</h2>
		<table border="1" style="width: 40%">
			<tr>
				<td>Username</td>				
				<td><input type="text" name="username" readonly="readonly" value="<%=uname%>"></td>
			</tr>
			<tr>
				<td>Product Serial Number</td>
				<td><input type="number" name="prodSerialNumber" readonly="readonly" value="<%=prodSerialNum%>"></td>
			</tr>
			<tr>
				<td>Date of Claim</td>
				<td><input type="date" name="claimDate"></td>
			</tr>
			<tr>
				<td>Description of Issue</td>
				<td><input type="text" name="issueDescription"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" width="100%"><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
	<br>
		<a href='UserHome.jsp?loggedInUser=<%=uname%>'>Go Home</a><br/>
</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>