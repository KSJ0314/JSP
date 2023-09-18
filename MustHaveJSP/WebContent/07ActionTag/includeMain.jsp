<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String outerPath1 = "inc/Outerpage1.jsp";
	String outerPath2 = "inc/Outerpage2.jsp";
	String outerPath3 = "inc/Outerpage3.jsp";
	
	pageContext.setAttribute("pAttr", "동명왕");
	request.setAttribute("rAttr", "온조왕");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>지시어로 페이지 포함하기</h2>
	<%@ include file="inc/Outerpage1.jsp" %>
	<p>외부 파일에 선언한 변수 : <%=newVar1 %> </p>
	
	<h2>액션태그로 페이지 포함하기</h2>
	<jsp:include page="inc/Outerpage2.jsp" />
	
	<h2>액션태그로 페이지 포함하기2</h2>
	<jsp:include page="<%=outerPath3 %>" />
</body>
</html>