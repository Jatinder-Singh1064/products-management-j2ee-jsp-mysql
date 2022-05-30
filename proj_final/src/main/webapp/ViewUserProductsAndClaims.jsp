<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>View User Products And Claims</title>
</head>
<body>
<% 
String adminname = (String) request.getParameter("loggedInAdmin");
String username = (String) request.getParameter("userName");
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
<hr>

	<div align="center">
		<form action="ViewUserProductsAndClaims.jsp?loggedInAdmin=<%=adminname%>&userName=<%=username%>" method="post">
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
		
		<sql:query dataSource="${dbCon}" var="res">
			SELECT * FROM registeredproducts WHERE LoginId = ?;
			<sql:param value="<%=username%>" />
		</sql:query>

			<h2><%=username%>'s Registered Products</h2>
			<table border="1">
				<tr>
					<th>Product Name</th>
					<th>Product Serial Number</th>
					<th>Purchase Date</th>
				</tr>

				<c:forEach var="coll" items="${res.rows}">
					<c:set var="pn" value="${coll.ProductName}" />
					<c:set var="entered_pname" value="${param.p_name}" />
					
					<c:if test="${fn:containsIgnoreCase(pn, entered_pname)}">
						<tr>						   
							<td><c:out value="${coll.ProductName}"></c:out></td>
							<td><c:out value="${coll.ProductSerialNumber}"></c:out></td>
							<td><c:out value="${coll.PurchaseDate}"></c:out></td>												
						</tr>
					</c:if>
				</c:forEach>
			</table>
	</div>
	
	<br>
	
	<div align="center">	
		<sql:query dataSource="${dbCon}" var="rslt">
			select * from claim WHERE Username = ?;
			<sql:param value="<%=username%>" />
		</sql:query>

			<h2><%=username%>'s Product Claims Submitted</h2>
			<table border="1">
				<tr>
					<th>Product Serial Number</th>
					<th>Description</th>
					<th>Claim Date</th>
					<th>Status</th>
					<th></th>
				</tr>

				<c:forEach items="${rslt.rows}" var="cc">
					<tr>
						<td><c:out value="${cc.SerialNumber}"></c:out></td>
						<td><c:out value="${cc.Description}"></c:out></td>
						<td><c:out value="${cc.DateOfClaim}"></c:out></td>
						<td><c:out value="${cc.Status}"></c:out></td>	
						
						<c:set var="status" value="${cc.Status}"/>
						<c:choose>
							<c:when test="${(status == 'Pending')}">
								<td><a href="./UpdateClaimStatus.jsp?loggedInAdmin=<%=adminname%>&prodSrNum=${cc.SerialNumber}&userName=${cc.Username}&claimId=${cc.ClaimId}">Approve/Reject</a></td>
							</c:when>
							<c:otherwise>
								<td>Approve/Reject</td>
							</c:otherwise>
						</c:choose>	
					</tr>
				</c:forEach>
			</table>
			<br>
			<a href='AdminHome.jsp?loggedInAdmin=<%=adminname%>'>Go Home</a><br/>
			<br><br><br>
	</div>	
</body>
<link rel="stylesheet" href="Style.css">
</html>