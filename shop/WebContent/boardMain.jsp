<%@page import="common.BoardPaging"%>
<%@page import="java.util.List"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sel = (String)session.getAttribute("sel");
	String search = (String)session.getAttribute("search");

	BoardDAO dao = new BoardDAO();
	
	int total_count = dao.selectCount(sel, search);
	int post_page = Integer.parseInt(application.getInitParameter("POST_PAGE"));
	int block_count = Integer.parseInt(application.getInitParameter("BLOCK_COUNT"));
	int total_page = (int)Math.ceil((double)total_count / post_page);
	
	int num = 1;
	if (request.getParameter("num") != null) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	
	int start = (num-1) * post_page + 1;
	int count = total_count - start + 1;
	
	List<BoardDTO> listOfBoard = dao.selectBoard(start, post_page, sel, search);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
	#page{
		color: red;
	}
	#page a {
		color: black;
		text-decoration: none;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%@ include file="loginCheck.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<table border="1" width="100%" style="text-align: center;">
			<tr>
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="10%">조회수</th>
				<th width="15%">작성일</th>
			</tr>
			
			<c:forEach var="listOfBoard" items="<%=listOfBoard %>">
			<tr>
				<td><%=count-- %></td>
				<td><a href="view.jsp?num=${listOfBoard.num }">${listOfBoard.title }</a></td>
				<td>${listOfBoard.id }</td>
				<td>${listOfBoard.visitcount }</td>
				<td>${listOfBoard.postdate }</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5">
					<form action="boardMainProcess.jsp">
						<select name="sel">
							<option value="title">제목</option>
							<option value="id">아이디</option>
						</select>
						<input type="text" name="search">
						<input type="submit" value="검색">
					</form>
				</td>
			</tr>
		</table>
		<table border="1" width="100%" style="border-top: none;">
			<tr id="page">
				<td align="right" style="border: none;" width="32.5%">
					<%=BoardPaging.leftStr(num) %>
				</td>
				<td align="center" style="border: none;"  width="35%">
					<%=BoardPaging.centerStr(num, block_count, total_page) %>
				</td>
				<td style="border: none;"  width="32.5%">
					<%=BoardPaging.rightStr(num, total_page) %>
				</td>
			</tr>
		</table>
		<button type="button" onclick="location.href='write.jsp;'" style="float: right; margin-top: 10px">글쓰기</button>
	</div>
</body>
</html>