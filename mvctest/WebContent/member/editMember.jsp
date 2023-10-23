<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<form action="edit.member" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required value="${dto.id}"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pw" required value="${dto.pw}"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required value="${dto.name}"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<c:choose>
						<c:when test='${dto.sex eq "M"}'>
							<input type="checkbox" name="sex" checked value="M" >남자
							<input type="checkbox" name="sex" value="F" >여자
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="sex" value="M" >남자
							<input type="checkbox" name="sex" checked value="F" >여자
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="date" name="birth" required value="${dto.birth }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email" value='${dto.email.substring(0,dto.email.lastIndexOf("@"))}'>@
					<select name="domain">
						<option value="@naver.com">naver.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@google.com">google.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tell" value="${dto.tell}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="${dto.addr}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="변경"></td>
			</tr>
		</table>
	</form>
</body>
</html>