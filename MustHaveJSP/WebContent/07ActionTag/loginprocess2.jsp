<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String)request.getAttribute("id");
		String pw = (String)pageContext.getAttribute("pw");
	%>
	<h2>loginprocess.jsp 2</h2>
	<ul>
		<li>리퀘스트 : <%=id %></li>
		<li>페이지 : <%=pw %></li>
	</ul>
</body>
</html>