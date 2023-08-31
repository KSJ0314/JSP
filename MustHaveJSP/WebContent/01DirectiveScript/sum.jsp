<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	
public int sum(){
	int result = 0;
	for (int i = 1; i <= 100; i++){
		result += i;
	}
	return result;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1부터 100까지의 합계는 <%= sum()%>입니다.</h3>
</body>
</html>