<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="JDBC.SQLConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getDTO(id, pw);
	if (dto.getId() != null){
		session.setAttribute("UserId", dto.getId());
		session.setAttribute("UserName", dto.getName());
		session.setAttribute("UserPhone", dto.getName());
		session.setAttribute("UserAddress", dto.getName());
	} else {
		request.setAttribute("ErrorMessage", "아이디나 비밀번호가 일치하지 않습니다.");
	}
	dao.close();
	request.getRequestDispatcher("login.jsp").forward(request, response);
	
%>