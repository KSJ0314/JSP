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
		String pw = request.getParameter("pw");
		if (pw.equals("1234")){
			response.sendRedirect("result.jsp");
		} else {
			request.getRequestDispatcher("exam1.jsp?pwError=1").forward(request, response);
			// response.sendRedirect("exam1.jsp?pwError=1"); -> 기능은 같으나 제어권한을 안넘겨줌, 조금 차이가 있음
		}
	%>
</body>
</html>