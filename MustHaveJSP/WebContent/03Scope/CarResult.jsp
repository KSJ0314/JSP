<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
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
		Map<Integer, Car> maps = (Map<Integer, Car>)(application.getAttribute("car"));
		Set<Integer> keys = maps.keySet();
		
		Iterator<Integer> iterator = keys.iterator();	// while 형식
		while (iterator.hasNext()){
			Car car = maps.get(iterator.next());
			out.print(car.getCarName()+ " : " + car.getCarPrice() + "<br>");
		}
		
		out.print("<br>");
		
		Iterator<Integer> iterator2 = keys.iterator();	// for문 형식
		for (int i = 0; i < keys.size(); i++){
			Car car = maps.get(iterator2.next());
			out.print(car.getCarName()+ " : " + car.getCarPrice() + "<br>");
		}
		
		out.print("<br>");
		
		for (int key : keys){							// 향상된 for문 형식
			Car car = maps.get(key);
			out.print(car.getCarName()+ " : " + car.getCarPrice() + "<br>");
		}
	%>
</body>
</html>