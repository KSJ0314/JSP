<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>숫자 포맷 설정</h4>
	<c:set var="num1" value="12345" />
	
	<fmt:setLocale value="en_US"/>
	<fmt:formatNumber type="currency" value="${num1}" /><br>
	
	<fmt:setLocale value="ko_kr"/>
	<fmt:formatNumber type="currency" value="${num1}" /><br>
	
	<fmt:formatNumber groupingUsed="false" value="${num1}" /><br>
	
	<fmt:formatNumber type="percent" value="${num1}" /><br>
	
	<h4>숫자 패턴 변경</h4>
	<c:set var="num2" value="6,789.01" />
	
	<fmt:parseNumber value="${num2 }" /><br>
		
</body>
</html>