<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("member_id")==null){
		JSFunction.alertBack("회원만 이용가능합니다.", out);
		return;
	}
%>