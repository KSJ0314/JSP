<%@page import="dto.BookInfoDTO"%>
<%@page import="dao.BookInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String)session.getAttribute("member_id");
	String book_id = request.getParameter("book_id");
	String count = request.getParameter("count");
	
	BookInfoDAO dao = new BookInfoDAO();
	BookInfoDTO dto = dao.selectBook(book_id);
	dao.close();
	
	int totalMoney = Integer.parseInt(count) * dto.getBook_price(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="top.jsp" />
	<h2>구매 성공</h2>
	<table border="1" style="width: 100%; text-align: center;">
		<tr>
			<th>도서명</th>
			<td><%=dto.getBook_title() %></td>
		</tr>
		<tr>
			<th>구매 수량</th>
			<td><%=count %></td>
		</tr>
		<tr>
			<th>총 가격</th>
			<td><%=totalMoney %></td>
		</tr>
	</table>
</body>
</html>