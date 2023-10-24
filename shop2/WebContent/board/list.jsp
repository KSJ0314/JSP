<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<jsp:include page="/loginCheck.jsp" />
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="text-right">
			<span class="badge badge-success">전체${total_row}건</span>
		</div>
		<form action="<c:url value='/list.board'/>" method="post">
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<th width="10%">번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회</th>
					<th>글쓴이</th>
				</tr>
				<c:forEach var="i" items="${boardlist }">
					<tr>
						<td>${i.num }</td>
						<td><a href="<c:url value='/view.board?num=${i.num}&pageNum=${pageNum}'/>">${i.title }</a></td>
						<td>${i.regist_day }</td>
						<td>${i.hit }</td>
						<td>${i.name }</td>
					</tr>
				</c:forEach>
			</table>
			<table style="width: 100%;">
				<tr align="center" height="50">
					<td colspan="3">
					<c:forEach var="i" begin="1" end="${total_page}">
						<c:choose>
							<c:when test="${i eq pageNum}">
								<font color="red"><b>[${i }]</b></font>
							</c:when>
							<c:otherwise>
								<a href="<c:url value='/list.board?pageNum=${i}' />">
									<font color="black"><b>[${i }]</b></font>
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</td>
				</tr>
				<tr height="50">
					<td width="10%">
						<select name="items">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="name">글쓴이</option>
						</select>
					</td>
					<td>
						<input type="text" name="text">
						<input type="submit" value="입력">
					</td>
					<td align="right">
						<a class="btn btn-primary" href="<c:url value='/write.board'/>" >글쓰기</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>