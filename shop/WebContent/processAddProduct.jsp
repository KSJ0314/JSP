<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.productDTO"%>
<%@ page import="dao.productDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String productId = request.getParameter("productId");	
		String pname = request.getParameter("pname");
		Integer unitPrice = 0;
		if (!request.getParameter("unitPrice").isEmpty()){
			unitPrice = Integer.valueOf(request.getParameter("unitPrice"));	
		}
		String description = request.getParameter("description");	
		String manufacturer = request.getParameter("manufacturer");
		String category = request.getParameter("category");
		long unitsInStock = 0;
		if (!request.getParameter("unitsInStock").isEmpty()){
			unitsInStock = Long.parseLong(request.getParameter("unitsInStock"));
		}
		String condition = request.getParameter("condition");
		String uId = (String)session.getAttribute("UserId");
		
		
		
		productDTO product = new productDTO();
		
		product.setProductId(productId);
		product.setPname(pname);
		product.setUnitPrice(unitPrice);
		product.setDescription(description);
		product.setManufacturer(manufacturer);
		product.setCategory(category);
		product.setUnitsInStock(unitsInStock);
		product.setCondition(condition);
		product.setUId(uId);
		
		/* ProductRepository pr = (ProductRepository)session.getAttribute("pr"); */
		productDAO pr = new productDAO();
		int addResult = pr.addProduct(product);
		pr.close();
		if (addResult == 1){
			JSFunction.alertLocation("상품 추가 성공", "products.jsp", out);
		} else {
			JSFunction.alertBack("상품 추가 실패", out);
		}
		
	%>
</body>
</html>