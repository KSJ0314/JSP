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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals("abcd") && pw.equals("1234")){
			Cookie cookie_id = new Cookie("id", id);
			cookie_id.setPath(request.getContextPath());
			cookie_id.setMaxAge(60*60);
			response.addCookie(cookie_id);
	
			Cookie cookie_pw = new Cookie("pw", pw);
			cookie_pw.setPath(request.getContextPath());
			cookie_pw.setMaxAge(60*60);
			response.addCookie(cookie_pw);
			response.sendRedirect("CookieResult.jsp");
		} else {
			request.getRequestDispatcher("CookieMain2.jsp?result=1").forward(request, response);
		}
	
	%>
</body>
</html>