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
		String fruit = request.getParameter("fruit");
		if (fruit.equals("none")){
			request.getRequestDispatcher("choice.jsp?fruitNone=1").forward(request, response);
		}
	%>
	<h2>당신이 좋아하는 과일은 <%=fruit %>입니다.</h2>
</body>
</html>