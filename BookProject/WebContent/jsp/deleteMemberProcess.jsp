<%@page import="common.JSFunction"%>
<%@page import="dto.MemberShipDTO"%>
<%@page import="dao.MemberShipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("member_id");
	String pw = request.getParameter("pw");
	
	MemberShipDAO dao = new MemberShipDAO();
	MemberShipDTO dto = dao.selectMember(id);
	
	if (dto.getMember_pw()!=null && dto.getMember_pw().equals(pw)){
		dao.deleteMember(id);
		JSFunction.alertLocation("탈퇴되었습니다.", "logout.jsp", out);
	} else {
		JSFunction.alertBack("탈퇴 실패", out);
	}
	
	dao.close();
%>
