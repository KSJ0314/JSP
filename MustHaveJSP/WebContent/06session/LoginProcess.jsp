<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	
	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
	MemberDTO dto = dao.getMemberDTO(user_id, user_pw);
	dao.close();
	
	if (dto.getId() != null){
		session.setAttribute("UserId", dto.getId());
		session.setAttribute("UserName", dto.getName());
	} else {
		request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	}
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
%>