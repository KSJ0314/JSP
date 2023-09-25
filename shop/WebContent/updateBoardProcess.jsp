<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String UserName = (String)session.getAttribute("UserName");

	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	if (UserName.equals(dto.getName())) {
		dao.updateBoard(dto);
		JSFunction.alertLocation("수정되었습니다.", "view.jsp?num="+num, out);
	} else {
		JSFunction.alertBack("작성자만 수정 가능합니다.", out);
	}
	dao.close();
%>