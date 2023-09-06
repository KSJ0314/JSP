<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<style>
	#head{
		padding: 20px;
	}
</style>
</head>
<body>
	<!--
		홈 버튼 글자 만들고 누르면 main.jsp로 이동
		주문하기 글자 만들고 누르면 clothmain.jsp로 이동
		main.jsp에서 인클루드
	-->
	<div id="head">
		<a href="main.jsp" class="btn btn-secondary">Home</a>
		<a href="clothmain.jsp" class="btn btn-secondary">주문하기</a>
	</div>
</body>
</html>