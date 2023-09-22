<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="welcome.jsp">홈</a>
				<% if (session.getAttribute("UserId") != null) {%>
				<a class="navbar-brand" href="products.jsp">상품정보</a>
				<a class="navbar-brand" href="addProduct.jsp">상품등록</a>
				<% } %>
			</div>
			<div class="navbar-header justify-content-end">
				<% if (session.getAttribute("UserId") != null) {%>
					<a class="navbar-brand" href="login.jsp" style="color: green; font-size: 1em;"><%= (String)session.getAttribute("UserId")%>님</a>
				<% } %>
				<% if (session.getAttribute("UserName") == null) {%>
					<a class="navbar-brand" href="login.jsp">로그인</a>
				<% } else { %>
					<a class="navbar-brand" href="logout.jsp">로그아웃</a>
					<a class="navbar-brand" href="editMember.jsp">회원정보수정</a>
					<a class="navbar-brand" href="deleteMember.jsp">회원탈퇴</a>
				<% } %>
				<a class="navbar-brand" href="addMember.jsp">회원가입</a>
			</div>
		</div>
</nav>