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
	<jsp:include page="../menu.jsp" />
	<form action="delete" method="post">
		<table border="1">
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="변경"></td>
			</tr>
		</table>
	</form>
</body>
</html>