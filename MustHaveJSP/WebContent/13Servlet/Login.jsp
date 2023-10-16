<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>아이디 비밀번호 출력하기</h2>
	<form action="./Login.do">
		id : <input type="text" name="id"><br>
		pw : <input type="text" name="pw">
		<input type="submit" value="전송">
	</form>
	<strong>${id}</strong><br>
	<strong>${pw}</strong><br>
</body>
</html>