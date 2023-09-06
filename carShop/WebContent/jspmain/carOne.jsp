<%@page import="dto.Car"%>
<%@page import="dto.CarRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/css.css">
</head>
<body>
	<%
		String name = request.getParameter("name");
		Car car = new CarRepository().getCar(name);
	%>

	<table>
		<tr>
			<td colspan="2"><img src="../resources/images/<%=name%>.png"></td>
		</tr>
		<tr>
			<td>모델명</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><%=car.getCarCost()%></td>
		</tr>
		<tr>
			<td>연료</td>
			<td><%=car.getCarFuel()%></td>
		</tr>
		<tr>
			<td>출시년도</td>
			<td><%=car.getCarYear()%></td>
		</tr>
		<tr>
			<td>출력</td>
			<td><%=car.getCarPower()%></td>
		</tr>
	</table>
</body>
</html>