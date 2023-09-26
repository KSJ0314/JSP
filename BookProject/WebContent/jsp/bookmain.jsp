<%@page import="dao.BookInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	BookInfoDAO dao = new BookInfoDAO();
	List<BookInfoDTO> listOfBookInfo = dao.getListOfBookInfo();
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
	<h2>도서 목록 보기</h2>
	<table border="1" style="width: 100%; text-align: center;">
		<tr>
			<th width="10%">저자</th>
			<th width="50%">제목</th>
			<th width="20%">가격</th>
			<th width="20%">발행일자</th>
		</tr>
		<% for (BookInfoDTO dto : listOfBookInfo){ %>
		<tr>
			<td><%=dto.getBook_author() %></td>
			<td><a href="book.jsp?book_id=<%=dto.getBook_id()%>"><%=dto.getBook_title() %></a></td>
			<td><%=dto.getBook_price() %></td>
			<td><%=dto.getBook_date() %></td>
		</tr>
		<% }%>
	</table>
	<button type="button" onclick="location.href='addBook.jsp';"  style="float: right; margin-top: 10px;">도서추가</button>
</body>
</html>