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
	<h3>리스트컬렉션</h3>
	<%
		LinkedList<Person> list = new LinkedList<>();
		list.add(new Person("맹사성", 34));
		list.add(new Person("장영실", 44));
		list.add(new Person("신숙주", 54));
	%>
	<c:forEach var="p" items="<%=list %>">
		<span>${p.name}</span>
		<span>${p.age}</span> <br>
	</c:forEach>
	
	<h3>맵컬렉션</h3>
	<%
		Map<String, Person> map = new HashMap<>();
		map.put("1st", new Person("맹사성", 34));
		map.put("2st", new Person("장영실", 44));
		map.put("3st", new Person("신숙주", 54));
	%>
	<c:forEach var="p" items="<%=map %>">
		<span>${p.value.name}</span>
		<span>${p.value.age}</span> <br>
	</c:forEach>
</body>
</html>