<%@page import="model2.mvcBoard.MVCBoardDTO"%>
<%@page import="model2.mvcBoard.MVCBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 첨부형 비회원제 게시판 - 비밀번호 확인</h2>
	<table border="1" width="90%">
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="15%">
			<col width="*">
		</colgroup>
		<tr>
			<td>번호</td>
			<td>${dto.idx}</td>
			<td>작성자</td>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${dto.postdate}</td>
			<td>조회수</td>
			<td>${dto.visitcount}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${dto.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">${dto.content}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<c:if test="${not empty dto.ofile }">
				<td>
					${dto.ofile }
					<a href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile}&idx=${dto.idx}">[다운로드]</a>
				</td>
			</c:if>
			<td>다운로드수</td>
			<td>${dto.downcount}</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<button type="button" onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${param.idx}';">수정하기</button>
			<button type="button" onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${dto.idx}';">삭제하기</button>
			<button type="button" onclick="location.href='../mvcboard/list.do';">목록보기</button>
			</td>
		</tr>
	</table>
</body>
</html>