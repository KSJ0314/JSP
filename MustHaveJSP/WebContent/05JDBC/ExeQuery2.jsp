<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	
	<h2>MySQL 회원 목록 조회 테스트</h2>
	<%
		Connection co = null;
		Statement st = null;
		ResultSet rs = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8";
			String name = "manager";
			String pw = "1234";
			co = DriverManager.getConnection(url, name, pw);
			String sql = "select * from student where s_name like '홍%'";
			st = co.createStatement();
			rs = st.executeQuery(sql);
			
			int rowCount = rs.getMetaData().getColumnCount();
			while (rs.next()){
				String result = "";
				for (int i = 1; i <= rowCount; i++){
					result += rs.getString(i) + " ";
				}
				out.print(result + "<br>");
			}
			
		} catch(Exception e){
			out.print("연결실패");
		} finally {
			if (rs != null) rs.close();
			if (st != null) st.close();
			if (co != null) co.close();
		}
		
	%>
</body>
</html>