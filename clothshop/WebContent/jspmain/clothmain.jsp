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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<style>
	#cloth{
		width: 300px;
		float: left;
		border: 1px solid gray;
	}
	#container{
		width: 900px;
		margin: auto;
	}
	#aa{
		display:block;
		width: 95px;
		margin: 10px auto;
	}
</style>
</head>
<body>
	<%@ include file="head.jsp" %>
	<%
		ArrayList<Cloth> listOfCloth = new ClothRepository().getListOfCloth();
	%>
		<div id="container">
	<%
		for (Cloth cloth : listOfCloth){
	%>
			<div id="cloth">
				<img src="../resources/images/<%=cloth.getClothId() %>.jpg" style="width: 100%">
				<h5>상품 아이디 : <%=cloth.getClothId() %></h5>
				<h5>상품명 : <%=cloth.getClothName() %></h5>
				<a href="clothone.jsp?id=<%=cloth.getClothId() %>" class="btn btn-info" id="aa">상세 보기</a>
			</div>
	<%
		}
	%>
		</div>
	<%@ include file="bottom.jsp" %>
</body>
</html>