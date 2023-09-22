<%@page import="common.JSFunction"%>
<%@page import="dao.productDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String UserId = (String)session.getAttribute("UserId");
	String id = request.getParameter("id");
	String uId = request.getParameter("uId");
	productDAO dao = new productDAO();
	if (UserId != null && UserId.equals(uId)){
		dao.deleteProduct(id);
		JSFunction.alertLocation("삭제되었습니다.", "products.jsp", out);
	} else {
		JSFunction.alertBack("작성자만 삭제 가능합니다.", out);
	}
	dao.close();
%>