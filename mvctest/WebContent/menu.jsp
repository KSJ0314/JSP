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
	<a href="/mvctest/main.jsp">[홈]</a>
	<c:choose>
		<c:when test="${empty UserId}">
			<a href="/mvctest/mvc/login">[로그인]</a>
			<a href="/mvctest/mvc/add">[회원가입]</a>
		</c:when>
		<c:otherwise>
			<a href="/mvctest/mvc/logout">[로그아웃]</a>
			<a href="/mvctest/mvc/edit">[회원수정]</a>
			<a href="/mvctest/mvc/delete">[회원탈퇴]</a>
		</c:otherwise>
	</c:choose>
</body>
</html>