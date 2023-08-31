<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includeFile2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><%= name%>님 <%= today.getHour()%>시 <%= today.getMinute() %>분에 출석하셨습니다.</p>
</body>
</html>