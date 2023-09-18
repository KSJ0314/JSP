<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>car 빈즈로 값 가져오기</h2>
	
	<ul>
		<li>carName : <jsp:getProperty property="carName" name="Car"/> </li>
		<li>carPrice : <jsp:getProperty property="carPrice" name="Car"/> </li>
		<li>carColor : <jsp:getProperty property="carColor" name="Car"/> </li>
	</ul>
</body>
</html>