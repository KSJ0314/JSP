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
		String fruitNone = request.getParameter("fruitNone");
		if (fruitNone != null) out.println("좋아하는 과일이 없군요!!!");
	%>
	<h1>좋아하는 과일을 선택하세요!!!</h1>
	<form action="choiceResult.jsp" method="post">
		<select name="fruit">
			<option value="사과">사과</option>
			<option value="딸기">딸기</option>
			<option value="바나나">바나나</option>
			<option value="포도">포도</option>
			<option value="귤">귤</option>
			<option value="none">없음</option>
		</select>
		<input type="submit" value="보내기">
	</form>
</body>
</html>