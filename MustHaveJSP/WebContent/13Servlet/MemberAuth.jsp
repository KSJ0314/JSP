<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MVC2 패턴으로 회원 인증</h2>
	<p>
		<b>${authMessage}</b><br>
		<a href="./MemberAuth.mvc?id=sojung&pw=1234">회원인증(관리자)</a>&emsp;
		<a href="./MemberAuth.mvc?id=java&pw=1234">회원인증(회원)</a>&emsp;
		<a href="./MemberAuth.mvc?id=stranger&pw=1234">회원인증(비회원)</a>&emsp;
	</p>
</body>
</html>