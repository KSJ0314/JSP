<%@page import="dto.productDTO"%>
<%@page import="common.JSFunction"%>
<%@page import="dao.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String UserId = (String)session.getAttribute("UserId");
	String id = request.getParameter("id");
	String uId = request.getParameter("uId");
	
	productDAO dao = new productDAO();
	
	productDTO dto = new productDTO();
	dto.setProductId(request.getParameter("productId"));
	dto.setPname(request.getParameter("pname"));
	dto.setUnitPrice(Integer.parseInt(request.getParameter("unitPrice")));
	dto.setDescription(request.getParameter("description"));
	dto.setManufacturer(request.getParameter("manufacturer"));
	dto.setCategory(request.getParameter("category"));
	dto.setUnitsInStock(Long.parseLong(request.getParameter("unitsInStock")));
	dto.setCondition(request.getParameter("condition"));
	dto.setUId(uId);
	
	
	if (UserId != null && UserId.equals(uId)){
		dao.updateProduct(id, dto);
		JSFunction.alertLocation("수정되었습니다.", "product.jsp?id="+id+"&uId="+uId, out);
	} else {
		JSFunction.alertLocation("작성자만 수정 가능합니다.", "products.jsp", out);
	}
	dao.close();
%>