<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.productDTO"%>
<%@ page import="dao.productDAO"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// multipart/form-data 타입 form값 받기
		String saveDirectory = application.getRealPath("/resources/images");
		int maxSize = 1024 * 1024 * 5;
		String enc = "utf-8";
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, enc, new DefaultFileRenamePolicy());
	
		
		String productId = mr.getParameter("productId");	
		String pname = mr.getParameter("pname");
		Integer unitPrice = 0;
		if (!mr.getParameter("unitPrice").isEmpty()){
			unitPrice = Integer.valueOf(mr.getParameter("unitPrice"));	
		}
		String description = mr.getParameter("description");	
		String manufacturer = mr.getParameter("manufacturer");
		String category = mr.getParameter("category");
		long unitsInStock = 0;
		if (!mr.getParameter("unitsInStock").isEmpty()){
			unitsInStock = Long.parseLong(mr.getParameter("unitsInStock"));
		}
		String condition = mr.getParameter("condition");
		String uId = (String)session.getAttribute("UserId");
		String productImage = mr.getFilesystemName("productImage");
		
		File file = new File(saveDirectory+File.separator+productImage);
		
		
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
		product.setProductImage(productImage);
		
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