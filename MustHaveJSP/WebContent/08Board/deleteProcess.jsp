<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp" %>
<%
	String num = request.getParameter("num");
	String UserId = (String)session.getAttribute("UserId");
	
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = dao.selectView(num);
	
	int delResult = 0;
	if (UserId.equals(dto.getId())){
		delResult = dao.deletePost(num);
	}
	dao.close();
	
	if (delResult == 1) {
		JSFunction.alertLocation("삭제되었습니다.", "list.jsp", out);
	} else {
		JSFunction.alertBack("본인만 삭제할 수 있습니다", out);
	}
%>