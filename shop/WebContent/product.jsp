<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.productDTO"%>
<%@ page import="dao.productDAO"%>
<%@ include file="loginCheck.jsp" %>
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
	<%
		String id = request.getParameter("id");
		String uId = request.getParameter("uId");
		String UserId = (String)session.getAttribute("UserId");

		productDAO pr = new productDAO();
		productDTO product = pr.getProductById(id);
		pr.close();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="resources/images/<%=id %>.png" style="with: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%></p>
				
				<p>상품 코드 : <span class="badge badge-danger"><%=product.getProductId()%></span></p>
				<p>제조사 : <%=product.getManufacturer()%></p>
				<p>구분 : <%=product.getCategory()%></p>
				<p>재고 : <%=product.getUnitsInStock()%>개</p>
				<p>가격 : <%=product.getUnitPrice()%>원</p>
				<p>상태 : <%=product.getCondition()%></p>
				<p>
					<a href="#" class="btn btn-info">상품 주문</a>
					<% if (UserId != null && UserId.equals(uId)) { %>
					<a href="UpdateProduct.jsp?id=<%=id %>&uId=<%=uId %>" class="btn btn-secondary">상품 수정</a>
					<a href="deleteProductProcess.jsp?id=<%=id %>&uId=<%=uId %>" class="btn btn-secondary">상품 삭제</a>
					<% } %>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>











