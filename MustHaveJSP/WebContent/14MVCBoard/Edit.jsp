<%@page import="model2.mvcBoard.MVCBoardDTO"%>
<%@page import="model2.mvcBoard.MVCBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setAttribute("pw", request.getAttribute("pw"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 첨부형 비회원제 게시판 - 수정하기</h2>
	<form action="../mvcboard/edit.do" name="writeFrm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="idx" value="${dto.idx}">
	<input type="hidden" name="preOfile" value="${dto.ofile}">
	<input type="hidden" name="preSfile" value="${dto.sfile}">
		<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="name" style="width: 150px;" value="${dto.name }" required>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width: 90%;" value="${dto.title }" required>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width: 90%; height: 100px;" required>${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="fileName" value="${dto.sfile }">
				</td> 
			</tr>
			<tr>
				<td colspan="3" align="center">
					<button type="submit">작성 완료</button>
					<button type="reset">다시 입력</button>
					<button type="button" onclick="location.href='../mvcboard/view.do?idx=${param.idx}';">돌아가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>