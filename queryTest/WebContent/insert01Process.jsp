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
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		JDBConnect j = new JDBConnect();
		
		String sql = "insert into member values('"+id+"', '"+name+"', '"+pw+"', '"+phone+"', '"+address+"')";
		
		try{
			j.stmt = j.co.createStatement();
			j.stmt.executeUpdate(sql);
			System.out.print("테이블 삽입 성공");
		} catch(Exception e){
			System.out.print("테이블 삽입 실패");
			e.printStackTrace();
		} finally {
			j.close();
		}
		
	%>
</body>
</html>