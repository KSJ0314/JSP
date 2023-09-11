<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 추가 테스트</h2>
	<%
		JDBConnect jdbc = new JDBConnect();
		
		String sql_ins = "insert into member values (?, ?, ?,sysdate)";		// 동적 쿼리 문법
		PreparedStatement pm_ins = jdbc.con.prepareStatement(sql_ins);
		
		String id = "test1";
		String pass = "1111";
		String name = "테스트1회원";
		
		pm_ins.setString(1, id);
		pm_ins.setString(2, pass);
		pm_ins.setString(3, name);
		
		int inResult = pm_ins.executeUpdate();
		out.print(inResult + "개의 행이 추가되었습니다.");
		// 바뀐 줄 수
		
		jdbc.close();
		
	%>
</body>
</html>