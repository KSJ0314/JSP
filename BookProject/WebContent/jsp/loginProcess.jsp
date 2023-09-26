<%@page import="common.JSFunction"%>
<%@page import="dto.MemberShipDTO"%>
<%@page import="dao.MemberShipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberShipDAO dao = new MemberShipDAO();
	MemberShipDTO dto = dao.selectMember(id);
	
	if (dto.getMember_pw()!=null && dto.getMember_pw().equals(pw)){
		session.setAttribute("member_id", dto.getMember_id());
		session.setAttribute("member_name", dto.getMember_name());
		JSFunction.alertLocation(dto.getMember_name()+"님 환영합니다.", "main.jsp", out);
	} else {
		JSFunction.alertBack("아이디나 비밀번호가 틀렸습니다.", out);
	}
	
	dao.close();
%>