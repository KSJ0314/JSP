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
		String pwError = request.getParameter("pwError");
		if (pwError != null){
			out.print("<h1>비밀번호가 틀렸습니다.</h1>");
		}
	%>
	<form action="examprocess.jsp" method="get">
		<p>이름 : <input type="text" name="name"></p>
		<p>비밀번호 : <input type="password" name="pw"></p>
		<input type="submit" value="전송">
	</form>
</body>
</html>