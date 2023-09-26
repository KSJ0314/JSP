<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	String num = request.getParameter("num");
	String UserId = (String)session.getAttribute("UserId");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	
	if (UserId.equals(dto.getId())) {
		dao.deleteBoard(num);
		JSFunction.alertLocation("삭제되었습니다.", "boardMain.jsp", out);
	} else {
		JSFunction.alertBack("작성자만 삭제 가능합니다.", out);
	}
	dao.close();
%>