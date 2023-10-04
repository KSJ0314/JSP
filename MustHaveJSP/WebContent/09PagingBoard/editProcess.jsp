<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String UserId = (String)session.getAttribute("UserId");
	
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	BoardDAO dao = new BoardDAO(application);
	int affected = dao.updateEdit(dto);
	dao.close();
	
	if (affected == 1) {
		response.sendRedirect("view.jsp?num="+num);
	} else {
		JSFunction.alertBack("수정하기 실패했습니다.", out);
	}
%>