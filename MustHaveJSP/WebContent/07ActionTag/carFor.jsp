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
	<ul>
		<li>모델명 : <jsp:getProperty property="carName" name="car"/></li>
		<li>가격 : <jsp:getProperty property="carPrice" name="car"/></li>
		<li>색상 : <jsp:getProperty property="carColor" name="car"/></li>
		<li>회사 : <%=request.getParameter("carCom") %></li>
		<li>최고속도 : <%=request.getParameter("maxSpeed") %></li>
	</ul>
</body>
</html>