<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp" %>
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = dao.selectView(num);
	String UserId = (String)session.getAttribute("UserId");
	
	if (!UserId.equals(dto.getId())){
		JSFunction.alertBack("작성자만 편집 가능합니다.", out);
		return;
	}
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Common/link.jsp"></jsp:include>
	
	<h2>회원제 게시판 - 수정하기</h2>
	<form action="editProcess.jsp" name="writeFrm" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>">
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width: 90%;" value="<%=dto.getTitle() %>">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width: 90%; height: 100px;" ><%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">다시입력</button>
					<button type="button" onclick="location.href='list.jsp'">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>