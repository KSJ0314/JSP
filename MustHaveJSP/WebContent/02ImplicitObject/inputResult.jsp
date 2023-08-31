<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
public int sum(int num1, int num2){
	int result = 0;
	for (int i = num1; i<=num2; i++){
		result += i;
	}
	return result;
}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
	%>
	<p><%= num1%>부터 <%= num2%>까지의 합계는 <%= sum(num1, num2)%> 입니다.</p>
</body>
</html>