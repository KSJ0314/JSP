<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.productDTO"%>
<%@ page import="dao.productDAO"%>
<%@ include file="loginCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	productDAO pr = new productDAO();
	ArrayList<productDTO> listOfProduct = pr.getAllProducts();
	pr.close();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<c:forEach var="lp" items="<%=listOfProduct%>">
				<div class="col-md-4">
					<img src="resources/images/${lp.productImage}" style="with: 300px; height: 200px;">
					<div id="box">
						<h3>${lp.pname}</h3>
						<h3>${lp.description}</h3>
						<h3>${lp.unitPrice}</h3>
					</div>
					<p><a href="product.jsp?id=${lp.productId}&uId=${lp.uId}"
					class="btn btn-secondary" role="button">상세보기</a></p>
				</div>
			</c:forEach>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>











