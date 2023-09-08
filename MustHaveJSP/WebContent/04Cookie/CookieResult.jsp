<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키값 확인하기</h2>
	<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null){
		for (Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			out.print(cookieName + " : " +cookieValue + "<br>");
		}
	}
	%>
</body>
</html>