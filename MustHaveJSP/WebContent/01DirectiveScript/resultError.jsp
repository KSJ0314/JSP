<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 에러가 발생했습니다. </h3>
	<p>
		오류명 : <%= exception.getClass().getName() %> <br />
		오류 메시지 : <%= exception.getMessage() %>
	</p>
</body>
</html>