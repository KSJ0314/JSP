<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	BoardDTO dto = new BoardDTO();
	dto.setId((String)session.getAttribute("UserId"));
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	
	BoardDAO dao = new BoardDAO();
	int result = dao.insertBoard(dto);
	dao.close();
	if (result == 1) {
		JSFunction.alertLocation("게시물 작성이 완료되었습니다.", "boardMain.jsp", out);
	} else {
		JSFunction.alertBack("작성이 실패하였습니다.", out);
	}
%>