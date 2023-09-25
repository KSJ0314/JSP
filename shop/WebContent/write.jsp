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
<style>
	td{
		padding: 5px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%@ include file="loginCheck.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">글쓰기</h1>
		</div>
	</div>
		<div class="container" align="center">
			<div class="col-md-4 col-md-offset-5">
				<form name="write" class="form-signin" action="writeProcess.jsp" method="post">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="제목" name="title" required autofocus>
					</div>
					<div class="form-group">
						<textarea class="form-control" placeholder="내용" name="content" required></textarea>
					</div>
					<button class="btn btn-lg btn-success btn-block" type="submit">글작성</button>
				</form>
			</div>
		</div>
	<%@ include file="footer.jsp" %>
</body>
</html>