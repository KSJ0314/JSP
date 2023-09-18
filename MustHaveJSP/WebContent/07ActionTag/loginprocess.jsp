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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		request.setAttribute("id",id);
		pageContext.setAttribute("pw", pw);
	%>
	<jsp:forward page="loginprocess2.jsp" />
</body>
</html>