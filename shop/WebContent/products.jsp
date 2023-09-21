<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.productDTO"%>
<%@ page import="dao.productDAO"%>
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
			<%
				/* 				if(session.getAttribute("pr")==null){
							session.setAttribute("pr", new ProductRepository());
						}
						ProductRepository pr = (ProductRepository)session.getAttribute("pr"); */
						productDAO pr = new productDAO();
						
						ArrayList<productDTO> listOfProduct = pr.getAllProducts();
						pr.close();
						for (productDTO lp : listOfProduct) {
							String productId = lp.getProductId();
			%>
					<div class="col-md-4">
						<img src="resources/images/<%=productId %>.png" style="with: 100%">
						<div id="box">
							<h3><%=lp.getPname()%></h3>
							<h3><%=lp.getDescription()%></h3>
							<h3><%=lp.getUnitPrice()%></h3>
						</div>
						<p><a href="product.jsp?id=<%=productId%>"
						class="btn btn-secondary" role="button">상세보기</a></p>
					</div>
			<%
				}
			%>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>











