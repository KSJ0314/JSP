<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<% if (session.getAttribute("member_id")!=null) {%>
		<a href="bookmain.jsp">도서목록</a>
		<% } %>
		
		<% if (session.getAttribute("member_id")==null) {%>
		<a href="login.jsp">로그인</a>
		<a href="addMember.jsp">회원가입</a>
		<% } else { %>
		<a href="logout.jsp">로그아웃</a>
		<a href="deleteMember.jsp">회원탈퇴</a>
		<% } %>
	</div>
</body>
</html>