<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Car"%>
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
		Map<Integer, Car> maps = new HashMap<>();
		maps.put(0, new Car("현대", 10000000, "검정"));
		maps.put(1, new Car("기아", 20000000, "흰색"));
		application.setAttribute("car", maps);
		
	%>
</body>
</html>