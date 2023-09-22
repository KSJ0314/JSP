<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jq.js"></script>
<script>
	$(function() {
		$("#btn").click(function() {
			var id = $("#id").val();
			var path = "idCheck.jsp?id="+id;
			location.href=path;
		});
	});
</script>
<style>
	#field{
		width: 500px;
		border: 3px solid lightgreen;
		border-radius: 10px;
		margin: auto;
		padding: 0;
	}
</style>
</head>
<body>
	<%
		String erCode = request.getParameter("erCode");
		if (erCode != null){
			if (erCode.equals("1")) {
				JSFunction.alertLocation("비밀번호가 다릅니다.", "addMember.jsp", out);
			} else if (erCode.equals("2")) {
				JSFunction.alertLocation("이미 등록된 아이디입니다.", "addMember.jsp", out);
			} else if (erCode.equals("3")) {
				JSFunction.alertLocation("회원가입이 완료되었습니다.", "addMember.jsp", out);
			}
		}
	%>

	<form action="addProcess.jsp" method="post">
		<fieldset id="field">
			<h2 align="center">회원 가입</h2>
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" id="id">
					<a href="#" id="btn"> 중복확인</a></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pw2"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="tel" placeholder="010-123-4567"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email">@
						<select name="domain">
							<option value="">직접입력</option>
							<option value="@naver.com">naver.com</option>
							<option value="@daum.net">daum.net</option>
							<option value="@gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>문자수신 여부</td>
					<td>
						<input type="radio" name="message" value="true"> 예 
						<input type="radio" name="message" value="false"> 아니오
					</td>
				</tr>
				<tr>
					<td>가입 경로</td>
					<td colspan="2">
						<input type="checkbox" name="path" value="친구 소개"> 친구 소개 
						<input type="checkbox" name="path" value="인터넷 검색"> 인터넷 검색 
						<input type="checkbox" name="path" value="블로그"> 블로그 
						<input type="checkbox" name="path" value="기타"> 기타 
					</td>
				</tr>
				<tr>
					<td>가입 하기</td>
					<td><input type="submit" value="전송"></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>