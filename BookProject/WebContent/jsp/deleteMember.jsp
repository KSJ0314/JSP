<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="top.jsp" />
	<form action="deleteMemberProcess.jsp" method="post">
		비밀번호 : <input type="pw" name="pw">
		<input type="submit" value="전송">
	</form>
</body>
</html>