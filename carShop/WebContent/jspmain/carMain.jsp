<%@page import="dto.Car"%>
<%@page import="dto.CarRepository"%>
<%@page import="java.util.ArrayList"%>
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
		ArrayList<Car> listOfCar = new CarRepository().getListOfCar();
	%>
	
	<%
		for (Car car : listOfCar) {
			String name = car.getCarName();
	%>
		<table>
			<tr>
				<td colspan="2"><a href="carOne.jsp?name=<%=name %>">
				<img src="../resources/images/<%=name %>.png"></a></td>
			</tr>
			<tr>
				<td>모델명</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><%=car.getCarCost() %></td>
			</tr>
		</table>
	<%
		}
	%>
	
</body>
</html>