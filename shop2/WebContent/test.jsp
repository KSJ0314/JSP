<%@page import="dao.MemberDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="mvc.database.BoardConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="co" value="${BoardConnection.getConnection()}" />
	<c:if test="${not empty co}">
		<h2>연결 성공</h2>
		${co.close() }
	</c:if>
	
</body>
</html>