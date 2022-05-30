<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>User Product Claims</title>
</head>
<body>
	<% String uname = (String) request.getParameter("uname");%>
	<% String prodName = (String) request.getParameter("pname"); %>
	<% String prodSerialNum = (String) request.getParameter("prodSrNum"); %>
	
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
		<sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/java_proj_db" user="root"
			password="root@12345" />

		<sql:query dataSource="${dbCon}" var="result">
			select * from claim WHERE Username = ? AND SerialNumber = ?;
			<sql:param value="<%=uname%>" />
			<sql:param value="<%=prodSerialNum%>" />
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

				<c:forEach var="col" items="${result.rows}">
					<tr>
						<td><c:out value="<%=prodName%>"></c:out></td>
						<td><c:out value="${col.SerialNumber}"></c:out></td>
						<td><c:out value="${col.Description}"></c:out></td>
						<td><c:out value="${col.DateOfClaim}"></c:out></td>
						<td><c:out value="${col.Status}"></c:out></td>						
					</tr>
				</c:forEach>
			</table>
<br>
		<a href='UserHome.jsp?loggedInUser=<%=uname%>'>Go Home</a><br/>
	</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>