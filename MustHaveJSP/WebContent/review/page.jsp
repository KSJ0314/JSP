<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date dt = new Date();
		SimpleDateFormat sdt = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		String now = sdt.format(dt);
	%>
	<p>현재 시간 : <span id="time"><%=now %></span></p>
</body>
</html>