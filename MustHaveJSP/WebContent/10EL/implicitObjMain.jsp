<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("scopeValue", "page 영역");
	request.setAttribute("scopeValue", "request 영역");
	session.setAttribute("scopeValue", "session 영역");
	application.setAttribute("scopeValue", "application 영역");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 각 영역에 저장된 속성 읽기</h2>
	<ul>
		<li>page : ${pageScope.scopeValue}</li>
		<li>request : ${requestScope.scopeValue}</li>
		<li>session : ${sessionScope.scopeValue}</li>
		<li>application : ${applicationScope.scopeValue}</li>
	</ul>
	
	<h2> 영역 지정없이 속성값 읽기</h2>
	<ul>
		<li>${scopeValue}</li>
	</ul>
	
	<jsp:forward page="implicitForwardResult.jsp" />
	
</body>
</html>