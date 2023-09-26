<%@page import="dto.BookInfoDTO"%>
<%@page import="dao.BookInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String book_id = request.getParameter("book_id");
	BookInfoDAO dao = new BookInfoDAO();
	BookInfoDTO dto = dao.selectBook(book_id);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="top.jsp" />
	<h2>도서 상세 보기</h2>
	<table border="1" style="width: 100%; text-align: center;">
		<tr>
			<th>도서 코드</th>
			<td><%=dto.getBook_id() %></td>
		</tr>
		<tr>
			<th>작가</th>
			<td><%=dto.getBook_author() %></td>
		</tr>
		<tr>
			<th>도서 제목</th>
			<td><%=dto.getBook_title() %></td>
		</tr>
		<tr>
			<th>도서 가격</th>
			<td><%=dto.getBook_price() %></td>
		</tr>
		<tr>
			<th>도서 발행일</th>
			<td><%=dto.getBook_date() %></td>
		</tr>
		<tr>
			<th>도서 내용</th>
			<td><%=dto.getBook_content() %></td>
		</tr>
		<tr align="right">
			<td colspan="2">
				<form action="buy.jsp" method="post">
					<input type="hidden" name="book_id" value="<%=dto.getBook_id()%>">
					<select name="count">
						<option value="1">1권</option>
						<option value="2">2권</option>
						<option value="3">3권</option>
						<option value="4">4권</option>
						<option value="5">5권</option>
						<option value="6">6권</option>
						<option value="7">7권</option>
						<option value="8">8권</option>
						<option value="9">9권</option>
						<option value="10">10권</option>
					</select>
					<input type="submit" value="주문하기">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>