<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.OracleConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		OracleConnect oc = new OracleConnect();	// 오라클 DB 연결
		String sql = "insert into student values(?,?,?)";
		PreparedStatement psmt = oc.con.prepareStatement(sql);
		
		psmt.setString(1, name);
		psmt.setString(2, id);
		psmt.setString(3, pwd);	// 쿼리 세팅
		
		int result = oc.psmt.executeUpdate();	// 쿼리 실행 + 값 저장
		if (result == 1){
			out.print("정상 처리 되었습니다.");
		} else {
			out.print("문제 발생");
		}
		
		oc.close();
	%>
</body>
</html>