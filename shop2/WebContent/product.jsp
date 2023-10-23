<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.productDTO"%>
<%@ page import="dao.productDAO"%>
<%@ include file="loginCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");

	productDAO pr = new productDAO();
	productDTO product = pr.getProductById(id);
	pr.close();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 상세 정보</h1>
		</div>
	</div>
	<c:set var="pr" value="<%=product %>" />
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="resources/images/${pr.productImage}" style="with: 100%">
			</div>
			<div class="col-md-5">
				<h3>${pr.pname}</h3>
				<p>${pr.description}</p>
				<p>상품 코드 : <span class="badge badge-danger">${pr.productId}</span></p>
				<p>제조사 : ${pr.manufacturer}</p>
				<p>구분 : ${pr.category}</p>
				<p>재고 : ${pr.unitsInStock}개</p>
				<p>가격 : ${pr.unitPrice}원</p>
				<p>상태 : ${pr.condition}</p>
				<p>
					<a href="#" class="btn btn-info">상품 주문</a>
					<c:if test="${UserId != null && UserId eq param.uId }">
						<a href="UpdateProduct.jsp?id=${param.id}&uId=${param.uId}" class="btn btn-secondary">상품 수정</a>
						<a href="deleteProductProcess.jsp?id=${param.id}&uId=${param.uId}" class="btn btn-secondary">상품 삭제</a>
					</c:if>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>











