<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>가을 최고 여행지는?</h1>
	<form action="responseProcess.jsp" method="get">
		<select name="travel">
			<option value="https://namu.wiki/w/%EB%B3%B4%EB%9D%BC%EC%B9%B4%EC%9D%B4">보라카이</option>
			<option value="https://namu.wiki/w/%EC%84%B8%EB%B6%80">세부</option>
			<option value="https://namu.wiki/w/%ED%8C%8C%EB%A6%AC(%ED%94%84%EB%9E%91%EC%8A%A4)">파리</option>
			<option value="https://namu.wiki/w/%EB%9F%B0%EB%8D%98">런던</option>
		</select>
		<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>