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
		String carName = request.getParameter("carName");
		int carPrice = Integer.parseInt(request.getParameter("carPrice"));
		String carColor = request.getParameter("carColor");
	%>
	<jsp:useBean id="car" class="common.Car" scope="request" />
	<jsp:setProperty property="carName" name="car" value="<%=carName %>"/>
	<jsp:setProperty property="carPrice" name="car" value="<%=carPrice %>"/>
	<jsp:setProperty property="carColor" name="car" value="<%=carColor %>"/>
	
	<h2>car 빈즈로 값 가져오기</h2>
	<ul>
		<li>carName : <jsp:getProperty property="carName" name="car"/> </li>
		<li>carPrice : <jsp:getProperty property="carPrice" name="car"/> </li>
		<li>carColor : <jsp:getProperty property="carColor" name="car"/> </li>
	</ul>
</body>
</html>