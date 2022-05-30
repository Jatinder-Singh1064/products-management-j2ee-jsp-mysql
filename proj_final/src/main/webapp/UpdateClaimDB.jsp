<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Claim DB</title>
</head>
<body>
<c:set var="loggedInAdmin" value="${param.loggedInAdmin}" />
<c:set var="prodSerialNum" value="${param.prodSerialNum}" />
<c:set var="prodStatus" value="${param.prodStatus}" />
<c:set var="claimId" value="${param.claimId}" />

		<sql:setDataSource var="dbCon" driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/java_proj_db" user="root"
			password="root@12345"/>
			
		<sql:update dataSource="${dbCon}" var="ProdClaim">
            UPDATE claim SET Status=? where SerialNumber=? AND ClaimId = ?;
            <sql:param value="${param.prodStatus}" />
            <sql:param value="${param.prodSerialNum}" />
            <sql:param value="${param.claimId}" />
        </sql:update>
            
        <c:if test="${ProdClaim>=1}">
			<c:redirect url="AdminHome.jsp?loggedInAdmin=${param.loggedInAdmin}">
			</c:redirect>
		</c:if>	
</body>
</html>