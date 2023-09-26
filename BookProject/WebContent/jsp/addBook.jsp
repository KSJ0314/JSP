<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="top.jsp" />
	<h2>도서 목록 수정</h2>
	<form action="addBookProcess.jsp" method="post">
		<input type="hidden" name="member_id" value="<%=(String)session.getAttribute("member_id")%>">
		<table border="1" style="width: 100%; text-align: center;">
			<tr>
				<th width="15%">도서코드</th>
				<th width="40%">제목</th>
				<th width="15%">저자</th>
				<th width="15%">가격</th>
				<th width="15%">발행일</th>
			</tr>
			<tr>
				<td><input type="text" name="book_id" required style="width: 90%;"></td>
				<td><input type="text" name="book_title" required style="width: 95%;"></td>
				<td><input type="text" name="book_author" required style="width: 90%;"></td>
				<td><input type="text" name="book_price" required style="width: 90%;"></td>
				<td><input type="text" name="book_date" required style="width: 90%;" placeholder="2023-09-26"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="4">
					<textarea name="book_content" required style="width: 95%;"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="변경" style="float: right; margin-top: 10px;">
	</form>
</body>
</html>