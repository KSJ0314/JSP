<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MyELClass elc = new MyELClass();
	pageContext.setAttribute("elc", elc);
	String email = request.getParameter("email") + request.getParameter("domain");
	pageContext.setAttribute("email", email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="#">
		<table border="1" style="width: 80%; margin: auto;">
			<tr>
				<td width="30%">이름 </td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>주민번호 </td>
				<td><input type="text" name="jumin" placeholder="111111-2222222" required></td>
			</tr>
			<tr>
				<td>이메일 </td>
				<td>
				<input type="text" name="email">@
				<select name="domain">
					<option value="@naver.com">naver.com</option>
					<option value="@daum.net">daum.net</option>
					<option value="@gmail.com">gmail.com</option>
				</select>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="입력완료"></td>
			</tr>
			
		</table>
	</form>
	
	<% if (request.getParameter("jumin") != null) {%>
	
	<h3>사용자 정보</h3>
	<p>이름 : ${param.name}</p>
	<p>성별 : ${elc.getGender(param.jumin)}</p>
	<p>아이디 : ${elc.getId(email)}</p>
	<p>도메인 : ${elc.getDomain(email)}</p>
	
	<% } %>
	
</body>
</html>