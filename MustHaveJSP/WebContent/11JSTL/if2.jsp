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
	<form>
		<input type="text" name="num">
		<input type="submit" value="입력">
	</form>
	<c:if test='${!empty param.num}'>
		<c:if test="${param.num mod 3 eq 0 }" var="mod3">
			${param.num}은 3의 배수입니다.
		</c:if>
		<c:if test="${!mod3}">
			${param.num}은 3의 배수가 아닙니다.
		</c:if>
	</c:if>
</body>
</html>