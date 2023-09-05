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
		String message = "";
		if (id.equals("jsp")) {
			if (pw.equals("1234")){
				message = "환영합니다.";
			} else {
				message = "비밀번호가 틀립니다.";
			}
		} else {
			message = "사용할 수 없는 아이디입니다.";
		}
	%>
	<h2><%=message %></h2>
</body>
</html>