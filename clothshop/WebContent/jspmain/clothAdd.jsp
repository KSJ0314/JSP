<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="head.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품등록</h1>
		</div>
	</div>
	
	<div class="container">
		<form action="processAdd.jsp" name="newProduct" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">상품 아이디</label>
				<div class="col-sm-3">
					<input type="text" name="clothId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="clothName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 가격</label>
				<div class="col-sm-3">
					<input type="text" name="clothCost" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 사이즈</label>
				<div class="col-sm-3">
					<input type="text" name="clothSize" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 색상</label>
				<div class="col-sm-3">
					<input type="text" name="clothColor" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>
	</div>
	<%@ include file="bottom.jsp" %>
</body>
</html>