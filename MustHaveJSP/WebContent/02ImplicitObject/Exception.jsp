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
		int status = response.getStatus();
		// 에러 코드 숫자 저장
		
		String errorMessage = "";
		if (status == 404) {
			errorMessage = "404 에러가 발생했습니다.<br>파일 경로를 확인해주세요.";
		} else if (status == 405) {
			errorMessage = "405 에러가 발생했습니다.<br>요청 방식을 확인해주세요.";
		} else if (status == 500) {
			errorMessage = "500 에러가 발생했습니다.<br>소스 코드에 오류가 없는지 확인해 주세요.";
		}
	%>
	<h2><%=errorMessage %></h2>
</body>
</html>