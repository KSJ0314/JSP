<%@page import="dao.TestDAO"%>
<%@page import="dto.TestDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String grade = request.getParameter("grade");

	int start = 0;
	int end = 101;
	if (grade != null){
		switch(grade){
			case "A":
				start = 90;
				end = 101;
				break;
			case "B":
				start = 80;
				end = 90;
				break;
			case "C":
				start = 70;
				end = 80;
				break;
			case "D":
				start = 60;
				end = 70;
				break;
			case "F":
				end = 60;
				break;
		}
	}

	TestDAO dao = new TestDAO();
	ArrayList<TestDTO> listTest = dao.selectAll(start, end);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="listOfTest" value="<%=listTest %>" />
	<table border="1" style="width: 80%; margin: auto; text-align: center;">
		<form>
			<tr>
				<td colspan="5">
				학점 : <input type="text" name="grade">
				<input type="submit" value="찾기">
				</td>
			</tr>
		</form>
		<tr>
			<th>학번</th>
			<th>국어</th>
			<th>수학</th>
			<th>영어</th>
			<th>평균</th>
		</tr>
		<c:forEach var="test" items="${listOfTest}">
			<c:set var="avg" value="${(test.kor+test.math+test.eng)/3 }" />
			<tr>
				<td>${test.code}</td>
				<td>${test.kor}</td>
				<td>${test.math}</td>
				<td>${test.eng}</td>
				<td>
					<c:choose>
						<c:when test="${avg>=90}">A</c:when>
						<c:when test="${avg>=80}">B</c:when>
						<c:when test="${avg>=70}">C</c:when>
						<c:when test="${avg>=60}">D</c:when>
						<c:otherwise>F</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>