<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("UserId");
	Map<String, String> data = new HashMap<>();
	data.put("pw", request.getParameter("pw"));
	data.put("phone", request.getParameter("phone"));
	data.put("address", request.getParameter("address"));
	
	MemberDAO dao = new MemberDAO();
	dao.updateDTO(id, data, out);
	dao.close();
%>