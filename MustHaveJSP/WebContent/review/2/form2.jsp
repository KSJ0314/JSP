<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="form2Process.jsp" method="post">
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="password" name="pw"></p>
		<p>이름 : <input type="text" name="name"></p>
		<p>성별 : 
			<input type="radio" name="gen" value="남성"> 남성
			<input type="radio" name="gen" value="여성"> 여성
		</p>
		<p>취미 : 
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="영화">영화
		</p>
		<input type="submit" value="전송">
	</form>
</body>
</html>