<%@page import="dao.MemberDAO"%>
<%@page import="utils.JSFunction"%>
<%@page import="JDBC.SQLConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	MemberDAO dao = new MemberDAO();
	dao.addDTO(id, name, pw, phone, address , out);
	dao.close();
	
%>