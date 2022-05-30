<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Update Claim Status</title>
</head>
<body>

<%
	String adminname = (String) request.getParameter("loggedInAdmin");
	String prodSrNum = (String) request.getParameter("prodSrNum");
	String uName = (String) request.getParameter("userName");
	String claimId = (String) request.getParameter("claimId");
	%>
	
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Hello <%= adminname %></a>     
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Home</a></li>
      <li><a href="./ViewAllProducts.jsp?loggedInAdmin=<%=adminname%>">View All Products</a></li>
      <li><a href='LoginAdmin.jsp'>Logout</a></li>     
    </ul>
  </div>
</nav>
	
<h5>You are logged in as an Administrator</h5>
	<hr><br>
	
	<sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/java_proj_db" user="root"
			password="root@12345"/>

	<div align="center">
		<form action="UpdateClaimDB.jsp" method="post">
			<input type="hidden" name="loggedInAdmin" value="<%=adminname%>">
			<input type="hidden" name="claimId" value="<%=claimId%>">
			<h2>Update Claim Status</h2>
			<table border="1" style="width: 40%">
				<tr>
					<td>Username</td>
					<td><input type="text" name="user_name" readonly="readonly" value="<%=uName%>"></td>
				</tr>
				<tr>
					<td>Product Serial Number</td>
					<td><input type="number" name="prodSerialNum" readonly="readonly" value="<%=prodSrNum%>"></td>
				</tr>
				<tr>
					<td>Claim Status</td>
					<td>
						<input type="radio" name="prodStatus" value="Approved" checked="checked">
								<label>Approved</label> 
						<input type="radio" name="prodStatus" value="Rejected"> 
							     <label>Rejected</label> 				
					</td>
				</tr>
				<tr>					
					<td colspan="2" align="center" width="100%"><input type="submit" value="Update Claim Status"></td>
				</tr>
			</table>
		</form>
		
		<br/><br/>
		
		<a href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Go Home</a><br />
	</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>