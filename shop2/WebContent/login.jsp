<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td{
		padding: 5px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<c:choose>
	<c:when test="${UserName eq null}">
		<div class="container">
			<h2 align="center">${ErrorMessage}</h2>
			<form action="loginCheck.mvc" method="post">
				<table style="margin: auto;">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" required autofocus></td>
						<td rowspan="2"><input type="submit" value="로그인" style="height: 70px;"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" required></td>
					</tr>
				</table>
			</form>
		</div>
	</c:when>
	<c:otherwise>
		<div class="container">
			<h2 align="center">${UserName}님 환영합니다.</h2>
			<p align="center"><a href="welcome.jsp">돌아가기</a></p>
		</div>
	</c:otherwise>
	</c:choose>
	<%@ include file="footer.jsp" %>
</body>
</html>