<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sel = request.getParameter("sel");
	String search = request.getParameter("search");
	session.setAttribute("sel", sel);
	session.setAttribute("search", search);
	response.sendRedirect("boardMain.jsp");
%>