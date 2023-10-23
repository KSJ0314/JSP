<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%!
	String greeting = "쇼핑몰 방문을 환영합니다";
	String tagline = "자바 쇼핑몰에 어서오세요";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- <script>
	$(function(){
		function getClock(){
			location.reload();
		}
		getClock();
		setInterval(getClock,1000);
	});
</script> -->
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron" style="text-align: center;">
		<div class="container">
			<h1 class="display-3">
				<%=greeting %>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
			<c:set var="today" value="<%=new java.util.Date() %>" />
			<h3 id="clock"><fmt:formatDate value="${today }" type="time"/></h3>
			<%
				response.setIntHeader("Refresh", 1);
			%>
		</div>	
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>











