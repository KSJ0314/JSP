<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jq.js"></script>
<script>
	$(function(){
		function clock() {
			var dt = new Date();
			var time = dt.toLocaleTimeString();
			$("#clock").text(time);
		}
		clock();
		setInterval(clock, 1000);
	});
</script>
<style>
	#clock{
		position: absolute;
		right: 30px;
		bottom: 10px;
	}
</style>
</head>
<body>
	<h3 id="clock"></h3>
</body>
</html>