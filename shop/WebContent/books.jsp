<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<style>
	table, tr, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 20px;
	}
</style>
</head>
<body>
	<%
		ArrayList<Book> listBook = new BookRepository().getListOfBook();
	%>
	
	<table>
		<tr>
			<td>도서 아이디</td>
			<td>도서 이름</td>
			<td>도서 가격</td>
			<td>저자</td>
			<td>도서 설명</td>
		</tr>
	<%
		for (Book bk : listBook){
	%>
			<tr>
				<td><%=bk.getBookId() %></td>
				<td><%=bk.getBookName() %></td>
				<td><%=bk.getBookPrice() %></td>
				<td><%=bk.getAuthor() %></td>
				<td><%=bk.getDescription() %></td>
			</tr>
	<%
		}
	%>
	</table>
</body>
</html>