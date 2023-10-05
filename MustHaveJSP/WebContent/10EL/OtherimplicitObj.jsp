<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>
<%
	CookieManager.makeCookie(response, "ElCookie", "쿠키좋아요", 10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 값 읽기</h3>
	<ul>
		<li>EL 쿠키 값 : ${cookie.ElCookie.value}</li>
		<li>EL 쿠키 값 : <%=CookieManager.readCookie(request, "ElCookie") %></li>
	</ul>
</body>
</html>