<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("UserId") == null){
		JSFunction.alertLocation("회원만 방문 가능합니다.", "/shop2/login.jsp", out);
		return;
	}
%>