<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 쿠키 설정</h2>
	<%
		Cookie cookie = new Cookie("myCookie", "내가만든쿠키이");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(60*60);	// 1시간 유지, setMaxAge 미 설정시 default로 -1이 들어가기 때문에 유지가 안됨
		response.addCookie(cookie);	// 응답 헤더에 쿠키 추가
	%>
	
	<h2>2. 쿠키 설정 후 값 확인하기</h2>
	<%
		Cookie[] cookies = request.getCookies();
		if (cookies != null){
			for (Cookie c : cookies){
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				out.print(cookieName + " : " +cookieValue + "<br>");
			}
		}
	%>
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">다음 페이지에서 확인하기</a>
</body>
</html>