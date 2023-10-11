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
	<h3>향상된 for 문 형태의 forEach 태그</h3>
	<%
		String[] rgba = {"red", "green", "blue", "black"};
	%>
	<c:forEach var="color" items="<%=rgba %>">
		<span style="color: ${color};">${color}</span>
	</c:forEach>
	
	<h3>varStatus 속성 보기</h3>
	<c:forEach var="c" items="<%=rgba %>" varStatus="s">
		<span>${s.count }</span>
		<span>${s.index }</span>
		<span>${s.current }</span>
		<span>${s.first }</span>
		<span>${s.last }</span><br>
	</c:forEach>
</body>
</html>