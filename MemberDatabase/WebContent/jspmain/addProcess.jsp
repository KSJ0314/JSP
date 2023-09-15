<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.MysqlConnect"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String pw2 = request.getParameter("pw2");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String domain = request.getParameter("domain");
	email += domain;
	String message = request.getParameter("message");
	String[] paths = request.getParameterValues("path");
	String path = "";
	for (String str : paths){
		path += str+" ";
	}
	
	if (!pw.equals(pw2)){
		request.getRequestDispatcher("addMember.jsp?erCode=1").forward(request, response);
	}
	
	MysqlConnect ms = new MysqlConnect();
	String sql = "insert into mem (id, name, pass, tel, email, message, path) values(?,?,?,?,?,?,?)";
	PreparedStatement psmt = ms.con.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, name);
	psmt.setString(3, pw);
	psmt.setString(4, tel);
	psmt.setString(5, email);
	psmt.setString(6, message);
	psmt.setString(7, path);
	try {
		psmt.executeUpdate();
	} catch (Exception e) {
		request.getRequestDispatcher("addMember.jsp?erCode=2").forward(request, response);
	}
	ms.close();
	request.getRequestDispatcher("addMember.jsp?erCode=3").forward(request, response);
%>