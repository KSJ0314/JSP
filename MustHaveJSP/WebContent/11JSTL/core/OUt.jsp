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
	<h4>Out 태그</h4>
	<c:set var="iTag">
		i 태그는 <i>기울임</i>을 표현합니다.
	</c:set>
	
	<c:out value="${iTag}"/><br>
	${iTag}<br>
	<c:out value="${param.name }" default="넘겨온 값이 없습니다." />
	
</body>
</html>