<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	String num = request.getParameter("num");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시물 상세보기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시물 상세보기</h1>
		</div>
	</div>
	<div class="container">
		<form action="updateBoardProcess.jsp" method="post">
		<input type="hidden" name="num" value="<%=num %>">
		<table border="1" width="100%" style="text-align: center;">
			<tr>
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="10%">이름</th>
				<th width="20%">작성일자</th>
				<th width="10%">조회수</th>
			</tr>
			<tr>
				<td><%=dto.getNum()%></td>
				<td>
					<input type="text" name="title" value="<%=dto.getTitle()%>" style="width: 100%;">
				</td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getPostdate()%></td>
				<td><%=dto.getVisitcount()%></td>
			</tr>
			<tr>
				<td width="10%">내용</td>
				<td colspan="4" height="200px" align="left">
					<textarea style="height: 90%; width: 100%" name="content"><%=dto.getContent() %></textarea>
				</td>
			</tr>
		</table>
		<br>
		<button class="btn btn-lg btn-info btn-block" onclick="#" type="submit">수정 완료</button>
		</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>