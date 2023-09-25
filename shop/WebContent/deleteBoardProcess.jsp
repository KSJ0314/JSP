<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	String num = request.getParameter("num");
	String UserName = (String)session.getAttribute("UserName");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	
	if (UserName.equals(dto.getName())) {
		dao.deleteBoard(num);
		JSFunction.alertLocation("삭제되었습니다.", "boardMain.jsp", out);
	} else {
		JSFunction.alertBack("작성자만 삭제 가능합니다.", out);
	}
	dao.close();
%>