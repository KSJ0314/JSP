<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="isLogin.jsp" %>
	<jsp:include page="../Common/link.jsp" />
	<h2>회원제 게시판 - 글쓰기</h2>
	<form action="writeProcess.jsp" name="writeFrm" method="post">
		<table border="1" width="90%">
			<tr>
				<td width="10%">제목</td>
				<td>
					<input type="text" name="title" style="width: 90%;">
				</td>
			</tr>
			<tr>
				<td width="10%">내용</td>
				<td>
					<textarea name="content" style="width: 90%; height: 100px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<button type="submit">작성 완료</button>
					<button type="reset">다시 입력</button>
					<button type="button" onclick="location.href='list.jsp';">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>