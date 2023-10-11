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
	<h3>일반 for 문 형태의 forEach 태그</h3>
	<c:forEach var="i" begin="1" end="3">
		<p>반복 ${i}입니다.</p>
	</c:forEach>
	
	<h3>일반 for 문 형태의 forEach 태그</h3>
	<c:forEach var="i" begin="1" end="100">
		<c:if test="${i % 2 == 0 }" >
			<c:set var="sum" value="${sum+i}" />
		</c:if>
	</c:forEach>
	<p>합계는 ${sum}입니다.</p>
</body>
</html>