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
	<c:set var="today" value="<%=new java.util.Date() %>" />
	
	<h4>날짜 포맷</h4>
	<p>full : <fmt:formatDate value="${today }" type="date" dateStyle="full"/></p>
	<p>long : <fmt:formatDate value="${today }" type="date" dateStyle="long"/></p>
	<p>default : <fmt:formatDate value="${today }" type="date"/></p>
	
	<h4>시간 포맷</h4>
	<p>full : <fmt:formatDate value="${today }" type="time" timeStyle="full"/></p>
	<p>default : <fmt:formatDate value="${today }" type="time"/></p>
	
	<h4>날짜+시간 포맷</h4>
	<p>default : <fmt:formatDate value="${today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/></p>
	
	<h4>타임존 설정</h4>
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
	</fmt:timeZone>
	
	<h4>로케일 설정</h4>
	<fmt:setLocale value="ja_JP"/>
	<fmt:formatNumber value="99999" type="currency" />
</body>
</html>