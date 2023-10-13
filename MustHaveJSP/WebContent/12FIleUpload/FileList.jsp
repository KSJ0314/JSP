<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.MyfileDAO"%>
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
	<h2>데이터베이스에 등록된 파일 목록 보기</h2>
	<a href="FileUploadMain.jsp">파일 등록하기</a>
	<%
		MyfileDAO dao = new MyfileDAO();
		List<MyfileDTO> fileList = dao.myFileList();
		dao.close();
	%>
	<table border="1">
		<tr>
			<th>순서</th>
			<th>작성자</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본 파일명</th>
			<th>저장된 파일명</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="i" items="<%=fileList %>">
			<tr>
				<td>${i.idx }</td>
				<td>${i.name }</td>
				<td>${i.title }</td>
				<td>${i.cate }</td>
				<td>${i.ofile }</td>
				<td>${i.sfile }</td>
				<td>${i.postdate }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>