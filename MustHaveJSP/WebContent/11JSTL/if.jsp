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
	<c:set var="num" value="99" />
	<c:set var="str" value="JSP" />
	
	<h3>짝수 홀수 판단하기</h3>
	<c:if test="${num mod 2 eq 0}" var="result">
		${num}은 짝수입니다. <br>
	</c:if>
	<c:if test="${not result}">
		${num}은 홀수입니다. <br>
	</c:if>
</body>
</html>