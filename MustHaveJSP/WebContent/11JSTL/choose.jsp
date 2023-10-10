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
	<c:set var="num" value="100" />
	
	<h3>choose 태그로 홀짝 출력</h3>
	
	<c:choose>
		<c:when test="${num mod 2 eq 0 }">짝수</c:when>
		<c:otherwise >홀수</c:otherwise>
	</c:choose>
</body>
</html>