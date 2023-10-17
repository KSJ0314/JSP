<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<style>
	#page {
		color: red;
	}
	#page a {
		color: black;
		text-decoration: none;
	}
</style>
</head>
<body>
	<h2>파일 첨부형 비회원제 게시판</h2>
	<form action="#" method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord">
					<input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty boardList}">
				<tr>
					<td colspan="6" align="center">글 없음</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${boardList}" varStatus="dtoSt">
					<tr align="center">
						<td>${map.totalCount - (((map.pageNum-1)*map.pageSize)+dtoSt.index)}</td>
						<td align="left"><a href="View.jsp?idx=${dto.idx}">${dto.title}</a></td>
						<td>${dto.name}</td>
						<td>${dto.visitcount}</td>
						<td>${dto.postdate}</td>
						<td>
							<c:if test="${not empty dto.ofile}">
								<a href="../mvcboard/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}">[다운로드]</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<table border="1" width="90%">
		<tr align="center">
			<td id="page">${map.pagingStr}</td>
			<td width="100">
				<button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
			</td>
		</tr>
	</table>
	
</body>
</html>