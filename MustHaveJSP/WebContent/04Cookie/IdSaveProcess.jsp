<%@page import="utils.CookieManager"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String save_check = request.getParameter("save_check");
	
	if (user_id.equals("java") && user_pw.equals("1234")){
		if (save_check != null && save_check.equals("Y")) {
			CookieManager.makeCookie(response, "loginId", user_id, 60*60*24);
		} else {
			CookieManager.deleteCookie(response, "loginId");
		}
		JSFunction.alertLocation("로그인 성공", "idSaveMain.jsp", out);
	} else {
		JSFunction.alertBack("로그인 실패", out);
	}
	
	
	
%>