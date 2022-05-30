<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>User Home</title>
</head>
<body>

<%
		String username = (String) request.getAttribute("loggedInUser");
		
		if(username == null)
		{
			username = (String) request.getParameter("loggedInUser");
		}
%>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Hello <%= username %></a>  
    </div>
    <ul class="nav navbar-nav">
     	<li class="active"><a href="#">Home</a></li>
        <li><a href='LoginUser.jsp'>Logout</a></li>      
    </ul>
  </div>
</nav>
<h2><a href="./RegisterProduct.jsp?uname=<%=username%>">Register new product</a></h2>	
<br><br>
		
	<div align="center">
		<form action="UserHome.jsp?loggedInUser=<%=username%>" method="post">
				<table style="width: 40%">
					<tr>
						<td>Enter Product Name:</td>
						<td><input type="text" name="p_name">&nbsp;&nbsp;&nbsp;<input type="submit" value="Search Product"></td>						
					</tr>
				</table>
		</form>
			
		<sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/java_proj_db" user="root"
			password="root@12345" />	
		
		<sql:query dataSource="${dbCon}" var="result">
			select * from registeredproducts WHERE LoginId = ?;
			<sql:param value="<%=username%>" />
		</sql:query>	
			
			<h2>Registered Products</h2>
			<table border="1">
				<tr>
					<th>Product Name</th>
					<th>Product Serial Number</th>
					<th>Purchase Date</th>
					<th></th>
					<th></th>
				</tr>

				<c:forEach var="col" items="${result.rows}">
					<tr>
						<td><c:out value="${col.ProductName}"></c:out></td>
						<td><c:out value="${col.ProductSerialNumber}"></c:out></td>
						<td><c:out value="${col.PurchaseDate}"></c:out></td>
						<td><a href="./SubmitProductClaim.jsp?uname=<%=username%>&prodSrNum=${col.ProductSerialNumber}">Add a claim</a></td>
						<td><a href="./ViewClaimsByUserProduct.jsp?uname=<%=username%>&pname=${col.ProductName}&prodSrNum=${col.ProductSerialNumber}">View Claims</a></td>
					</tr>
				</c:forEach>
			</table>
			<br>		
	</div>
	<br>

	<div align="center">
		<sql:query dataSource="${dbCon}" var="res">
			select r.ProductName, c.SerialNumber, c.Description, c.DateOfClaim, c.Status from claim c
				JOIN registeredproducts r ON c.SerialNumber = r.ProductSerialNumber
			 WHERE c.Username = ?;
			<sql:param value="<%=username%>" />
		</sql:query>

			<h2>Product Claims</h2>
			<table border="1">
				<tr>
					<th>Product Name</th>
					<th>Product Serial Number</th>
					<th>Description</th>
					<th>Claim Date</th>
					<th>Status</th>
				</tr>

				<c:forEach var="coll" items="${res.rows}">
					<tr>
						<td><c:out value="${coll.ProductName}"></c:out></td>
						<td><c:out value="${coll.SerialNumber}"></c:out></td>
						<td><c:out value="${coll.Description}"></c:out></td>
						<td><c:out value="${coll.DateOfClaim}"></c:out></td>
						<td><c:out value="${coll.Status}"></c:out></td>						
					</tr>
				</c:forEach>
			</table>
		<br><br><br>
	</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>