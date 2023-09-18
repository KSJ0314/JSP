<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="car" class="common.Car" scope="request" />
	<jsp:setProperty property="carName" name="car" value="캐스퍼"/>
	<jsp:setProperty property="carPrice" name="car" value="20000000"/>
	<jsp:setProperty property="carColor" name="car" value="검정"/>
	<jsp:forward page="carFor.jsp">
		<jsp:param value="현대" name="carCom"/>
		<jsp:param value="300" name="maxSpeed"/>
	</jsp:forward>
</body>
</html>