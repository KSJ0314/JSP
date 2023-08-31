<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul {
		list-style: none;
	}
	li {
		font-size: 20px;
	}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String gender = request.getParameter("gender");
		
		String[] favo = request.getParameterValues("favo");
		String favoText = "";
		if (favo != null) {
			for (int i = 0; i < favo.length; i++){
				favoText += favo[i] + " ";
			}
		}
		
		String intro = request.getParameter("intro").replace("\r\n", "<br>");
	%>
	<ul>
		<li> 아이디 : <%=id %></li>
		<li> 성별 : <%=gender %></li>
		<li> 관심 사항 : <%=favoText %></li>
		<li> 자기 소개 : <%=intro %></li>
	</ul>
</body>
</html>