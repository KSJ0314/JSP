<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
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
		response.setIntHeader("Refresh", 5);
	
		// Date today = new Date();
		// Calendar
		// LocalDate, LocalTime, LocalDateTime
		
		LocalDateTime lt = LocalDateTime.now();
		String time = lt.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
		String time2 = lt.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
		
	%>
	<h1>
		<%=time %><br>
		<%=time2 %>
	</h1>
</body>
</html>