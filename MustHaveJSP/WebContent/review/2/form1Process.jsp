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
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gen = request.getParameter("gen");
		String[] hobbys = request.getParameterValues("hobbys");
		
		String hobby = "";
		for (String st : hobbys){
			hobby += st + " ";
		}
	%>
	<h3>id : <%=id %></h3>
	<h3>pw : <%=pw %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>성별 : <%=gen %></h3>
	<h3>취미 : <%=hobby %></h3>
</body>
</html>