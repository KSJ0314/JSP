<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>포워드 결과</h2>
	<ul>
		<li>페이지 영역 속성 : <%=pageContext.getAttribute("pAttr") %></li>
		<li>리퀘스트 영역 속성 : <%=request.getAttribute("rAttr") %></li>
	</ul>
</body>
</html>