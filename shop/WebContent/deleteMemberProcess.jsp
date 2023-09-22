<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="common.SQLConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pw = request.getParameter("pw");
	String id = (String)session.getAttribute("UserId");
	
	MemberDAO dao = new MemberDAO();
	dao.deleteDTO(id, pw, out);
	dao.close();
%>