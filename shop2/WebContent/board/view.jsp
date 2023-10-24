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
		<form class="form-horizontal" action="<c:url value='/edit.board'/>" method="post">
		<input type="hidden" name="num" value="${param.num }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
			<div class="form-group row">
				<label class="col-sm-2 control-label">이름</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" value="${dto.name }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-8">
					<input name="title" type="text" class="form-control" required value="${dto.title }">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea cols="50" rows="5" name="content" class="form-control" required>${dto.content }</textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">등록일자</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" value="${dto.regist_day }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">조회수</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" value="${dto.hit }" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">Ip</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" value="${dto.ip }" readonly>
				</div>
			</div>
			<div>
			<c:if test="${UserId == dto.id }">
				<c:url value='/delete.board?num=${param.num }&pageNum=${param.pageNum }' var="deleteAddr" />
				<input type="button" value="삭제" class="btn btn-danger" onclick="location.href='${deleteAddr}';">
				<input type="submit" value="수정" class="btn btn-success">
			</c:if>
				<c:url value='/list.board?pageNum=${param.pageNum }' var="listAddr" />
				<input type="button" value="목록" class="btn btn-primary" onclick="location.href='${listAddr}';">
			</div>
		</form>
	</div>
</body>
</html>