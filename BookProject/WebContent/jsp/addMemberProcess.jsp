<%@page import="dto.MemberShipDTO"%>
<%@page import="dao.MemberShipDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.BookInfoDTO"%>
<%@page import="dao.BookInfoDAO"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberShipDTO dto = new MemberShipDTO();

	dto.setMember_id(request.getParameter("id"));
	dto.setMember_pw(request.getParameter("pw"));
	dto.setMember_name(request.getParameter("name"));
	dto.setMember_addr(request.getParameter("addr"));
	dto.setMember_tel(request.getParameter("tel"));
	
	MemberShipDAO dao = new MemberShipDAO();
	
	int result = dao.addMember(dto);
	
	if (result == 1){
		JSFunction.alertLocation("회원 추가 성공", "main.jsp", out);
	} else {
		JSFunction.alertBack("회원 추가 실패", out);
	}
	
	dao.close();
%>