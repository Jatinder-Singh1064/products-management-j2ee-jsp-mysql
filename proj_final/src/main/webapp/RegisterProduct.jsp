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
<title>Register Product</title>
</head>
<body>

<% String uname = (String) request.getParameter("uname");%>

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
	<form action="C_RegisterProductServlet" method="POST">
	<h2>Register Product</h2>
		<table border="1" style="width: 40%">
			<tr>
				<td>Username</td>
				<td><input type="text" name="username" readonly="readonly" value="<%=uname%>"></td>
			</tr>
			<tr>
				<td>Product Name</td>
				<td><input type="text" name="productName"></td>
			</tr>
			<tr>
				<td>Serial Number</td>
				<td><input type="number" name="productSerialNum" min="10001" max="99999"></td>
			</tr>
			<tr>
				<td>Purchase Date</td>
				<td><input type="date" name="purchaseDate"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" width="100%"><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
</div>

<hr>
<br>
<div  align="center">
	<form action="RegisterProduct.jsp?uname=<%=uname%>" method="post">
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
			select * from products;
	</sql:query>
	
			<h2>Available Products</h2>
			<table border="1">
				<tr>
				    <th>Product Serial Number</th>
					<th>Product Name</th>
					<th>Product Model</th>
					<th>Product Color</th>
					<th>Product Company</th>
				</tr>

				<c:forEach var="coll" items="${res.rows}">
					<c:set var="pn" value="${coll.ProductName}" />
					<c:set var="entered_pname" value="${param.p_name}" />
					
					<c:if test="${fn:containsIgnoreCase(pn, entered_pname)}">
						<tr>
						    <td><c:out value="${coll.ProductSerialNumber}"></c:out></td>
							<td><c:out value="${coll.ProductName}"></c:out></td>
							<td><c:out value="${coll.ProductModel}"></c:out></td>
							<td><c:out value="${coll.ProductColor}"></c:out></td>	
							<td><c:out value="${coll.ProductCompany}"></c:out></td>											
						</tr>
					</c:if>
				</c:forEach>
			</table>
		<br>
		<a href='UserHome.jsp?loggedInUser=<%=uname%>'>Go Home</a><br/>
		<br>
		<br>
		<br>
</div>
</body>
<link rel="stylesheet" href="Style.css">
</html>