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
	<%
		String id = (String)session.getAttribute("UserId");
		String phone = (String)session.getAttribute("UserPhone");
		String address = (String)session.getAttribute("UserAddress");
	%>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				회원정보수정
			</h1>
		</div>
	</div>
		<div class="container">
			<form action="editMemberProcess.jsp" method="post">
				<table style="margin: auto;">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" value="<%=id%>" disabled></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" name="pw"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" name="phone" placeholder="<%=phone%>"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address" placeholder="<%=address%>"></td>
					</tr>
					<tr>
						<td rowspan="2"><input type="submit" value="수정"></td>
					</tr>
				</table>
			</form>
		</div>
	<%@ include file="footer.jsp" %>
</body>
</html>