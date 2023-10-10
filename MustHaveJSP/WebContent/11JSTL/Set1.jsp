<%@page import="common.Car"%>
<%@page import="common.Person"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<c:set var="directVar" value="100" />
	<c:set var="elVar" value="${directVar % 5}" />
	<c:set var="expVar" value="<%=new Date() %>" />
	<c:set var="today" value='<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>' />
	
	<h3>JSTL 변수 출력</h3>
	<ul>
		<li>directVar : ${directVar }</li>
		<li>elVar : ${elVar }</li>
		<li>expVar : ${expVar }</li>
		<li>오늘날짜 : ${today }</li>
	</ul>
	
	<h3>자바빈즈 생성1 - 생성자 사용</h3>
	<c:set var="personVar1" value='<%=new Person("박문수", 50) %>' scope="request" />
	<ul>
		<li>이름 : ${requestScope.personVar1.name }</li>
		<li>나이 : ${requestScope.personVar1.age }</li>
	</ul>
	
	<h3>자바빈즈 생성2 - 생성자 사용</h3>
	<c:set var="carVar1" value='<%=new Car() %>' scope="request" />
		<c:set target="${carVar1 }" property="carName" value="제네시스" />
		<c:set target="${carVar1 }" property="carPrice" value="200000000" />
		<c:set target="${carVar1 }" property="carColor" value="검정" />
	<ul>
		<li>모델명 : ${requestScope.carVar1.carName }</li>
		<li>가격 : ${requestScope.carVar1.carPrice }</li>
		<li>색상 : ${requestScope.carVar1.carColor }</li>
	</ul>
</body>
</html>