<%@page import="dto.ClothRepository"%>
<%@page import="dto.Cloth"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#img{
		width: 500px;
		float: left;
		margin-right: 20px;
	}
</style>
</head>
<body>
	<%@ include file="head.jsp" %>
	<%
		String id = request.getParameter("id");
		Cloth cloth = new ClothRepository().getCloth(id);
	%>
	<div id="img">
		<img src="../resources/images/<%=cloth.getClothId() %>.jpg" style="width: 100%">
	</div>
	<div id="text">
		<h3>상품 아이디 : <%=cloth.getClothId() %></h3>
		<h3>상품명 : <%=cloth.getClothName() %></h3>
		<h3>상품 가격 : <%=cloth.getClothCost() %></h3>
		<h3>상품 사이즈 : <%=cloth.getClothSize() %></h3>
		<h3>상품 색상 : <%=cloth.getClothColor() %></h3>
	</div>
	<%@ include file="bottom.jsp" %>
</body>
</html>