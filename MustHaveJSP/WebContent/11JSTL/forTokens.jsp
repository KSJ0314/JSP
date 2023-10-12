<%@page import="java.util.*"%>
<%@page import="common.*"%>
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
	<h3>forToken 태그</h3>
	<%
		String rgba = "red,green,blue,black";
	%>
	<c:forTokens var="color" items="<%=rgba %>" delims=",">
		<span style="color: ${color};">${color}</span>
	</c:forTokens>
	
</body>
</html>