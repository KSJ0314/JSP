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
		String requestPerson = request.getParameter("requestPerson");
	%>
	
	<h3>Forward2 : <%=requestPerson %></h3>
</body>
</html>