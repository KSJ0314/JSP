<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
	<jsp:include page="/loginCheck.jsp" />
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판 작성</h1>
		</div>
	</div>
	<div class="container">
		<form class="form-horizontal" action="<c:url value='/write.board'/>" method="post">
			<div class="form-group row">
				<label class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-8">
					<input name="id" type="text" class="form-control" value="${UserId }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">이름</label>
				<div class="col-sm-8">
					<input name="name" type="text" class="form-control" value="${UserName }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-8">
					<input name="title" type="text" class="form-control" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea cols="50" rows="5" name="content" class="form-control" required></textarea>
				</div>
			</div>
			<div>
				<input type="submit" value="작성" class="btn btn-primary">&emsp;
				<input type="reset" value="취소" class="btn btn-primary">
			</div>
		</form>
	</div>
</body>
</html>