<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				회원탈퇴
			</h1>
		</div>
	</div>
		<div class="container">
			<h2 align="center">
				<%
					if (request.getAttribute("ErrorMessage") != null){
						out.print(request.getAttribute("ErrorMessage"));
					}
				%>
			</h2>
			<form action="deleteMemberProcess.jsp" method="post" align="center">
				비밀번호 <input type="password" name="pw" required autofocus>
				<input type="submit" value="입력">
			</form>
		</div>
	<%@ include file="footer.jsp" %>
</body>
</html>