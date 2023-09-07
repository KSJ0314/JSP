<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<table border="1">
	<tr><td>파라미터 이름</td><td>파라미터 값</td></tr>
	<%
		Enumeration pNames = request.getParameterNames();	// request.getParameterNames()의 return 타입이 열거형
		while (pNames.hasMoreElements()) {
			String name = (String)pNames.nextElement();
			out.print("<tr><td>"+name+"</td>");
			String[] values = request.getParameterValues(name);
			String value = "";
			for (String str : values){
				value += str + " ";
			}
			out.print("<td>"+value+"</td></tr>");
		}
	%>
	</table>
</body>
</html>