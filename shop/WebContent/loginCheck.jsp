<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("UserId") == null){
		JSFunction.alertBack("회원만 방문 가능합니다.", out);
		return;
	}
%>