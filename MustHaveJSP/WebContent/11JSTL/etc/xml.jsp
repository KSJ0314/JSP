<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<c:import url="../inc/BookList.xml" var="booklist" charEncoding="utf-8" />
	<x:parse xml="${booklist}" var="blist" />
	
	<h4>파싱1</h4>
	<p>제목 : <x:out select="$blist/booklist/book[1]/name"/> </p>
	<p>저자 : <x:out select="$blist/booklist/book[1]/author"/> </p>
	<p>가격 : <x:out select="$blist/booklist/book[1]/price"/> </p>
	<p>${booklist}</p>
	
	<h4>파싱2</h4>
	<table border="1">
		<tr>
			<th>제목</th>
			<th>저자</th>
			<th>가격</th>
			<th></th>
		</tr>
		<x:forEach var="i" select="$blist/booklist/book">
			<tr>
				<td><x:out select="$i/name"/></td>
				<td><x:out select="$i/author"/></td>
				<td><x:out select="$i/price"/></td>
				<td>
					<x:choose>
						<x:when select="$i/price >= 20000">고가</x:when>
						<x:otherwise>저가</x:otherwise>
					</x:choose>
				</td>
			</tr>
		</x:forEach>
	</table>
</body>
</html>